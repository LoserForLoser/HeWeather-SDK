//
//  Basic.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherGridMinuteBasic.h"


NSString *const kWeatherGridMinuteBasicAdminArea = @"admin_area";
NSString *const kWeatherGridMinuteBasicLat = @"lat";
NSString *const kWeatherGridMinuteBasicCnty = @"cnty";
NSString *const kWeatherGridMinuteBasicLon = @"lon";
NSString *const kWeatherGridMinuteBasicParentCity = @"parent_city";
NSString *const kWeatherGridMinuteBasicTz = @"tz";


@interface WeatherGridMinuteBasic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherGridMinuteBasic

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
            self.adminArea = [self objectOrNilForKey:kWeatherGridMinuteBasicAdminArea fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kWeatherGridMinuteBasicLat fromDictionary:dict];
            self.cnty = [self objectOrNilForKey:kWeatherGridMinuteBasicCnty fromDictionary:dict];
            self.lon = [self objectOrNilForKey:kWeatherGridMinuteBasicLon fromDictionary:dict];
            self.parentCity = [self objectOrNilForKey:kWeatherGridMinuteBasicParentCity fromDictionary:dict];
            self.tz = [self objectOrNilForKey:kWeatherGridMinuteBasicTz fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.adminArea forKey:kWeatherGridMinuteBasicAdminArea];
    [mutableDict setValue:self.lat forKey:kWeatherGridMinuteBasicLat];
    [mutableDict setValue:self.cnty forKey:kWeatherGridMinuteBasicCnty];
    [mutableDict setValue:self.lon forKey:kWeatherGridMinuteBasicLon];
    [mutableDict setValue:self.parentCity forKey:kWeatherGridMinuteBasicParentCity];
    [mutableDict setValue:self.tz forKey:kWeatherGridMinuteBasicTz];

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

    self.adminArea = [aDecoder decodeObjectForKey:kWeatherGridMinuteBasicAdminArea];
    self.lat = [aDecoder decodeObjectForKey:kWeatherGridMinuteBasicLat];
    self.cnty = [aDecoder decodeObjectForKey:kWeatherGridMinuteBasicCnty];
    self.lon = [aDecoder decodeObjectForKey:kWeatherGridMinuteBasicLon];
    self.parentCity = [aDecoder decodeObjectForKey:kWeatherGridMinuteBasicParentCity];
    self.tz = [aDecoder decodeObjectForKey:kWeatherGridMinuteBasicTz];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_adminArea forKey:kWeatherGridMinuteBasicAdminArea];
    [aCoder encodeObject:_lat forKey:kWeatherGridMinuteBasicLat];
    [aCoder encodeObject:_cnty forKey:kWeatherGridMinuteBasicCnty];
    [aCoder encodeObject:_lon forKey:kWeatherGridMinuteBasicLon];
    [aCoder encodeObject:_parentCity forKey:kWeatherGridMinuteBasicParentCity];
    [aCoder encodeObject:_tz forKey:kWeatherGridMinuteBasicTz];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherGridMinuteBasic *copy = [[WeatherGridMinuteBasic alloc] init];
    
    
    
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
