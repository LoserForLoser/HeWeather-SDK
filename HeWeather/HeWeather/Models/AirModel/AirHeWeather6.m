//
//  HeWeather6.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "AirHeWeather6.h"
#import "AirAirNowCity.h"
#import "AirBasic.h"
#import "AirUpdate.h"
#import "AirAirHourly.h"
#import "AirAirForecast.h"


NSString *const kAirHeWeather6Status = @"status";
NSString *const kAirHeWeather6AirNowCity = @"air_now_city";
NSString *const kAirHeWeather6Basic = @"basic";
NSString *const kAirHeWeather6Update = @"update";
NSString *const kAirHeWeather6AirHourly = @"air_hourly";
NSString *const kAirHeWeather6AirForecast = @"air_forecast";


@interface AirHeWeather6 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AirHeWeather6

@synthesize status = _status;
@synthesize airNowCity = _airNowCity;
@synthesize basic = _basic;
@synthesize update = _update;
@synthesize airHourly = _airHourly;
@synthesize airForecast = _airForecast;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [self objectOrNilForKey:kAirHeWeather6Status fromDictionary:dict];
            self.airNowCity = [AirAirNowCity modelObjectWithDictionary:[dict objectForKey:kAirHeWeather6AirNowCity]];
            self.basic = [AirBasic modelObjectWithDictionary:[dict objectForKey:kAirHeWeather6Basic]];
            self.update = [AirUpdate modelObjectWithDictionary:[dict objectForKey:kAirHeWeather6Update]];
    NSObject *receivedAirHourly = [dict objectForKey:kAirHeWeather6AirHourly];
    NSMutableArray *parsedAirHourly = [NSMutableArray array];
    
    if ([receivedAirHourly isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAirHourly) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAirHourly addObject:[AirAirHourly modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAirHourly isKindOfClass:[NSDictionary class]]) {
       [parsedAirHourly addObject:[AirAirHourly modelObjectWithDictionary:(NSDictionary *)receivedAirHourly]];
    }

    self.airHourly = [NSArray arrayWithArray:parsedAirHourly];
    NSObject *receivedAirForecast = [dict objectForKey:kAirHeWeather6AirForecast];
    NSMutableArray *parsedAirForecast = [NSMutableArray array];
    
    if ([receivedAirForecast isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAirForecast) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAirForecast addObject:[AirAirForecast modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAirForecast isKindOfClass:[NSDictionary class]]) {
       [parsedAirForecast addObject:[AirAirForecast modelObjectWithDictionary:(NSDictionary *)receivedAirForecast]];
    }

    self.airForecast = [NSArray arrayWithArray:parsedAirForecast];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kAirHeWeather6Status];
    [mutableDict setValue:[self.airNowCity dictionaryRepresentation] forKey:kAirHeWeather6AirNowCity];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kAirHeWeather6Basic];
    [mutableDict setValue:[self.update dictionaryRepresentation] forKey:kAirHeWeather6Update];
    NSMutableArray *tempArrayForAirHourly = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.airHourly) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAirHourly addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAirHourly addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAirHourly] forKey:kAirHeWeather6AirHourly];
    NSMutableArray *tempArrayForAirForecast = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.airForecast) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAirForecast addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAirForecast addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAirForecast] forKey:kAirHeWeather6AirForecast];

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

    self.status = [aDecoder decodeObjectForKey:kAirHeWeather6Status];
    self.airNowCity = [aDecoder decodeObjectForKey:kAirHeWeather6AirNowCity];
    self.basic = [aDecoder decodeObjectForKey:kAirHeWeather6Basic];
    self.update = [aDecoder decodeObjectForKey:kAirHeWeather6Update];
    self.airHourly = [aDecoder decodeObjectForKey:kAirHeWeather6AirHourly];
    self.airForecast = [aDecoder decodeObjectForKey:kAirHeWeather6AirForecast];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kAirHeWeather6Status];
    [aCoder encodeObject:_airNowCity forKey:kAirHeWeather6AirNowCity];
    [aCoder encodeObject:_basic forKey:kAirHeWeather6Basic];
    [aCoder encodeObject:_update forKey:kAirHeWeather6Update];
    [aCoder encodeObject:_airHourly forKey:kAirHeWeather6AirHourly];
    [aCoder encodeObject:_airForecast forKey:kAirHeWeather6AirForecast];
}

- (id)copyWithZone:(NSZone *)zone {
    AirHeWeather6 *copy = [[AirHeWeather6 alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.airNowCity = [self.airNowCity copyWithZone:zone];
        copy.basic = [self.basic copyWithZone:zone];
        copy.update = [self.update copyWithZone:zone];
        copy.airHourly = [self.airHourly copyWithZone:zone];
        copy.airForecast = [self.airForecast copyWithZone:zone];
    }
    
    return copy;
}


@end
