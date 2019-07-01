//
//  NetworkComponent.m
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/26.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "NetworkComponent.h"
#import <AFNetworking/AFNetworking.h>

#if APP_DEVELOPMENT

// 开发环境
//NSString * const kAppServerAPIURL = @"";
// 测试环境
NSString * const kAppServerAPIURL = @"";

#else

NSString * const kAppServerAPIURL = @"";

#endif

@interface NetworkComponent ()

@end

@implementation NetworkComponent

+ (AFHTTPSessionManager *)sharedInstance {
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kAppServerAPIURL]];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.requestSerializer.timeoutInterval = 30;
    });
    return manager;
}
- (void)networkRequestType:(NETWORK_TYPE)networkType
                 urlString:(NSString *)urlString
                parameters:(id)parameters
           networkResponce:(void (^)(id responseObject, NSError *error))networkResponce {
    [self networkRequestType:networkType urlString:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        if (networkResponce) {
            networkResponce(responseObject, nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (networkResponce) {
            networkResponce(nil, error);
        }
    }];
}

- (void)networkRequestType:(NETWORK_TYPE)networkType
                 urlString:(NSString *)urlString
                parameters:(id)parameters
                   success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                   failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    switch (networkType) {
        case NETWORK_TYPE_GET:
        {
            [[NetworkComponent sharedInstance] GET:urlString parameters:parameters progress:nil success:success failure:failure];
        }
            break;
            
        case NETWORK_TYPE_POST:
        {
            [[NetworkComponent sharedInstance] POST:urlString parameters:parameters progress:nil success:success failure:failure];
        }
            break;
            
        case NETWORK_TYPE_PUT:
        {
            [[NetworkComponent sharedInstance] PUT:urlString parameters:parameters success:success failure:failure];
        }            break;
            
        case NETWORK_TYPE_HEAD:
        {
            [[NetworkComponent sharedInstance] HEAD:urlString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task) {
                if (success) {
                    success(task, nil);
                }
            } failure:failure];
        }
            break;
            
        case NETWORK_TYPE_PATCH:
        {
            [[NetworkComponent sharedInstance] PATCH:urlString parameters:parameters success:success failure:failure];
        }            break;
            
        case NETWORK_TYPE_DELETE:
        {
            [[NetworkComponent sharedInstance] DELETE:urlString parameters:parameters success:success failure:failure];
        }            break;
            
        default:
        {
            if (failure) {
                failure(nil, [NSError new]);
            }
        }
            break;
    }
}

- (void)setNetworkStatus:(void (^)(NETWORK_STATUS))networkStatus {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                networkStatus(NETWORK_STATUS_UNKNOW);
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                networkStatus(NETWORK_STATUS_NOTREACHABLE);
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                networkStatus(NETWORK_STATUS_WLAN);
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                networkStatus(NETWORK_STATUS_WIFI);
                break;
                
            default:
                networkStatus(NETWORK_STATUS_UNKNOW);
                break;
        }
    }];
}

- (void)networkUpdateWithURLString:(NSString *)URLString
                        parameters:(id)parameters
                          progress:(void (^)(NSProgress * _Nonnull))uploadProgress
                           success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                           failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    [[NetworkComponent sharedInstance] POST:URLString parameters:parameters progress:uploadProgress success:success failure:failure];
}

- (void)networkDownloadWithURLString:(NSString *)URLString
                          parameters:(id)parameters
                            progress:(void (^)(NSProgress * _Nonnull))downloadProgress
                             success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                             failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    [[NetworkComponent sharedInstance] GET:URLString parameters:parameters progress:downloadProgress success:success failure:failure];
}

@end
