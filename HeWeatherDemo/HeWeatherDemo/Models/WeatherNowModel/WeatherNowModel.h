//
//  WeatherNowModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/29.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WetherResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class Now;

@interface WeatherNowModel : WetherResponseModel

@property (nonatomic, strong) Now *now;

@end

@interface Now : NSObject

@property (nonatomic, strong) NSString *cond_code;
@property (nonatomic, strong) NSString *cond_txt;
@property (nonatomic, strong) NSString *fl;
@property (nonatomic, strong) NSString *hum;
@property (nonatomic, strong) NSString *pcpn;
@property (nonatomic, strong) NSString *pres;
@property (nonatomic, strong) NSString *tmp;
@property (nonatomic, strong) NSString *vis;
@property (nonatomic, strong) NSString *wind_deg;
@property (nonatomic, strong) NSString *wind_dir;
@property (nonatomic, strong) NSString *wind_sc;
@property (nonatomic, strong) NSString *wind_spd;

@end

NS_ASSUME_NONNULL_END
