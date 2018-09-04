//
//  HeWeather6.h
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AirAirNowCity, AirBasic, AirUpdate;

@interface AirHeWeather6 : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) AirAirNowCity *airNowCity;
@property (nonatomic, strong) AirBasic *basic;
@property (nonatomic, strong) AirUpdate *update;
@property (nonatomic, strong) NSArray *airHourly;
@property (nonatomic, strong) NSArray *airForecast;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
