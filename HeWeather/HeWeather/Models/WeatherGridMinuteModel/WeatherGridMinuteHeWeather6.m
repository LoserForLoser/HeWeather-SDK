//
//  HeWeather6.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherGridMinuteHeWeather6.h"
#import "WeatherGridMinuteGridMinuteForecast.h"
#import "WeatherGridMinuteBasic.h"
#import "WeatherGridMinutePcpn5m.h"
#import "WeatherGridMinutePcpnType.h"
#import "WeatherGridMinuteUpdate.h"


NSString *const kWeatherGridMinuteHeWeather6GridMinuteForecast = @"grid_minute_forecast";
NSString *const kWeatherGridMinuteHeWeather6Status = @"status";
NSString *const kWeatherGridMinuteHeWeather6Basic = @"basic";
NSString *const kWeatherGridMinuteHeWeather6Pcpn5m = @"pcpn_5m";
NSString *const kWeatherGridMinuteHeWeather6PcpnType = @"pcpn_type";
NSString *const kWeatherGridMinuteHeWeather6Update = @"update";


@interface WeatherGridMinuteHeWeather6 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherGridMinuteHeWeather6

@synthesize gridMinuteForecast = _gridMinuteForecast;
@synthesize status = _status;
@synthesize basic = _basic;
@synthesize pcpn5m = _pcpn5m;
@synthesize pcpnType = _pcpnType;
@synthesize update = _update;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.gridMinuteForecast = [WeatherGridMinuteGridMinuteForecast modelObjectWithDictionary:[dict objectForKey:kWeatherGridMinuteHeWeather6GridMinuteForecast]];
            self.status = [self objectOrNilForKey:kWeatherGridMinuteHeWeather6Status fromDictionary:dict];
            self.basic = [WeatherGridMinuteBasic modelObjectWithDictionary:[dict objectForKey:kWeatherGridMinuteHeWeather6Basic]];
    NSObject *receivedPcpn5m = [dict objectForKey:kWeatherGridMinuteHeWeather6Pcpn5m];
    NSMutableArray *parsedPcpn5m = [NSMutableArray array];
    
    if ([receivedPcpn5m isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPcpn5m) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPcpn5m addObject:[WeatherGridMinutePcpn5m modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPcpn5m isKindOfClass:[NSDictionary class]]) {
       [parsedPcpn5m addObject:[WeatherGridMinutePcpn5m modelObjectWithDictionary:(NSDictionary *)receivedPcpn5m]];
    }

    self.pcpn5m = [NSArray arrayWithArray:parsedPcpn5m];
            self.pcpnType = [WeatherGridMinutePcpnType modelObjectWithDictionary:[dict objectForKey:kWeatherGridMinuteHeWeather6PcpnType]];
            self.update = [WeatherGridMinuteUpdate modelObjectWithDictionary:[dict objectForKey:kWeatherGridMinuteHeWeather6Update]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.gridMinuteForecast dictionaryRepresentation] forKey:kWeatherGridMinuteHeWeather6GridMinuteForecast];
    [mutableDict setValue:self.status forKey:kWeatherGridMinuteHeWeather6Status];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kWeatherGridMinuteHeWeather6Basic];
    NSMutableArray *tempArrayForPcpn5m = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.pcpn5m) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPcpn5m addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPcpn5m addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPcpn5m] forKey:kWeatherGridMinuteHeWeather6Pcpn5m];
    [mutableDict setValue:[self.pcpnType dictionaryRepresentation] forKey:kWeatherGridMinuteHeWeather6PcpnType];
    [mutableDict setValue:[self.update dictionaryRepresentation] forKey:kWeatherGridMinuteHeWeather6Update];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    self.gridMinuteForecast = [aDecoder decodeObjectForKey:kWeatherGridMinuteHeWeather6GridMinuteForecast];
    self.status = [aDecoder decodeObjectForKey:kWeatherGridMinuteHeWeather6Status];
    self.basic = [aDecoder decodeObjectForKey:kWeatherGridMinuteHeWeather6Basic];
    self.pcpn5m = [aDecoder decodeObjectForKey:kWeatherGridMinuteHeWeather6Pcpn5m];
    self.pcpnType = [aDecoder decodeObjectForKey:kWeatherGridMinuteHeWeather6PcpnType];
    self.update = [aDecoder decodeObjectForKey:kWeatherGridMinuteHeWeather6Update];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_gridMinuteForecast forKey:kWeatherGridMinuteHeWeather6GridMinuteForecast];
    [aCoder encodeObject:_status forKey:kWeatherGridMinuteHeWeather6Status];
    [aCoder encodeObject:_basic forKey:kWeatherGridMinuteHeWeather6Basic];
    [aCoder encodeObject:_pcpn5m forKey:kWeatherGridMinuteHeWeather6Pcpn5m];
    [aCoder encodeObject:_pcpnType forKey:kWeatherGridMinuteHeWeather6PcpnType];
    [aCoder encodeObject:_update forKey:kWeatherGridMinuteHeWeather6Update];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherGridMinuteHeWeather6 *copy = [[WeatherGridMinuteHeWeather6 alloc] init];
    
    
    
    if (copy) {

        copy.gridMinuteForecast = [self.gridMinuteForecast copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.basic = [self.basic copyWithZone:zone];
        copy.pcpn5m = [self.pcpn5m copyWithZone:zone];
        copy.pcpnType = [self.pcpnType copyWithZone:zone];
        copy.update = [self.update copyWithZone:zone];
    }
    
    return copy;
}


@end
