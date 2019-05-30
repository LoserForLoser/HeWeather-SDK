//
//  WeatherGridNowModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WetherResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class GridNow;

@interface WeatherGridNowModel : WetherResponseModel

@property (nonatomic, strong) GridNow *grid_now;

@end

@interface GridNow : NSObject

@property (nonatomic, strong) NSString *cond_code;
@property (nonatomic, strong) NSString *cond_txt;
@property (nonatomic, strong) NSString *hum;
@property (nonatomic, strong) NSString *pcpn;
@property (nonatomic, strong) NSString *pcpn_10m;
@property (nonatomic, strong) NSString *pres;
@property (nonatomic, strong) NSString *tmp;
@property (nonatomic, strong) NSString *wind_dir;
@property (nonatomic, strong) NSString *wind_sc;

@end

NS_ASSUME_NONNULL_END
