//
//  WeatherGridHourlyModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WetherResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class GridHourly;

@interface WeatherGridHourlyModel : WetherResponseModel

@property (nonatomic, copy) NSArray <GridHourly*>*grid_hourly;

@end

@interface GridHourly : NSObject

@property (nonatomic, strong) NSString *cond_code;
@property (nonatomic, strong) NSString *cond_txt;
@property (nonatomic, strong) NSString *pcpn;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *tmp;
@property (nonatomic, strong) NSString *wind_dir;
@property (nonatomic, strong) NSString *wind_sc;

@end

NS_ASSUME_NONNULL_END
