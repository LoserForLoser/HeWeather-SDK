//
//  AlarmAllModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WetherResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class AlarmList;

@interface AlarmAllModel : WetherResponseModel

@property (nonatomic, copy) NSArray <AlarmList *>*alarm_list;

@end

@interface AlarmList : NSObject

@property (nonatomic, strong) NSString *cid;
@property (nonatomic, strong) NSString *stat;
@property (nonatomic, strong) NSString *level;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *txt;

@end

NS_ASSUME_NONNULL_END
