//
//  Basic.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "AirNowBasic.h"


NSString *const kAirNowBasicTz = @"tz";
NSString *const kAirNowBasicLocation = @"location";
NSString *const kAirNowBasicCid = @"cid";
NSString *const kAirNowBasicAdminArea = @"admin_area";
NSString *const kAirNowBasicLon = @"lon";
NSString *const kAirNowBasicLat = @"lat";
NSString *const kAirNowBasicParentCity = @"parent_city";
NSString *const kAirNowBasicCnty = @"cnty";


@interface AirNowBasic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AirNowBasic

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
            self.tz = [self objectOrNilForKey:kAirNowBasicTz fromDictionary:dict];
            self.location = [self objectOrNilForKey:kAirNowBasicLocation fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kAirNowBasicCid fromDictionary:dict];
            self.adminArea = [self objectOrNilForKey:kAirNowBasicAdminArea fromDictionary:dict];
            self.lon = [self objectOrNilForKey:kAirNowBasicLon fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kAirNowBasicLat fromDictionary:dict];
            self.parentCity = [self objectOrNilForKey:kAirNowBasicParentCity fromDictionary:dict];
            self.cnty = [self objectOrNilForKey:kAirNowBasicCnty fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tz forKey:kAirNowBasicTz];
    [mutableDict setValue:self.location forKey:kAirNowBasicLocation];
    [mutableDict setValue:self.cid forKey:kAirNowBasicCid];
    [mutableDict setValue:self.adminArea forKey:kAirNowBasicAdminArea];
    [mutableDict setValue:self.lon forKey:kAirNowBasicLon];
    [mutableDict setValue:self.lat forKey:kAirNowBasicLat];
    [mutableDict setValue:self.parentCity forKey:kAirNowBasicParentCity];
    [mutableDict setValue:self.cnty forKey:kAirNowBasicCnty];

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

    self.tz = [aDecoder decodeObjectForKey:kAirNowBasicTz];
    self.location = [aDecoder decodeObjectForKey:kAirNowBasicLocation];
    self.cid = [aDecoder decodeObjectForKey:kAirNowBasicCid];
    self.adminArea = [aDecoder decodeObjectForKey:kAirNowBasicAdminArea];
    self.lon = [aDecoder decodeObjectForKey:kAirNowBasicLon];
    self.lat = [aDecoder decodeObjectForKey:kAirNowBasicLat];
    self.parentCity = [aDecoder decodeObjectForKey:kAirNowBasicParentCity];
    self.cnty = [aDecoder decodeObjectForKey:kAirNowBasicCnty];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tz forKey:kAirNowBasicTz];
    [aCoder encodeObject:_location forKey:kAirNowBasicLocation];
    [aCoder encodeObject:_cid forKey:kAirNowBasicCid];
    [aCoder encodeObject:_adminArea forKey:kAirNowBasicAdminArea];
    [aCoder encodeObject:_lon forKey:kAirNowBasicLon];
    [aCoder encodeObject:_lat forKey:kAirNowBasicLat];
    [aCoder encodeObject:_parentCity forKey:kAirNowBasicParentCity];
    [aCoder encodeObject:_cnty forKey:kAirNowBasicCnty];
}

- (id)copyWithZone:(NSZone *)zone {
    AirNowBasic *copy = [[AirNowBasic alloc] init];
    
    
    
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
