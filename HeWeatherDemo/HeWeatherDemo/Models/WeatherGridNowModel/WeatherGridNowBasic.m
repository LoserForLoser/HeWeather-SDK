//
//  Basic.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherGridNowBasic.h"


NSString *const kWeatherGridNowBasicAdminArea = @"admin_area";
NSString *const kWeatherGridNowBasicLat = @"lat";
NSString *const kWeatherGridNowBasicCnty = @"cnty";
NSString *const kWeatherGridNowBasicLon = @"lon";
NSString *const kWeatherGridNowBasicParentCity = @"parent_city";
NSString *const kWeatherGridNowBasicTz = @"tz";


@interface WeatherGridNowBasic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherGridNowBasic

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
            self.adminArea = [self objectOrNilForKey:kWeatherGridNowBasicAdminArea fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kWeatherGridNowBasicLat fromDictionary:dict];
            self.cnty = [self objectOrNilForKey:kWeatherGridNowBasicCnty fromDictionary:dict];
            self.lon = [self objectOrNilForKey:kWeatherGridNowBasicLon fromDictionary:dict];
            self.parentCity = [self objectOrNilForKey:kWeatherGridNowBasicParentCity fromDictionary:dict];
            self.tz = [self objectOrNilForKey:kWeatherGridNowBasicTz fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.adminArea forKey:kWeatherGridNowBasicAdminArea];
    [mutableDict setValue:self.lat forKey:kWeatherGridNowBasicLat];
    [mutableDict setValue:self.cnty forKey:kWeatherGridNowBasicCnty];
    [mutableDict setValue:self.lon forKey:kWeatherGridNowBasicLon];
    [mutableDict setValue:self.parentCity forKey:kWeatherGridNowBasicParentCity];
    [mutableDict setValue:self.tz forKey:kWeatherGridNowBasicTz];

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

    self.adminArea = [aDecoder decodeObjectForKey:kWeatherGridNowBasicAdminArea];
    self.lat = [aDecoder decodeObjectForKey:kWeatherGridNowBasicLat];
    self.cnty = [aDecoder decodeObjectForKey:kWeatherGridNowBasicCnty];
    self.lon = [aDecoder decodeObjectForKey:kWeatherGridNowBasicLon];
    self.parentCity = [aDecoder decodeObjectForKey:kWeatherGridNowBasicParentCity];
    self.tz = [aDecoder decodeObjectForKey:kWeatherGridNowBasicTz];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_adminArea forKey:kWeatherGridNowBasicAdminArea];
    [aCoder encodeObject:_lat forKey:kWeatherGridNowBasicLat];
    [aCoder encodeObject:_cnty forKey:kWeatherGridNowBasicCnty];
    [aCoder encodeObject:_lon forKey:kWeatherGridNowBasicLon];
    [aCoder encodeObject:_parentCity forKey:kWeatherGridNowBasicParentCity];
    [aCoder encodeObject:_tz forKey:kWeatherGridNowBasicTz];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherGridNowBasic *copy = [[WeatherGridNowBasic alloc] init];
    
    
    
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
