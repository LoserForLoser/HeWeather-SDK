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

- (void)weatherForecastWithSuccess:(void(^)(id responseObject))getSuccess
                  faileureForError:(void(^)(NSError *error))getError;

/**
 实况天气
 weather/now
 */
- (void)weatherNowWithSuccess:(void(^)(id responseObject))getSuccess
             faileureForError:(void(^)(NSError *error))getError;

/**
 逐小时预报
 weather/hourly
 */

- (void)weatherHourlyWithSuccess:(void(^)(id responseObject))getSuccess
                faileureForError:(void(^)(NSError *error))getError;

/**
 生活指数
 weather/lifestyle
 */

- (void)weatherLifestyleWithSuccess:(void(^)(id responseObject))getSuccess
                   faileureForError:(void(^)(NSError *error))getError;

/**
 常规天气数据集合
 weather
 */

- (void)weatherWithSuccess:(void(^)(id responseObject))getSuccess
          faileureForError:(void(^)(NSError *error))getError;

/**
 分钟级降雨（邻近预报）
 weather/grid-minute
 */

- (void)weatherGridMinuteWithSuccess:(void(^)(id responseObject))getSuccess
                    faileureForError:(void(^)(NSError *error))getError;

/**
 格点实况天气
 weather/grid-now
 */

- (void)weatherGridNowWithSuccess:(void(^)(id responseObject))getSuccess
                 faileureForError:(void(^)(NSError *error))getError;

/**
 格点7天预报
 weather/grid-forecast
 */

- (void)weatherGridForecastWithSuccess:(void(^)(id responseObject))getSuccess
                      faileureForError:(void(^)(NSError *error))getError;

/**
 格点逐小时预报
 weather/grid-hourly
 */

- (void)weatherGridHourlyWithSuccess:(void(^)(id responseObject))getSuccess
                    faileureForError:(void(^)(NSError *error))getError;

/**
 天气灾害预警
 alarm
 */

- (void)alarmWithSuccess:(void(^)(id responseObject))getSuccess
        faileureForError:(void(^)(NSError *error))getError;

/**
 天气灾害预警集合
 alarm/all
 */

- (void)alarmAllWithSuccess:(void(^)(id responseObject))getSuccess
           faileureForError:(void(^)(NSError *error))getError;

/**
 景点天气预报
 scenic
 */

- (void)scenicWithSuccess:(void(^)(id responseObject))getSuccess
         faileureForError:(void(^)(NSError *error))getError;

/**
 空气质量实况
 air/now
 */

- (void)airNowWithSuccess:(void(^)(id responseObject))getSuccess
         faileureForError:(void(^)(NSError *error))getError;

/**
 空气质量7天预报
 air/forecast
 */

- (void)airForecastWithSuccess:(void(^)(id responseObject))getSuccess
              faileureForError:(void(^)(NSError *error))getError;

/**
 空气质量逐小时预报
 air/hourly
 */

- (void)airHourlyWithSuccess:(void(^)(id responseObject))getSuccess
            faileureForError:(void(^)(NSError *error))getError;

/**
 空气质量数据集合
 air
 */

- (void)airWithSuccess:(void(^)(id responseObject))getSuccess
      faileureForError:(void(^)(NSError *error))getError;

/**
 历史天气
 weather/historical
 */

- (void)weatherHistoricalWithSuccess:(void(^)(id responseObject))getSuccess
                    faileureForError:(void(^)(NSError *error))getError;

/**
 日出日落
 solar/sunrise-sunset
 */

- (void)solarSunriseSunsetWithSuccess:(void(^)(id responseObject))getSuccess
                     faileureForError:(void(^)(NSError *error))getError;

/**
 卫星云图
 map/cloudmap
 */

- (void)mapCloudmapWithSuccess:(void(^)(id responseObject))getSuccess
              faileureForError:(void(^)(NSError *error))getError;

/**
 太阳高度
 solar/solar-elevation-angle
 */

- (void)solarElevationAngleWithSuccess:(void(^)(id responseObject))getSuccess
                      faileureForError:(void(^)(NSError *error))getError;

/**
 城市查询
 search
 */

- (void)searchWithSuccess:(void(^)(id responseObject))getSuccess
         faileureForError:(void(^)(NSError *error))getError;

@end
