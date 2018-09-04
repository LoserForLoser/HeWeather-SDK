//
//  HeWeather6.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "SolarSunriseSunsetHeWeather6.h"
#import "SolarSunriseSunsetBasic.h"
#import "SolarSunriseSunsetUpdate.h"
#import "SolarSunriseSunsetSunriseSunset.h"


NSString *const kSolarSunriseSunsetHeWeather6Status = @"status";
NSString *const kSolarSunriseSunsetHeWeather6Basic = @"basic";
NSString *const kSolarSunriseSunsetHeWeather6Update = @"update";
NSString *const kSolarSunriseSunsetHeWeather6SunriseSunset = @"sunrise_sunset";


@interface SolarSunriseSunsetHeWeather6 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SolarSunriseSunsetHeWeather6

@synthesize status = _status;
@synthesize basic = _basic;
@synthesize update = _update;
@synthesize sunriseSunset = _sunriseSunset;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [self objectOrNilForKey:kSolarSunriseSunsetHeWeather6Status fromDictionary:dict];
            self.basic = [SolarSunriseSunsetBasic modelObjectWithDictionary:[dict objectForKey:kSolarSunriseSunsetHeWeather6Basic]];
            self.update = [SolarSunriseSunsetUpdate modelObjectWithDictionary:[dict objectForKey:kSolarSunriseSunsetHeWeather6Update]];
    NSObject *receivedSunriseSunset = [dict objectForKey:kSolarSunriseSunsetHeWeather6SunriseSunset];
    NSMutableArray *parsedSunriseSunset = [NSMutableArray array];
    
    if ([receivedSunriseSunset isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSunriseSunset) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSunriseSunset addObject:[SolarSunriseSunsetSunriseSunset modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSunriseSunset isKindOfClass:[NSDictionary class]]) {
       [parsedSunriseSunset addObject:[SolarSunriseSunsetSunriseSunset modelObjectWithDictionary:(NSDictionary *)receivedSunriseSunset]];
    }

    self.sunriseSunset = [NSArray arrayWithArray:parsedSunriseSunset];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kSolarSunriseSunsetHeWeather6Status];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kSolarSunriseSunsetHeWeather6Basic];
    [mutableDict setValue:[self.update dictionaryRepresentation] forKey:kSolarSunriseSunsetHeWeather6Update];
    NSMutableArray *tempArrayForSunriseSunset = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.sunriseSunset) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSunriseSunset addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSunriseSunset addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSunriseSunset] forKey:kSolarSunriseSunsetHeWeather6SunriseSunset];

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

    self.status = [aDecoder decodeObjectForKey:kSolarSunriseSunsetHeWeather6Status];
    self.basic = [aDecoder decodeObjectForKey:kSolarSunriseSunsetHeWeather6Basic];
    self.update = [aDecoder decodeObjectForKey:kSolarSunriseSunsetHeWeather6Update];
    self.sunriseSunset = [aDecoder decodeObjectForKey:kSolarSunriseSunsetHeWeather6SunriseSunset];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kSolarSunriseSunsetHeWeather6Status];
    [aCoder encodeObject:_basic forKey:kSolarSunriseSunsetHeWeather6Basic];
    [aCoder encodeObject:_update forKey:kSolarSunriseSunsetHeWeather6Update];
    [aCoder encodeObject:_sunriseSunset forKey:kSolarSunriseSunsetHeWeather6SunriseSunset];
}

- (id)copyWithZone:(NSZone *)zone {
    SolarSunriseSunsetHeWeather6 *copy = [[SolarSunriseSunsetHeWeather6 alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.basic = [self.basic copyWithZone:zone];
        copy.update = [self.update copyWithZone:zone];
        copy.sunriseSunset = [self.sunriseSunset copyWithZone:zone];
    }
    
    return copy;
}


@end
