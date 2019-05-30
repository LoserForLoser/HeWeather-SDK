//
//  WeatherForecastModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/29.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WetherResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class DailyForecast;

@interface WeatherForecastModel : WetherResponseModel

@property (nonatomic, strong) NSArray <DailyForecast *>*daily_forecast;

@end

@interface DailyForecast : NSObject

@property (nonatomic, strong) NSString *cond_code_d;
@property (nonatomic, strong) NSString *cond_code_n;
@property (nonatomic, strong) NSString *cond_txt_d;
@property (nonatomic, strong) NSString *cond_txt_n;
@property (nonatomic, strong) NSString *hum;
@property (nonatomic, strong) NSString *pcpn;
@property (nonatomic, strong) NSString *pop;
@property (nonatomic, strong) NSString *pres;
@property (nonatomic, strong) NSString *tmp_max;
@property (nonatomic, strong) NSString *tmp_min;
@property (nonatomic, strong) NSString *uv_index;
@property (nonatomic, strong) NSString *vis;
@property (nonatomic, strong) NSString *wind_deg;
@property (nonatomic, strong) NSString *wind_dir;
@property (nonatomic, strong) NSString *wind_sc;
@property (nonatomic, strong) NSString *wind_spd;

@end

NS_ASSUME_NONNULL_END
