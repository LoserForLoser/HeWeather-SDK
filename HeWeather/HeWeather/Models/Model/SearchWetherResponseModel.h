//
//  SearchWetherResponseModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WetherResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class SearchCity;

@interface SearchWetherResponseModel : NSObject

@property (nonatomic, strong) NSArray <SearchWetherResponseModel *>*HeWeather6;
@property (nonatomic, strong) NSArray <Basic *>*basic;
@property (nonatomic, strong) NSString *status;

@end

NS_ASSUME_NONNULL_END
