//
//  AlarmList.h
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface AlarmAllAlarmList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *stat;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *level;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *txt;
@property (nonatomic, strong) NSString *cid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
