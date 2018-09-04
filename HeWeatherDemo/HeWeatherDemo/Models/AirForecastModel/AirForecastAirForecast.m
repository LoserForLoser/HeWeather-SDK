//
//  AirForecast.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "AirForecastAirForecast.h"


NSString *const kAirForecastQlty = @"qlty";
NSString *const kAirForecastPm25 = @"pm25";
NSString *const kAirForecastAqi = @"aqi";
NSString *const kAirForecastNo2 = @"no2";
NSString *const kAirForecastCo = @"co";
NSString *const kAirForecastDate = @"date";
NSString *const kAirForecastMain = @"main";
NSString *const kAirForecastO3 = @"o3";
NSString *const kAirForecastPm10 = @"pm10";
NSString *const kAirForecastSo2 = @"so2";


@interface AirForecastAirForecast ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AirForecastAirForecast

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
            self.qlty = [self objectOrNilForKey:kAirForecastQlty fromDictionary:dict];
            self.pm25 = [self objectOrNilForKey:kAirForecastPm25 fromDictionary:dict];
            self.aqi = [self objectOrNilForKey:kAirForecastAqi fromDictionary:dict];
            self.no2 = [self objectOrNilForKey:kAirForecastNo2 fromDictionary:dict];
            self.co = [self objectOrNilForKey:kAirForecastCo fromDictionary:dict];
            self.date = [self objectOrNilForKey:kAirForecastDate fromDictionary:dict];
            self.main = [self objectOrNilForKey:kAirForecastMain fromDictionary:dict];
            self.o3 = [self objectOrNilForKey:kAirForecastO3 fromDictionary:dict];
            self.pm10 = [self objectOrNilForKey:kAirForecastPm10 fromDictionary:dict];
            self.so2 = [self objectOrNilForKey:kAirForecastSo2 fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.qlty forKey:kAirForecastQlty];
    [mutableDict setValue:self.pm25 forKey:kAirForecastPm25];
    [mutableDict setValue:self.aqi forKey:kAirForecastAqi];
    [mutableDict setValue:self.no2 forKey:kAirForecastNo2];
    [mutableDict setValue:self.co forKey:kAirForecastCo];
    [mutableDict setValue:self.date forKey:kAirForecastDate];
    [mutableDict setValue:self.main forKey:kAirForecastMain];
    [mutableDict setValue:self.o3 forKey:kAirForecastO3];
    [mutableDict setValue:self.pm10 forKey:kAirForecastPm10];
    [mutableDict setValue:self.so2 forKey:kAirForecastSo2];

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

    self.qlty = [aDecoder decodeObjectForKey:kAirForecastQlty];
    self.pm25 = [aDecoder decodeObjectForKey:kAirForecastPm25];
    self.aqi = [aDecoder decodeObjectForKey:kAirForecastAqi];
    self.no2 = [aDecoder decodeObjectForKey:kAirForecastNo2];
    self.co = [aDecoder decodeObjectForKey:kAirForecastCo];
    self.date = [aDecoder decodeObjectForKey:kAirForecastDate];
    self.main = [aDecoder decodeObjectForKey:kAirForecastMain];
    self.o3 = [aDecoder decodeObjectForKey:kAirForecastO3];
    self.pm10 = [aDecoder decodeObjectForKey:kAirForecastPm10];
    self.so2 = [aDecoder decodeObjectForKey:kAirForecastSo2];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_qlty forKey:kAirForecastQlty];
    [aCoder encodeObject:_pm25 forKey:kAirForecastPm25];
    [aCoder encodeObject:_aqi forKey:kAirForecastAqi];
    [aCoder encodeObject:_no2 forKey:kAirForecastNo2];
    [aCoder encodeObject:_co forKey:kAirForecastCo];
    [aCoder encodeObject:_date forKey:kAirForecastDate];
    [aCoder encodeObject:_main forKey:kAirForecastMain];
    [aCoder encodeObject:_o3 forKey:kAirForecastO3];
    [aCoder encodeObject:_pm10 forKey:kAirForecastPm10];
    [aCoder encodeObject:_so2 forKey:kAirForecastSo2];
}

- (id)copyWithZone:(NSZone *)zone {
    AirForecastAirForecast *copy = [[AirForecastAirForecast alloc] init];
    
    
    
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
