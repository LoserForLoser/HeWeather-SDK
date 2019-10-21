//
//  WeatherResponseModel.m
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/29.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WeatherResponseModel.h"
#import "YYModel.h"

@implementation WeatherResponseModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"HeWeather6" : WeatherResponseModel.class
             };
}

@end

@implementation Basic

@end

@implementation Update

@end

#pragma mark - 通用属性

@implementation AirData

@end

@implementation AlarmMessage

@end

@implementation Lifestyle

@end

@implementation WeatherData

@end
