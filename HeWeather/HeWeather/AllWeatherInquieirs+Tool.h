//
//  AllWeatherInquieirs+Tool.h
//  HEWEATHER
//
//  Created by Coder on 2018/4/29.
//  Copyright © 2018年 Song. All rights reserved.
//

#import "AllWeatherInquieirs.h"

@interface AllWeatherInquieirs (Tool)

- (void)startLocation;
- (void)AFNetworkActionWitchGET:(NSString *)URLString parameters:(id)parameters success:(void (^)(id _Nullable))success failure:(void (^)(NSError * _Nonnull))failure;
- (NSString *)currentTimeStr;
- (NSString *)signToEncryptionStringWithDataDictionary:(NSDictionary *)dataDictionary;

@end
