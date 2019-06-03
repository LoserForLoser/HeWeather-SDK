//
//  WeatherModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WetherResponseModel.h"
#import "WeatherLifestyleModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeatherModel : WetherResponseModel

@property (nonatomic, copy) NSArray <WeatherData *>*daily_forecast;
@property (nonatomic, copy) NSArray <WeatherData *>*hourly;
@property (nonatomic, copy) NSArray <Lifestyle *>*lifestyle;
@property (nonatomic, strong) WeatherData *now;

@end

NS_ASSUME_NONNULL_END
