//
//  Basic.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherGridForecastBasic.h"


NSString *const kWeatherGridForecastBasicAdminArea = @"admin_area";
NSString *const kWeatherGridForecastBasicLat = @"lat";
NSString *const kWeatherGridForecastBasicCnty = @"cnty";
NSString *const kWeatherGridForecastBasicLon = @"lon";
NSString *const kWeatherGridForecastBasicParentCity = @"parent_city";
NSString *const kWeatherGridForecastBasicTz = @"tz";


@interface WeatherGridForecastBasic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherGridForecastBasic

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
            self.adminArea = [self objectOrNilForKey:kWeatherGridForecastBasicAdminArea fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kWeatherGridForecastBasicLat fromDictionary:dict];
            self.cnty = [self objectOrNilForKey:kWeatherGridForecastBasicCnty fromDictionary:dict];
            self.lon = [self objectOrNilForKey:kWeatherGridForecastBasicLon fromDictionary:dict];
            self.parentCity = [self objectOrNilForKey:kWeatherGridForecastBasicParentCity fromDictionary:dict];
            self.tz = [self objectOrNilForKey:kWeatherGridForecastBasicTz fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.adminArea forKey:kWeatherGridForecastBasicAdminArea];
    [mutableDict setValue:self.lat forKey:kWeatherGridForecastBasicLat];
    [mutableDict setValue:self.cnty forKey:kWeatherGridForecastBasicCnty];
    [mutableDict setValue:self.lon forKey:kWeatherGridForecastBasicLon];
    [mutableDict setValue:self.parentCity forKey:kWeatherGridForecastBasicParentCity];
    [mutableDict setValue:self.tz forKey:kWeatherGridForecastBasicTz];

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

    self.adminArea = [aDecoder decodeObjectForKey:kWeatherGridForecastBasicAdminArea];
    self.lat = [aDecoder decodeObjectForKey:kWeatherGridForecastBasicLat];
    self.cnty = [aDecoder decodeObjectForKey:kWeatherGridForecastBasicCnty];
    self.lon = [aDecoder decodeObjectForKey:kWeatherGridForecastBasicLon];
    self.parentCity = [aDecoder decodeObjectForKey:kWeatherGridForecastBasicParentCity];
    self.tz = [aDecoder decodeObjectForKey:kWeatherGridForecastBasicTz];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_adminArea forKey:kWeatherGridForecastBasicAdminArea];
    [aCoder encodeObject:_lat forKey:kWeatherGridForecastBasicLat];
    [aCoder encodeObject:_cnty forKey:kWeatherGridForecastBasicCnty];
    [aCoder encodeObject:_lon forKey:kWeatherGridForecastBasicLon];
    [aCoder encodeObject:_parentCity forKey:kWeatherGridForecastBasicParentCity];
    [aCoder encodeObject:_tz forKey:kWeatherGridForecastBasicTz];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherGridForecastBasic *copy = [[WeatherGridForecastBasic alloc] init];
    
    
    
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
