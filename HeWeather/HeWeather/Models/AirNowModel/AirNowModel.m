//
//  AirNowModel.m
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "AirNowModel.h"

@implementation AirNowModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"air_now_station" : @"AirData"
             };
}

@end
