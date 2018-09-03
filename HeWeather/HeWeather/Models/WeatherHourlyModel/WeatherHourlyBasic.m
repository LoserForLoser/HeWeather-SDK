//
//  Basic.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherHourlyBasic.h"


NSString *const kWeatherHourlyBasicTz = @"tz";
NSString *const kWeatherHourlyBasicLocation = @"location";
NSString *const kWeatherHourlyBasicCnty = @"cnty";
NSString *const kWeatherHourlyBasicAdminArea = @"admin_area";
NSString *const kWeatherHourlyBasicLon = @"lon";
NSString *const kWeatherHourlyBasicLat = @"lat";
NSString *const kWeatherHourlyBasicParentCity = @"parent_city";
NSString *const kWeatherHourlyBasicCid = @"cid";


@interface WeatherHourlyBasic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherHourlyBasic

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
            self.tz = [self objectOrNilForKey:kWeatherHourlyBasicTz fromDictionary:dict];
            self.location = [self objectOrNilForKey:kWeatherHourlyBasicLocation fromDictionary:dict];
            self.cnty = [self objectOrNilForKey:kWeatherHourlyBasicCnty fromDictionary:dict];
            self.adminArea = [self objectOrNilForKey:kWeatherHourlyBasicAdminArea fromDictionary:dict];
            self.lon = [self objectOrNilForKey:kWeatherHourlyBasicLon fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kWeatherHourlyBasicLat fromDictionary:dict];
            self.parentCity = [self objectOrNilForKey:kWeatherHourlyBasicParentCity fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kWeatherHourlyBasicCid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tz forKey:kWeatherHourlyBasicTz];
    [mutableDict setValue:self.location forKey:kWeatherHourlyBasicLocation];
    [mutableDict setValue:self.cnty forKey:kWeatherHourlyBasicCnty];
    [mutableDict setValue:self.adminArea forKey:kWeatherHourlyBasicAdminArea];
    [mutableDict setValue:self.lon forKey:kWeatherHourlyBasicLon];
    [mutableDict setValue:self.lat forKey:kWeatherHourlyBasicLat];
    [mutableDict setValue:self.parentCity forKey:kWeatherHourlyBasicParentCity];
    [mutableDict setValue:self.cid forKey:kWeatherHourlyBasicCid];

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

    self.tz = [aDecoder decodeObjectForKey:kWeatherHourlyBasicTz];
    self.location = [aDecoder decodeObjectForKey:kWeatherHourlyBasicLocation];
    self.cnty = [aDecoder decodeObjectForKey:kWeatherHourlyBasicCnty];
    self.adminArea = [aDecoder decodeObjectForKey:kWeatherHourlyBasicAdminArea];
    self.lon = [aDecoder decodeObjectForKey:kWeatherHourlyBasicLon];
    self.lat = [aDecoder decodeObjectForKey:kWeatherHourlyBasicLat];
    self.parentCity = [aDecoder decodeObjectForKey:kWeatherHourlyBasicParentCity];
    self.cid = [aDecoder decodeObjectForKey:kWeatherHourlyBasicCid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tz forKey:kWeatherHourlyBasicTz];
    [aCoder encodeObject:_location forKey:kWeatherHourlyBasicLocation];
    [aCoder encodeObject:_cnty forKey:kWeatherHourlyBasicCnty];
    [aCoder encodeObject:_adminArea forKey:kWeatherHourlyBasicAdminArea];
    [aCoder encodeObject:_lon forKey:kWeatherHourlyBasicLon];
    [aCoder encodeObject:_lat forKey:kWeatherHourlyBasicLat];
    [aCoder encodeObject:_parentCity forKey:kWeatherHourlyBasicParentCity];
    [aCoder encodeObject:_cid forKey:kWeatherHourlyBasicCid];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherHourlyBasic *copy = [[WeatherHourlyBasic alloc] init];
    
    
    
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
