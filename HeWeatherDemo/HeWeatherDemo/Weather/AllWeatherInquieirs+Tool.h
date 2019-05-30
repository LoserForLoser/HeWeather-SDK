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
- (void)AFNetworkActionWitchGET:(NSString *_Nonnull)URLString parameters:(id _Nullable )parameters success:(void (^_Nullable)(id _Nullable))success failure:(void (^_Nullable)(NSError * _Nonnull))failure;
- (NSString *_Nonnull)currentTimeStr;
- (NSString *_Nonnull)signToEncryptionStringWithDataDictionary:(NSDictionary *_Nonnull)dataDictionary;

@end
