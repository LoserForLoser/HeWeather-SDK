//
//  AllWeatherInquieirs+Property.h
//  HEWEATHER
//
//  Created by Coder on 2018/4/29.
//  Copyright © 2018年 Song. All rights reserved.
//

#import "AllWeatherInquieirs.h"
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

#import "DataBaseClasses.h"

@interface AllWeatherInquieirs () <CLLocationManagerDelegate>

@property (nonatomic, copy) void(^locationBlock)(void);

@property (nonatomic, strong) CLLocationManager *locationManager;// 定位服务
@property (nonatomic, copy) NSString *strLatitude;// 经度
@property (nonatomic, copy) NSString *strLongitude;// 维度

@property (nonatomic, copy) NSString *kAppServerAPIURL;// 请求接口

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *key;

/**
 数字签名，签名算法
 必选
 */

@property (nonatomic, copy) NSString *sign;

/**
 时间戳，秒级
 */

@property (nonatomic, copy) NSString *t;

@end
