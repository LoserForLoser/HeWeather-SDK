//
//  GridNow.h
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WeatherGridNowGridNow : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *pcpn10m;
@property (nonatomic, strong) NSString *condTxt;
@property (nonatomic, strong) NSString *pres;
@property (nonatomic, strong) NSString *condCode;
@property (nonatomic, strong) NSString *tmp;
@property (nonatomic, strong) NSString *hum;
@property (nonatomic, strong) NSString *windSc;
@property (nonatomic, strong) NSString *pcpn;
@property (nonatomic, strong) NSString *windDir;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
