//
//  AirForecast.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "AirAirForecast.h"


NSString *const kAirAirForecastQlty = @"qlty";
NSString *const kAirAirForecastPm25 = @"pm25";
NSString *const kAirAirForecastAqi = @"aqi";
NSString *const kAirAirForecastNo2 = @"no2";
NSString *const kAirAirForecastCo = @"co";
NSString *const kAirAirForecastDate = @"date";
NSString *const kAirAirForecastMain = @"main";
NSString *const kAirAirForecastO3 = @"o3";
NSString *const kAirAirForecastPm10 = @"pm10";
NSString *const kAirAirForecastSo2 = @"so2";


@interface AirAirForecast ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AirAirForecast

@synthesize qlty = _qlty;
@synthesize pm25 = _pm25;
@synthesize aqi = _aqi;
@synthesize no2 = _no2;
@synthesize co = _co;
@synthesize date = _date;
@synthesize main = _main;
@synthesize o3 = _o3;
@synthesize pm10 = _pm10;
@synthesize so2 = _so2;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.qlty = [self objectOrNilForKey:kAirAirForecastQlty fromDictionary:dict];
            self.pm25 = [self objectOrNilForKey:kAirAirForecastPm25 fromDictionary:dict];
            self.aqi = [self objectOrNilForKey:kAirAirForecastAqi fromDictionary:dict];
            self.no2 = [self objectOrNilForKey:kAirAirForecastNo2 fromDictionary:dict];
            self.co = [self objectOrNilForKey:kAirAirForecastCo fromDictionary:dict];
            self.date = [self objectOrNilForKey:kAirAirForecastDate fromDictionary:dict];
            self.main = [self objectOrNilForKey:kAirAirForecastMain fromDictionary:dict];
            self.o3 = [self objectOrNilForKey:kAirAirForecastO3 fromDictionary:dict];
            self.pm10 = [self objectOrNilForKey:kAirAirForecastPm10 fromDictionary:dict];
            self.so2 = [self objectOrNilForKey:kAirAirForecastSo2 fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.qlty forKey:kAirAirForecastQlty];
    [mutableDict setValue:self.pm25 forKey:kAirAirForecastPm25];
    [mutableDict setValue:self.aqi forKey:kAirAirForecastAqi];
    [mutableDict setValue:self.no2 forKey:kAirAirForecastNo2];
    [mutableDict setValue:self.co forKey:kAirAirForecastCo];
    [mutableDict setValue:self.date forKey:kAirAirForecastDate];
    [mutableDict setValue:self.main forKey:kAirAirForecastMain];
    [mutableDict setValue:self.o3 forKey:kAirAirForecastO3];
    [mutableDict setValue:self.pm10 forKey:kAirAirForecastPm10];
    [mutableDict setValue:self.so2 forKey:kAirAirForecastSo2];

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

    self.qlty = [aDecoder decodeObjectForKey:kAirAirForecastQlty];
    self.pm25 = [aDecoder decodeObjectForKey:kAirAirForecastPm25];
    self.aqi = [aDecoder decodeObjectForKey:kAirAirForecastAqi];
    self.no2 = [aDecoder decodeObjectForKey:kAirAirForecastNo2];
    self.co = [aDecoder decodeObjectForKey:kAirAirForecastCo];
    self.date = [aDecoder decodeObjectForKey:kAirAirForecastDate];
    self.main = [aDecoder decodeObjectForKey:kAirAirForecastMain];
    self.o3 = [aDecoder decodeObjectForKey:kAirAirForecastO3];
    self.pm10 = [aDecoder decodeObjectForKey:kAirAirForecastPm10];
    self.so2 = [aDecoder decodeObjectForKey:kAirAirForecastSo2];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_qlty forKey:kAirAirForecastQlty];
    [aCoder encodeObject:_pm25 forKey:kAirAirForecastPm25];
    [aCoder encodeObject:_aqi forKey:kAirAirForecastAqi];
    [aCoder encodeObject:_no2 forKey:kAirAirForecastNo2];
    [aCoder encodeObject:_co forKey:kAirAirForecastCo];
    [aCoder encodeObject:_date forKey:kAirAirForecastDate];
    [aCoder encodeObject:_main forKey:kAirAirForecastMain];
    [aCoder encodeObject:_o3 forKey:kAirAirForecastO3];
    [aCoder encodeObject:_pm10 forKey:kAirAirForecastPm10];
    [aCoder encodeObject:_so2 forKey:kAirAirForecastSo2];
}

- (id)copyWithZone:(NSZone *)zone {
    AirAirForecast *copy = [[AirAirForecast alloc] init];
    
    
    
    if (copy) {

        copy.qlty = [self.qlty copyWithZone:zone];
        copy.pm25 = [self.pm25 copyWithZone:zone];
        copy.aqi = [self.aqi copyWithZone:zone];
        copy.no2 = [self.no2 copyWithZone:zone];
        copy.co = [self.co copyWithZone:zone];
        copy.date = [self.date copyWithZone:zone];
        copy.main = [self.main copyWithZone:zone];
        copy.o3 = [self.o3 copyWithZone:zone];
        copy.pm10 = [self.pm10 copyWithZone:zone];
        copy.so2 = [self.so2 copyWithZone:zone];
    }
    
    return copy;
}


@end