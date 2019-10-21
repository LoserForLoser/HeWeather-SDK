//
//  WeatherModel.m
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WeatherModel.h"

@implementation WeatherModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"daily_forecast" : WeatherData.class,
             @"hourly" : WeatherData.class,
             @"lifestyle" : Lifestyle.class
             };
}

@end
