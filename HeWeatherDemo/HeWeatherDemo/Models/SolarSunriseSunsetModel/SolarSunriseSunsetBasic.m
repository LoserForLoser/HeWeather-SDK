//
//  Basic.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "SolarSunriseSunsetBasic.h"


NSString *const kSolarSunriseSunsetBasicTz = @"tz";
NSString *const kSolarSunriseSunsetBasicLocation = @"location";
NSString *const kSolarSunriseSunsetBasicCid = @"cid";
NSString *const kSolarSunriseSunsetBasicAdminArea = @"admin_area";
NSString *const kSolarSunriseSunsetBasicLon = @"lon";
NSString *const kSolarSunriseSunsetBasicLat = @"lat";
NSString *const kSolarSunriseSunsetBasicParentCity = @"parent_city";
NSString *const kSolarSunriseSunsetBasicCnty = @"cnty";


@interface SolarSunriseSunsetBasic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SolarSunriseSunsetBasic

@synthesize tz = _tz;
@synthesize location = _location;
@synthesize cid = _cid;
@synthesize adminArea = _adminArea;
@synthesize lon = _lon;
@synthesize lat = _lat;
@synthesize parentCity = _parentCity;
@synthesize cnty = _cnty;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.tz = [self objectOrNilForKey:kSolarSunriseSunsetBasicTz fromDictionary:dict];
            self.location = [self objectOrNilForKey:kSolarSunriseSunsetBasicLocation fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kSolarSunriseSunsetBasicCid fromDictionary:dict];
            self.adminArea = [self objectOrNilForKey:kSolarSunriseSunsetBasicAdminArea fromDictionary:dict];
            self.lon = [self objectOrNilForKey:kSolarSunriseSunsetBasicLon fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kSolarSunriseSunsetBasicLat fromDictionary:dict];
            self.parentCity = [self objectOrNilForKey:kSolarSunriseSunsetBasicParentCity fromDictionary:dict];
            self.cnty = [self objectOrNilForKey:kSolarSunriseSunsetBasicCnty fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tz forKey:kSolarSunriseSunsetBasicTz];
    [mutableDict setValue:self.location forKey:kSolarSunriseSunsetBasicLocation];
    [mutableDict setValue:self.cid forKey:kSolarSunriseSunsetBasicCid];
    [mutableDict setValue:self.adminArea forKey:kSolarSunriseSunsetBasicAdminArea];
    [mutableDict setValue:self.lon forKey:kSolarSunriseSunsetBasicLon];
    [mutableDict setValue:self.lat forKey:kSolarSunriseSunsetBasicLat];
    [mutableDict setValue:self.parentCity forKey:kSolarSunriseSunsetBasicParentCity];
    [mutableDict setValue:self.cnty forKey:kSolarSunriseSunsetBasicCnty];

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

    self.tz = [aDecoder decodeObjectForKey:kSolarSunriseSunsetBasicTz];
    self.location = [aDecoder decodeObjectForKey:kSolarSunriseSunsetBasicLocation];
    self.cid = [aDecoder decodeObjectForKey:kSolarSunriseSunsetBasicCid];
    self.adminArea = [aDecoder decodeObjectForKey:kSolarSunriseSunsetBasicAdminArea];
    self.lon = [aDecoder decodeObjectForKey:kSolarSunriseSunsetBasicLon];
    self.lat = [aDecoder decodeObjectForKey:kSolarSunriseSunsetBasicLat];
    self.parentCity = [aDecoder decodeObjectForKey:kSolarSunriseSunsetBasicParentCity];
    self.cnty = [aDecoder decodeObjectForKey:kSolarSunriseSunsetBasicCnty];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tz forKey:kSolarSunriseSunsetBasicTz];
    [aCoder encodeObject:_location forKey:kSolarSunriseSunsetBasicLocation];
    [aCoder encodeObject:_cid forKey:kSolarSunriseSunsetBasicCid];
    [aCoder encodeObject:_adminArea forKey:kSolarSunriseSunsetBasicAdminArea];
    [aCoder encodeObject:_lon forKey:kSolarSunriseSunsetBasicLon];
    [aCoder encodeObject:_lat forKey:kSolarSunriseSunsetBasicLat];
    [aCoder encodeObject:_parentCity forKey:kSolarSunriseSunsetBasicParentCity];
    [aCoder encodeObject:_cnty forKey:kSolarSunriseSunsetBasicCnty];
}

- (id)copyWithZone:(NSZone *)zone {
    SolarSunriseSunsetBasic *copy = [[SolarSunriseSunsetBasic alloc] init];
    
    
    
    if (copy) {

        copy.tz = [self.tz copyWithZone:zone];
        copy.location = [self.location copyWithZone:zone];
        copy.cid = [self.cid copyWithZone:zone];
        copy.adminArea = [self.adminArea copyWithZone:zone];
        copy.lon = [self.lon copyWithZone:zone];
        copy.lat = [self.lat copyWithZone:zone];
        copy.parentCity = [self.parentCity copyWithZone:zone];
        copy.cnty = [self.cnty copyWithZone:zone];
    }
    
    return copy;
}


@end
