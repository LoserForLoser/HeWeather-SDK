//
//  WetherResponseModel.m
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/29.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WetherResponseModel.h"
#import "MJExtension.h"

@implementation WetherResponseModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"HeWeather6" : @"WetherResponseModel"
             };
}

+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName {
    return [propertyName mj_underlineFromCamel];
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
