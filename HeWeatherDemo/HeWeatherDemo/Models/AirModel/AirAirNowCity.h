//
//  AirNowCity.h
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface AirAirNowCity : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *qlty;
@property (nonatomic, strong) NSString *pm25;
@property (nonatomic, strong) NSString *aqi;
@property (nonatomic, strong) NSString *co;
@property (nonatomic, strong) NSString *no2;
@property (nonatomic, strong) NSString *pm10;
@property (nonatomic, strong) NSString *main;
@property (nonatomic, strong) NSString *so2;
@property (nonatomic, strong) NSString *o3;
@property (nonatomic, strong) NSString *pubTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
