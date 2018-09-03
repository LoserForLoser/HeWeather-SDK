//
//  AirNowCity.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "AirAirNowCity.h"


NSString *const kAirNowCityQlty = @"qlty";
NSString *const kAirNowCityPm25 = @"pm25";
NSString *const kAirNowCityAqi = @"aqi";
NSString *const kAirNowCityCo = @"co";
NSString *const kAirNowCityNo2 = @"no2";
NSString *const kAirNowCityPm10 = @"pm10";
NSString *const kAirNowCityMain = @"main";
NSString *const kAirNowCitySo2 = @"so2";
NSString *const kAirNowCityO3 = @"o3";
NSString *const kAirNowCityPubTime = @"pub_time";


@interface AirAirNowCity ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AirAirNowCity

@synthesize qlty = _qlty;
@synthesize pm25 = _pm25;
@synthesize aqi = _aqi;
@synthesize co = _co;
@synthesize no2 = _no2;
@synthesize pm10 = _pm10;
@synthesize main = _main;
@synthesize so2 = _so2;
@synthesize o3 = _o3;
@synthesize pubTime = _pubTime;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.qlty = [self objectOrNilForKey:kAirNowCityQlty fromDictionary:dict];
            self.pm25 = [self objectOrNilForKey:kAirNowCityPm25 fromDictionary:dict];
            self.aqi = [self objectOrNilForKey:kAirNowCityAqi fromDictionary:dict];
            self.co = [self objectOrNilForKey:kAirNowCityCo fromDictionary:dict];
            self.no2 = [self objectOrNilForKey:kAirNowCityNo2 fromDictionary:dict];
            self.pm10 = [self objectOrNilForKey:kAirNowCityPm10 fromDictionary:dict];
            self.main = [self objectOrNilForKey:kAirNowCityMain fromDictionary:dict];
            self.so2 = [self objectOrNilForKey:kAirNowCitySo2 fromDictionary:dict];
            self.o3 = [self objectOrNilForKey:kAirNowCityO3 fromDictionary:dict];
            self.pubTime = [self objectOrNilForKey:kAirNowCityPubTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.qlty forKey:kAirNowCityQlty];
    [mutableDict setValue:self.pm25 forKey:kAirNowCityPm25];
    [mutableDict setValue:self.aqi forKey:kAirNowCityAqi];
    [mutableDict setValue:self.co forKey:kAirNowCityCo];
    [mutableDict setValue:self.no2 forKey:kAirNowCityNo2];
    [mutableDict setValue:self.pm10 forKey:kAirNowCityPm10];
    [mutableDict setValue:self.main forKey:kAirNowCityMain];
    [mutableDict setValue:self.so2 forKey:kAirNowCitySo2];
    [mutableDict setValue:self.o3 forKey:kAirNowCityO3];
    [mutableDict setValue:self.pubTime forKey:kAirNowCityPubTime];

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

    self.qlty = [aDecoder decodeObjectForKey:kAirNowCityQlty];
    self.pm25 = [aDecoder decodeObjectForKey:kAirNowCityPm25];
    self.aqi = [aDecoder decodeObjectForKey:kAirNowCityAqi];
    self.co = [aDecoder decodeObjectForKey:kAirNowCityCo];
    self.no2 = [aDecoder decodeObjectForKey:kAirNowCityNo2];
    self.pm10 = [aDecoder decodeObjectForKey:kAirNowCityPm10];
    self.main = [aDecoder decodeObjectForKey:kAirNowCityMain];
    self.so2 = [aDecoder decodeObjectForKey:kAirNowCitySo2];
    self.o3 = [aDecoder decodeObjectForKey:kAirNowCityO3];
    self.pubTime = [aDecoder decodeObjectForKey:kAirNowCityPubTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_qlty forKey:kAirNowCityQlty];
    [aCoder encodeObject:_pm25 forKey:kAirNowCityPm25];
    [aCoder encodeObject:_aqi forKey:kAirNowCityAqi];
    [aCoder encodeObject:_co forKey:kAirNowCityCo];
    [aCoder encodeObject:_no2 forKey:kAirNowCityNo2];
    [aCoder encodeObject:_pm10 forKey:kAirNowCityPm10];
    [aCoder encodeObject:_main forKey:kAirNowCityMain];
    [aCoder encodeObject:_so2 forKey:kAirNowCitySo2];
    [aCoder encodeObject:_o3 forKey:kAirNowCityO3];
    [aCoder encodeObject:_pubTime forKey:kAirNowCityPubTime];
}

- (id)copyWithZone:(NSZone *)zone {
    AirAirNowCity *copy = [[AirAirNowCity alloc] init];
    
    
    
    if (copy) {

        copy.qlty = [self.qlty copyWithZone:zone];
        copy.pm25 = [self.pm25 copyWithZone:zone];
        copy.aqi = [self.aqi copyWithZone:zone];
        copy.co = [self.co copyWithZone:zone];
        copy.no2 = [self.no2 copyWithZone:zone];
        copy.pm10 = [self.pm10 copyWithZone:zone];
        copy.main = [self.main copyWithZone:zone];
        copy.so2 = [self.so2 copyWithZone:zone];
        copy.o3 = [self.o3 copyWithZone:zone];
        copy.pubTime = [self.pubTime copyWithZone:zone];
    }
    
    return copy;
}


@end
