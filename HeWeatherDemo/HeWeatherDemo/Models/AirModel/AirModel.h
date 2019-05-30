//
//  AirModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WetherResponseModel.h"
#import "AirForecastModel.h"
#import "AirNowModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AirModel : WetherResponseModel

@property (nonatomic, strong) AirForecast *air_forecast;
@property (nonatomic, strong) NSArray <AirForecast *>*air_hourly;

@property (nonatomic, strong) AirNowCity *air_now_city;
@property (nonatomic, copy) NSArray <AirNowCity *>*air_now_station;

@end

NS_ASSUME_NONNULL_END
