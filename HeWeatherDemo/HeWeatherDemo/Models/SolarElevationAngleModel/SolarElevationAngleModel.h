//
//  SolarElevationAngleModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WeatherResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class SolarElevationAngle;

@interface SolarElevationAngleModel : WeatherResponseModel

@property (nonatomic, strong) SolarElevationAngle *solar_elevation_angle;

@end

@interface SolarElevationAngle : NSObject

@property (nonatomic, strong) NSString *solar_elevation_angle;
@property (nonatomic, strong) NSString *solar_azimuth_angle;
@property (nonatomic, strong) NSString *solar_hour;
@property (nonatomic, strong) NSString *hour_angle;

@end

NS_ASSUME_NONNULL_END
