//
//  AirForecastModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WetherResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class AirForecast;

@interface AirForecastModel : WetherResponseModel

@property (nonatomic, strong) AirForecast *air_forecast;

@end

@interface AirForecast : NSObject

@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *aqi;
@property (nonatomic, strong) NSString *main;
@property (nonatomic, strong) NSString *qlty;

@end

NS_ASSUME_NONNULL_END
