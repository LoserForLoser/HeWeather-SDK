//
//  AirNowStation.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "AirNowAirNowStation.h"


NSString *const kAirNowStationPubTime = @"pub_time";
NSString *const kAirNowStationLon = @"lon";
NSString *const kAirNowStationNo2 = @"no2";
NSString *const kAirNowStationCo = @"co";
NSString *const kAirNowStationAsid = @"asid";
NSString *const kAirNowStationAirSta = @"air_sta";
NSString *const kAirNowStationQlty = @"qlty";
NSString *const kAirNowStationAqi = @"aqi";
NSString *const kAirNowStationMain = @"main";
NSString *const kAirNowStationPm25 = @"pm25";
NSString *const kAirNowStationLat = @"lat";
NSString *const kAirNowStationO3 = @"o3";
NSString *const kAirNowStationSo2 = @"so2";
NSString *const kAirNowStationPm10 = @"pm10";


@interface AirNowAirNowStation ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AirNowAirNowStation

@synthesize pubTime = _pubTime;
@synthesize lon = _lon;
@synthesize no2 = _no2;
@synthesize co = _co;
@synthesize asid = _asid;
@synthesize airSta = _airSta;
@synthesize qlty = _qlty;
@synthesize aqi = _aqi;
@synthesize main = _main;
@synthesize pm25 = _pm25;
@synthesize lat = _lat;
@synthesize o3 = _o3;
@synthesize so2 = _so2;
@synthesize pm10 = _pm10;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.pubTime = [self objectOrNilForKey:kAirNowStationPubTime fromDictionary:dict];
            self.lon = [self objectOrNilForKey:kAirNowStationLon fromDictionary:dict];
            self.no2 = [self objectOrNilForKey:kAirNowStationNo2 fromDictionary:dict];
            self.co = [self objectOrNilForKey:kAirNowStationCo fromDictionary:dict];
            self.asid = [self objectOrNilForKey:kAirNowStationAsid fromDictionary:dict];
            self.airSta = [self objectOrNilForKey:kAirNowStationAirSta fromDictionary:dict];
            self.qlty = [self objectOrNilForKey:kAirNowStationQlty fromDictionary:dict];
            self.aqi = [self objectOrNilForKey:kAirNowStationAqi fromDictionary:dict];
            self.main = [self objectOrNilForKey:kAirNowStationMain fromDictionary:dict];
            self.pm25 = [self objectOrNilForKey:kAirNowStationPm25 fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kAirNowStationLat fromDictionary:dict];
            self.o3 = [self objectOrNilForKey:kAirNowStationO3 fromDictionary:dict];
            self.so2 = [self objectOrNilForKey:kAirNowStationSo2 fromDictionary:dict];
            self.pm10 = [self objectOrNilForKey:kAirNowStationPm10 fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.pubTime forKey:kAirNowStationPubTime];
    [mutableDict setValue:self.lon forKey:kAirNowStationLon];
    [mutableDict setValue:self.no2 forKey:kAirNowStationNo2];
    [mutableDict setValue:self.co forKey:kAirNowStationCo];
    [mutableDict setValue:self.asid forKey:kAirNowStationAsid];
    [mutableDict setValue:self.airSta forKey:kAirNowStationAirSta];
    [mutableDict setValue:self.qlty forKey:kAirNowStationQlty];
    [mutableDict setValue:self.aqi forKey:kAirNowStationAqi];
    [mutableDict setValue:self.main forKey:kAirNowStationMain];
    [mutableDict setValue:self.pm25 forKey:kAirNowStationPm25];
    [mutableDict setValue:self.lat forKey:kAirNowStationLat];
    [mutableDict setValue:self.o3 forKey:kAirNowStationO3];
    [mutableDict setValue:self.so2 forKey:kAirNowStationSo2];
    [mutableDict setValue:self.pm10 forKey:kAirNowStationPm10];

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

    self.pubTime = [aDecoder decodeObjectForKey:kAirNowStationPubTime];
    self.lon = [aDecoder decodeObjectForKey:kAirNowStationLon];
    self.no2 = [aDecoder decodeObjectForKey:kAirNowStationNo2];
    self.co = [aDecoder decodeObjectForKey:kAirNowStationCo];
    self.asid = [aDecoder decodeObjectForKey:kAirNowStationAsid];
    self.airSta = [aDecoder decodeObjectForKey:kAirNowStationAirSta];
    self.qlty = [aDecoder decodeObjectForKey:kAirNowStationQlty];
    self.aqi = [aDecoder decodeObjectForKey:kAirNowStationAqi];
    self.main = [aDecoder decodeObjectForKey:kAirNowStationMain];
    self.pm25 = [aDecoder decodeObjectForKey:kAirNowStationPm25];
    self.lat = [aDecoder decodeObjectForKey:kAirNowStationLat];
    self.o3 = [aDecoder decodeObjectForKey:kAirNowStationO3];
    self.so2 = [aDecoder decodeObjectForKey:kAirNowStationSo2];
    self.pm10 = [aDecoder decodeObjectForKey:kAirNowStationPm10];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pubTime forKey:kAirNowStationPubTime];
    [aCoder encodeObject:_lon forKey:kAirNowStationLon];
    [aCoder encodeObject:_no2 forKey:kAirNowStationNo2];
    [aCoder encodeObject:_co forKey:kAirNowStationCo];
    [aCoder encodeObject:_asid forKey:kAirNowStationAsid];
    [aCoder encodeObject:_airSta forKey:kAirNowStationAirSta];
    [aCoder encodeObject:_qlty forKey:kAirNowStationQlty];
    [aCoder encodeObject:_aqi forKey:kAirNowStationAqi];
    [aCoder encodeObject:_main forKey:kAirNowStationMain];
    [aCoder encodeObject:_pm25 forKey:kAirNowStationPm25];
    [aCoder encodeObject:_lat forKey:kAirNowStationLat];
    [aCoder encodeObject:_o3 forKey:kAirNowStationO3];
    [aCoder encodeObject:_so2 forKey:kAirNowStationSo2];
    [aCoder encodeObject:_pm10 forKey:kAirNowStationPm10];
}

- (id)copyWithZone:(NSZone *)zone {
    AirNowAirNowStation *copy = [[AirNowAirNowStation alloc] init];
    
    
    
    if (copy) {

        copy.pubTime = [self.pubTime copyWithZone:zone];
        copy.lon = [self.lon copyWithZone:zone];
        copy.no2 = [self.no2 copyWithZone:zone];
        copy.co = [self.co copyWithZone:zone];
        copy.asid = [self.asid copyWithZone:zone];
        copy.airSta = [self.airSta copyWithZone:zone];
        copy.qlty = [self.qlty copyWithZone:zone];
        copy.aqi = [self.aqi copyWithZone:zone];
        copy.main = [self.main copyWithZone:zone];
        copy.pm25 = [self.pm25 copyWithZone:zone];
        copy.lat = [self.lat copyWithZone:zone];
        copy.o3 = [self.o3 copyWithZone:zone];
        copy.so2 = [self.so2 copyWithZone:zone];
        copy.pm10 = [self.pm10 copyWithZone:zone];
    }
    
    return copy;
}


@end
