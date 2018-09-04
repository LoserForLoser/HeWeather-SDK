//
//  Basic.m
//
//  Created by 朝阳 宋 on 2018/9/3
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "FindBasic.h"


NSString *const kFindBasicTz = @"tz";
NSString *const kFindBasicLocation = @"location";
NSString *const kFindBasicCid = @"cid";
NSString *const kFindBasicAdminArea = @"admin_area";
NSString *const kFindBasicLon = @"lon";
NSString *const kFindBasicType = @"type";
NSString *const kFindBasicLat = @"lat";
NSString *const kFindBasicParentCity = @"parent_city";
NSString *const kFindBasicCnty = @"cnty";


@interface FindBasic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FindBasic

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
            self.tz = [self objectOrNilForKey:kFindBasicTz fromDictionary:dict];
            self.location = [self objectOrNilForKey:kFindBasicLocation fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kFindBasicCid fromDictionary:dict];
            self.adminArea = [self objectOrNilForKey:kFindBasicAdminArea fromDictionary:dict];
            self.lon = [self objectOrNilForKey:kFindBasicLon fromDictionary:dict];
            self.type = [self objectOrNilForKey:kFindBasicType fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kFindBasicLat fromDictionary:dict];
            self.parentCity = [self objectOrNilForKey:kFindBasicParentCity fromDictionary:dict];
            self.cnty = [self objectOrNilForKey:kFindBasicCnty fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tz forKey:kFindBasicTz];
    [mutableDict setValue:self.location forKey:kFindBasicLocation];
    [mutableDict setValue:self.cid forKey:kFindBasicCid];
    [mutableDict setValue:self.adminArea forKey:kFindBasicAdminArea];
    [mutableDict setValue:self.lon forKey:kFindBasicLon];
    [mutableDict setValue:self.type forKey:kFindBasicType];
    [mutableDict setValue:self.lat forKey:kFindBasicLat];
    [mutableDict setValue:self.parentCity forKey:kFindBasicParentCity];
    [mutableDict setValue:self.cnty forKey:kFindBasicCnty];

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

    self.tz = [aDecoder decodeObjectForKey:kFindBasicTz];
    self.location = [aDecoder decodeObjectForKey:kFindBasicLocation];
    self.cid = [aDecoder decodeObjectForKey:kFindBasicCid];
    self.adminArea = [aDecoder decodeObjectForKey:kFindBasicAdminArea];
    self.lon = [aDecoder decodeObjectForKey:kFindBasicLon];
    self.type = [aDecoder decodeObjectForKey:kFindBasicType];
    self.lat = [aDecoder decodeObjectForKey:kFindBasicLat];
    self.parentCity = [aDecoder decodeObjectForKey:kFindBasicParentCity];
    self.cnty = [aDecoder decodeObjectForKey:kFindBasicCnty];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tz forKey:kFindBasicTz];
    [aCoder encodeObject:_location forKey:kFindBasicLocation];
    [aCoder encodeObject:_cid forKey:kFindBasicCid];
    [aCoder encodeObject:_adminArea forKey:kFindBasicAdminArea];
    [aCoder encodeObject:_lon forKey:kFindBasicLon];
    [aCoder encodeObject:_type forKey:kFindBasicType];
    [aCoder encodeObject:_lat forKey:kFindBasicLat];
    [aCoder encodeObject:_parentCity forKey:kFindBasicParentCity];
    [aCoder encodeObject:_cnty forKey:kFindBasicCnty];
}

- (id)copyWithZone:(NSZone *)zone {
    FindBasic *copy = [[FindBasic alloc] init];
    
    
    
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
