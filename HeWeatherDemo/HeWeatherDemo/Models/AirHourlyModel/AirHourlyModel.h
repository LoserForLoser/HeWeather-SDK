//
//  AirHourlyModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WeatherResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AirHourlyModel : WeatherResponseModel

@property (nonatomic, strong) NSArray <AirData *>*air_hourly;

@end

NS_ASSUME_NONNULL_END
