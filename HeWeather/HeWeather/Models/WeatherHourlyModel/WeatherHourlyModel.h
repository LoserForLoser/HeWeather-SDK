//
//  WeatherHourlyModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/29.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WetherResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeatherHourlyModel : WetherResponseModel

@property (nonatomic, strong) NSArray <WeatherData *>*hourly;

@end

NS_ASSUME_NONNULL_END
