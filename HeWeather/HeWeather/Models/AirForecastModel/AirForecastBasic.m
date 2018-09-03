//
//  Basic.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "AirForecastBasic.h"


NSString *const kBasicTz = @"tz";
NSString *const kBasicLocation = @"location";
NSString *const kBasicCid = @"cid";
NSString *const kBasicAdminArea = @"admin_area";
NSString *const kBasicLon = @"lon";
NSString *const kBasicLat = @"lat";
NSString *const kBasicParentCity = @"parent_city";
NSString *const kBasicCnty = @"cnty";


@interface AirForecastBasic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AirForecastBasic

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
            self.tz = [self objectOrNilForKey:kBasicTz fromDictionary:dict];
            self.location = [self objectOrNilForKey:kBasicLocation fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kBasicCid fromDictionary:dict];
            self.adminArea = [self objectOrNilForKey:kBasicAdminArea fromDictionary:dict];
            self.lon = [self objectOrNilForKey:kBasicLon fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kBasicLat fromDictionary:dict];
            self.parentCity = [self objectOrNilForKey:kBasicParentCity fromDictionary:dict];
            self.cnty = [self objectOrNilForKey:kBasicCnty fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tz forKey:kBasicTz];
    [mutableDict setValue:self.location forKey:kBasicLocation];
    [mutableDict setValue:self.cid forKey:kBasicCid];
    [mutableDict setValue:self.adminArea forKey:kBasicAdminArea];
    [mutableDict setValue:self.lon forKey:kBasicLon];
    [mutableDict setValue:self.lat forKey:kBasicLat];
    [mutableDict setValue:self.parentCity forKey:kBasicParentCity];
    [mutableDict setValue:self.cnty forKey:kBasicCnty];

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

    self.tz = [aDecoder decodeObjectForKey:kBasicTz];
    self.location = [aDecoder decodeObjectForKey:kBasicLocation];
    self.cid = [aDecoder decodeObjectForKey:kBasicCid];
    self.adminArea = [aDecoder decodeObjectForKey:kBasicAdminArea];
    self.lon = [aDecoder decodeObjectForKey:kBasicLon];
    self.lat = [aDecoder decodeObjectForKey:kBasicLat];
    self.parentCity = [aDecoder decodeObjectForKey:kBasicParentCity];
    self.cnty = [aDecoder decodeObjectForKey:kBasicCnty];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tz forKey:kBasicTz];
    [aCoder encodeObject:_location forKey:kBasicLocation];
    [aCoder encodeObject:_cid forKey:kBasicCid];
    [aCoder encodeObject:_adminArea forKey:kBasicAdminArea];
    [aCoder encodeObject:_lon forKey:kBasicLon];
    [aCoder encodeObject:_lat forKey:kBasicLat];
    [aCoder encodeObject:_parentCity forKey:kBasicParentCity];
    [aCoder encodeObject:_cnty forKey:kBasicCnty];
}

- (id)copyWithZone:(NSZone *)zone {
    AirForecastBasic *copy = [[AirForecastBasic alloc] init];
    
    
    
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
