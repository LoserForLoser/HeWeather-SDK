//
//  HeWeather6.h
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WeatherGridMinuteGridMinuteForecast, WeatherGridMinuteBasic, WeatherGridMinutePcpnType, WeatherGridMinuteUpdate;

@interface WeatherGridMinuteHeWeather6 : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) WeatherGridMinuteGridMinuteForecast *gridMinuteForecast;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) WeatherGridMinuteBasic *basic;
@property (nonatomic, strong) NSArray *pcpn5m;
@property (nonatomic, strong) WeatherGridMinutePcpnType *pcpnType;
@property (nonatomic, strong) WeatherGridMinuteUpdate *update;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
