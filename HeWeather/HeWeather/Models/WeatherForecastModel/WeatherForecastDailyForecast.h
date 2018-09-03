//
//  DailyForecast.h
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WeatherForecastDailyForecast : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *hum;
@property (nonatomic, strong) NSString *condTxtD;
@property (nonatomic, strong) NSString *windDir;
@property (nonatomic, strong) NSString *pres;
@property (nonatomic, strong) NSString *uvIndex;
@property (nonatomic, strong) NSString *tmpMax;
@property (nonatomic, strong) NSString *vis;
@property (nonatomic, strong) NSString *windSpd;
@property (nonatomic, strong) NSString *condCodeN;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *windDeg;
@property (nonatomic, strong) NSString *condCodeD;
@property (nonatomic, strong) NSString *pcpn;
@property (nonatomic, strong) NSString *tmpMin;
@property (nonatomic, strong) NSString *condTxtN;
@property (nonatomic, strong) NSString *windSc;
@property (nonatomic, strong) NSString *pop;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
