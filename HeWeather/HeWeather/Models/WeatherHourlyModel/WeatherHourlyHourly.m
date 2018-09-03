//
//  Hourly.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherHourlyHourly.h"


NSString *const kWeatherHourlyHourlyHum = @"hum";
NSString *const kWeatherHourlyHourlyCloud = @"cloud";
NSString *const kWeatherHourlyHourlyPres = @"pres";
NSString *const kWeatherHourlyHourlyWindDir = @"wind_dir";
NSString *const kWeatherHourlyHourlyTime = @"time";
NSString *const kWeatherHourlyHourlyWindSpd = @"wind_spd";
NSString *const kWeatherHourlyHourlyWindDeg = @"wind_deg";
NSString *const kWeatherHourlyHourlyWindSc = @"wind_sc";
NSString *const kWeatherHourlyHourlyCondTxt = @"cond_txt";
NSString *const kWeatherHourlyHourlyTmp = @"tmp";
NSString *const kWeatherHourlyHourlyPop = @"pop";
NSString *const kWeatherHourlyHourlyCondCode = @"cond_code";


@interface WeatherHourlyHourly ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherHourlyHourly

@synthesize hum = _hum;
@synthesize cloud = _cloud;
@synthesize pres = _pres;
@synthesize windDir = _windDir;
@synthesize time = _time;
@synthesize windSpd = _windSpd;
@synthesize windDeg = _windDeg;
@synthesize windSc = _windSc;
@synthesize condTxt = _condTxt;
@synthesize tmp = _tmp;
@synthesize pop = _pop;
@synthesize condCode = _condCode;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.hum = [self objectOrNilForKey:kWeatherHourlyHourlyHum fromDictionary:dict];
            self.cloud = [self objectOrNilForKey:kWeatherHourlyHourlyCloud fromDictionary:dict];
            self.pres = [self objectOrNilForKey:kWeatherHourlyHourlyPres fromDictionary:dict];
            self.windDir = [self objectOrNilForKey:kWeatherHourlyHourlyWindDir fromDictionary:dict];
            self.time = [self objectOrNilForKey:kWeatherHourlyHourlyTime fromDictionary:dict];
            self.windSpd = [self objectOrNilForKey:kWeatherHourlyHourlyWindSpd fromDictionary:dict];
            self.windDeg = [self objectOrNilForKey:kWeatherHourlyHourlyWindDeg fromDictionary:dict];
            self.windSc = [self objectOrNilForKey:kWeatherHourlyHourlyWindSc fromDictionary:dict];
            self.condTxt = [self objectOrNilForKey:kWeatherHourlyHourlyCondTxt fromDictionary:dict];
            self.tmp = [self objectOrNilForKey:kWeatherHourlyHourlyTmp fromDictionary:dict];
            self.pop = [self objectOrNilForKey:kWeatherHourlyHourlyPop fromDictionary:dict];
            self.condCode = [self objectOrNilForKey:kWeatherHourlyHourlyCondCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.hum forKey:kWeatherHourlyHourlyHum];
    [mutableDict setValue:self.cloud forKey:kWeatherHourlyHourlyCloud];
    [mutableDict setValue:self.pres forKey:kWeatherHourlyHourlyPres];
    [mutableDict setValue:self.windDir forKey:kWeatherHourlyHourlyWindDir];
    [mutableDict setValue:self.time forKey:kWeatherHourlyHourlyTime];
    [mutableDict setValue:self.windSpd forKey:kWeatherHourlyHourlyWindSpd];
    [mutableDict setValue:self.windDeg forKey:kWeatherHourlyHourlyWindDeg];
    [mutableDict setValue:self.windSc forKey:kWeatherHourlyHourlyWindSc];
    [mutableDict setValue:self.condTxt forKey:kWeatherHourlyHourlyCondTxt];
    [mutableDict setValue:self.tmp forKey:kWeatherHourlyHourlyTmp];
    [mutableDict setValue:self.pop forKey:kWeatherHourlyHourlyPop];
    [mutableDict setValue:self.condCode forKey:kWeatherHourlyHourlyCondCode];

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

    self.hum = [aDecoder decodeObjectForKey:kWeatherHourlyHourlyHum];
    self.cloud = [aDecoder decodeObjectForKey:kWeatherHourlyHourlyCloud];
    self.pres = [aDecoder decodeObjectForKey:kWeatherHourlyHourlyPres];
    self.windDir = [aDecoder decodeObjectForKey:kWeatherHourlyHourlyWindDir];
    self.time = [aDecoder decodeObjectForKey:kWeatherHourlyHourlyTime];
    self.windSpd = [aDecoder decodeObjectForKey:kWeatherHourlyHourlyWindSpd];
    self.windDeg = [aDecoder decodeObjectForKey:kWeatherHourlyHourlyWindDeg];
    self.windSc = [aDecoder decodeObjectForKey:kWeatherHourlyHourlyWindSc];
    self.condTxt = [aDecoder decodeObjectForKey:kWeatherHourlyHourlyCondTxt];
    self.tmp = [aDecoder decodeObjectForKey:kWeatherHourlyHourlyTmp];
    self.pop = [aDecoder decodeObjectForKey:kWeatherHourlyHourlyPop];
    self.condCode = [aDecoder decodeObjectForKey:kWeatherHourlyHourlyCondCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_hum forKey:kWeatherHourlyHourlyHum];
    [aCoder encodeObject:_cloud forKey:kWeatherHourlyHourlyCloud];
    [aCoder encodeObject:_pres forKey:kWeatherHourlyHourlyPres];
    [aCoder encodeObject:_windDir forKey:kWeatherHourlyHourlyWindDir];
    [aCoder encodeObject:_time forKey:kWeatherHourlyHourlyTime];
    [aCoder encodeObject:_windSpd forKey:kWeatherHourlyHourlyWindSpd];
    [aCoder encodeObject:_windDeg forKey:kWeatherHourlyHourlyWindDeg];
    [aCoder encodeObject:_windSc forKey:kWeatherHourlyHourlyWindSc];
    [aCoder encodeObject:_condTxt forKey:kWeatherHourlyHourlyCondTxt];
    [aCoder encodeObject:_tmp forKey:kWeatherHourlyHourlyTmp];
    [aCoder encodeObject:_pop forKey:kWeatherHourlyHourlyPop];
    [aCoder encodeObject:_condCode forKey:kWeatherHourlyHourlyCondCode];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherHourlyHourly *copy = [[WeatherHourlyHourly alloc] init];
    
    
    
    if (copy) {

        copy.hum = [self.hum copyWithZone:zone];
        copy.cloud = [self.cloud copyWithZone:zone];
        copy.pres = [self.pres copyWithZone:zone];
        copy.windDir = [self.windDir copyWithZone:zone];
        copy.time = [self.time copyWithZone:zone];
        copy.windSpd = [self.windSpd copyWithZone:zone];
        copy.windDeg = [self.windDeg copyWithZone:zone];
        copy.windSc = [self.windSc copyWithZone:zone];
        copy.condTxt = [self.condTxt copyWithZone:zone];
        copy.tmp = [self.tmp copyWithZone:zone];
        copy.pop = [self.pop copyWithZone:zone];
        copy.condCode = [self.condCode copyWithZone:zone];
    }
    
    return copy;
}


@end
