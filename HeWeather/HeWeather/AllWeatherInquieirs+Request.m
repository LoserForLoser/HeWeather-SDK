//
//  AllWeatherInquieirs+Request.m
//  HEWEATHER
//
//  Created by Coder on 2018/4/29.
//  Copyright © 2018年 Song. All rights reserved.
//

#import "AllWeatherInquieirs+Request.h"
#import "AllWeatherInquieirs+Property.h"
#import "AllWeatherInquieirs+Tool.h"

// 付费接口（格点天气等接口仅付费用户可用）
NSString * const kAppHeweatherAPIURL = @"https://api.heweather.net/";

// 城市搜索服务
NSString * const kAppSearchAPIURL = @"https://search.heweather.com/";

@implementation AllWeatherInquieirs (Request)

/**
 3-10天天气预报
 weather/forecast
 */

- (void)weatherForecastWithResponse:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
    NSString *urlString = [NSString stringWithFormat:@"%@weather/forecast",self.kAppServerAPIURL];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:self.location forKey:@"location"];
    [parameter setObject:self.username forKey:@"username"];
    [parameter setObject:self.t forKey:@"t"];
    [parameter setObject:self.lang forKey:@"lang"];
    [parameter setObject:self.unit forKey:@"unit"];
    self.sign = [self signToEncryptionStringWithDataDictionary:parameter];
    [parameter setObject:self.sign forKey:@"sign"];
    
    [self AFNetworkActionWitchGET:urlString parameters:parameter response:^(id  _Nullable responseObject, NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (response) {
            response(responseObject, error);
        }
    }];
}

/**
 实况天气
 weather/now
 */
- (void)weatherNowWithResponse:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
    NSString *urlString = [NSString stringWithFormat:@"%@weather/now",self.kAppServerAPIURL];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:self.location forKey:@"location"];
    [parameter setObject:self.username forKey:@"username"];
    [parameter setObject:self.t forKey:@"t"];
    [parameter setObject:self.lang forKey:@"lang"];
    [parameter setObject:self.unit forKey:@"unit"];
    self.sign = [self signToEncryptionStringWithDataDictionary:parameter];
    [parameter setObject:self.sign forKey:@"sign"];
    
    [self AFNetworkActionWitchGET:urlString parameters:parameter response:^(id  _Nullable responseObject, NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (response) {
            response(responseObject, error);
        }
    }];
}

/**
 逐小时预报
 weather/hourly
 */

- (void)weatherHourlyWithResponse:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
    NSString *urlString = [NSString stringWithFormat:@"%@weather/hourly",self.kAppServerAPIURL];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:self.location forKey:@"location"];
    [parameter setObject:self.username forKey:@"username"];
    [parameter setObject:self.t forKey:@"t"];
    [parameter setObject:self.lang forKey:@"lang"];
    [parameter setObject:self.unit forKey:@"unit"];
    self.sign = [self signToEncryptionStringWithDataDictionary:parameter];
    [parameter setObject:self.sign forKey:@"sign"];
    
    [self AFNetworkActionWitchGET:urlString parameters:parameter response:^(id  _Nullable responseObject, NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (response) {
            response(responseObject, error);
        }
    }];
}

/**
 生活指数
 weather/lifestyle
 */

- (void)weatherLifestyleWithResponse:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
    NSString *urlString = [NSString stringWithFormat:@"%@weather/lifestyle",self.kAppServerAPIURL];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:self.location forKey:@"location"];
    [parameter setObject:self.username forKey:@"username"];
    [parameter setObject:self.t forKey:@"t"];
    [parameter setObject:self.lang forKey:@"lang"];
    [parameter setObject:self.unit forKey:@"unit"];
    self.sign = [self signToEncryptionStringWithDataDictionary:parameter];
    [parameter setObject:self.sign forKey:@"sign"];
    
    [self AFNetworkActionWitchGET:urlString parameters:parameter response:^(id  _Nullable responseObject, NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (response) {
            response(responseObject, error);
        }
    }];
}

/**
 常规天气数据集合
 weather
 */

- (void)weatherWithResponse:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
    NSString *urlString = [NSString stringWithFormat:@"%@weather",self.kAppServerAPIURL];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:self.location forKey:@"location"];
    [parameter setObject:self.username forKey:@"username"];
    [parameter setObject:self.t forKey:@"t"];
    [parameter setObject:self.lang forKey:@"lang"];
    [parameter setObject:self.unit forKey:@"unit"];
    self.sign = [self signToEncryptionStringWithDataDictionary:parameter];
    [parameter setObject:self.sign forKey:@"sign"];
    
    [self AFNetworkActionWitchGET:urlString parameters:parameter response:^(id  _Nullable responseObject, NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (response) {
            response(responseObject, error);
        }
    }];
}

/**
 分钟级降雨（邻近预报）
 weather/grid-minute
 */

- (void)weatherGridMinuteWithResponse:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
    NSString *urlString = [NSString stringWithFormat:@"%@weather/grid-minute",kAppHeweatherAPIURL];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:self.location forKey:@"location"];
    [parameter setObject:self.username forKey:@"username"];
    [parameter setObject:self.t forKey:@"t"];
    [parameter setObject:self.lang forKey:@"lang"];
    [parameter setObject:self.unit forKey:@"unit"];
    self.sign = [self signToEncryptionStringWithDataDictionary:parameter];
    [parameter setObject:self.sign forKey:@"sign"];
    
    [self AFNetworkActionWitchGET:urlString parameters:parameter response:^(id  _Nullable responseObject, NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (response) {
            response(responseObject, error);
        }
    }];
}

/**
 格点实况天气
 weather/grid-now
 */

- (void)weatherGridNowWithResponse:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
    NSString *urlString = [NSString stringWithFormat:@"%@weather/grid-now",kAppHeweatherAPIURL];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:self.location forKey:@"location"];
    [parameter setObject:self.username forKey:@"username"];
    [parameter setObject:self.t forKey:@"t"];
    [parameter setObject:self.lang forKey:@"lang"];
    [parameter setObject:self.unit forKey:@"unit"];
    self.sign = [self signToEncryptionStringWithDataDictionary:parameter];
    [parameter setObject:self.sign forKey:@"sign"];
    
    [self AFNetworkActionWitchGET:urlString parameters:parameter response:^(id  _Nullable responseObject, NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (response) {
            response(responseObject, error);
        }
    }];
}

/**
 格点7天预报
 weather/grid-forecast
 */

- (void)weatherGridForecastWithResponse:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
    NSString *urlString = [NSString stringWithFormat:@"%@weather/grid-forecast",kAppHeweatherAPIURL];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:self.location forKey:@"location"];
    [parameter setObject:self.username forKey:@"username"];
    [parameter setObject:self.t forKey:@"t"];
    [parameter setObject:self.lang forKey:@"lang"];
    [parameter setObject:self.unit forKey:@"unit"];
    self.sign = [self signToEncryptionStringWithDataDictionary:parameter];
    [parameter setObject:self.sign forKey:@"sign"];
    
    [self AFNetworkActionWitchGET:urlString parameters:parameter response:^(id  _Nullable responseObject, NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (response) {
            response(responseObject, error);
        }
    }];
}

/**
 格点逐小时预报
 weather/grid-hourly
 */

- (void)weatherGridHourlyWithResponse:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
    NSString *urlString = [NSString stringWithFormat:@"%@weather/grid-hourly",kAppHeweatherAPIURL];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:self.location forKey:@"location"];
    [parameter setObject:self.username forKey:@"username"];
    [parameter setObject:self.t forKey:@"t"];
    [parameter setObject:self.lang forKey:@"lang"];
    [parameter setObject:self.unit forKey:@"unit"];
    self.sign = [self signToEncryptionStringWithDataDictionary:parameter];
    [parameter setObject:self.sign forKey:@"sign"];
    
    [self AFNetworkActionWitchGET:urlString parameters:parameter response:^(id  _Nullable responseObject, NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (response) {
            response(responseObject, error);
        }
    }];
}

/**
 天气灾害预警
 alarm
 */

- (void)alarmWithResponse:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
    NSString *urlString = [NSString stringWithFormat:@"%@alarm",kAppHeweatherAPIURL];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:self.location forKey:@"location"];
    [parameter setObject:self.username forKey:@"username"];
    [parameter setObject:self.t forKey:@"t"];
    [parameter setObject:self.lang forKey:@"lang"];
    [parameter setObject:self.unit forKey:@"unit"];
    self.sign = [self signToEncryptionStringWithDataDictionary:parameter];
    [parameter setObject:self.sign forKey:@"sign"];
    
    [self AFNetworkActionWitchGET:urlString parameters:parameter response:^(id  _Nullable responseObject, NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (response) {
            response(responseObject, error);
        }
    }];
}

/**
 天气灾害预警集合
 alarm/all
 */

- (void)alarmAllWithResponse:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
    NSString *urlString = [NSString stringWithFormat:@"%@alarm/all",kAppHeweatherAPIURL];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:self.username forKey:@"username"];
    [parameter setObject:self.t forKey:@"t"];
    self.sign = [self signToEncryptionStringWithDataDictionary:parameter];
    [parameter setObject:self.sign forKey:@"sign"];
    
    [self AFNetworkActionWitchGET:urlString parameters:parameter response:^(id  _Nullable responseObject, NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (response) {
            response(responseObject, error);
        }
    }];
}

/**
 景点天气预报
 scenic
 */

- (void)scenicWithResponse:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
    NSString *urlString = [NSString stringWithFormat:@"%@scenic",kAppHeweatherAPIURL];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:self.location forKey:@"location"];
    [parameter setObject:self.username forKey:@"username"];
    [parameter setObject:self.t forKey:@"t"];
    [parameter setObject:self.lang forKey:@"lang"];
    [parameter setObject:self.unit forKey:@"unit"];
    self.sign = [self signToEncryptionStringWithDataDictionary:parameter];
    [parameter setObject:self.sign forKey:@"sign"];
    
    [self AFNetworkActionWitchGET:urlString parameters:parameter response:^(id  _Nullable responseObject, NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (response) {
            response(responseObject, error);
        }
    }];
}

/**
 空气质量实况
 air/now
 */

- (void)airNowWithResponse:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
    NSString *urlString = [NSString stringWithFormat:@"%@air/now",self.kAppServerAPIURL];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:self.location forKey:@"location"];
    [parameter setObject:self.username forKey:@"username"];
    [parameter setObject:self.t forKey:@"t"];
    [parameter setObject:self.lang forKey:@"lang"];
    [parameter setObject:self.unit forKey:@"unit"];
    self.sign = [self signToEncryptionStringWithDataDictionary:parameter];
    [parameter setObject:self.sign forKey:@"sign"];
    
    [self AFNetworkActionWitchGET:urlString parameters:parameter response:^(id  _Nullable responseObject, NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (response) {
            response(responseObject, error);
        }
    }];
}

/**
 空气质量7天预报
 air/forecast
 */

- (void)airForecastWithResponse:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
    NSString *urlString = [NSString stringWithFormat:@"%@air/forecast",kAppHeweatherAPIURL];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:self.location forKey:@"location"];
    [parameter setObject:self.username forKey:@"username"];
    [parameter setObject:self.t forKey:@"t"];
    [parameter setObject:self.lang forKey:@"lang"];
    [parameter setObject:self.unit forKey:@"unit"];
    self.sign = [self signToEncryptionStringWithDataDictionary:parameter];
    [parameter setObject:self.sign forKey:@"sign"];
    
    [self AFNetworkActionWitchGET:urlString parameters:parameter response:^(id  _Nullable responseObject, NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (response) {
            response(responseObject, error);
        }
    }];
}

/**
 空气质量逐小时预报
 air/hourly
 */

- (void)airHourlyWithResponse:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
    NSString *urlString = [NSString stringWithFormat:@"%@air/hourly",kAppHeweatherAPIURL];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:self.location forKey:@"location"];
    [parameter setObject:self.username forKey:@"username"];
    [parameter setObject:self.t forKey:@"t"];
    [parameter setObject:self.lang forKey:@"lang"];
    [parameter setObject:self.unit forKey:@"unit"];
    self.sign = [self signToEncryptionStringWithDataDictionary:parameter];
    [parameter setObject:self.sign forKey:@"sign"];
    
    [self AFNetworkActionWitchGET:urlString parameters:parameter response:^(id  _Nullable responseObject, NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (response) {
            response(responseObject, error);
        }
    }];
}

/**
 空气质量数据集合
 air
 */

- (void)airWithResponse:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
    NSString *urlString = [NSString stringWithFormat:@"%@air",kAppHeweatherAPIURL];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:self.location forKey:@"location"];
    [parameter setObject:self.username forKey:@"username"];
    [parameter setObject:self.t forKey:@"t"];
    [parameter setObject:self.lang forKey:@"lang"];
    [parameter setObject:self.unit forKey:@"unit"];
    self.sign = [self signToEncryptionStringWithDataDictionary:parameter];
    [parameter setObject:self.sign forKey:@"sign"];
    
    [self AFNetworkActionWitchGET:urlString parameters:parameter response:^(id  _Nullable responseObject, NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (response) {
            response(responseObject, error);
        }
    }];
}

/**
 历史天气
 weather/historical
 */

- (void)weatherHistoricalWithResponse:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
    NSString *urlString = [NSString stringWithFormat:@"%@weather/historical",kAppHeweatherAPIURL];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:self.location forKey:@"location"];
    [parameter setObject:self.username forKey:@"username"];
    [parameter setObject:self.t forKey:@"t"];
    [parameter setObject:self.date forKey:@"date"];
    self.sign = [self signToEncryptionStringWithDataDictionary:parameter];
    [parameter setObject:self.sign forKey:@"sign"];
    
    [self AFNetworkActionWitchGET:urlString parameters:parameter response:^(id  _Nullable responseObject, NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (response) {
            response(responseObject, error);
        }
    }];
}

/**
 日出日落
 solar/sunrise-sunset
 */

- (void)solarSunriseSunsetWithResponse:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
    NSString *urlString = [NSString stringWithFormat:@"%@solar/sunrise-sunset",self.kAppServerAPIURL];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:self.location forKey:@"location"];
    [parameter setObject:self.username forKey:@"username"];
    [parameter setObject:self.t forKey:@"t"];
    [parameter setObject:self.lang forKey:@"lang"];
    [parameter setObject:self.unit forKey:@"unit"];
    self.sign = [self signToEncryptionStringWithDataDictionary:parameter];
    [parameter setObject:self.sign forKey:@"sign"];
    
    [self AFNetworkActionWitchGET:urlString parameters:parameter response:^(id  _Nullable responseObject, NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (response) {
            response(responseObject, error);
        }
    }];
}

/**
 卫星云图
 map/cloudmap
 */

- (void)mapCloudmapWithResponse:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
    if (!self.username || [self.username isEqualToString:@""] || !self.t || [self.t isEqualToString:@""]) {
        NSDictionary *userInfoMessage = [NSDictionary dictionaryWithObjectsAndKeys:@"参数不能为空！", nil];
        if (response) {
            NSError *error = [NSError errorWithDomain:NSCocoaErrorDomain code:-999 userInfo:userInfoMessage];
            response(nil, error);
            return;
        }
    }
    
    NSString *urlString = [NSString stringWithFormat:@"%@map/cloudmap",kAppHeweatherAPIURL];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:self.username forKey:@"username"];
    [parameter setObject:self.t forKey:@"t"];
    self.sign = [self signToEncryptionStringWithDataDictionary:parameter];
    [parameter setObject:self.sign forKey:@"sign"];
    
    NSMutableArray *allKeysArray = [NSMutableArray arrayWithArray:[parameter allKeys]];
    [allKeysArray sortUsingSelector:@selector(compare:)];
    NSMutableArray *dicsArray = [NSMutableArray array];
    for (NSInteger count = 0; count < (long)allKeysArray.count; count++) {
        if (parameter[allKeysArray[count]] && ![parameter[allKeysArray[count]] isEqualToString:@""]) {
            [dicsArray addObject:[NSString stringWithFormat:@"%@=%@", allKeysArray[count], parameter[allKeysArray[count]]]];
        }
    }
    NSMutableString *tempString = [NSMutableString stringWithString:[dicsArray componentsJoinedByString:@"&"]];
    
    UIImage *mapCloudmapImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@?%@", urlString, tempString]]]];
    
    if (response) {
        response(mapCloudmapImage, nil);
    }
}

/**
 太阳高度
 solar/solar-elevation-angle
 */

- (void)solarElevationAngleWithResponse:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
    NSString *urlString = [NSString stringWithFormat:@"%@solar/solar-elevation-angle",kAppHeweatherAPIURL];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:self.lat forKey:@"lat"];
    [parameter setObject:self.lon forKey:@"lon"];
    [parameter setObject:self.date forKey:@"date"];
    [parameter setObject:self.time forKey:@"time"];
    [parameter setObject:self.alt forKey:@"alt"];
    [parameter setObject:self.tz forKey:@"tz"];
    [parameter setObject:self.username forKey:@"username"];
    [parameter setObject:self.t forKey:@"t"];
    self.sign = [self signToEncryptionStringWithDataDictionary:parameter];
    [parameter setObject:self.sign forKey:@"sign"];
    
    [self AFNetworkActionWitchGET:urlString parameters:parameter response:^(id  _Nullable responseObject, NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (response) {
            response(responseObject, error);
        }
    }];
}

/**
 城市查询
 search
 */

- (void)searchWithResponse:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
    NSString *urlString = [NSString stringWithFormat:@"%@search",self.kAppServerAPIURL];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:self.location forKey:@"location"];
    [parameter setObject:self.username forKey:@"username"];
    [parameter setObject:self.t forKey:@"t"];
    [parameter setObject:self.lang forKey:@"lang"];
    self.sign = [self signToEncryptionStringWithDataDictionary:parameter];
    [parameter setObject:self.sign forKey:@"sign"];
    
    [self AFNetworkActionWitchGET:urlString parameters:parameter response:^(id  _Nullable responseObject, NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (response) {
            response(responseObject, error);
        }
    }];
}

#pragma mark - 城市搜索服务

/**
 城市搜索
 find
 */

- (void)findWithResponse:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
    NSString *urlString = [NSString stringWithFormat:@"%@find",kAppSearchAPIURL];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:self.location forKey:@"location"];
    [parameter setObject:self.username forKey:@"username"];
    [parameter setObject:self.mode forKey:@"mode"];
    [parameter setObject:self.group forKey:@"group"];
    [parameter setObject:[NSNumber numberWithInt:self.number] forKey:@"number"];
    [parameter setObject:self.lang forKey:@"lang"];
    [parameter setObject:self.key forKey:@"key"];
    self.sign = [self signToEncryptionStringWithDataDictionary:parameter];
    [parameter setObject:self.sign forKey:@"sign"];
    
    [self AFNetworkActionWitchGET:urlString parameters:parameter response:^(id  _Nullable responseObject, NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (response) {
            response(responseObject, error);
        }
    }];
}

/**
 热门城市列表
 top
 */

- (void)topWithResponse:(void (^)(id _Nullable responseObject, NSError * _Nullable error))response {
    NSString *urlString = [NSString stringWithFormat:@"%@top",kAppSearchAPIURL];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:self.group forKey:@"group"];
    [parameter setObject:[NSNumber numberWithInt:self.number] forKey:@"number"];
    [parameter setObject:self.lang forKey:@"lang"];
    [parameter setObject:self.key forKey:@"key"];
    self.sign = [self signToEncryptionStringWithDataDictionary:parameter];
    [parameter setObject:self.sign forKey:@"sign"];
    
    [self AFNetworkActionWitchGET:urlString parameters:parameter response:^(id  _Nullable responseObject, NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (response) {
            response(responseObject, error);
        }
    }];
}

@end
