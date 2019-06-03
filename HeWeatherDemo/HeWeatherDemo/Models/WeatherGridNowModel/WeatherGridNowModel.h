//
//  WeatherGridNowModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WetherResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeatherGridNowModel : WetherResponseModel

@property (nonatomic, strong) WeatherData *grid_now;

@end

NS_ASSUME_NONNULL_END
