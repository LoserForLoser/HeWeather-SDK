//
//  HourlyWeather.h
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WeatherHistoricalHourlyWeather : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *brief;
@property (nonatomic, strong) NSString *spd;
@property (nonatomic, strong) NSString *pres;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *hum;
@property (nonatomic, strong) NSString *sc;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *dir;
@property (nonatomic, strong) NSString *tmp;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
