//
//  SearchModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WeatherResponseModel.h"
#import "SearchWeatherResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class Search;

@interface SearchModel : WeatherResponseModel

@property (nonatomic, strong) SearchCity *search;

@end

NS_ASSUME_NONNULL_END
