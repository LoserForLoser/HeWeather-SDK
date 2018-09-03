//
//  HeWeather6.h
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WeatherLifestyleBasic, WeatherLifestyleUpdate;

@interface WeatherLifestyleHeWeather6 : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSArray *lifestyle;
@property (nonatomic, strong) WeatherLifestyleBasic *basic;
@property (nonatomic, strong) WeatherLifestyleUpdate *update;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
