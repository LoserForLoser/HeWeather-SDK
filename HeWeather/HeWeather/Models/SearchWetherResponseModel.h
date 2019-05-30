//
//  SearchWetherResponseModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class SearchCity;

@interface SearchWetherResponseModel : NSObject

@property (nonatomic, strong) NSArray <SearchWetherResponseModel *>*HeWeather6;
@property (nonatomic, strong) NSArray <SearchCity *>*basic;
@property (nonatomic, strong) NSString *status;

@end

@interface SearchCity : NSObject

@property (nonatomic, strong) NSString *tz;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *cid;
@property (nonatomic, strong) NSString *admin_area;
@property (nonatomic, strong) NSString *lon;
@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) NSString *parent_city;
@property (nonatomic, strong) NSString *cnty;
@property (nonatomic, strong) NSString *type;

@end

NS_ASSUME_NONNULL_END
