//
//  WeatherGridMinuteModel.m
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WeatherGridMinuteModel.h"

@implementation WeatherGridMinuteModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"pcpn_5m" : Pcpn5m.class
             };
}

@end

@implementation GridMinuteForecast

@end

@implementation Pcpn5m

@end

@implementation PcpnType

@end
