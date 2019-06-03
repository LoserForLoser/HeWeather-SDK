//
//  WeatherForecastModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/29.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WetherResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeatherForecastModel : WetherResponseModel

@property (nonatomic, strong) NSArray <WeatherData *>*daily_forecast;

@end

NS_ASSUME_NONNULL_END
