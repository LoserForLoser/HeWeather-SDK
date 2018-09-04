//
//  Basic.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherGridHourlyBasic.h"


NSString *const kWeatherGridHourlyBasicAdminArea = @"admin_area";
NSString *const kWeatherGridHourlyBasicLat = @"lat";
NSString *const kWeatherGridHourlyBasicCnty = @"cnty";
NSString *const kWeatherGridHourlyBasicLon = @"lon";
NSString *const kWeatherGridHourlyBasicParentCity = @"parent_city";
NSString *const kWeatherGridHourlyBasicTz = @"tz";


@interface WeatherGridHourlyBasic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherGridHourlyBasic

@synthesize adminArea = _adminArea;
@synthesize lat = _lat;
@synthesize cnty = _cnty;
@synthesize lon = _lon;
@synthesize parentCity = _parentCity;
@synthesize tz = _tz;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.adminArea = [self objectOrNilForKey:kWeatherGridHourlyBasicAdminArea fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kWeatherGridHourlyBasicLat fromDictionary:dict];
            self.cnty = [self objectOrNilForKey:kWeatherGridHourlyBasicCnty fromDictionary:dict];
            self.lon = [self objectOrNilForKey:kWeatherGridHourlyBasicLon fromDictionary:dict];
            self.parentCity = [self objectOrNilForKey:kWeatherGridHourlyBasicParentCity fromDictionary:dict];
            self.tz = [self objectOrNilForKey:kWeatherGridHourlyBasicTz fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.adminArea forKey:kWeatherGridHourlyBasicAdminArea];
    [mutableDict setValue:self.lat forKey:kWeatherGridHourlyBasicLat];
    [mutableDict setValue:self.cnty forKey:kWeatherGridHourlyBasicCnty];
    [mutableDict setValue:self.lon forKey:kWeatherGridHourlyBasicLon];
    [mutableDict setValue:self.parentCity forKey:kWeatherGridHourlyBasicParentCity];
    [mutableDict setValue:self.tz forKey:kWeatherGridHourlyBasicTz];

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

    self.adminArea = [aDecoder decodeObjectForKey:kWeatherGridHourlyBasicAdminArea];
    self.lat = [aDecoder decodeObjectForKey:kWeatherGridHourlyBasicLat];
    self.cnty = [aDecoder decodeObjectForKey:kWeatherGridHourlyBasicCnty];
    self.lon = [aDecoder decodeObjectForKey:kWeatherGridHourlyBasicLon];
    self.parentCity = [aDecoder decodeObjectForKey:kWeatherGridHourlyBasicParentCity];
    self.tz = [aDecoder decodeObjectForKey:kWeatherGridHourlyBasicTz];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_adminArea forKey:kWeatherGridHourlyBasicAdminArea];
    [aCoder encodeObject:_lat forKey:kWeatherGridHourlyBasicLat];
    [aCoder encodeObject:_cnty forKey:kWeatherGridHourlyBasicCnty];
    [aCoder encodeObject:_lon forKey:kWeatherGridHourlyBasicLon];
    [aCoder encodeObject:_parentCity forKey:kWeatherGridHourlyBasicParentCity];
    [aCoder encodeObject:_tz forKey:kWeatherGridHourlyBasicTz];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherGridHourlyBasic *copy = [[WeatherGridHourlyBasic alloc] init];
    
    
    
    if (copy) {

        copy.adminArea = [self.adminArea copyWithZone:zone];
        copy.lat = [self.lat copyWithZone:zone];
        copy.cnty = [self.cnty copyWithZone:zone];
        copy.lon = [self.lon copyWithZone:zone];
        copy.parentCity = [self.parentCity copyWithZone:zone];
        copy.tz = [self.tz copyWithZone:zone];
    }
    
    return copy;
}


@end
