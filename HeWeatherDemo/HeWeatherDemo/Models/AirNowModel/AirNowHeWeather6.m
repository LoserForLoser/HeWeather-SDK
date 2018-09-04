//
//  HeWeather6.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "AirNowHeWeather6.h"
#import "AirNowAirNowCity.h"
#import "AirNowBasic.h"
#import "AirNowUpdate.h"
#import "AirNowAirNowStation.h"


NSString *const kAirNowHeWeather6Status = @"status";
NSString *const kAirNowHeWeather6AirNowCity = @"air_now_city";
NSString *const kAirNowHeWeather6Basic = @"basic";
NSString *const kAirNowHeWeather6Update = @"update";
NSString *const kAirNowHeWeather6AirNowStation = @"air_now_station";


@interface AirNowHeWeather6 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AirNowHeWeather6

@synthesize status = _status;
@synthesize airNowCity = _airNowCity;
@synthesize basic = _basic;
@synthesize update = _update;
@synthesize airNowStation = _airNowStation;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [self objectOrNilForKey:kAirNowHeWeather6Status fromDictionary:dict];
            self.airNowCity = [AirNowAirNowCity modelObjectWithDictionary:[dict objectForKey:kAirNowHeWeather6AirNowCity]];
            self.basic = [AirNowBasic modelObjectWithDictionary:[dict objectForKey:kAirNowHeWeather6Basic]];
            self.update = [AirNowUpdate modelObjectWithDictionary:[dict objectForKey:kAirNowHeWeather6Update]];
    NSObject *receivedAirNowStation = [dict objectForKey:kAirNowHeWeather6AirNowStation];
    NSMutableArray *parsedAirNowStation = [NSMutableArray array];
    
    if ([receivedAirNowStation isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAirNowStation) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAirNowStation addObject:[AirNowAirNowStation modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAirNowStation isKindOfClass:[NSDictionary class]]) {
       [parsedAirNowStation addObject:[AirNowAirNowStation modelObjectWithDictionary:(NSDictionary *)receivedAirNowStation]];
    }

    self.airNowStation = [NSArray arrayWithArray:parsedAirNowStation];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kAirNowHeWeather6Status];
    [mutableDict setValue:[self.airNowCity dictionaryRepresentation] forKey:kAirNowHeWeather6AirNowCity];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kAirNowHeWeather6Basic];
    [mutableDict setValue:[self.update dictionaryRepresentation] forKey:kAirNowHeWeather6Update];
    NSMutableArray *tempArrayForAirNowStation = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.airNowStation) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAirNowStation addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAirNowStation addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAirNowStation] forKey:kAirNowHeWeather6AirNowStation];

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

    self.status = [aDecoder decodeObjectForKey:kAirNowHeWeather6Status];
    self.airNowCity = [aDecoder decodeObjectForKey:kAirNowHeWeather6AirNowCity];
    self.basic = [aDecoder decodeObjectForKey:kAirNowHeWeather6Basic];
    self.update = [aDecoder decodeObjectForKey:kAirNowHeWeather6Update];
    self.airNowStation = [aDecoder decodeObjectForKey:kAirNowHeWeather6AirNowStation];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kAirNowHeWeather6Status];
    [aCoder encodeObject:_airNowCity forKey:kAirNowHeWeather6AirNowCity];
    [aCoder encodeObject:_basic forKey:kAirNowHeWeather6Basic];
    [aCoder encodeObject:_update forKey:kAirNowHeWeather6Update];
    [aCoder encodeObject:_airNowStation forKey:kAirNowHeWeather6AirNowStation];
}

- (id)copyWithZone:(NSZone *)zone {
    AirNowHeWeather6 *copy = [[AirNowHeWeather6 alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.airNowCity = [self.airNowCity copyWithZone:zone];
        copy.basic = [self.basic copyWithZone:zone];
        copy.update = [self.update copyWithZone:zone];
        copy.airNowStation = [self.airNowStation copyWithZone:zone];
    }
    
    return copy;
}


@end
