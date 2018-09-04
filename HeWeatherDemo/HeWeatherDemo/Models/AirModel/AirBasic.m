//
//  Basic.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "AirBasic.h"


NSString *const kAirBasicTz = @"tz";
NSString *const kAirBasicLocation = @"location";
NSString *const kAirBasicCid = @"cid";
NSString *const kAirBasicAdminArea = @"admin_area";
NSString *const kAirBasicLon = @"lon";
NSString *const kAirBasicLat = @"lat";
NSString *const kAirBasicParentCity = @"parent_city";
NSString *const kAirBasicCnty = @"cnty";


@interface AirBasic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AirBasic

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
            self.tz = [self objectOrNilForKey:kAirBasicTz fromDictionary:dict];
            self.location = [self objectOrNilForKey:kAirBasicLocation fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kAirBasicCid fromDictionary:dict];
            self.adminArea = [self objectOrNilForKey:kAirBasicAdminArea fromDictionary:dict];
            self.lon = [self objectOrNilForKey:kAirBasicLon fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kAirBasicLat fromDictionary:dict];
            self.parentCity = [self objectOrNilForKey:kAirBasicParentCity fromDictionary:dict];
            self.cnty = [self objectOrNilForKey:kAirBasicCnty fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tz forKey:kAirBasicTz];
    [mutableDict setValue:self.location forKey:kAirBasicLocation];
    [mutableDict setValue:self.cid forKey:kAirBasicCid];
    [mutableDict setValue:self.adminArea forKey:kAirBasicAdminArea];
    [mutableDict setValue:self.lon forKey:kAirBasicLon];
    [mutableDict setValue:self.lat forKey:kAirBasicLat];
    [mutableDict setValue:self.parentCity forKey:kAirBasicParentCity];
    [mutableDict setValue:self.cnty forKey:kAirBasicCnty];

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

    self.tz = [aDecoder decodeObjectForKey:kAirBasicTz];
    self.location = [aDecoder decodeObjectForKey:kAirBasicLocation];
    self.cid = [aDecoder decodeObjectForKey:kAirBasicCid];
    self.adminArea = [aDecoder decodeObjectForKey:kAirBasicAdminArea];
    self.lon = [aDecoder decodeObjectForKey:kAirBasicLon];
    self.lat = [aDecoder decodeObjectForKey:kAirBasicLat];
    self.parentCity = [aDecoder decodeObjectForKey:kAirBasicParentCity];
    self.cnty = [aDecoder decodeObjectForKey:kAirBasicCnty];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tz forKey:kAirBasicTz];
    [aCoder encodeObject:_location forKey:kAirBasicLocation];
    [aCoder encodeObject:_cid forKey:kAirBasicCid];
    [aCoder encodeObject:_adminArea forKey:kAirBasicAdminArea];
    [aCoder encodeObject:_lon forKey:kAirBasicLon];
    [aCoder encodeObject:_lat forKey:kAirBasicLat];
    [aCoder encodeObject:_parentCity forKey:kAirBasicParentCity];
    [aCoder encodeObject:_cnty forKey:kAirBasicCnty];
}

- (id)copyWithZone:(NSZone *)zone {
    AirBasic *copy = [[AirBasic alloc] init];
    
    
    
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
