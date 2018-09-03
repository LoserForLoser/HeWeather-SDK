//
//  Basic.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "SearchBasic.h"


NSString *const kSearchBasicTz = @"tz";
NSString *const kSearchBasicLocation = @"location";
NSString *const kSearchBasicCid = @"cid";
NSString *const kSearchBasicAdminArea = @"admin_area";
NSString *const kSearchBasicLon = @"lon";
NSString *const kSearchBasicLat = @"lat";
NSString *const kSearchBasicParentCity = @"parent_city";
NSString *const kSearchBasicCnty = @"cnty";


@interface SearchBasic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SearchBasic

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
            self.tz = [self objectOrNilForKey:kSearchBasicTz fromDictionary:dict];
            self.location = [self objectOrNilForKey:kSearchBasicLocation fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kSearchBasicCid fromDictionary:dict];
            self.adminArea = [self objectOrNilForKey:kSearchBasicAdminArea fromDictionary:dict];
            self.lon = [self objectOrNilForKey:kSearchBasicLon fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kSearchBasicLat fromDictionary:dict];
            self.parentCity = [self objectOrNilForKey:kSearchBasicParentCity fromDictionary:dict];
            self.cnty = [self objectOrNilForKey:kSearchBasicCnty fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tz forKey:kSearchBasicTz];
    [mutableDict setValue:self.location forKey:kSearchBasicLocation];
    [mutableDict setValue:self.cid forKey:kSearchBasicCid];
    [mutableDict setValue:self.adminArea forKey:kSearchBasicAdminArea];
    [mutableDict setValue:self.lon forKey:kSearchBasicLon];
    [mutableDict setValue:self.lat forKey:kSearchBasicLat];
    [mutableDict setValue:self.parentCity forKey:kSearchBasicParentCity];
    [mutableDict setValue:self.cnty forKey:kSearchBasicCnty];

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

    self.tz = [aDecoder decodeObjectForKey:kSearchBasicTz];
    self.location = [aDecoder decodeObjectForKey:kSearchBasicLocation];
    self.cid = [aDecoder decodeObjectForKey:kSearchBasicCid];
    self.adminArea = [aDecoder decodeObjectForKey:kSearchBasicAdminArea];
    self.lon = [aDecoder decodeObjectForKey:kSearchBasicLon];
    self.lat = [aDecoder decodeObjectForKey:kSearchBasicLat];
    self.parentCity = [aDecoder decodeObjectForKey:kSearchBasicParentCity];
    self.cnty = [aDecoder decodeObjectForKey:kSearchBasicCnty];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tz forKey:kSearchBasicTz];
    [aCoder encodeObject:_location forKey:kSearchBasicLocation];
    [aCoder encodeObject:_cid forKey:kSearchBasicCid];
    [aCoder encodeObject:_adminArea forKey:kSearchBasicAdminArea];
    [aCoder encodeObject:_lon forKey:kSearchBasicLon];
    [aCoder encodeObject:_lat forKey:kSearchBasicLat];
    [aCoder encodeObject:_parentCity forKey:kSearchBasicParentCity];
    [aCoder encodeObject:_cnty forKey:kSearchBasicCnty];
}

- (id)copyWithZone:(NSZone *)zone {
    SearchBasic *copy = [[SearchBasic alloc] init];
    
    
    
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
