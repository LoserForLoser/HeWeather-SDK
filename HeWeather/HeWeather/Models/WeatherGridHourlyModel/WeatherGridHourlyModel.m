//
//  WeatherGridHourlyModel.m
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WeatherGridHourlyModel.h"

@implementation WeatherGridHourlyModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"grid_hourly" : @"WeatherData"
             };
}

@end
