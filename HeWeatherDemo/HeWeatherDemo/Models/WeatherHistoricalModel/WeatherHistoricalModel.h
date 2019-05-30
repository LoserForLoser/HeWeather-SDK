//
//  WeatherHistoricalModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WetherResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class DailyWeather;
@class HourlyWeather;

@interface WeatherHistoricalModel : WetherResponseModel

@property (nonatomic, strong) DailyWeather *daily_weather;
@property (nonatomic, strong) NSArray <HourlyWeather *>*hourly_weather;

@end

@interface DailyWeather : NSObject

@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *sr;
@property (nonatomic, strong) NSString *ss;
@property (nonatomic, strong) NSString *mr;
@property (nonatomic, strong) NSString *ms;
@property (nonatomic, strong) NSString *tmp_max;
@property (nonatomic, strong) NSString *tmp_min;
@property (nonatomic, strong) NSString *hum;
@property (nonatomic, strong) NSString *pcpn;
@property (nonatomic, strong) NSString *pres;

@end

@interface HourlyWeather : NSObject

@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *tmp;
@property (nonatomic, strong) NSString *cond_code;
@property (nonatomic, strong) NSString *cond_txt;
@property (nonatomic, strong) NSString *wind_dir;
@property (nonatomic, strong) NSString *wind_sc;
@property (nonatomic, strong) NSString *wind_spd;
@property (nonatomic, strong) NSString *hum;
@property (nonatomic, strong) NSString *pres;

@end

NS_ASSUME_NONNULL_END
