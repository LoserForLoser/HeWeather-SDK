//
//  Basic.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherNowBasic.h"


NSString *const kWeatherNowBasicTz = @"tz";
NSString *const kWeatherNowBasicLocation = @"location";
NSString *const kWeatherNowBasicCnty = @"cnty";
NSString *const kWeatherNowBasicAdminArea = @"admin_area";
NSString *const kWeatherNowBasicLon = @"lon";
NSString *const kWeatherNowBasicLat = @"lat";
NSString *const kWeatherNowBasicParentCity = @"parent_city";
NSString *const kWeatherNowBasicCid = @"cid";


@interface WeatherNowBasic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherNowBasic

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
            self.tz = [self objectOrNilForKey:kWeatherNowBasicTz fromDictionary:dict];
            self.location = [self objectOrNilForKey:kWeatherNowBasicLocation fromDictionary:dict];
            self.cnty = [self objectOrNilForKey:kWeatherNowBasicCnty fromDictionary:dict];
            self.adminArea = [self objectOrNilForKey:kWeatherNowBasicAdminArea fromDictionary:dict];
            self.lon = [self objectOrNilForKey:kWeatherNowBasicLon fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kWeatherNowBasicLat fromDictionary:dict];
            self.parentCity = [self objectOrNilForKey:kWeatherNowBasicParentCity fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kWeatherNowBasicCid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tz forKey:kWeatherNowBasicTz];
    [mutableDict setValue:self.location forKey:kWeatherNowBasicLocation];
    [mutableDict setValue:self.cnty forKey:kWeatherNowBasicCnty];
    [mutableDict setValue:self.adminArea forKey:kWeatherNowBasicAdminArea];
    [mutableDict setValue:self.lon forKey:kWeatherNowBasicLon];
    [mutableDict setValue:self.lat forKey:kWeatherNowBasicLat];
    [mutableDict setValue:self.parentCity forKey:kWeatherNowBasicParentCity];
    [mutableDict setValue:self.cid forKey:kWeatherNowBasicCid];

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

    self.tz = [aDecoder decodeObjectForKey:kWeatherNowBasicTz];
    self.location = [aDecoder decodeObjectForKey:kWeatherNowBasicLocation];
    self.cnty = [aDecoder decodeObjectForKey:kWeatherNowBasicCnty];
    self.adminArea = [aDecoder decodeObjectForKey:kWeatherNowBasicAdminArea];
    self.lon = [aDecoder decodeObjectForKey:kWeatherNowBasicLon];
    self.lat = [aDecoder decodeObjectForKey:kWeatherNowBasicLat];
    self.parentCity = [aDecoder decodeObjectForKey:kWeatherNowBasicParentCity];
    self.cid = [aDecoder decodeObjectForKey:kWeatherNowBasicCid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tz forKey:kWeatherNowBasicTz];
    [aCoder encodeObject:_location forKey:kWeatherNowBasicLocation];
    [aCoder encodeObject:_cnty forKey:kWeatherNowBasicCnty];
    [aCoder encodeObject:_adminArea forKey:kWeatherNowBasicAdminArea];
    [aCoder encodeObject:_lon forKey:kWeatherNowBasicLon];
    [aCoder encodeObject:_lat forKey:kWeatherNowBasicLat];
    [aCoder encodeObject:_parentCity forKey:kWeatherNowBasicParentCity];
    [aCoder encodeObject:_cid forKey:kWeatherNowBasicCid];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherNowBasic *copy = [[WeatherNowBasic alloc] init];
    
    
    
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
