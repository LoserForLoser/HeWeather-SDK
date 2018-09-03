//
//  HeWeather6.h
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WeatherNow, WeatherUpdate, WeatherBasic;

@interface WeatherHeWeather6 : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSArray *hourly;
@property (nonatomic, strong) WeatherNow *now;
@property (nonatomic, strong) NSArray *dailyForecast;
@property (nonatomic, strong) WeatherUpdate *update;
@property (nonatomic, strong) WeatherBasic *basic;
@property (nonatomic, strong) NSArray *lifestyle;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
