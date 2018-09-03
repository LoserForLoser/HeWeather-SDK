//
//  Hourly.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherHourly.h"


NSString *const kHourlyHum = @"hum";
NSString *const kHourlyCloud = @"cloud";
NSString *const kHourlyPres = @"pres";
NSString *const kHourlyWindDir = @"wind_dir";
NSString *const kHourlyTime = @"time";
NSString *const kHourlyWindSpd = @"wind_spd";
NSString *const kHourlyWindDeg = @"wind_deg";
NSString *const kHourlyWindSc = @"wind_sc";
NSString *const kHourlyCondTxt = @"cond_txt";
NSString *const kHourlyTmp = @"tmp";
NSString *const kHourlyPop = @"pop";
NSString *const kHourlyCondCode = @"cond_code";


@interface WeatherHourly ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherHourly

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
            self.hum = [self objectOrNilForKey:kHourlyHum fromDictionary:dict];
            self.cloud = [self objectOrNilForKey:kHourlyCloud fromDictionary:dict];
            self.pres = [self objectOrNilForKey:kHourlyPres fromDictionary:dict];
            self.windDir = [self objectOrNilForKey:kHourlyWindDir fromDictionary:dict];
            self.time = [self objectOrNilForKey:kHourlyTime fromDictionary:dict];
            self.windSpd = [self objectOrNilForKey:kHourlyWindSpd fromDictionary:dict];
            self.windDeg = [self objectOrNilForKey:kHourlyWindDeg fromDictionary:dict];
            self.windSc = [self objectOrNilForKey:kHourlyWindSc fromDictionary:dict];
            self.condTxt = [self objectOrNilForKey:kHourlyCondTxt fromDictionary:dict];
            self.tmp = [self objectOrNilForKey:kHourlyTmp fromDictionary:dict];
            self.pop = [self objectOrNilForKey:kHourlyPop fromDictionary:dict];
            self.condCode = [self objectOrNilForKey:kHourlyCondCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.hum forKey:kHourlyHum];
    [mutableDict setValue:self.cloud forKey:kHourlyCloud];
    [mutableDict setValue:self.pres forKey:kHourlyPres];
    [mutableDict setValue:self.windDir forKey:kHourlyWindDir];
    [mutableDict setValue:self.time forKey:kHourlyTime];
    [mutableDict setValue:self.windSpd forKey:kHourlyWindSpd];
    [mutableDict setValue:self.windDeg forKey:kHourlyWindDeg];
    [mutableDict setValue:self.windSc forKey:kHourlyWindSc];
    [mutableDict setValue:self.condTxt forKey:kHourlyCondTxt];
    [mutableDict setValue:self.tmp forKey:kHourlyTmp];
    [mutableDict setValue:self.pop forKey:kHourlyPop];
    [mutableDict setValue:self.condCode forKey:kHourlyCondCode];

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

    self.hum = [aDecoder decodeObjectForKey:kHourlyHum];
    self.cloud = [aDecoder decodeObjectForKey:kHourlyCloud];
    self.pres = [aDecoder decodeObjectForKey:kHourlyPres];
    self.windDir = [aDecoder decodeObjectForKey:kHourlyWindDir];
    self.time = [aDecoder decodeObjectForKey:kHourlyTime];
    self.windSpd = [aDecoder decodeObjectForKey:kHourlyWindSpd];
    self.windDeg = [aDecoder decodeObjectForKey:kHourlyWindDeg];
    self.windSc = [aDecoder decodeObjectForKey:kHourlyWindSc];
    self.condTxt = [aDecoder decodeObjectForKey:kHourlyCondTxt];
    self.tmp = [aDecoder decodeObjectForKey:kHourlyTmp];
    self.pop = [aDecoder decodeObjectForKey:kHourlyPop];
    self.condCode = [aDecoder decodeObjectForKey:kHourlyCondCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_hum forKey:kHourlyHum];
    [aCoder encodeObject:_cloud forKey:kHourlyCloud];
    [aCoder encodeObject:_pres forKey:kHourlyPres];
    [aCoder encodeObject:_windDir forKey:kHourlyWindDir];
    [aCoder encodeObject:_time forKey:kHourlyTime];
    [aCoder encodeObject:_windSpd forKey:kHourlyWindSpd];
    [aCoder encodeObject:_windDeg forKey:kHourlyWindDeg];
    [aCoder encodeObject:_windSc forKey:kHourlyWindSc];
    [aCoder encodeObject:_condTxt forKey:kHourlyCondTxt];
    [aCoder encodeObject:_tmp forKey:kHourlyTmp];
    [aCoder encodeObject:_pop forKey:kHourlyPop];
    [aCoder encodeObject:_condCode forKey:kHourlyCondCode];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherHourly *copy = [[WeatherHourly alloc] init];
    
    
    
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
