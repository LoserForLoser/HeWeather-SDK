//
//  WeatherModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WeatherResponseModel.h"
#import "WeatherLifestyleModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeatherModel : WeatherResponseModel

@property (nonatomic, strong) NSArray <WeatherData *>*daily_forecast;
@property (nonatomic, strong) NSArray <WeatherData *>*hourly;
@property (nonatomic, strong) NSArray <Lifestyle *>*lifestyle;
@property (nonatomic, strong) WeatherData *now;

@end

NS_ASSUME_NONNULL_END
