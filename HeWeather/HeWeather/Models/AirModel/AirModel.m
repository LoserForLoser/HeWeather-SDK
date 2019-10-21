//
//  AirModel.m
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "AirModel.h"

@implementation AirModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"air_hourly" : AirData.class,
             @"air_now_station" : AirData.class
             };
}

@end
