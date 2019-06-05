//
//  AllWeatherInquieirs+Tool.m
//  HEWEATHER
//
//  Created by Coder on 2018/4/29.
//  Copyright © 2018年 Song. All rights reserved.
//

#import "AllWeatherInquieirs+Tool.h"
#import "AllWeatherInquieirs+Property.h"

#import <CommonCrypto/CommonDigest.h>
#import <AFNetworking/AFNetworking.h>
@implementation AllWeatherInquieirs (Tool)

#pragma mark - 开始定位

- (void)startLocation {
    if ([CLLocationManager locationServicesEnabled]) {
        self.locationManager = [[CLLocationManager alloc]init];
        self.locationManager.delegate = self;
        [self.locationManager requestAlwaysAuthorization];
        [self.locationManager requestWhenInUseAuthorization];
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = 5.0;
        [self.locationManager startUpdatingLocation];
    }
}

#pragma mark - 定位成功

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    [self.locationManager stopUpdatingLocation];
    CLLocation *currentLocation = [locations lastObject];
    self.strLatitude = [NSString stringWithFormat:@"%f", currentLocation.coordinate.latitude];
    self.strLongitude = [NSString stringWithFormat:@"%f", currentLocation.coordinate.longitude];
    if (self.locationBlock) {
        self.locationBlock();
    }
}

#pragma mark - Networking Action

- (void)AFNetworkActionWitchGET:(NSString *)URLString
                     parameters:(id)parameters
                       response:(void (^ _Nullable)(id _Nullable responseObject, NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error))response {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    if ([URLString isEqualToString:@"https://search.heweather.com/top"]) {
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    }
    
    [manager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (response) {
            response(responseObject, task, [NSError new]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (response) {
            response(nil, task, error);
        }
    }];
}

#pragma mark - 获取当前时间戳

- (NSString *)currentTimeStr {
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval time=[date timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}

#pragma mark - dictionary to sign string

- (NSString *)signToEncryptionStringWithDataDictionary:(NSDictionary *)dataDictionary {
    NSMutableArray *allKeysArray = [NSMutableArray arrayWithArray:[dataDictionary allKeys]];
    [allKeysArray sortUsingSelector:@selector(compare:)];
    
    NSMutableArray *dicsArray = [NSMutableArray array];
    for (NSInteger count = 0; count < (long)allKeysArray.count; count++) {
        if (dataDictionary[allKeysArray[count]] && [dataDictionary[allKeysArray[count]] isKindOfClass:[NSString class]] && ![dataDictionary[allKeysArray[count]] isEqualToString:@""]) {
            [dicsArray addObject:[NSString stringWithFormat:@"%@=%@", allKeysArray[count], dataDictionary[allKeysArray[count]]]];
        } else if (dataDictionary[allKeysArray[count]] && [dataDictionary[allKeysArray[count]] isKindOfClass:[NSNumber class]] && (dataDictionary[allKeysArray[count]] != 0)) {
            [dicsArray addObject:[NSString stringWithFormat:@"%@=%@", allKeysArray[count], dataDictionary[allKeysArray[count]]]];
        }
    }
    NSMutableString *tempString = [NSMutableString stringWithString:[dicsArray componentsJoinedByString:@"&"]];//分隔符逗号
    return [self md5WithString:[tempString stringByAppendingString:self.key]];
}

#pragma mark - MD5

- (NSString *) md5WithString:(NSString *)md5String {
    const char *cStr = [md5String UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    NSData *byteData = [NSData dataWithBytes:digest length:CC_MD5_DIGEST_LENGTH];
    NSData *dataByte = [byteData base64EncodedDataWithOptions:0];
    NSString *resultBase64String = [[NSString alloc] initWithData:dataByte encoding:NSUTF8StringEncoding];
    return resultBase64String;
}

@end
