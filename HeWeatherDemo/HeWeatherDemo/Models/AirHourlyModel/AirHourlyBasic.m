//
//  Basic.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "AirHourlyBasic.h"


NSString *const kAirHourlyBasicTz = @"tz";
NSString *const kAirHourlyBasicLocation = @"location";
NSString *const kAirHourlyBasicCid = @"cid";
NSString *const kAirHourlyBasicAdminArea = @"admin_area";
NSString *const kAirHourlyBasicLon = @"lon";
NSString *const kAirHourlyBasicLat = @"lat";
NSString *const kAirHourlyBasicParentCity = @"parent_city";
NSString *const kAirHourlyBasicCnty = @"cnty";


@interface AirHourlyBasic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AirHourlyBasic

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
            self.tz = [self objectOrNilForKey:kAirHourlyBasicTz fromDictionary:dict];
            self.location = [self objectOrNilForKey:kAirHourlyBasicLocation fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kAirHourlyBasicCid fromDictionary:dict];
            self.adminArea = [self objectOrNilForKey:kAirHourlyBasicAdminArea fromDictionary:dict];
            self.lon = [self objectOrNilForKey:kAirHourlyBasicLon fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kAirHourlyBasicLat fromDictionary:dict];
            self.parentCity = [self objectOrNilForKey:kAirHourlyBasicParentCity fromDictionary:dict];
            self.cnty = [self objectOrNilForKey:kAirHourlyBasicCnty fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tz forKey:kAirHourlyBasicTz];
    [mutableDict setValue:self.location forKey:kAirHourlyBasicLocation];
    [mutableDict setValue:self.cid forKey:kAirHourlyBasicCid];
    [mutableDict setValue:self.adminArea forKey:kAirHourlyBasicAdminArea];
    [mutableDict setValue:self.lon forKey:kAirHourlyBasicLon];
    [mutableDict setValue:self.lat forKey:kAirHourlyBasicLat];
    [mutableDict setValue:self.parentCity forKey:kAirHourlyBasicParentCity];
    [mutableDict setValue:self.cnty forKey:kAirHourlyBasicCnty];

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

    self.tz = [aDecoder decodeObjectForKey:kAirHourlyBasicTz];
    self.location = [aDecoder decodeObjectForKey:kAirHourlyBasicLocation];
    self.cid = [aDecoder decodeObjectForKey:kAirHourlyBasicCid];
    self.adminArea = [aDecoder decodeObjectForKey:kAirHourlyBasicAdminArea];
    self.lon = [aDecoder decodeObjectForKey:kAirHourlyBasicLon];
    self.lat = [aDecoder decodeObjectForKey:kAirHourlyBasicLat];
    self.parentCity = [aDecoder decodeObjectForKey:kAirHourlyBasicParentCity];
    self.cnty = [aDecoder decodeObjectForKey:kAirHourlyBasicCnty];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tz forKey:kAirHourlyBasicTz];
    [aCoder encodeObject:_location forKey:kAirHourlyBasicLocation];
    [aCoder encodeObject:_cid forKey:kAirHourlyBasicCid];
    [aCoder encodeObject:_adminArea forKey:kAirHourlyBasicAdminArea];
    [aCoder encodeObject:_lon forKey:kAirHourlyBasicLon];
    [aCoder encodeObject:_lat forKey:kAirHourlyBasicLat];
    [aCoder encodeObject:_parentCity forKey:kAirHourlyBasicParentCity];
    [aCoder encodeObject:_cnty forKey:kAirHourlyBasicCnty];
}

- (id)copyWithZone:(NSZone *)zone {
    AirHourlyBasic *copy = [[AirHourlyBasic alloc] init];
    
    
    
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
