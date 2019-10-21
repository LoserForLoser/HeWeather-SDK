//
//  SearchWeatherResponseModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class SearchCity;

@interface SearchWeatherResponseModel : NSObject

@property (nonatomic, strong) NSArray <SearchWeatherResponseModel *>*HeWeather6;
@property (nonatomic, strong) NSArray <Basic *>*basic;
@property (nonatomic, strong) NSString *status;

@end

NS_ASSUME_NONNULL_END
