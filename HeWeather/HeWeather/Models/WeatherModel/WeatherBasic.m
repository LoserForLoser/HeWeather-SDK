//
//  Basic.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherBasic.h"


NSString *const kWeatherBasicTz = @"tz";
NSString *const kWeatherBasicLocation = @"location";
NSString *const kWeatherBasicCnty = @"cnty";
NSString *const kWeatherBasicAdminArea = @"admin_area";
NSString *const kWeatherBasicLon = @"lon";
NSString *const kWeatherBasicLat = @"lat";
NSString *const kWeatherBasicParentCity = @"parent_city";
NSString *const kWeatherBasicCid = @"cid";


@interface WeatherBasic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherBasic

@synthesize tz = _tz;
@synthesize location = _location;
@synthesize cnty = _cnty;
@synthesize adminArea = _adminArea;
@synthesize lon = _lon;
@synthesize lat = _lat;
@synthesize parentCity = _parentCity;
@synthesize cid = _cid;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.tz = [self objectOrNilForKey:kWeatherBasicTz fromDictionary:dict];
            self.location = [self objectOrNilForKey:kWeatherBasicLocation fromDictionary:dict];
            self.cnty = [self objectOrNilForKey:kWeatherBasicCnty fromDictionary:dict];
            self.adminArea = [self objectOrNilForKey:kWeatherBasicAdminArea fromDictionary:dict];
            self.lon = [self objectOrNilForKey:kWeatherBasicLon fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kWeatherBasicLat fromDictionary:dict];
            self.parentCity = [self objectOrNilForKey:kWeatherBasicParentCity fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kWeatherBasicCid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tz forKey:kWeatherBasicTz];
    [mutableDict setValue:self.location forKey:kWeatherBasicLocation];
    [mutableDict setValue:self.cnty forKey:kWeatherBasicCnty];
    [mutableDict setValue:self.adminArea forKey:kWeatherBasicAdminArea];
    [mutableDict setValue:self.lon forKey:kWeatherBasicLon];
    [mutableDict setValue:self.lat forKey:kWeatherBasicLat];
    [mutableDict setValue:self.parentCity forKey:kWeatherBasicParentCity];
    [mutableDict setValue:self.cid forKey:kWeatherBasicCid];

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

    self.tz = [aDecoder decodeObjectForKey:kWeatherBasicTz];
    self.location = [aDecoder decodeObjectForKey:kWeatherBasicLocation];
    self.cnty = [aDecoder decodeObjectForKey:kWeatherBasicCnty];
    self.adminArea = [aDecoder decodeObjectForKey:kWeatherBasicAdminArea];
    self.lon = [aDecoder decodeObjectForKey:kWeatherBasicLon];
    self.lat = [aDecoder decodeObjectForKey:kWeatherBasicLat];
    self.parentCity = [aDecoder decodeObjectForKey:kWeatherBasicParentCity];
    self.cid = [aDecoder decodeObjectForKey:kWeatherBasicCid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tz forKey:kWeatherBasicTz];
    [aCoder encodeObject:_location forKey:kWeatherBasicLocation];
    [aCoder encodeObject:_cnty forKey:kWeatherBasicCnty];
    [aCoder encodeObject:_adminArea forKey:kWeatherBasicAdminArea];
    [aCoder encodeObject:_lon forKey:kWeatherBasicLon];
    [aCoder encodeObject:_lat forKey:kWeatherBasicLat];
    [aCoder encodeObject:_parentCity forKey:kWeatherBasicParentCity];
    [aCoder encodeObject:_cid forKey:kWeatherBasicCid];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherBasic *copy = [[WeatherBasic alloc] init];
    
    
    
    if (copy) {

        copy.tz = [self.tz copyWithZone:zone];
        copy.location = [self.location copyWithZone:zone];
        copy.cnty = [self.cnty copyWithZone:zone];
        copy.adminArea = [self.adminArea copyWithZone:zone];
        copy.lon = [self.lon copyWithZone:zone];
        copy.lat = [self.lat copyWithZone:zone];
        copy.parentCity = [self.parentCity copyWithZone:zone];
        copy.cid = [self.cid copyWithZone:zone];
    }
    
    return copy;
}


@end
