//
//  SunriseSunset.h
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SolarSunriseSunsetSunriseSunset : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *ss;
@property (nonatomic, strong) NSString *sr;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
