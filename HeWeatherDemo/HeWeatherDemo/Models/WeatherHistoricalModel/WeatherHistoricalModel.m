//
//  WeatherHistoricalModel.m
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WeatherHistoricalModel.h"

@implementation WeatherHistoricalModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"hourly_weather" : @"WeatherData"
             };
}

@end
