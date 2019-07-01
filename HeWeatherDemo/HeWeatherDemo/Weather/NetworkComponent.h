//
//  NetworkComponent.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/26.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AFHTTPSessionManager;

/* 切换 测试/正式 API 环境 */
#define APP_DEVELOPMENT 1

/* 网络请求类型 */
typedef NS_ENUM(NSInteger, NETWORK_TYPE) {
    NETWORK_TYPE_GET = 1,
    NETWORK_TYPE_POST = 2,
    NETWORK_TYPE_PUT = 3,
    NETWORK_TYPE_HEAD = 4,
    NETWORK_TYPE_PATCH = 5,
    NETWORK_TYPE_DELETE = 6,
};

/* 网络状态 */
typedef NS_ENUM(NSInteger, NETWORK_STATUS) {
    NETWORK_STATUS_UNKNOW = 0,
    NETWORK_STATUS_NOTREACHABLE = 1,
    NETWORK_STATUS_WLAN = 2,
    NETWORK_STATUS_WIFI = 3,
};

NS_ASSUME_NONNULL_BEGIN

@interface NetworkComponent : NSObject

@property (nonatomic, copy)  void(^networkStatus)(NETWORK_STATUS status);

+ (AFHTTPSessionManager *)sharedInstance;

- (void)networkRequestType:(NETWORK_TYPE)networkType
                 urlString:(NSString *)urlString
                parameters:(id)parameters
           networkResponce:(void (^)(id responseObject, NSError *error))networkResponce;

@end

NS_ASSUME_NONNULL_END
