//
//  HeWeather6.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "AirHourlyHeWeather6.h"
#import "AirHourlyBasic.h"
#import "AirHourlyUpdate.h"
#import "AirHourlyAirHourly.h"


NSString *const kAirHourlyHeWeather6Status = @"status";
NSString *const kAirHourlyHeWeather6Basic = @"basic";
NSString *const kAirHourlyHeWeather6Update = @"update";
NSString *const kAirHourlyHeWeather6AirHourly = @"air_hourly";


@interface AirHourlyHeWeather6 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AirHourlyHeWeather6

@synthesize status = _status;
@synthesize basic = _basic;
@synthesize update = _update;
@synthesize airHourly = _airHourly;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [self objectOrNilForKey:kAirHourlyHeWeather6Status fromDictionary:dict];
            self.basic = [AirHourlyBasic modelObjectWithDictionary:[dict objectForKey:kAirHourlyHeWeather6Basic]];
            self.update = [AirHourlyUpdate modelObjectWithDictionary:[dict objectForKey:kAirHourlyHeWeather6Update]];
    NSObject *receivedAirHourly = [dict objectForKey:kAirHourlyHeWeather6AirHourly];
    NSMutableArray *parsedAirHourly = [NSMutableArray array];
    
    if ([receivedAirHourly isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAirHourly) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAirHourly addObject:[AirHourlyAirHourly modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAirHourly isKindOfClass:[NSDictionary class]]) {
       [parsedAirHourly addObject:[AirHourlyAirHourly modelObjectWithDictionary:(NSDictionary *)receivedAirHourly]];
    }

    self.airHourly = [NSArray arrayWithArray:parsedAirHourly];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kAirHourlyHeWeather6Status];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kAirHourlyHeWeather6Basic];
    [mutableDict setValue:[self.update dictionaryRepresentation] forKey:kAirHourlyHeWeather6Update];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAirHourly] forKey:kAirHourlyHeWeather6AirHourly];

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

    self.status = [aDecoder decodeObjectForKey:kAirHourlyHeWeather6Status];
    self.basic = [aDecoder decodeObjectForKey:kAirHourlyHeWeather6Basic];
    self.update = [aDecoder decodeObjectForKey:kAirHourlyHeWeather6Update];
    self.airHourly = [aDecoder decodeObjectForKey:kAirHourlyHeWeather6AirHourly];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kAirHourlyHeWeather6Status];
    [aCoder encodeObject:_basic forKey:kAirHourlyHeWeather6Basic];
    [aCoder encodeObject:_update forKey:kAirHourlyHeWeather6Update];
    [aCoder encodeObject:_airHourly forKey:kAirHourlyHeWeather6AirHourly];
}

- (id)copyWithZone:(NSZone *)zone {
    AirHourlyHeWeather6 *copy = [[AirHourlyHeWeather6 alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.basic = [self.basic copyWithZone:zone];
        copy.update = [self.update copyWithZone:zone];
        copy.airHourly = [self.airHourly copyWithZone:zone];
    }
    
    return copy;
}


@end
