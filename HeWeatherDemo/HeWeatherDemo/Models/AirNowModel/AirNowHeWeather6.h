//
//  HeWeather6.h
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AirNowAirNowCity, AirNowBasic, AirNowUpdate;

@interface AirNowHeWeather6 : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) AirNowAirNowCity *airNowCity;
@property (nonatomic, strong) AirNowBasic *basic;
@property (nonatomic, strong) AirNowUpdate *update;
@property (nonatomic, strong) NSArray *airNowStation;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
