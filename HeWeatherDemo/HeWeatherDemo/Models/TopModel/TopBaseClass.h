//
//  BaseClass.h
//
//  Created by 朝阳 宋 on 2018/9/3
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface TopBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *heWeather6;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
