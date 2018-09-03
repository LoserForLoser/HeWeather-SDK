//
//  AirNowCity.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "AirNowAirNowCity.h"


NSString *const kAirNowAirNowCityQlty = @"qlty";
NSString *const kAirNowAirNowCityPm25 = @"pm25";
NSString *const kAirNowAirNowCityAqi = @"aqi";
NSString *const kAirNowAirNowCityCo = @"co";
NSString *const kAirNowAirNowCityO3 = @"o3";
NSString *const kAirNowAirNowCityNo2 = @"no2";
NSString *const kAirNowAirNowCityMain = @"main";
NSString *const kAirNowAirNowCityPm10 = @"pm10";
NSString *const kAirNowAirNowCityPubTime = @"pub_time";
NSString *const kAirNowAirNowCitySo2 = @"so2";


@interface AirNowAirNowCity ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AirNowAirNowCity

@synthesize qlty = _qlty;
@synthesize pm25 = _pm25;
@synthesize aqi = _aqi;
@synthesize co = _co;
@synthesize o3 = _o3;
@synthesize no2 = _no2;
@synthesize main = _main;
@synthesize pm10 = _pm10;
@synthesize pubTime = _pubTime;
@synthesize so2 = _so2;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.qlty = [self objectOrNilForKey:kAirNowAirNowCityQlty fromDictionary:dict];
            self.pm25 = [self objectOrNilForKey:kAirNowAirNowCityPm25 fromDictionary:dict];
            self.aqi = [self objectOrNilForKey:kAirNowAirNowCityAqi fromDictionary:dict];
            self.co = [self objectOrNilForKey:kAirNowAirNowCityCo fromDictionary:dict];
            self.o3 = [self objectOrNilForKey:kAirNowAirNowCityO3 fromDictionary:dict];
            self.no2 = [self objectOrNilForKey:kAirNowAirNowCityNo2 fromDictionary:dict];
            self.main = [self objectOrNilForKey:kAirNowAirNowCityMain fromDictionary:dict];
            self.pm10 = [self objectOrNilForKey:kAirNowAirNowCityPm10 fromDictionary:dict];
            self.pubTime = [self objectOrNilForKey:kAirNowAirNowCityPubTime fromDictionary:dict];
            self.so2 = [self objectOrNilForKey:kAirNowAirNowCitySo2 fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.qlty forKey:kAirNowAirNowCityQlty];
    [mutableDict setValue:self.pm25 forKey:kAirNowAirNowCityPm25];
    [mutableDict setValue:self.aqi forKey:kAirNowAirNowCityAqi];
    [mutableDict setValue:self.co forKey:kAirNowAirNowCityCo];
    [mutableDict setValue:self.o3 forKey:kAirNowAirNowCityO3];
    [mutableDict setValue:self.no2 forKey:kAirNowAirNowCityNo2];
    [mutableDict setValue:self.main forKey:kAirNowAirNowCityMain];
    [mutableDict setValue:self.pm10 forKey:kAirNowAirNowCityPm10];
    [mutableDict setValue:self.pubTime forKey:kAirNowAirNowCityPubTime];
    [mutableDict setValue:self.so2 forKey:kAirNowAirNowCitySo2];

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

    self.qlty = [aDecoder decodeObjectForKey:kAirNowAirNowCityQlty];
    self.pm25 = [aDecoder decodeObjectForKey:kAirNowAirNowCityPm25];
    self.aqi = [aDecoder decodeObjectForKey:kAirNowAirNowCityAqi];
    self.co = [aDecoder decodeObjectForKey:kAirNowAirNowCityCo];
    self.o3 = [aDecoder decodeObjectForKey:kAirNowAirNowCityO3];
    self.no2 = [aDecoder decodeObjectForKey:kAirNowAirNowCityNo2];
    self.main = [aDecoder decodeObjectForKey:kAirNowAirNowCityMain];
    self.pm10 = [aDecoder decodeObjectForKey:kAirNowAirNowCityPm10];
    self.pubTime = [aDecoder decodeObjectForKey:kAirNowAirNowCityPubTime];
    self.so2 = [aDecoder decodeObjectForKey:kAirNowAirNowCitySo2];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_qlty forKey:kAirNowAirNowCityQlty];
    [aCoder encodeObject:_pm25 forKey:kAirNowAirNowCityPm25];
    [aCoder encodeObject:_aqi forKey:kAirNowAirNowCityAqi];
    [aCoder encodeObject:_co forKey:kAirNowAirNowCityCo];
    [aCoder encodeObject:_o3 forKey:kAirNowAirNowCityO3];
    [aCoder encodeObject:_no2 forKey:kAirNowAirNowCityNo2];
    [aCoder encodeObject:_main forKey:kAirNowAirNowCityMain];
    [aCoder encodeObject:_pm10 forKey:kAirNowAirNowCityPm10];
    [aCoder encodeObject:_pubTime forKey:kAirNowAirNowCityPubTime];
    [aCoder encodeObject:_so2 forKey:kAirNowAirNowCitySo2];
}

- (id)copyWithZone:(NSZone *)zone {
    AirNowAirNowCity *copy = [[AirNowAirNowCity alloc] init];
    
    
    
    if (copy) {

        copy.qlty = [self.qlty copyWithZone:zone];
        copy.pm25 = [self.pm25 copyWithZone:zone];
        copy.aqi = [self.aqi copyWithZone:zone];
        copy.co = [self.co copyWithZone:zone];
        copy.o3 = [self.o3 copyWithZone:zone];
        copy.no2 = [self.no2 copyWithZone:zone];
        copy.main = [self.main copyWithZone:zone];
        copy.pm10 = [self.pm10 copyWithZone:zone];
        copy.pubTime = [self.pubTime copyWithZone:zone];
        copy.so2 = [self.so2 copyWithZone:zone];
    }
    
    return copy;
}


@end
