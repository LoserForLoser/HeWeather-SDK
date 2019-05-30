//
//  AlarmModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WetherResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class Alarm;

@interface AlarmModel : WetherResponseModel

@property (nonatomic, strong) Alarm *alarm;

@end

@interface Alarm : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *stat;
@property (nonatomic, strong) NSString *level;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *txt;

@end

NS_ASSUME_NONNULL_END
