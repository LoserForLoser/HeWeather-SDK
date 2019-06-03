//
//  AirNowModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WetherResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AirNowModel : WetherResponseModel

@property (nonatomic, strong) AirData *air_now_city;
@property (nonatomic, copy) NSArray <AirData *>*air_now_station;

@end

NS_ASSUME_NONNULL_END
