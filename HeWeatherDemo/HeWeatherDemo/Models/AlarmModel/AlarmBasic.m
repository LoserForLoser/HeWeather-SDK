//
//  Basic.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "AlarmBasic.h"


NSString *const kAlarmBasicTz = @"tz";
NSString *const kAlarmBasicLocation = @"location";
NSString *const kAlarmBasicCid = @"cid";
NSString *const kAlarmBasicAdminArea = @"admin_area";
NSString *const kAlarmBasicLon = @"lon";
NSString *const kAlarmBasicLat = @"lat";
NSString *const kAlarmBasicParentCity = @"parent_city";
NSString *const kAlarmBasicCnty = @"cnty";


@interface AlarmBasic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AlarmBasic

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
            self.tz = [self objectOrNilForKey:kAlarmBasicTz fromDictionary:dict];
            self.location = [self objectOrNilForKey:kAlarmBasicLocation fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kAlarmBasicCid fromDictionary:dict];
            self.adminArea = [self objectOrNilForKey:kAlarmBasicAdminArea fromDictionary:dict];
            self.lon = [self objectOrNilForKey:kAlarmBasicLon fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kAlarmBasicLat fromDictionary:dict];
            self.parentCity = [self objectOrNilForKey:kAlarmBasicParentCity fromDictionary:dict];
            self.cnty = [self objectOrNilForKey:kAlarmBasicCnty fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tz forKey:kAlarmBasicTz];
    [mutableDict setValue:self.location forKey:kAlarmBasicLocation];
    [mutableDict setValue:self.cid forKey:kAlarmBasicCid];
    [mutableDict setValue:self.adminArea forKey:kAlarmBasicAdminArea];
    [mutableDict setValue:self.lon forKey:kAlarmBasicLon];
    [mutableDict setValue:self.lat forKey:kAlarmBasicLat];
    [mutableDict setValue:self.parentCity forKey:kAlarmBasicParentCity];
    [mutableDict setValue:self.cnty forKey:kAlarmBasicCnty];

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

    self.tz = [aDecoder decodeObjectForKey:kAlarmBasicTz];
    self.location = [aDecoder decodeObjectForKey:kAlarmBasicLocation];
    self.cid = [aDecoder decodeObjectForKey:kAlarmBasicCid];
    self.adminArea = [aDecoder decodeObjectForKey:kAlarmBasicAdminArea];
    self.lon = [aDecoder decodeObjectForKey:kAlarmBasicLon];
    self.lat = [aDecoder decodeObjectForKey:kAlarmBasicLat];
    self.parentCity = [aDecoder decodeObjectForKey:kAlarmBasicParentCity];
    self.cnty = [aDecoder decodeObjectForKey:kAlarmBasicCnty];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tz forKey:kAlarmBasicTz];
    [aCoder encodeObject:_location forKey:kAlarmBasicLocation];
    [aCoder encodeObject:_cid forKey:kAlarmBasicCid];
    [aCoder encodeObject:_adminArea forKey:kAlarmBasicAdminArea];
    [aCoder encodeObject:_lon forKey:kAlarmBasicLon];
    [aCoder encodeObject:_lat forKey:kAlarmBasicLat];
    [aCoder encodeObject:_parentCity forKey:kAlarmBasicParentCity];
    [aCoder encodeObject:_cnty forKey:kAlarmBasicCnty];
}

- (id)copyWithZone:(NSZone *)zone {
    AlarmBasic *copy = [[AlarmBasic alloc] init];
    
    
    
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
