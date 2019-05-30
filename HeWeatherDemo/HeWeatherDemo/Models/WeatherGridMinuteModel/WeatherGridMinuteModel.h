//
//  WeatherGridMinuteModel.h
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2019/5/30.
//  Copyright © 2019 宋朝阳. All rights reserved.
//

#import "WetherResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class GridMinuteForecast;
@class Pcpn5m;
@class PcpnType;

@interface WeatherGridMinuteModel : WetherResponseModel

@property (nonatomic, strong) GridMinuteForecast *grid_minute_forecast;
@property (nonatomic, copy) NSArray <Pcpn5m *>*pcpn_5m;
@property (nonatomic, strong) PcpnType *pcpn_type;

@end

@interface GridMinuteForecast : NSObject

@property (nonatomic, copy) NSString *date;

@end

@interface Pcpn5m : NSObject

@property (nonatomic, copy) NSString *pcpn;
@property (nonatomic, copy) NSString *time;

@end

@interface PcpnType : NSObject

@property (nonatomic, copy) NSString *pcpn_type;

@end

NS_ASSUME_NONNULL_END
