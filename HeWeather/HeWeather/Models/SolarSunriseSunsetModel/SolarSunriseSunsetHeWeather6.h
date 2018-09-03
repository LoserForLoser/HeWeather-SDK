//
//  HeWeather6.h
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SolarSunriseSunsetBasic, SolarSunriseSunsetUpdate;

@interface SolarSunriseSunsetHeWeather6 : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) SolarSunriseSunsetBasic *basic;
@property (nonatomic, strong) SolarSunriseSunsetUpdate *update;
@property (nonatomic, strong) NSArray *sunriseSunset;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end