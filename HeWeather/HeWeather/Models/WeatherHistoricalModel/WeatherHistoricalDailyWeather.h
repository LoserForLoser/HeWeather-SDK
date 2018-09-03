//
//  DailyWeather.h
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WeatherHistoricalDailyWeather : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *mr;
@property (nonatomic, strong) NSString *tmpMin;
@property (nonatomic, strong) NSString *pres;
@property (nonatomic, strong) NSString *sr;
@property (nonatomic, strong) NSString *hum;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *ms;
@property (nonatomic, strong) NSString *ss;
@property (nonatomic, strong) NSString *tmpMax;
@property (nonatomic, strong) NSString *pcpn;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
