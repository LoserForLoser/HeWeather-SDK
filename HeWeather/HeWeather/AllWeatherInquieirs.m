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
                      response:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
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
                [self weatherForecastWithResponse:^(id  _Nullable responseObject, NSError * _Nullable error) {
                    WeatherForecastModel *weatherForecastModel = [WeatherForecastModel mj_objectWithKeyValues:responseObject];
                    WeatherForecastModel *weatherForecastModelResponse = (WeatherForecastModel *)weatherForecastModel.HeWeather6.firstObject;
                    if (response) {
                        response(weatherForecastModelResponse, error);
                    }
                }];
            }
                break;
            case INQUIRE_TYPE_WEATHER_NOW:{
                [self weatherNowWithResponse:^(id  _Nullable responseObject, NSError * _Nullable error) {
                    WeatherNowModel *weatherNowModel = [WeatherNowModel mj_objectWithKeyValues:responseObject];
                    WeatherNowModel *weatherNowModelResponse = (WeatherNowModel *)weatherNowModel.HeWeather6.firstObject;
                    if (response) {
                        response(weatherNowModelResponse, error);
                    }
                }];
            }
                break;
            case INQUIRE_TYPE_WEATHER_HOURLY:{
                [self weatherHourlyWithResponse:^(id  _Nullable responseObject, NSError * _Nullable error) {
                    WeatherHourlyModel *weatherHourlyModel = [WeatherHourlyModel mj_objectWithKeyValues:responseObject];
                    WeatherHourlyModel *weatherHourlyModelResponse = (WeatherHourlyModel *)weatherHourlyModel.HeWeather6.firstObject;
                    if (response) {
                        response(weatherHourlyModelResponse, error);
                    }
                }];
            }
                break;
            case INQUIRE_TYPE_WEATHER_LIFESTYLE:{
                [self weatherLifestyleWithResponse:^(id  _Nullable responseObject, NSError * _Nullable error) {
                    WeatherLifestyleModel *weatherLifestyleModel = [WeatherLifestyleModel mj_objectWithKeyValues:responseObject];
                    WeatherLifestyleModel *weatherLifestyleModelResponse = (WeatherLifestyleModel *)weatherLifestyleModel.HeWeather6.firstObject;
                    if (response) {
                        response(weatherLifestyleModelResponse, error);
                    }
                }];
            }
                break;
            case INQUIRE_TYPE_WEATHER:{
                [self weatherWithResponse:^(id  _Nullable responseObject, NSError * _Nullable error) {
                    WeatherModel *weatherModel = [WeatherModel mj_objectWithKeyValues:responseObject];
                    WeatherModel *weatherModelResponse = (WeatherModel *)weatherModel.HeWeather6.firstObject;
                    if (response) {
                        response(weatherModelResponse, error);
                    }
                }];
            }
                break;
            case INQUIRE_TYPE_WEATHER_GRID_MINUTE:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (response) {
                        response(nil, [self prohibitRequest]);
                    }
                } else {
                    [self weatherGridMinuteWithResponse:^(id  _Nullable responseObject, NSError * _Nullable error) {
                        WeatherGridMinuteModel *weatherGridMinuteModel = [WeatherGridMinuteModel mj_objectWithKeyValues:responseObject];
                        WeatherGridMinuteModel *weatherGridMinuteModelResponse = (WeatherGridMinuteModel *)weatherGridMinuteModel.HeWeather6.firstObject;
                        if (response) {
                            response(weatherGridMinuteModelResponse, error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_WEATHER_GRID_NOW:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (response) {
                        response(nil, [self prohibitRequest]);
                    }
                } else {
                    [self weatherGridNowWithResponse:^(id  _Nullable responseObject, NSError * _Nullable error) {
                        WeatherGridNowModel *weatherGridNowModel = [WeatherGridNowModel mj_objectWithKeyValues:responseObject];
                        WeatherGridNowModel *weatherGridNowModelResponse = (WeatherGridNowModel *)weatherGridNowModel.HeWeather6.firstObject;
                        if (response) {
                            response(weatherGridNowModelResponse, error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_WEATHER_GRID_FORECAST:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (response) {
                        response(nil, [self prohibitRequest]);
                    }
                } else {
                    [self weatherGridForecastWithResponse:^(id  _Nullable responseObject, NSError * _Nullable error) {
                        WeatherGridForecastModel *weatherGridForecastModel = [WeatherGridForecastModel mj_objectWithKeyValues:responseObject];
                        WeatherGridForecastModel *weatherGridForecastModelResponse = (WeatherGridForecastModel *)weatherGridForecastModel.HeWeather6.firstObject;
                        if (response) {
                            response(weatherGridForecastModelResponse, error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_WEATHER_GRID_HOURLY:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (response) {
                        response(nil, [self prohibitRequest]);
                    }
                } else {
                    [self weatherGridHourlyWithResponse:^(id  _Nullable responseObject, NSError * _Nullable error) {
                        WeatherGridHourlyModel *weatherGridHourlyModel = [WeatherGridHourlyModel mj_objectWithKeyValues:responseObject];
                        WeatherGridHourlyModel *weatherGridHourlyModelResponse = (WeatherGridHourlyModel *)weatherGridHourlyModel.HeWeather6.firstObject;
                        if (response) {
                            response(weatherGridHourlyModelResponse, error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_ALARM:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (response) {
                        response(nil, [self prohibitRequest]);
                    }
                } else {
                    [self alarmWithResponse:^(id  _Nullable responseObject, NSError * _Nullable error) {
                        AlarmModel *alarmModel = [AlarmModel mj_objectWithKeyValues:responseObject];
                        AlarmModel *alarmModelResponse = (AlarmModel *)alarmModel.HeWeather6.firstObject;
                        if (response) {
                            response(alarmModelResponse, error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_ALARM_ALL:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (response) {
                        response(nil, [self prohibitRequest]);
                    }
                } else {
                    [self alarmAllWithResponse:^(id  _Nullable responseObject, NSError * _Nullable error) {
                        AlarmAllModel *alarmAllModel = [AlarmAllModel mj_objectWithKeyValues:responseObject];
                        AlarmAllModel *alarmAllModelResponse = (AlarmAllModel *)alarmAllModel.HeWeather6.firstObject;
                        if (response) {
                            response(alarmAllModelResponse, error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_SCENIC:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (response) {
                        response(nil, [self prohibitRequest]);
                    }
                } else {
                    [self scenicWithResponse:^(id  _Nullable responseObject, NSError * _Nullable error) {
                        ScenicModel *scenicModel = [ScenicModel mj_objectWithKeyValues:responseObject];
                        ScenicModel *scenicModelResponse = (ScenicModel *)scenicModel.HeWeather6.firstObject;
                        if (response) {
                            response(scenicModelResponse, error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_AIR_NOW:{
                [self airNowWithResponse:^(id  _Nullable responseObject, NSError * _Nullable error) {
                    AirNowModel *airNowModel = [AirNowModel mj_objectWithKeyValues:responseObject];
                    AirNowModel *airNowModelResponse = (AirNowModel *)airNowModel.HeWeather6.firstObject;
                    if (response) {
                        response(airNowModelResponse, error);
                    }
                }];
            }
                break;
            case INQUIRE_TYPE_AIR_FORECAST:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (response) {
                        response(nil, [self prohibitRequest]);
                    }
                } else {
                    [self airForecastWithResponse:^(id  _Nullable responseObject, NSError * _Nullable error) {
                        AirForecastModel *airForecastModel = [AirForecastModel mj_objectWithKeyValues:responseObject];
                        AirForecastModel *airForecastModelResponse = (AirForecastModel *)airForecastModel.HeWeather6.firstObject;
                        if (response) {
                            response(airForecastModelResponse, error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_AIR_HOURLY:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (response) {
                        response(nil, [self prohibitRequest]);
                    }
                } else {
                    [self airHourlyWithResponse:^(id  _Nullable responseObject, NSError * _Nullable error) {
                        AirHourlyModel *airHourlyModel = [AirHourlyModel mj_objectWithKeyValues:responseObject];
                        AirHourlyModel *airHourlyModelResponse = (AirHourlyModel *)airHourlyModel.HeWeather6.firstObject;
                        if (response) {
                            response(airHourlyModelResponse, error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_AIR:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (response) {
                        response(nil, [self prohibitRequest]);
                    }
                } else {
                    [self airWithResponse:^(id  _Nullable responseObject, NSError * _Nullable error) {
                        AirModel *airModel = [AirModel mj_objectWithKeyValues:responseObject];
                        AirModel *airModelResponse = (AirModel *)airModel.HeWeather6.firstObject;
                        if (response) {
                            response(airModelResponse, error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_WEATHER_HISTORICAL:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (response) {
                        response(nil, [self prohibitRequest]);
                    }
                } else {
                    [self weatherHistoricalWithResponse:^(id  _Nullable responseObject, NSError * _Nullable error) {
                        WeatherHistoricalModel *weatherHistoricalModel = [WeatherHistoricalModel mj_objectWithKeyValues:responseObject];
                        WeatherHistoricalModel *weatherHistoricalModelResponse = (WeatherHistoricalModel *)weatherHistoricalModel.HeWeather6.firstObject;
                        if (response) {
                            response(weatherHistoricalModelResponse, error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_SOLAR_SUNRISE_SUNSET:{
                [self solarSunriseSunsetWithResponse:^(id  _Nullable responseObject, NSError * _Nullable error) {
                    SolarSunriseSunsetModel *solarSunriseSunsetModel = [SolarSunriseSunsetModel mj_objectWithKeyValues:responseObject];
                    SolarSunriseSunsetModel *solarSunriseSunsetModelResponse = (SolarSunriseSunsetModel *)solarSunriseSunsetModel.HeWeather6.firstObject;
                    if (response) {
                        response(solarSunriseSunsetModelResponse, error);
                    }
                }];
            }
                break;
            case INQUIRE_TYPE_MAP_CLOUD_MAP:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (response) {
                        response(nil, [self prohibitRequest]);
                    }
                } else {
                    [self mapCloudmapWithResponse:^(id  _Nullable responseObject, NSError * _Nullable error) {
                        if (response) {
                            response(responseObject, error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_SOLAR_ELEVATION_ANGLR:{
                if (self.userType == USER_TYPE_FREE_USER) {
                    if (response) {
                        response(nil, [self prohibitRequest]);
                    }
                } else {
                    [self solarElevationAngleWithResponse:^(id  _Nullable responseObject, NSError * _Nullable error) {
                        SolarElevationAngleModel *solarElevationAngleModel = [SolarElevationAngleModel mj_objectWithKeyValues:responseObject];
                        SolarElevationAngleModel *solarElevationAngleModelResponse = (SolarElevationAngleModel *)solarElevationAngleModel.HeWeather6.firstObject;
                        if (response) {
                            response(solarElevationAngleModelResponse, error);
                        }
                    }];
                }
            }
                break;
            case INQUIRE_TYPE_SEARCH:{
                [self searchWithResponse:^(id  _Nullable responseObject, NSError * _Nullable error) {
                    SearchModel *searchModel = [SearchModel mj_objectWithKeyValues:responseObject];
                    SearchModel *searchModelResponse = (SearchModel *)searchModel.HeWeather6.firstObject;
                    if (response) {
                        response(searchModelResponse, error);
                    }
                }];
            }
                break;
            case INQUIRE_TYPE_FIND:{
                [self findWithResponse:^(id  _Nullable responseObject, NSError * _Nullable error) {
                    FindModel *findModel = [FindModel mj_objectWithKeyValues:responseObject];
                    FindModel *findModelResponse = (FindModel *)findModel.HeWeather6.firstObject;
                    if (response) {
                        response(findModelResponse, error);
                    }
                }];
            }
                break;
            case INQUIRE_TYPE_TOP:{
                [self topWithResponse:^(id  _Nullable responseObject, NSError * _Nullable error) {
                    TopModel *topModel = [TopModel mj_objectWithKeyValues:responseObject];
                    TopModel *topModelResponse = (TopModel *)topModel.HeWeather6.firstObject;
                    if (response) {
                        response(topModelResponse, error);
                    }
                }];
            }
                break;
                
            default: {
                if (response) {
                    NSDictionary *userInfo1 = [NSDictionary dictionaryWithObject:@"请选择查询类型！" forKey:@"RequestError"];
                    NSError *error = [NSError errorWithDomain:NSCocoaErrorDomain code:-999 userInfo:userInfo1];
                    response(nil, error);
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
