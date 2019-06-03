//
//  WetherResponseModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/29.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Basic;
@class Update;

@interface WetherResponseModel : NSObject

@property (nonatomic, strong) NSArray <WetherResponseModel *>*HeWeather6;
@property (nonatomic, strong) Basic *basic;
@property (nonatomic, strong) Update *update;
@property (nonatomic, strong) NSString *status;

@end

@interface Basic : NSObject

@property (nonatomic, strong) NSString *cid;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *parent_city;
@property (nonatomic, strong) NSString *admin_area;
@property (nonatomic, strong) NSString *cnty;
@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) NSString *lon;
@property (nonatomic, strong) NSString *tz;

@end

@interface Update : NSObject

@property (nonatomic, strong) NSString *loc;
@property (nonatomic, strong) NSString *utc;

@end

#pragma mark - 通用属性

// 空气质量数据
@interface AirData : NSObject

@property (nonatomic, strong) NSString *air_sta;
@property (nonatomic, strong) NSString *aqi;
@property (nonatomic, strong) NSString *asid;
@property (nonatomic, strong) NSString *co;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) NSString *lon;
@property (nonatomic, strong) NSString *main;
@property (nonatomic, strong) NSString *no2;
@property (nonatomic, strong) NSString *o3;
@property (nonatomic, strong) NSString *pm10;
@property (nonatomic, strong) NSString *pm25;
@property (nonatomic, strong) NSString *pub_time;
@property (nonatomic, strong) NSString *qlty;
@property (nonatomic, strong) NSString *so2;

@end

// 警报信息
@interface AlarmMessage : NSObject

@property (nonatomic, strong) NSString *cid;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *stat;
@property (nonatomic, strong) NSString *level;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *txt;

@end

// 生活指数数据
@interface Lifestyle : NSObject

@property (nonatomic, strong) NSString *brf;
@property (nonatomic, strong) NSString *txt;
@property (nonatomic, strong) NSString *type;

@end

// 天气数据
@interface WeatherData : NSObject

@property (nonatomic, strong) NSString *cond_code_d;
@property (nonatomic, strong) NSString *cond_code_n;
@property (nonatomic, strong) NSString *cond_txt_d;
@property (nonatomic, strong) NSString *cond_txt_n;
@property (nonatomic, strong) NSString *cond_code;
@property (nonatomic, strong) NSString *cond_txt;

@property (nonatomic, strong) NSString *hum;
@property (nonatomic, strong) NSString *pcpn;
@property (nonatomic, strong) NSString *pcpn_10m;
@property (nonatomic, strong) NSString *pop;
@property (nonatomic, strong) NSString *pres;

@property (nonatomic, strong) NSString *tmp;
@property (nonatomic, strong) NSString *tmp_max;
@property (nonatomic, strong) NSString *tmp_min;

@property (nonatomic, strong) NSString *uv_index;
@property (nonatomic, strong) NSString *vis;
@property (nonatomic, strong) NSString *fl;
@property (nonatomic, strong) NSString *time;

@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *sr;
@property (nonatomic, strong) NSString *ss;
@property (nonatomic, strong) NSString *mr;
@property (nonatomic, strong) NSString *ms;

@property (nonatomic, strong) NSString *wind_deg;
@property (nonatomic, strong) NSString *wind_dir;
@property (nonatomic, strong) NSString *wind_sc;
@property (nonatomic, strong) NSString *wind_spd;
@property (nonatomic, strong) NSString *wind_dir_d;
@property (nonatomic, strong) NSString *wind_dir_n;
@property (nonatomic, strong) NSString *wind_sc_d;
@property (nonatomic, strong) NSString *wind_sc_n;

@end

NS_ASSUME_NONNULL_END
