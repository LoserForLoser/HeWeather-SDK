//
//  GridForecast.h
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WeatherGridForecastGridForecast : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *condCodeN;
@property (nonatomic, strong) NSString *tmpMin;
@property (nonatomic, strong) NSString *windDirD;
@property (nonatomic, strong) NSString *condTxtD;
@property (nonatomic, strong) NSString *windScN;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *tmpMax;
@property (nonatomic, strong) NSString *windDirN;
@property (nonatomic, strong) NSString *condTxtN;
@property (nonatomic, strong) NSString *windScD;
@property (nonatomic, strong) NSString *condCodeD;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
