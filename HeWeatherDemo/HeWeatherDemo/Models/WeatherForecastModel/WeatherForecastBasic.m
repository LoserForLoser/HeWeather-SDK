//
//  Basic.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherForecastBasic.h"


NSString *const kWeatherForecastBasicTz = @"tz";
NSString *const kWeatherForecastBasicLocation = @"location";
NSString *const kWeatherForecastBasicCnty = @"cnty";
NSString *const kWeatherForecastBasicAdminArea = @"admin_area";
NSString *const kWeatherForecastBasicLon = @"lon";
NSString *const kWeatherForecastBasicLat = @"lat";
NSString *const kWeatherForecastBasicParentCity = @"parent_city";
NSString *const kWeatherForecastBasicCid = @"cid";


@interface WeatherForecastBasic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherForecastBasic

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
            self.tz = [self objectOrNilForKey:kWeatherForecastBasicTz fromDictionary:dict];
            self.location = [self objectOrNilForKey:kWeatherForecastBasicLocation fromDictionary:dict];
            self.cnty = [self objectOrNilForKey:kWeatherForecastBasicCnty fromDictionary:dict];
            self.adminArea = [self objectOrNilForKey:kWeatherForecastBasicAdminArea fromDictionary:dict];
            self.lon = [self objectOrNilForKey:kWeatherForecastBasicLon fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kWeatherForecastBasicLat fromDictionary:dict];
            self.parentCity = [self objectOrNilForKey:kWeatherForecastBasicParentCity fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kWeatherForecastBasicCid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tz forKey:kWeatherForecastBasicTz];
    [mutableDict setValue:self.location forKey:kWeatherForecastBasicLocation];
    [mutableDict setValue:self.cnty forKey:kWeatherForecastBasicCnty];
    [mutableDict setValue:self.adminArea forKey:kWeatherForecastBasicAdminArea];
    [mutableDict setValue:self.lon forKey:kWeatherForecastBasicLon];
    [mutableDict setValue:self.lat forKey:kWeatherForecastBasicLat];
    [mutableDict setValue:self.parentCity forKey:kWeatherForecastBasicParentCity];
    [mutableDict setValue:self.cid forKey:kWeatherForecastBasicCid];

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

    self.tz = [aDecoder decodeObjectForKey:kWeatherForecastBasicTz];
    self.location = [aDecoder decodeObjectForKey:kWeatherForecastBasicLocation];
    self.cnty = [aDecoder decodeObjectForKey:kWeatherForecastBasicCnty];
    self.adminArea = [aDecoder decodeObjectForKey:kWeatherForecastBasicAdminArea];
    self.lon = [aDecoder decodeObjectForKey:kWeatherForecastBasicLon];
    self.lat = [aDecoder decodeObjectForKey:kWeatherForecastBasicLat];
    self.parentCity = [aDecoder decodeObjectForKey:kWeatherForecastBasicParentCity];
    self.cid = [aDecoder decodeObjectForKey:kWeatherForecastBasicCid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tz forKey:kWeatherForecastBasicTz];
    [aCoder encodeObject:_location forKey:kWeatherForecastBasicLocation];
    [aCoder encodeObject:_cnty forKey:kWeatherForecastBasicCnty];
    [aCoder encodeObject:_adminArea forKey:kWeatherForecastBasicAdminArea];
    [aCoder encodeObject:_lon forKey:kWeatherForecastBasicLon];
    [aCoder encodeObject:_lat forKey:kWeatherForecastBasicLat];
    [aCoder encodeObject:_parentCity forKey:kWeatherForecastBasicParentCity];
    [aCoder encodeObject:_cid forKey:kWeatherForecastBasicCid];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherForecastBasic *copy = [[WeatherForecastBasic alloc] init];
    
    
    
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
