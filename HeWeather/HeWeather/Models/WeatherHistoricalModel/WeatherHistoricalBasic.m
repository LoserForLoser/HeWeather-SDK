//
//  Basic.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherHistoricalBasic.h"


NSString *const kWeatherHistoricalBasicTz = @"tz";
NSString *const kWeatherHistoricalBasicLocation = @"location";
NSString *const kWeatherHistoricalBasicCid = @"cid";
NSString *const kWeatherHistoricalBasicAdminArea = @"admin_area";
NSString *const kWeatherHistoricalBasicLon = @"lon";
NSString *const kWeatherHistoricalBasicLat = @"lat";
NSString *const kWeatherHistoricalBasicParentCity = @"parent_city";
NSString *const kWeatherHistoricalBasicCnty = @"cnty";


@interface WeatherHistoricalBasic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherHistoricalBasic

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
            self.tz = [self objectOrNilForKey:kWeatherHistoricalBasicTz fromDictionary:dict];
            self.location = [self objectOrNilForKey:kWeatherHistoricalBasicLocation fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kWeatherHistoricalBasicCid fromDictionary:dict];
            self.adminArea = [self objectOrNilForKey:kWeatherHistoricalBasicAdminArea fromDictionary:dict];
            self.lon = [self objectOrNilForKey:kWeatherHistoricalBasicLon fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kWeatherHistoricalBasicLat fromDictionary:dict];
            self.parentCity = [self objectOrNilForKey:kWeatherHistoricalBasicParentCity fromDictionary:dict];
            self.cnty = [self objectOrNilForKey:kWeatherHistoricalBasicCnty fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tz forKey:kWeatherHistoricalBasicTz];
    [mutableDict setValue:self.location forKey:kWeatherHistoricalBasicLocation];
    [mutableDict setValue:self.cid forKey:kWeatherHistoricalBasicCid];
    [mutableDict setValue:self.adminArea forKey:kWeatherHistoricalBasicAdminArea];
    [mutableDict setValue:self.lon forKey:kWeatherHistoricalBasicLon];
    [mutableDict setValue:self.lat forKey:kWeatherHistoricalBasicLat];
    [mutableDict setValue:self.parentCity forKey:kWeatherHistoricalBasicParentCity];
    [mutableDict setValue:self.cnty forKey:kWeatherHistoricalBasicCnty];

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

    self.tz = [aDecoder decodeObjectForKey:kWeatherHistoricalBasicTz];
    self.location = [aDecoder decodeObjectForKey:kWeatherHistoricalBasicLocation];
    self.cid = [aDecoder decodeObjectForKey:kWeatherHistoricalBasicCid];
    self.adminArea = [aDecoder decodeObjectForKey:kWeatherHistoricalBasicAdminArea];
    self.lon = [aDecoder decodeObjectForKey:kWeatherHistoricalBasicLon];
    self.lat = [aDecoder decodeObjectForKey:kWeatherHistoricalBasicLat];
    self.parentCity = [aDecoder decodeObjectForKey:kWeatherHistoricalBasicParentCity];
    self.cnty = [aDecoder decodeObjectForKey:kWeatherHistoricalBasicCnty];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tz forKey:kWeatherHistoricalBasicTz];
    [aCoder encodeObject:_location forKey:kWeatherHistoricalBasicLocation];
    [aCoder encodeObject:_cid forKey:kWeatherHistoricalBasicCid];
    [aCoder encodeObject:_adminArea forKey:kWeatherHistoricalBasicAdminArea];
    [aCoder encodeObject:_lon forKey:kWeatherHistoricalBasicLon];
    [aCoder encodeObject:_lat forKey:kWeatherHistoricalBasicLat];
    [aCoder encodeObject:_parentCity forKey:kWeatherHistoricalBasicParentCity];
    [aCoder encodeObject:_cnty forKey:kWeatherHistoricalBasicCnty];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherHistoricalBasic *copy = [[WeatherHistoricalBasic alloc] init];
    
    
    
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
