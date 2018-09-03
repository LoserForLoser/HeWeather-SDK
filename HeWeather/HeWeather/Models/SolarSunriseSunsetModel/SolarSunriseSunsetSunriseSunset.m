//
//  SunriseSunset.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "SolarSunriseSunsetSunriseSunset.h"


NSString *const kSolarSunriseSunsetSunriseSunsetDate = @"date";
NSString *const kSolarSunriseSunsetSunriseSunsetSs = @"ss";
NSString *const kSolarSunriseSunsetSunriseSunsetSr = @"sr";


@interface SolarSunriseSunsetSunriseSunset ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SolarSunriseSunsetSunriseSunset

@synthesize date = _date;
@synthesize ss = _ss;
@synthesize sr = _sr;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.date = [self objectOrNilForKey:kSolarSunriseSunsetSunriseSunsetDate fromDictionary:dict];
            self.ss = [self objectOrNilForKey:kSolarSunriseSunsetSunriseSunsetSs fromDictionary:dict];
            self.sr = [self objectOrNilForKey:kSolarSunriseSunsetSunriseSunsetSr fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.date forKey:kSolarSunriseSunsetSunriseSunsetDate];
    [mutableDict setValue:self.ss forKey:kSolarSunriseSunsetSunriseSunsetSs];
    [mutableDict setValue:self.sr forKey:kSolarSunriseSunsetSunriseSunsetSr];

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

    self.date = [aDecoder decodeObjectForKey:kSolarSunriseSunsetSunriseSunsetDate];
    self.ss = [aDecoder decodeObjectForKey:kSolarSunriseSunsetSunriseSunsetSs];
    self.sr = [aDecoder decodeObjectForKey:kSolarSunriseSunsetSunriseSunsetSr];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_date forKey:kSolarSunriseSunsetSunriseSunsetDate];
    [aCoder encodeObject:_ss forKey:kSolarSunriseSunsetSunriseSunsetSs];
    [aCoder encodeObject:_sr forKey:kSolarSunriseSunsetSunriseSunsetSr];
}

- (id)copyWithZone:(NSZone *)zone {
    SolarSunriseSunsetSunriseSunset *copy = [[SolarSunriseSunsetSunriseSunset alloc] init];
    
    
    
    if (copy) {

        copy.date = [self.date copyWithZone:zone];
        copy.ss = [self.ss copyWithZone:zone];
        copy.sr = [self.sr copyWithZone:zone];
    }
    
    return copy;
}


@end
