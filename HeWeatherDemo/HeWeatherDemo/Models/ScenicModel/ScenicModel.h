//
//  ScenicModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WetherResponseModel.h"
#import "WeatherForecastModel.h"

NS_ASSUME_NONNULL_BEGIN

@class DailyForecast;

@interface ScenicModel : WetherResponseModel

@property (nonatomic, strong) DailyForecast *ScenicDailyForecast;

@end

@interface ScenicDailyForecast : DailyForecast

@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *sr;
@property (nonatomic, strong) NSString *ss;

@end

NS_ASSUME_NONNULL_END
