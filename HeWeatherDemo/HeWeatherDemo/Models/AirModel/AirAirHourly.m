//
//  AirHourly.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "AirAirHourly.h"


NSString *const kAirHourlyQlty = @"qlty";
NSString *const kAirHourlyPm25 = @"pm25";
NSString *const kAirHourlyTime = @"time";
NSString *const kAirHourlyAqi = @"aqi";
NSString *const kAirHourlyNo2 = @"no2";
NSString *const kAirHourlyCo = @"co";
NSString *const kAirHourlyPm10 = @"pm10";
NSString *const kAirHourlyMain = @"main";
NSString *const kAirHourlySo2 = @"so2";
NSString *const kAirHourlyO3 = @"o3";


@interface AirAirHourly ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AirAirHourly

@synthesize qlty = _qlty;
@synthesize pm25 = _pm25;
@synthesize time = _time;
@synthesize aqi = _aqi;
@synthesize no2 = _no2;
@synthesize co = _co;
@synthesize pm10 = _pm10;
@synthesize main = _main;
@synthesize so2 = _so2;
@synthesize o3 = _o3;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.qlty = [self objectOrNilForKey:kAirHourlyQlty fromDictionary:dict];
            self.pm25 = [self objectOrNilForKey:kAirHourlyPm25 fromDictionary:dict];
            self.time = [self objectOrNilForKey:kAirHourlyTime fromDictionary:dict];
            self.aqi = [self objectOrNilForKey:kAirHourlyAqi fromDictionary:dict];
            self.no2 = [self objectOrNilForKey:kAirHourlyNo2 fromDictionary:dict];
            self.co = [self objectOrNilForKey:kAirHourlyCo fromDictionary:dict];
            self.pm10 = [self objectOrNilForKey:kAirHourlyPm10 fromDictionary:dict];
            self.main = [self objectOrNilForKey:kAirHourlyMain fromDictionary:dict];
            self.so2 = [self objectOrNilForKey:kAirHourlySo2 fromDictionary:dict];
            self.o3 = [self objectOrNilForKey:kAirHourlyO3 fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.qlty forKey:kAirHourlyQlty];
    [mutableDict setValue:self.pm25 forKey:kAirHourlyPm25];
    [mutableDict setValue:self.time forKey:kAirHourlyTime];
    [mutableDict setValue:self.aqi forKey:kAirHourlyAqi];
    [mutableDict setValue:self.no2 forKey:kAirHourlyNo2];
    [mutableDict setValue:self.co forKey:kAirHourlyCo];
    [mutableDict setValue:self.pm10 forKey:kAirHourlyPm10];
    [mutableDict setValue:self.main forKey:kAirHourlyMain];
    [mutableDict setValue:self.so2 forKey:kAirHourlySo2];
    [mutableDict setValue:self.o3 forKey:kAirHourlyO3];

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

    self.qlty = [aDecoder decodeObjectForKey:kAirHourlyQlty];
    self.pm25 = [aDecoder decodeObjectForKey:kAirHourlyPm25];
    self.time = [aDecoder decodeObjectForKey:kAirHourlyTime];
    self.aqi = [aDecoder decodeObjectForKey:kAirHourlyAqi];
    self.no2 = [aDecoder decodeObjectForKey:kAirHourlyNo2];
    self.co = [aDecoder decodeObjectForKey:kAirHourlyCo];
    self.pm10 = [aDecoder decodeObjectForKey:kAirHourlyPm10];
    self.main = [aDecoder decodeObjectForKey:kAirHourlyMain];
    self.so2 = [aDecoder decodeObjectForKey:kAirHourlySo2];
    self.o3 = [aDecoder decodeObjectForKey:kAirHourlyO3];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_qlty forKey:kAirHourlyQlty];
    [aCoder encodeObject:_pm25 forKey:kAirHourlyPm25];
    [aCoder encodeObject:_time forKey:kAirHourlyTime];
    [aCoder encodeObject:_aqi forKey:kAirHourlyAqi];
    [aCoder encodeObject:_no2 forKey:kAirHourlyNo2];
    [aCoder encodeObject:_co forKey:kAirHourlyCo];
    [aCoder encodeObject:_pm10 forKey:kAirHourlyPm10];
    [aCoder encodeObject:_main forKey:kAirHourlyMain];
    [aCoder encodeObject:_so2 forKey:kAirHourlySo2];
    [aCoder encodeObject:_o3 forKey:kAirHourlyO3];
}

- (id)copyWithZone:(NSZone *)zone {
    AirAirHourly *copy = [[AirAirHourly alloc] init];
    
    
    
    if (copy) {

        copy.qlty = [self.qlty copyWithZone:zone];
        copy.pm25 = [self.pm25 copyWithZone:zone];
        copy.time = [self.time copyWithZone:zone];
        copy.aqi = [self.aqi copyWithZone:zone];
        copy.no2 = [self.no2 copyWithZone:zone];
        copy.co = [self.co copyWithZone:zone];
        copy.pm10 = [self.pm10 copyWithZone:zone];
        copy.main = [self.main copyWithZone:zone];
        copy.so2 = [self.so2 copyWithZone:zone];
        copy.o3 = [self.o3 copyWithZone:zone];
    }
    
    return copy;
}


@end
