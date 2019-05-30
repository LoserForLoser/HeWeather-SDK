//
//  WeatherGridForecastModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WetherResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class GridForecast;

@interface WeatherGridForecastModel : WetherResponseModel

@property (nonatomic, strong) NSArray <GridForecast *>*grid_forecast;

@end

@interface GridForecast : NSObject

@property (nonatomic, strong) NSString *cond_code_d;
@property (nonatomic, strong) NSString *cond_code_n;
@property (nonatomic, strong) NSString *cond_txt_d;
@property (nonatomic, strong) NSString *cond_txt_n;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *tmp_max;
@property (nonatomic, strong) NSString *tmp_min;
@property (nonatomic, strong) NSString *wind_dir_d;
@property (nonatomic, strong) NSString *wind_dir_n;
@property (nonatomic, strong) NSString *wind_sc_d;
@property (nonatomic, strong) NSString *wind_sc_n;

@end

NS_ASSUME_NONNULL_END
