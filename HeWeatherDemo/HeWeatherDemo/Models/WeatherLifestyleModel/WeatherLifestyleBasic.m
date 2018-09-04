//
//  Basic.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherLifestyleBasic.h"


NSString *const kWeatherLifestyleBasicTz = @"tz";
NSString *const kWeatherLifestyleBasicLocation = @"location";
NSString *const kWeatherLifestyleBasicCnty = @"cnty";
NSString *const kWeatherLifestyleBasicAdminArea = @"admin_area";
NSString *const kWeatherLifestyleBasicLon = @"lon";
NSString *const kWeatherLifestyleBasicLat = @"lat";
NSString *const kWeatherLifestyleBasicParentCity = @"parent_city";
NSString *const kWeatherLifestyleBasicCid = @"cid";


@interface WeatherLifestyleBasic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherLifestyleBasic

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
            self.tz = [self objectOrNilForKey:kWeatherLifestyleBasicTz fromDictionary:dict];
            self.location = [self objectOrNilForKey:kWeatherLifestyleBasicLocation fromDictionary:dict];
            self.cnty = [self objectOrNilForKey:kWeatherLifestyleBasicCnty fromDictionary:dict];
            self.adminArea = [self objectOrNilForKey:kWeatherLifestyleBasicAdminArea fromDictionary:dict];
            self.lon = [self objectOrNilForKey:kWeatherLifestyleBasicLon fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kWeatherLifestyleBasicLat fromDictionary:dict];
            self.parentCity = [self objectOrNilForKey:kWeatherLifestyleBasicParentCity fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kWeatherLifestyleBasicCid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tz forKey:kWeatherLifestyleBasicTz];
    [mutableDict setValue:self.location forKey:kWeatherLifestyleBasicLocation];
    [mutableDict setValue:self.cnty forKey:kWeatherLifestyleBasicCnty];
    [mutableDict setValue:self.adminArea forKey:kWeatherLifestyleBasicAdminArea];
    [mutableDict setValue:self.lon forKey:kWeatherLifestyleBasicLon];
    [mutableDict setValue:self.lat forKey:kWeatherLifestyleBasicLat];
    [mutableDict setValue:self.parentCity forKey:kWeatherLifestyleBasicParentCity];
    [mutableDict setValue:self.cid forKey:kWeatherLifestyleBasicCid];

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

    self.tz = [aDecoder decodeObjectForKey:kWeatherLifestyleBasicTz];
    self.location = [aDecoder decodeObjectForKey:kWeatherLifestyleBasicLocation];
    self.cnty = [aDecoder decodeObjectForKey:kWeatherLifestyleBasicCnty];
    self.adminArea = [aDecoder decodeObjectForKey:kWeatherLifestyleBasicAdminArea];
    self.lon = [aDecoder decodeObjectForKey:kWeatherLifestyleBasicLon];
    self.lat = [aDecoder decodeObjectForKey:kWeatherLifestyleBasicLat];
    self.parentCity = [aDecoder decodeObjectForKey:kWeatherLifestyleBasicParentCity];
    self.cid = [aDecoder decodeObjectForKey:kWeatherLifestyleBasicCid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tz forKey:kWeatherLifestyleBasicTz];
    [aCoder encodeObject:_location forKey:kWeatherLifestyleBasicLocation];
    [aCoder encodeObject:_cnty forKey:kWeatherLifestyleBasicCnty];
    [aCoder encodeObject:_adminArea forKey:kWeatherLifestyleBasicAdminArea];
    [aCoder encodeObject:_lon forKey:kWeatherLifestyleBasicLon];
    [aCoder encodeObject:_lat forKey:kWeatherLifestyleBasicLat];
    [aCoder encodeObject:_parentCity forKey:kWeatherLifestyleBasicParentCity];
    [aCoder encodeObject:_cid forKey:kWeatherLifestyleBasicCid];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherLifestyleBasic *copy = [[WeatherLifestyleBasic alloc] init];
    
    
    
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
