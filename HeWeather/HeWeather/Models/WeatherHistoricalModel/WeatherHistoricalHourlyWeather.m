//
//  HourlyWeather.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherHistoricalHourlyWeather.h"


NSString *const kHourlyWeatherBrief = @"brief";
NSString *const kHourlyWeatherSpd = @"spd";
NSString *const kHourlyWeatherPres = @"pres";
NSString *const kHourlyWeatherCode = @"code";
NSString *const kHourlyWeatherHum = @"hum";
NSString *const kHourlyWeatherSc = @"sc";
NSString *const kHourlyWeatherDate = @"date";
NSString *const kHourlyWeatherDir = @"dir";
NSString *const kHourlyWeatherTmp = @"tmp";


@interface WeatherHistoricalHourlyWeather ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherHistoricalHourlyWeather

@synthesize brief = _brief;
@synthesize spd = _spd;
@synthesize pres = _pres;
@synthesize code = _code;
@synthesize hum = _hum;
@synthesize sc = _sc;
@synthesize date = _date;
@synthesize dir = _dir;
@synthesize tmp = _tmp;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.brief = [self objectOrNilForKey:kHourlyWeatherBrief fromDictionary:dict];
            self.spd = [self objectOrNilForKey:kHourlyWeatherSpd fromDictionary:dict];
            self.pres = [self objectOrNilForKey:kHourlyWeatherPres fromDictionary:dict];
            self.code = [self objectOrNilForKey:kHourlyWeatherCode fromDictionary:dict];
            self.hum = [self objectOrNilForKey:kHourlyWeatherHum fromDictionary:dict];
            self.sc = [self objectOrNilForKey:kHourlyWeatherSc fromDictionary:dict];
            self.date = [self objectOrNilForKey:kHourlyWeatherDate fromDictionary:dict];
            self.dir = [self objectOrNilForKey:kHourlyWeatherDir fromDictionary:dict];
            self.tmp = [self objectOrNilForKey:kHourlyWeatherTmp fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.brief forKey:kHourlyWeatherBrief];
    [mutableDict setValue:self.spd forKey:kHourlyWeatherSpd];
    [mutableDict setValue:self.pres forKey:kHourlyWeatherPres];
    [mutableDict setValue:self.code forKey:kHourlyWeatherCode];
    [mutableDict setValue:self.hum forKey:kHourlyWeatherHum];
    [mutableDict setValue:self.sc forKey:kHourlyWeatherSc];
    [mutableDict setValue:self.date forKey:kHourlyWeatherDate];
    [mutableDict setValue:self.dir forKey:kHourlyWeatherDir];
    [mutableDict setValue:self.tmp forKey:kHourlyWeatherTmp];

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

    self.brief = [aDecoder decodeObjectForKey:kHourlyWeatherBrief];
    self.spd = [aDecoder decodeObjectForKey:kHourlyWeatherSpd];
    self.pres = [aDecoder decodeObjectForKey:kHourlyWeatherPres];
    self.code = [aDecoder decodeObjectForKey:kHourlyWeatherCode];
    self.hum = [aDecoder decodeObjectForKey:kHourlyWeatherHum];
    self.sc = [aDecoder decodeObjectForKey:kHourlyWeatherSc];
    self.date = [aDecoder decodeObjectForKey:kHourlyWeatherDate];
    self.dir = [aDecoder decodeObjectForKey:kHourlyWeatherDir];
    self.tmp = [aDecoder decodeObjectForKey:kHourlyWeatherTmp];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_brief forKey:kHourlyWeatherBrief];
    [aCoder encodeObject:_spd forKey:kHourlyWeatherSpd];
    [aCoder encodeObject:_pres forKey:kHourlyWeatherPres];
    [aCoder encodeObject:_code forKey:kHourlyWeatherCode];
    [aCoder encodeObject:_hum forKey:kHourlyWeatherHum];
    [aCoder encodeObject:_sc forKey:kHourlyWeatherSc];
    [aCoder encodeObject:_date forKey:kHourlyWeatherDate];
    [aCoder encodeObject:_dir forKey:kHourlyWeatherDir];
    [aCoder encodeObject:_tmp forKey:kHourlyWeatherTmp];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherHistoricalHourlyWeather *copy = [[WeatherHistoricalHourlyWeather alloc] init];
    
    
    
    if (copy) {

        copy.brief = [self.brief copyWithZone:zone];
        copy.spd = [self.spd copyWithZone:zone];
        copy.pres = [self.pres copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
        copy.hum = [self.hum copyWithZone:zone];
        copy.sc = [self.sc copyWithZone:zone];
        copy.date = [self.date copyWithZone:zone];
        copy.dir = [self.dir copyWithZone:zone];
        copy.tmp = [self.tmp copyWithZone:zone];
    }
    
    return copy;
}


@end
