//
//  HeWeather6.h
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WeatherGridNowGridNow, WeatherGridNowBasic, WeatherGridNowUpdate;

@interface WeatherGridNowHeWeather6 : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) WeatherGridNowGridNow *gridNow;
@property (nonatomic, strong) WeatherGridNowBasic *basic;
@property (nonatomic, strong) WeatherGridNowUpdate *update;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
