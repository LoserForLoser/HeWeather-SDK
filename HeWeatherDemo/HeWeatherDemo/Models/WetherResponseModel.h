//
//  WetherResponseModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/29.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Basic;
@class Update;

@interface WetherResponseModel : NSObject

@property (nonatomic, strong) NSArray <WetherResponseModel *>*HeWeather6;
@property (nonatomic, strong) Basic *basic;
@property (nonatomic, strong) Update *update;
@property (nonatomic, strong) NSString *status;

@end

@interface Basic : NSObject

@property (nonatomic, strong) NSString *cid;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *parent_city;
@property (nonatomic, strong) NSString *admin_area;
@property (nonatomic, strong) NSString *cnty;
@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) NSString *lon;
@property (nonatomic, strong) NSString *tz;

@end

@interface Update : NSObject

@property (nonatomic, strong) NSString *loc;
@property (nonatomic, strong) NSString *utc;

@end

NS_ASSUME_NONNULL_END
