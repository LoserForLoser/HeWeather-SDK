//
//  SolarSunriseSunsetModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WetherResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class SunriseSunset;

@interface SolarSunriseSunsetModel : WetherResponseModel

@property (nonatomic, strong) SunriseSunset *sunrise_sunset;

@end

@interface SunriseSunset : NSObject

@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *sr;
@property (nonatomic, strong) NSString *ss;

@end

NS_ASSUME_NONNULL_END
