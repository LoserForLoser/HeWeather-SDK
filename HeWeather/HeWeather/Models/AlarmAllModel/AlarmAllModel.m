//
//  AlarmAllModel.m
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "AlarmAllModel.h"

@implementation AlarmAllModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"alarm_list" : @"AlarmMessage"
             };
}

@end
