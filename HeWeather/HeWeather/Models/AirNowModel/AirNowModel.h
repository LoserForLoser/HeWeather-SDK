//
//  AirNowModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WetherResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class AirNowCity;

@interface AirNowModel : WetherResponseModel

@property (nonatomic, strong) AirNowCity *air_now_city;
@property (nonatomic, copy) NSArray <AirNowCity *>*air_now_station;

@end

@interface AirNowCity : NSObject

@property (nonatomic, strong) NSString *air_sta;
@property (nonatomic, strong) NSString *aqi;
@property (nonatomic, strong) NSString *asid;
@property (nonatomic, strong) NSString *co;
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

NS_ASSUME_NONNULL_END
