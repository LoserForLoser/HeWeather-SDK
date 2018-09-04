//
//  Basic.m
//
//  Created by 朝阳 宋 on 2018/9/3
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "TopBasic.h"


NSString *const kTopBasicTz = @"tz";
NSString *const kTopBasicLocation = @"location";
NSString *const kTopBasicCid = @"cid";
NSString *const kTopBasicAdminArea = @"admin_area";
NSString *const kTopBasicLon = @"lon";
NSString *const kTopBasicType = @"type";
NSString *const kTopBasicLat = @"lat";
NSString *const kTopBasicParentCity = @"parent_city";
NSString *const kTopBasicCnty = @"cnty";


@interface TopBasic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TopBasic

@synthesize tz = _tz;
@synthesize location = _location;
@synthesize cid = _cid;
@synthesize adminArea = _adminArea;
@synthesize lon = _lon;
@synthesize type = _type;
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
            self.tz = [self objectOrNilForKey:kTopBasicTz fromDictionary:dict];
            self.location = [self objectOrNilForKey:kTopBasicLocation fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kTopBasicCid fromDictionary:dict];
            self.adminArea = [self objectOrNilForKey:kTopBasicAdminArea fromDictionary:dict];
            self.lon = [self objectOrNilForKey:kTopBasicLon fromDictionary:dict];
            self.type = [self objectOrNilForKey:kTopBasicType fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kTopBasicLat fromDictionary:dict];
            self.parentCity = [self objectOrNilForKey:kTopBasicParentCity fromDictionary:dict];
            self.cnty = [self objectOrNilForKey:kTopBasicCnty fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tz forKey:kTopBasicTz];
    [mutableDict setValue:self.location forKey:kTopBasicLocation];
    [mutableDict setValue:self.cid forKey:kTopBasicCid];
    [mutableDict setValue:self.adminArea forKey:kTopBasicAdminArea];
    [mutableDict setValue:self.lon forKey:kTopBasicLon];
    [mutableDict setValue:self.type forKey:kTopBasicType];
    [mutableDict setValue:self.lat forKey:kTopBasicLat];
    [mutableDict setValue:self.parentCity forKey:kTopBasicParentCity];
    [mutableDict setValue:self.cnty forKey:kTopBasicCnty];

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

    self.tz = [aDecoder decodeObjectForKey:kTopBasicTz];
    self.location = [aDecoder decodeObjectForKey:kTopBasicLocation];
    self.cid = [aDecoder decodeObjectForKey:kTopBasicCid];
    self.adminArea = [aDecoder decodeObjectForKey:kTopBasicAdminArea];
    self.lon = [aDecoder decodeObjectForKey:kTopBasicLon];
    self.type = [aDecoder decodeObjectForKey:kTopBasicType];
    self.lat = [aDecoder decodeObjectForKey:kTopBasicLat];
    self.parentCity = [aDecoder decodeObjectForKey:kTopBasicParentCity];
    self.cnty = [aDecoder decodeObjectForKey:kTopBasicCnty];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tz forKey:kTopBasicTz];
    [aCoder encodeObject:_location forKey:kTopBasicLocation];
    [aCoder encodeObject:_cid forKey:kTopBasicCid];
    [aCoder encodeObject:_adminArea forKey:kTopBasicAdminArea];
    [aCoder encodeObject:_lon forKey:kTopBasicLon];
    [aCoder encodeObject:_type forKey:kTopBasicType];
    [aCoder encodeObject:_lat forKey:kTopBasicLat];
    [aCoder encodeObject:_parentCity forKey:kTopBasicParentCity];
    [aCoder encodeObject:_cnty forKey:kTopBasicCnty];
}

- (id)copyWithZone:(NSZone *)zone {
    TopBasic *copy = [[TopBasic alloc] init];
    
    
    
    if (copy) {

        copy.tz = [self.tz copyWithZone:zone];
        copy.location = [self.location copyWithZone:zone];
        copy.cid = [self.cid copyWithZone:zone];
        copy.adminArea = [self.adminArea copyWithZone:zone];
        copy.lon = [self.lon copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.lat = [self.lat copyWithZone:zone];
        copy.parentCity = [self.parentCity copyWithZone:zone];
        copy.cnty = [self.cnty copyWithZone:zone];
    }
    
    return copy;
}


@end
