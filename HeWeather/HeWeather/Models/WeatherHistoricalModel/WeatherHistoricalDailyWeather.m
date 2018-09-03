//
//  DailyWeather.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherHistoricalDailyWeather.h"


NSString *const kDailyWeatherMr = @"mr";
NSString *const kDailyWeatherTmpMin = @"tmp_min";
NSString *const kDailyWeatherPres = @"pres";
NSString *const kDailyWeatherSr = @"sr";
NSString *const kDailyWeatherHum = @"hum";
NSString *const kDailyWeatherDate = @"date";
NSString *const kDailyWeatherMs = @"ms";
NSString *const kDailyWeatherSs = @"ss";
NSString *const kDailyWeatherTmpMax = @"tmp_max";
NSString *const kDailyWeatherPcpn = @"pcpn";


@interface WeatherHistoricalDailyWeather ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherHistoricalDailyWeather

@synthesize mr = _mr;
@synthesize tmpMin = _tmpMin;
@synthesize pres = _pres;
@synthesize sr = _sr;
@synthesize hum = _hum;
@synthesize date = _date;
@synthesize ms = _ms;
@synthesize ss = _ss;
@synthesize tmpMax = _tmpMax;
@synthesize pcpn = _pcpn;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.mr = [self objectOrNilForKey:kDailyWeatherMr fromDictionary:dict];
            self.tmpMin = [self objectOrNilForKey:kDailyWeatherTmpMin fromDictionary:dict];
            self.pres = [self objectOrNilForKey:kDailyWeatherPres fromDictionary:dict];
            self.sr = [self objectOrNilForKey:kDailyWeatherSr fromDictionary:dict];
            self.hum = [self objectOrNilForKey:kDailyWeatherHum fromDictionary:dict];
            self.date = [self objectOrNilForKey:kDailyWeatherDate fromDictionary:dict];
            self.ms = [self objectOrNilForKey:kDailyWeatherMs fromDictionary:dict];
            self.ss = [self objectOrNilForKey:kDailyWeatherSs fromDictionary:dict];
            self.tmpMax = [self objectOrNilForKey:kDailyWeatherTmpMax fromDictionary:dict];
            self.pcpn = [self objectOrNilForKey:kDailyWeatherPcpn fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.mr forKey:kDailyWeatherMr];
    [mutableDict setValue:self.tmpMin forKey:kDailyWeatherTmpMin];
    [mutableDict setValue:self.pres forKey:kDailyWeatherPres];
    [mutableDict setValue:self.sr forKey:kDailyWeatherSr];
    [mutableDict setValue:self.hum forKey:kDailyWeatherHum];
    [mutableDict setValue:self.date forKey:kDailyWeatherDate];
    [mutableDict setValue:self.ms forKey:kDailyWeatherMs];
    [mutableDict setValue:self.ss forKey:kDailyWeatherSs];
    [mutableDict setValue:self.tmpMax forKey:kDailyWeatherTmpMax];
    [mutableDict setValue:self.pcpn forKey:kDailyWeatherPcpn];

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

    self.mr = [aDecoder decodeObjectForKey:kDailyWeatherMr];
    self.tmpMin = [aDecoder decodeObjectForKey:kDailyWeatherTmpMin];
    self.pres = [aDecoder decodeObjectForKey:kDailyWeatherPres];
    self.sr = [aDecoder decodeObjectForKey:kDailyWeatherSr];
    self.hum = [aDecoder decodeObjectForKey:kDailyWeatherHum];
    self.date = [aDecoder decodeObjectForKey:kDailyWeatherDate];
    self.ms = [aDecoder decodeObjectForKey:kDailyWeatherMs];
    self.ss = [aDecoder decodeObjectForKey:kDailyWeatherSs];
    self.tmpMax = [aDecoder decodeObjectForKey:kDailyWeatherTmpMax];
    self.pcpn = [aDecoder decodeObjectForKey:kDailyWeatherPcpn];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_mr forKey:kDailyWeatherMr];
    [aCoder encodeObject:_tmpMin forKey:kDailyWeatherTmpMin];
    [aCoder encodeObject:_pres forKey:kDailyWeatherPres];
    [aCoder encodeObject:_sr forKey:kDailyWeatherSr];
    [aCoder encodeObject:_hum forKey:kDailyWeatherHum];
    [aCoder encodeObject:_date forKey:kDailyWeatherDate];
    [aCoder encodeObject:_ms forKey:kDailyWeatherMs];
    [aCoder encodeObject:_ss forKey:kDailyWeatherSs];
    [aCoder encodeObject:_tmpMax forKey:kDailyWeatherTmpMax];
    [aCoder encodeObject:_pcpn forKey:kDailyWeatherPcpn];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherHistoricalDailyWeather *copy = [[WeatherHistoricalDailyWeather alloc] init];
    
    
    
    if (copy) {

        copy.mr = [self.mr copyWithZone:zone];
        copy.tmpMin = [self.tmpMin copyWithZone:zone];
        copy.pres = [self.pres copyWithZone:zone];
        copy.sr = [self.sr copyWithZone:zone];
        copy.hum = [self.hum copyWithZone:zone];
        copy.date = [self.date copyWithZone:zone];
        copy.ms = [self.ms copyWithZone:zone];
        copy.ss = [self.ss copyWithZone:zone];
        copy.tmpMax = [self.tmpMax copyWithZone:zone];
        copy.pcpn = [self.pcpn copyWithZone:zone];
    }
    
    return copy;
}


@end
