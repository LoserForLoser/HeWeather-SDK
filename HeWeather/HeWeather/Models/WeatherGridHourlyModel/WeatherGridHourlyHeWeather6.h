//
//  HeWeather6.h
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WeatherGridHourlyBasic, WeatherGridHourlyUpdate;

@interface WeatherGridHourlyHeWeather6 : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSArray *gridHourly;
@property (nonatomic, strong) WeatherGridHourlyBasic *basic;
@property (nonatomic, strong) WeatherGridHourlyUpdate *update;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
