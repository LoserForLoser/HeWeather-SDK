//
//  AirHourly.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "AirHourlyAirHourly.h"


NSString *const kAirHourlyAirHourlyQlty = @"qlty";
NSString *const kAirHourlyAirHourlyPm25 = @"pm25";
NSString *const kAirHourlyAirHourlyTime = @"time";
NSString *const kAirHourlyAirHourlyAqi = @"aqi";
NSString *const kAirHourlyAirHourlyNo2 = @"no2";
NSString *const kAirHourlyAirHourlyCo = @"co";
NSString *const kAirHourlyAirHourlyPm10 = @"pm10";
NSString *const kAirHourlyAirHourlyMain = @"main";
NSString *const kAirHourlyAirHourlySo2 = @"so2";
NSString *const kAirHourlyAirHourlyO3 = @"o3";


@interface AirHourlyAirHourly ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AirHourlyAirHourly

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
            self.qlty = [self objectOrNilForKey:kAirHourlyAirHourlyQlty fromDictionary:dict];
            self.pm25 = [self objectOrNilForKey:kAirHourlyAirHourlyPm25 fromDictionary:dict];
            self.time = [self objectOrNilForKey:kAirHourlyAirHourlyTime fromDictionary:dict];
            self.aqi = [self objectOrNilForKey:kAirHourlyAirHourlyAqi fromDictionary:dict];
            self.no2 = [self objectOrNilForKey:kAirHourlyAirHourlyNo2 fromDictionary:dict];
            self.co = [self objectOrNilForKey:kAirHourlyAirHourlyCo fromDictionary:dict];
            self.pm10 = [self objectOrNilForKey:kAirHourlyAirHourlyPm10 fromDictionary:dict];
            self.main = [self objectOrNilForKey:kAirHourlyAirHourlyMain fromDictionary:dict];
            self.so2 = [self objectOrNilForKey:kAirHourlyAirHourlySo2 fromDictionary:dict];
            self.o3 = [self objectOrNilForKey:kAirHourlyAirHourlyO3 fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.qlty forKey:kAirHourlyAirHourlyQlty];
    [mutableDict setValue:self.pm25 forKey:kAirHourlyAirHourlyPm25];
    [mutableDict setValue:self.time forKey:kAirHourlyAirHourlyTime];
    [mutableDict setValue:self.aqi forKey:kAirHourlyAirHourlyAqi];
    [mutableDict setValue:self.no2 forKey:kAirHourlyAirHourlyNo2];
    [mutableDict setValue:self.co forKey:kAirHourlyAirHourlyCo];
    [mutableDict setValue:self.pm10 forKey:kAirHourlyAirHourlyPm10];
    [mutableDict setValue:self.main forKey:kAirHourlyAirHourlyMain];
    [mutableDict setValue:self.so2 forKey:kAirHourlyAirHourlySo2];
    [mutableDict setValue:self.o3 forKey:kAirHourlyAirHourlyO3];

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

    self.qlty = [aDecoder decodeObjectForKey:kAirHourlyAirHourlyQlty];
    self.pm25 = [aDecoder decodeObjectForKey:kAirHourlyAirHourlyPm25];
    self.time = [aDecoder decodeObjectForKey:kAirHourlyAirHourlyTime];
    self.aqi = [aDecoder decodeObjectForKey:kAirHourlyAirHourlyAqi];
    self.no2 = [aDecoder decodeObjectForKey:kAirHourlyAirHourlyNo2];
    self.co = [aDecoder decodeObjectForKey:kAirHourlyAirHourlyCo];
    self.pm10 = [aDecoder decodeObjectForKey:kAirHourlyAirHourlyPm10];
    self.main = [aDecoder decodeObjectForKey:kAirHourlyAirHourlyMain];
    self.so2 = [aDecoder decodeObjectForKey:kAirHourlyAirHourlySo2];
    self.o3 = [aDecoder decodeObjectForKey:kAirHourlyAirHourlyO3];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_qlty forKey:kAirHourlyAirHourlyQlty];
    [aCoder encodeObject:_pm25 forKey:kAirHourlyAirHourlyPm25];
    [aCoder encodeObject:_time forKey:kAirHourlyAirHourlyTime];
    [aCoder encodeObject:_aqi forKey:kAirHourlyAirHourlyAqi];
    [aCoder encodeObject:_no2 forKey:kAirHourlyAirHourlyNo2];
    [aCoder encodeObject:_co forKey:kAirHourlyAirHourlyCo];
    [aCoder encodeObject:_pm10 forKey:kAirHourlyAirHourlyPm10];
    [aCoder encodeObject:_main forKey:kAirHourlyAirHourlyMain];
    [aCoder encodeObject:_so2 forKey:kAirHourlyAirHourlySo2];
    [aCoder encodeObject:_o3 forKey:kAirHourlyAirHourlyO3];
}

- (id)copyWithZone:(NSZone *)zone {
    AirHourlyAirHourly *copy = [[AirHourlyAirHourly alloc] init];
    
    
    
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
