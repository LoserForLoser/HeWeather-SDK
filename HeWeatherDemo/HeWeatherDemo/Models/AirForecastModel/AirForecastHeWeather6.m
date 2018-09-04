//
//  HeWeather6.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "AirForecastHeWeather6.h"
#import "AirForecastBasic.h"
#import "AirForecastUpdate.h"
#import "AirForecastAirForecast.h"


NSString *const kHeWeather6Status = @"status";
NSString *const kHeWeather6Basic = @"basic";
NSString *const kHeWeather6Update = @"update";
NSString *const kHeWeather6AirForecast = @"air_forecast";


@interface AirForecastHeWeather6 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AirForecastHeWeather6

@synthesize status = _status;
@synthesize basic = _basic;
@synthesize update = _update;
@synthesize airForecast = _airForecast;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [self objectOrNilForKey:kHeWeather6Status fromDictionary:dict];
            self.basic = [AirForecastBasic modelObjectWithDictionary:[dict objectForKey:kHeWeather6Basic]];
            self.update = [AirForecastUpdate modelObjectWithDictionary:[dict objectForKey:kHeWeather6Update]];
    NSObject *receivedAirForecast = [dict objectForKey:kHeWeather6AirForecast];
    NSMutableArray *parsedAirForecast = [NSMutableArray array];
    
    if ([receivedAirForecast isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAirForecast) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAirForecast addObject:[AirForecastAirForecast modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAirForecast isKindOfClass:[NSDictionary class]]) {
       [parsedAirForecast addObject:[AirForecastAirForecast modelObjectWithDictionary:(NSDictionary *)receivedAirForecast]];
    }

    self.airForecast = [NSArray arrayWithArray:parsedAirForecast];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kHeWeather6Status];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kHeWeather6Basic];
    [mutableDict setValue:[self.update dictionaryRepresentation] forKey:kHeWeather6Update];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAirForecast] forKey:kHeWeather6AirForecast];

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

    self.status = [aDecoder decodeObjectForKey:kHeWeather6Status];
    self.basic = [aDecoder decodeObjectForKey:kHeWeather6Basic];
    self.update = [aDecoder decodeObjectForKey:kHeWeather6Update];
    self.airForecast = [aDecoder decodeObjectForKey:kHeWeather6AirForecast];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kHeWeather6Status];
    [aCoder encodeObject:_basic forKey:kHeWeather6Basic];
    [aCoder encodeObject:_update forKey:kHeWeather6Update];
    [aCoder encodeObject:_airForecast forKey:kHeWeather6AirForecast];
}

- (id)copyWithZone:(NSZone *)zone {
    AirForecastHeWeather6 *copy = [[AirForecastHeWeather6 alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.basic = [self.basic copyWithZone:zone];
        copy.update = [self.update copyWithZone:zone];
        copy.airForecast = [self.airForecast copyWithZone:zone];
    }
    
    return copy;
}


@end
