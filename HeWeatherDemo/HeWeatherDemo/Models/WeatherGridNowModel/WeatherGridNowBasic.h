//
//  Basic.h
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WeatherGridNowBasic : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *adminArea;
@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) NSString *cnty;
@property (nonatomic, strong) NSString *lon;
@property (nonatomic, strong) NSString *parentCity;
@property (nonatomic, strong) NSString *tz;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
