//
//  AllWeatherInquieirs+Request.h
//  HEWEATHER
//
//  Created by Coder on 2018/4/29.
//  Copyright © 2018年 Song. All rights reserved.
//

#import "AllWeatherInquieirs.h"

@interface AllWeatherInquieirs (Request)

/**
 3-10天天气预报
 weather/forecast
 */
- (void)weatherForecastWithResponse:(void (^ _Nullable)(id _Nullable responseObject, NSError * _Nullable error))response;

/**
 实况天气
 weather/now
 */
- (void)weatherNowWithResponse:(void (^ _Nullable)(id _Nullable responseObject, NSError * _Nullable error))response;

/**
 逐小时预报
 weather/hourly
 */
- (void)weatherHourlyWithResponse:(void (^ _Nullable)(id _Nullable responseObject, NSError * _Nullable error))response;

/**
 生活指数
 weather/lifestyle
 */
- (void)weatherLifestyleWithResponse:(void (^ _Nullable)(id _Nullable responseObject, NSError * _Nullable error))response;

/**
 常规天气数据集合
 weather
 */
- (void)weatherWithResponse:(void (^ _Nullable)(id _Nullable responseObject, NSError * _Nullable error))response;

/**
 分钟级降雨（邻近预报）
 weather/grid-minute
 */
- (void)weatherGridMinuteWithResponse:(void (^ _Nullable)(id _Nullable responseObject, NSError * _Nullable error))response;

/**
 格点实况天气
 weather/grid-now
 */
- (void)weatherGridNowWithResponse:(void (^ _Nullable)(id _Nullable responseObject, NSError * _Nullable error))response;

/**
 格点7天预报
 weather/grid-forecast
 */
- (void)weatherGridForecastWithResponse:(void (^ _Nullable)(id _Nullable responseObject, NSError * _Nullable error))response;

/**
 格点逐小时预报
 weather/grid-hourly
 */
- (void)weatherGridHourlyWithResponse:(void (^ _Nullable)(id _Nullable responseObject, NSError * _Nullable error))response;

/**
 天气灾害预警
 alarm
 */
- (void)alarmWithResponse:(void (^ _Nullable)(id _Nullable responseObject, NSError * _Nullable error))response;

/**
 天气灾害预警集合
 alarm/all
 */
- (void)alarmAllWithResponse:(void (^ _Nullable)(id _Nullable responseObject, NSError * _Nullable error))response;

/**
 景点天气预报
 scenic
 */
- (void)scenicWithResponse:(void (^ _Nullable)(id _Nullable responseObject, NSError * _Nullable error))response;

/**
 空气质量实况
 air/now
 */
- (void)airNowWithResponse:(void (^ _Nullable)(id _Nullable responseObject, NSError * _Nullable error))response;

/**
 空气质量7天预报
 air/forecast
 */
- (void)airForecastWithResponse:(void (^ _Nullable)(id _Nullable responseObject, NSError * _Nullable error))response;

/**
 空气质量逐小时预报
 air/hourly
 */
- (void)airHourlyWithResponse:(void (^ _Nullable)(id _Nullable responseObject, NSError * _Nullable error))response;

/**
 空气质量数据集合
 air
 */
- (void)airWithResponse:(void (^ _Nullable)(id _Nullable responseObject, NSError * _Nullable error))response;

/**
 历史天气
 weather/historical
 */
- (void)weatherHistoricalWithResponse:(void (^ _Nullable)(id _Nullable responseObject, NSError * _Nullable error))response;

/**
 日出日落
 solar/sunrise-sunset
 */
- (void)solarSunriseSunsetWithResponse:(void (^ _Nullable)(id _Nullable responseObject, NSError * _Nullable error))response;

/**
 卫星云图
 map/cloudmap
 */
- (void)mapCloudmapWithResponse:(void (^ _Nullable)(id _Nullable responseObject, NSError * _Nullable error))response;

/**
 太阳高度
 solar/solar-elevation-angle
 */
- (void)solarElevationAngleWithResponse:(void (^ _Nullable)(id _Nullable responseObject, NSError * _Nullable error))response;

/**
 城市查询
 search
 */
- (void)searchWithResponse:(void (^ _Nullable)(id _Nullable responseObject, NSError * _Nullable error))response;

/**
 城市搜索
 find
 */
- (void)findWithResponse:(void (^ _Nullable)(id _Nullable responseObject, NSError * _Nullable error))response;

/**
 热门城市列表
 top
 */
- (void)topWithResponse:(void (^ _Nullable)(id _Nullable responseObject, NSError * _Nullable error))response;

@end
