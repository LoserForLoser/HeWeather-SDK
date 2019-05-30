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
#import "WeatherNowModel.h"
#import <MJExtension/MJExtension.h>

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
                    WeatherForecastModel *weatherForecastModel = [WeatherForecastModel mj_objectWithKeyValues:responseObject];
                    WeatherForecastModel *weatherForecastModelResponse = (WeatherForecastModel *)weatherForecastModel.HeWeather6.firstObject;
                    if (getSuccess) {
                        getSuccess(weatherForecastModelResponse);
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
                    WeatherNowModel *weatherNowModel = [WeatherNowModel mj_objectWithKeyValues:responseObject];
                    WeatherNowModel *weatherNowModelResponse = (WeatherNowModel *)weatherNowModel.HeWeather6.firstObject;
                    if (getSuccess) {
                        getSuccess(weatherNowModelResponse);
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
                    WeatherHourlyModel *weatherHourlyModel = [WeatherHourlyModel mj_objectWithKeyValues:responseObject];
                    WeatherHourlyModel *weatherHourlyModelResponse = (WeatherHourlyModel *)weatherHourlyModel.HeWeather6.firstObject;
                    if (getSuccess) {
                        getSuccess(weatherHourlyModelResponse);
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
                    WeatherLifestyleModel *weatherLifestyleModel = [WeatherLifestyleModel mj_objectWithKeyValues:responseObject];
                    WeatherLifestyleModel *weatherLifestyleModelResponse = (WeatherLifestyleModel *)weatherLifestyleModel.HeWeather6.firstObject;
                    if (getSuccess) {
                        getSuccess(weatherLifestyleModelResponse);
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
                    WeatherModel *weatherModel = [WeatherModel mj_objectWithKeyValues:responseObject];
                    WeatherModel *weatherModelResponse = (WeatherModel *)weatherModel.HeWeather6.firstObject;
                    if (getSuccess) {
                        getSuccess(weatherModelResponse);
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
                        WeatherGridMinuteModel *weatherGridMinuteModel = [WeatherGridMinuteModel mj_objectWithKeyValues:responseObject];
                        WeatherGridMinuteModel *weatherGridMinuteModelResponse = (WeatherGridMinuteModel *)weatherGridMinuteModel.HeWeather6.firstObject;
                        if (getSuccess) {
                            getSuccess(weatherGridMinuteModelResponse);
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
                        WeatherGridNowModel *weatherGridNowModel = [WeatherGridNowModel mj_objectWithKeyValues:responseObject];
                        WeatherGridNowModel *weatherGridNowModelResponse = (WeatherGridNowModel *)weatherGridNowModel.HeWeather6.firstObject;
                        if (getSuccess) {
                            getSuccess(weatherGridNowModelResponse);
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
                        WeatherGridForecastModel *weatherGridForecastModel = [WeatherGridForecastModel mj_objectWithKeyValues:responseObject];
                        WeatherGridForecastModel *weatherGridForecastModelResponse = (WeatherGridForecastModel *)weatherGridForecastModel.HeWeather6.firstObject;
                        if (getSuccess) {
                            getSuccess(weatherGridForecastModelResponse);
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
                        WeatherGridHourlyModel *weatherGridHourlyModel = [WeatherGridHourlyModel mj_objectWithKeyValues:responseObject];
                        WeatherGridHourlyModel *weatherGridHourlyModelResponse = (WeatherGridHourlyModel *)weatherGridHourlyModel.HeWeather6.firstObject;
                        if (getSuccess) {
                            getSuccess(weatherGridHourlyModelResponse);
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
                        AlarmModel *alarmModel = [AlarmModel mj_objectWithKeyValues:responseObject];
                        AlarmModel *alarmModelResponse = (AlarmModel *)alarmModel.HeWeather6.firstObject;
                        if (getSuccess) {
                            getSuccess(alarmModelResponse);
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
                        AlarmAllModel *alarmAllModel = [AlarmAllModel mj_objectWithKeyValues:responseObject];
                        AlarmAllModel *alarmAllModelResponse = (AlarmAllModel *)alarmAllModel.HeWeather6.firstObject;
                        if (getSuccess) {
                            getSuccess(alarmAllModelResponse);
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
                        ScenicModel *scenicModel = [ScenicModel mj_objectWithKeyValues:responseObject];
                        ScenicModel *scenicModelResponse = (ScenicModel *)scenicModel.HeWeather6.firstObject;
                        if (getSuccess) {
                            getSuccess(scenicModelResponse);
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
                    AirNowModel *airNowModel = [AirNowModel mj_objectWithKeyValues:responseObject];
                    AirNowModel *airNowModelResponse = (AirNowModel *)airNowModel.HeWeather6.firstObject;
                    if (getSuccess) {
                        getSuccess(airNowModelResponse);
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
                        AirForecastModel *airForecastModel = [AirForecastModel mj_objectWithKeyValues:responseObject];
                        AirForecastModel *airForecastModelResponse = (AirForecastModel *)airForecastModel.HeWeather6.firstObject;
                        if (getSuccess) {
                            getSuccess(airForecastModelResponse);
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
                        AirHourlyModel *airHourlyModel = [AirHourlyModel mj_objectWithKeyValues:responseObject];
                        AirHourlyModel *airHourlyModelResponse = (AirHourlyModel *)airHourlyModel.HeWeather6.firstObject;
                        if (getSuccess) {
                            getSuccess(airHourlyModelResponse);
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
                        AirModel *airModel = [AirModel mj_objectWithKeyValues:responseObject];
                        AirModel *airModelResponse = (AirModel *)airModel.HeWeather6.firstObject;
                        if (getSuccess) {
                            getSuccess(airModelResponse);
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
                        WeatherHistoricalModel *weatherHistoricalModel = [WeatherHistoricalModel mj_objectWithKeyValues:responseObject];
                        WeatherHistoricalModel *weatherHistoricalModelResponse = (WeatherHistoricalModel *)weatherHistoricalModel.HeWeather6.firstObject;
                        if (getSuccess) {
                            getSuccess(weatherHistoricalModelResponse);
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
                    SolarSunriseSunsetModel *solarSunriseSunsetModel = [SolarSunriseSunsetModel mj_objectWithKeyValues:responseObject];
                    SolarSunriseSunsetModel *solarSunriseSunsetModelResponse = (SolarSunriseSunsetModel *)solarSunriseSunsetModel.HeWeather6.firstObject;
                    if (getSuccess) {
                        getSuccess(solarSunriseSunsetModelResponse);
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
                        SolarElevationAngleModel *solarElevationAngleModel = [SolarElevationAngleModel mj_objectWithKeyValues:responseObject];
                        SolarElevationAngleModel *solarElevationAngleModelResponse = (SolarElevationAngleModel *)solarElevationAngleModel.HeWeather6.firstObject;
                        if (getSuccess) {
                            getSuccess(solarElevationAngleModelResponse);
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
                    SearchModel *searchModel = [SearchModel mj_objectWithKeyValues:responseObject];
                    SearchModel *searchModelResponse = (SearchModel *)searchModel.HeWeather6.firstObject;
                    if (getSuccess) {
                        getSuccess(searchModelResponse);
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
                    FindModel *findModel = [FindModel mj_objectWithKeyValues:responseObject];
                    FindModel *findModelResponse = (FindModel *)findModel.HeWeather6.firstObject;
                    if (getSuccess) {
                        getSuccess(findModelResponse);
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
                    TopModel *topModel = [TopModel mj_objectWithKeyValues:responseObject];
                    TopModel *topModelResponse = (TopModel *)topModel.HeWeather6.firstObject;
                    if (getSuccess) {
                        getSuccess(topModelResponse);
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
