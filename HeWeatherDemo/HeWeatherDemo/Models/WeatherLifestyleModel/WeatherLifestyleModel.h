//
//  WeatherLifestyleModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/29.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WeatherResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeatherLifestyleModel : WeatherResponseModel

@property (nonatomic, strong) NSArray <Lifestyle *>*lifestyle;

@end

NS_ASSUME_NONNULL_END
