//
//  AllWeatherInquieirs.m
//  HEWEATHER
//
//  Created by Coder on 2018/4/29.
//  Copyright © 2018年 Song. All rights reserved.
//

#import "AllWeatherInquieirs.h"
#import "AllWeatherInquieirs+Property.h"
#import "AllWeatherInquieirs+Request.h"
#import "AllWeatherInquieirs+Tool.h"

NSString * const kAppAPIURL = @"https://api.heweather.com/s6/";
NSString * const kAppFreeAPIURL = @"https://free-api.heweather.com/s6/";

@interface AllWeatherInquieirs () <CLLocationManagerDelegate>
{
    NSUserDefaults *defaults;
}
@end

@implementation AllWeatherInquieirs

static AllWeatherInquieirs *_allWeatherInquieirs;

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _allWeatherInquieirs = [super allocWithZone:zone];
    });
    return _allWeatherInquieirs;
    
}

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _allWeatherInquieirs = [[self alloc] init];
    });
    return _allWeatherInquieirs;
    
}

- (id)copyWithZone:(NSZone *)zone {
    return _allWeatherInquieirs;
}

- (instancetype)init {
    self = [super init];
    return self;
}

#pragma mark - Set kHeAppUsername & kHeAppKey

- (void)setKHeAppUsername:(NSString *)kHeAppUsername {
    defaults = [NSUserDefaults standardUserDefaults];
    NSString * usernameString = [defaults objectForKey:@"usernameString"];
    if (!usernameString || [usernameString isEqualToString:@""] || [usernameString isEqualToString:kHeAppUsername]) {
        [defaults removeObjectForKey:@"usernameString"];
        [defaults setObject:kHeAppUsername forKey:@"usernameString"];
    }
}

- (void)setKHeAppKey:(NSString *)kHeAppKey {
    defaults = [NSUserDefaults standardUserDefaults];
    NSString * keyString = [defaults objectForKey:@"keyString"];
    if (!keyString || [keyString isEqualToString:@""] || [keyString isEqualToString:kHeAppKey]) {
        [defaults removeObjectForKey:@"keyString"];
        [defaults setObject:kHeAppKey forKey:@"keyString"];
    }
}

#pragma mark - Set User Type

- (void)setUserType:(USER_TYPE)userType {
    _userType = userType;
    switch (userType) {
        case USER_TYPE_USER:
            self.kAppServerAPIURL = kAppAPIURL;
            break;
        case USER_TYPE_FREE_USER:
            self.kAppServerAPIURL = kAppFreeAPIURL;
            break;
            
        default:
            break;
    }
}

#pragma mark - Set Language Type

- (void)setLanguageType:(LANGUAGE_TYPE)languageType {
    switch (languageType) {
        case LANGUAGE_TYPE_ZH:
            self.lang = @"zh";
            break;
        case LANGUAGE_TYPE_ZHHK:
            self.lang = @"zhhk";
            break;
        case LANGUAGE_TYPE_EN:
            self.lang = @"en";
            break;
        case LANGUAGE_TYPE_DE:
            self.lang = @"de";
            break;
        case LANGUAGE_TYPE_ES:
            self.lang = @"es";
            break;
        case LANGUAGE_TYPE_FR:
            self.lang = @"fr";
            break;
        case LANGUAGE_TYPE_IT:
            self.lang = @"it";
            break;
        case LANGUAGE_TYPE_JP:
            self.lang = @"jp";
            break;
        case LANGUAGE_TYPE_KR:
            self.lang = @"kr";
            break;
        case LANGUAGE_TYPE_RU:
            self.lang = @"ru";
            break;
        case LANGUAGE_TYPE_IN:
            self.lang = @"in";
            break;
        case LANGUAGE_TYPE_TH:
            self.lang = @"th";
            break;
        case LANGUAGE_TYPE_ZHCN:
            self.lang = @"zhcn";
            break;
        case LANGUAGE_TYPE_CN:
            self.lang = @"cn";
            break;
        case LANGUAGE_TYPE_HK:
            self.lang = @"hk";
            break;
            
        default:
            break;
    }
}

#pragma mark - Set Unit Type

- (void)setUnitType:(UNIT_TYPE)unitType {
    switch (unitType) {
        case UNIT_TYPE_M:
            self.unit = @"m";
            break;
        case UNIT_TYPE_I:
            self.unit = @"i";
            break;
            
        default:
            break;
    }
}

#pragma mark - Set Mode Type

- (void)setModeType:(MODE_TYPE)modeType {
    switch (modeType) {
        case MODE_TYPE_EQUAL:
            self.mode = @"equal";
            break;
        case MODE_TYPE_MATCH:
            self.mode = @"match";
            break;
            
        default:
            break;
    }
}

#pragma mark - Inquire Action

- (void)weatherWithInquireType:(INQUIRE_TYPE)inquireType
                   WithSuccess:(void(^)(id responseObject))getSuccess
              faileureForError:(void(^)(NSError *error))getError {
    [self startLocation];
    
    defaults = [NSUserDefaults standardUserDefaults];
    self.username = [defaults objectForKey:@"usernameString"];
    self.key = [defaults objectForKey:@"keyString"];
    
    __weak AllWeatherInquieirs *weakself = self;
    self.locationBlock = ^{
        __strong AllWeatherInquieirs *self = weakself;
        
        if (!self.location || [self.location isEqualToString:@""]) {
            self.location = [NSString stringWithFormat:@"%@,%@",self.strLatitude,self.strLongitude];
        }
        if (!self.lang || [self.lang isEqualToString:@""]) {
            self.lang = @"zh";
        }
        if (!self.unit || [self.unit isEqualToString:@""]) {
            self.unit = @"m";
        }
        if (!self.mode || [self.mode isEqualToString:@""]) {
            self.mode = @"match";
        }
        if (!self.group || [self.group isEqualToString:@""]) {
            self.group = @"world";
        }
        if (!self.number || self.number==0) {
            self.number = 10;
        }
        self.t = [self currentTimeStr];
        
        switch (inquireType) {
            case INQUIRE_TYPE_WEATHER_FORECAST:{
                [self weatherForecastWithSuccess:^(id responseObject) {
                    WeatherForecastBaseClass *weatherForecastBC = [WeatherForecastBaseClass modelObjectWithDictionary:responseObject];
                    if (getSuccess) {
                        getSuccess(weatherForecastBC);
                    }
                } faileureForError:^(NSError *error) {
                    if (getError) {
                        getError(error);
                    }
                }];
            }
                break;
            case INQUIRE_TYPE_WEATHER_NOW:{
                [self weatherNowWithSuccess:^(id responseObject) {
                    WeatherNowBaseClass *weatherNowBC = [WeatherNowBaseClass modelObjectWithDictionary:responseObject];
                    if (getSuccess) {
                        getSuccess(weatherNowBC);
                    }
                } faileureForError:^(NSError *error) {
                    if (getError) {
                        getError(error);
                    }
                }];
            }
                break;
            case INQUIRE_TYPE_WEATHER_HOURLY:{
                [self weatherHourlyWithSuccess:^(id responseObject) {
                    WeatherHourlyBaseClass *weatherHourlyBC = [WeatherHourlyBaseClass modelObjectWithDictionary:responseObject];
                    if (getSuccess) {
                        getSuccess(weatherHourlyBC);
                    }
                } faileureForError:^(NSError *error) {
                    if (getError) {
                        getError(error);
                    }
                }];
            }
                break;
            case INQUIRE_TYPE_WEATHER_LIFESTYLE:{
                [self weatherLifestyleWithSuccess:^(id responseObject) {
                    WeatherLifestyleBaseClass *weatherLifestyletBC = [WeatherLifestyleBaseClass modelObjectWithDictionary:responseObject];
                    if (getSuccess) {
                        getSuccess(weatherLifestyletBC);
                    }
                } faileureForError:^(NSError *error) {
                    if (getError) {
                        getError(error);
                    }
                }];
            }
                break;
            case INQUIRE_TYPE_WEATHER:{
                [self weatherWithSuccess:^(id responseObject) {
                    WeatherBaseClass *weatherBC = [WeatherBaseClass modelObjectWithDictionary:responseObject];
                    if (getSuccess) {
                        getSuccess(weatherBC);
                    }
                } faileureForError:^(NSError *error) {
                    if (getError) {
                        getError(error);
                    }
                }];
            }
                break;
            case INQUIRE_TYPE_WEATHER_GRID_MINUTE:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (getError) {
                        getError([self prohibitRequest]);
                    }
                } else {
                    [self weatherGridMinuteWithSuccess:^(id responseObject) {
                        WeatherGridMinuteBaseClass *weatherGridMinuteBC = [WeatherGridMinuteBaseClass modelObjectWithDictionary:responseObject];
                        if (getSuccess) {
                            getSuccess(weatherGridMinuteBC);
                        }
                    } faileureForError:^(NSError *error) {
                        if (getError) {
                            getError(error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_WEATHER_GRID_NOW:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (getError) {
                        getError([self prohibitRequest]);
                    }
                } else {
                    [self weatherGridNowWithSuccess:^(id responseObject) {
                        WeatherGridNowBaseClass *weatherGridNowBC = [WeatherGridNowBaseClass modelObjectWithDictionary:responseObject];
                        if (getSuccess) {
                            getSuccess(weatherGridNowBC);
                        }
                    } faileureForError:^(NSError *error) {
                        if (getError) {
                            getError(error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_WEATHER_GRID_FORECAST:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (getError) {
                        getError([self prohibitRequest]);
                    }
                } else {
                    [self weatherGridForecastWithSuccess:^(id responseObject) {
                        WeatherGridForecastBaseClass *weatherGridForecastBC = [WeatherGridForecastBaseClass modelObjectWithDictionary:responseObject];
                        if (getSuccess) {
                            getSuccess(weatherGridForecastBC);
                        }
                    } faileureForError:^(NSError *error) {
                        if (getError) {
                            getError(error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_WEATHER_GRID_HOURLY:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (getError) {
                        getError([self prohibitRequest]);
                    }
                } else {
                    [self weatherGridHourlyWithSuccess:^(id responseObject) {
                        WeatherGridHourlyBaseClass *weatherGridHourlyBC = [WeatherGridHourlyBaseClass modelObjectWithDictionary:responseObject];
                        if (getSuccess) {
                            getSuccess(weatherGridHourlyBC);
                        }
                    } faileureForError:^(NSError *error) {
                        if (getError) {
                            getError(error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_ALARM:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (getError) {
                        getError([self prohibitRequest]);
                    }
                } else {
                    [self alarmWithSuccess:^(id responseObject) {
                        AlarmBaseClass *alarmBC = [AlarmBaseClass modelObjectWithDictionary:responseObject];
                        if (getSuccess) {
                            getSuccess(alarmBC);
                        }
                    } faileureForError:^(NSError *error) {
                        if (getError) {
                            getError(error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_ALARM_ALL:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (getError) {
                        getError([self prohibitRequest]);
                    }
                } else {
                    [self alarmAllWithSuccess:^(id responseObject) {
                        AlarmAllBaseClass *alarmAllBC = [AlarmAllBaseClass modelObjectWithDictionary:responseObject];
                        if (getSuccess) {
                            getSuccess(alarmAllBC);
                        }
                    } faileureForError:^(NSError *error) {
                        if (getError) {
                            getError(error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_SCENIC:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (getError) {
                        getError([self prohibitRequest]);
                    }
                } else {
                    [self scenicWithSuccess:^(id responseObject) {
                        ScenicBaseClass *scenicBC = [ScenicBaseClass modelObjectWithDictionary:responseObject];
                        if (getSuccess) {
                            getSuccess(scenicBC);
                        }
                    } faileureForError:^(NSError *error) {
                        if (getError) {
                            getError(error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_AIR_NOW:{
                [self airNowWithSuccess:^(id responseObject) {
                    AirNowBaseClass *airNowBC = [AirNowBaseClass modelObjectWithDictionary:responseObject];
                    if (getSuccess) {
                        getSuccess(airNowBC);
                    }
                } faileureForError:^(NSError *error) {
                    if (getError) {
                        getError(error);
                    }
                }];
            }
                break;
            case INQUIRE_TYPE_AIR_FORECAST:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (getError) {
                        getError([self prohibitRequest]);
                    }
                } else {
                    [self airForecastWithSuccess:^(id responseObject) {
                        AirForecastBaseClass *airForecastBC = [AirForecastBaseClass modelObjectWithDictionary:responseObject];
                        if (getSuccess) {
                            getSuccess(airForecastBC);
                        }
                    } faileureForError:^(NSError *error) {
                        if (getError) {
                            getError(error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_AIR_HOURLY:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (getError) {
                        getError([self prohibitRequest]);
                    }
                } else {
                    [self airHourlyWithSuccess:^(id responseObject) {
                        AirHourlyBaseClass *airHourlyBC = [AirHourlyBaseClass modelObjectWithDictionary:responseObject];
                        if (getSuccess) {
                            getSuccess(airHourlyBC);
                        }
                    } faileureForError:^(NSError *error) {
                        if (getError) {
                            getError(error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_AIR:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (getError) {
                        getError([self prohibitRequest]);
                    }
                } else {
                    [self airWithSuccess:^(id responseObject) {
                        AirBaseClass *airForecastBC = [AirBaseClass modelObjectWithDictionary:responseObject];
                        if (getSuccess) {
                            getSuccess(airForecastBC);
                        }
                    } faileureForError:^(NSError *error) {
                        if (getError) {
                            getError(error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_WEATHER_HISTORICAL:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (getError) {
                        getError([self prohibitRequest]);
                    }
                } else {
                    [self weatherHistoricalWithSuccess:^(id responseObject) {
                        WeatherHistoricalBaseClass *weatherHistoricalBC = [WeatherHistoricalBaseClass modelObjectWithDictionary:responseObject];
                        if (getSuccess) {
                            getSuccess(weatherHistoricalBC);
                        }
                    } faileureForError:^(NSError *error) {
                        if (getError) {
                            getError(error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_SOLAR_SUNRISE_SUNSET:{
                [self solarSunriseSunsetWithSuccess:^(id responseObject) {
                    SolarSunriseSunsetBaseClass *solarSunriseSunsetBC = [SolarSunriseSunsetBaseClass modelObjectWithDictionary:responseObject];
                    if (getSuccess) {
                        getSuccess(solarSunriseSunsetBC);
                    }
                } faileureForError:^(NSError *error) {
                    if (getError) {
                        getError(error);
                    }
                }];
            }
                break;
            case INQUIRE_TYPE_MAP_CLOUD_MAP:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (getError) {
                        getError([self prohibitRequest]);
                    }
                } else {
                    [self mapCloudmapWithSuccess:^(id responseObject) {
                        if (getSuccess) {
                            getSuccess(responseObject);
                        }
                    } faileureForError:^(NSError *error) {
                        if (getError) {
                            getError(error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_SOLAR_ELEVATION_ANGLR:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (getError) {
                        getError([self prohibitRequest]);
                    }
                } else {
                    [self solarElevationAngleWithSuccess:^(id responseObject) {
                        SolarElevationAngleBaseClass *solarElevationAngleBC = [SolarElevationAngleBaseClass modelObjectWithDictionary:responseObject];
                        if (getSuccess) {
                            getSuccess(solarElevationAngleBC);
                        }
                    } faileureForError:^(NSError *error) {
                        if (getError) {
                            getError(error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_SEARCH:{
                [self searchWithSuccess:^(id responseObject) {
                    SearchBaseClass *searchBC = [SearchBaseClass modelObjectWithDictionary:responseObject];
                    if (getSuccess) {
                        getSuccess(searchBC);
                    }
                } faileureForError:^(NSError *error) {
                    if (getError) {
                        getError(error);
                    }
                }];
            }
                break;
            case INQUIRE_TYPE_FIND:{
                [self findWithSuccess:^(id responseObject) {
                    FindBaseClass *findBC = [FindBaseClass modelObjectWithDictionary:responseObject];
                    if (getSuccess) {
                        getSuccess(findBC);
                    }
                } faileureForError:^(NSError *error) {
                    if (getError) {
                        getError(error);
                    }
                }];
            }
                break;
            case INQUIRE_TYPE_TOP:{
                [self topWithSuccess:^(id responseObject) {
                    TopBaseClass *topBC = [TopBaseClass modelObjectWithDictionary:responseObject];
                    if (getSuccess) {
                        getSuccess(topBC);
                    }
                } faileureForError:^(NSError *error) {
                    if (getError) {
                        getError(error);
                    }
                }];
            }
                break;
                
            default: {
                if (getError) {
                    NSDictionary *userInfo1 = [NSDictionary dictionaryWithObject:@"请选择查询类型！" forKey:@"RequestError"];
                    NSError *error = [NSError errorWithDomain:NSCocoaErrorDomain code:-999 userInfo:userInfo1];
                    getError(error);
                }
            }
                break;
        }
    };
}

- (NSError *)prohibitRequest {
    NSDictionary *userInfo1 = [NSDictionary dictionaryWithObject:@"此接口不对免费用户开放!" forKey:@"RequestError"];
    NSError *error = [NSError errorWithDomain:NSCocoaErrorDomain code:-999 userInfo:userInfo1];
    return error;
}

@end
