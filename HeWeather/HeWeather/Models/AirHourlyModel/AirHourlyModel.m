//
//  AirHourlyModel.m
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "AirHourlyModel.h"

@implementation AirHourlyModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"air_hourly" : @"AirData"
             };
}

@end
