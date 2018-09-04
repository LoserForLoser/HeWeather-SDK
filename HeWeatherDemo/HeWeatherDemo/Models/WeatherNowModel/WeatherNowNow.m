//
//  Now.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherNowNow.h"


NSString *const kWeatherNowNowHum = @"hum";
NSString *const kWeatherNowNowFl = @"fl";
NSString *const kWeatherNowNowWindDir = @"wind_dir";
NSString *const kWeatherNowNowPres = @"pres";
NSString *const kWeatherNowNowVis = @"vis";
NSString *const kWeatherNowNowWindSpd = @"wind_spd";
NSString *const kWeatherNowNowWindDeg = @"wind_deg";
NSString *const kWeatherNowNowWindSc = @"wind_sc";
NSString *const kWeatherNowNowPcpn = @"pcpn";
NSString *const kWeatherNowNowCondTxt = @"cond_txt";
NSString *const kWeatherNowNowTmp = @"tmp";
NSString *const kWeatherNowNowCondCode = @"cond_code";


@interface WeatherNowNow ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherNowNow

@synthesize hum = _hum;
@synthesize fl = _fl;
@synthesize windDir = _windDir;
@synthesize pres = _pres;
@synthesize vis = _vis;
@synthesize windSpd = _windSpd;
@synthesize windDeg = _windDeg;
@synthesize windSc = _windSc;
@synthesize pcpn = _pcpn;
@synthesize condTxt = _condTxt;
@synthesize tmp = _tmp;
@synthesize condCode = _condCode;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.hum = [self objectOrNilForKey:kWeatherNowNowHum fromDictionary:dict];
            self.fl = [self objectOrNilForKey:kWeatherNowNowFl fromDictionary:dict];
            self.windDir = [self objectOrNilForKey:kWeatherNowNowWindDir fromDictionary:dict];
            self.pres = [self objectOrNilForKey:kWeatherNowNowPres fromDictionary:dict];
            self.vis = [self objectOrNilForKey:kWeatherNowNowVis fromDictionary:dict];
            self.windSpd = [self objectOrNilForKey:kWeatherNowNowWindSpd fromDictionary:dict];
            self.windDeg = [self objectOrNilForKey:kWeatherNowNowWindDeg fromDictionary:dict];
            self.windSc = [self objectOrNilForKey:kWeatherNowNowWindSc fromDictionary:dict];
            self.pcpn = [self objectOrNilForKey:kWeatherNowNowPcpn fromDictionary:dict];
            self.condTxt = [self objectOrNilForKey:kWeatherNowNowCondTxt fromDictionary:dict];
            self.tmp = [self objectOrNilForKey:kWeatherNowNowTmp fromDictionary:dict];
            self.condCode = [self objectOrNilForKey:kWeatherNowNowCondCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.hum forKey:kWeatherNowNowHum];
    [mutableDict setValue:self.fl forKey:kWeatherNowNowFl];
    [mutableDict setValue:self.windDir forKey:kWeatherNowNowWindDir];
    [mutableDict setValue:self.pres forKey:kWeatherNowNowPres];
    [mutableDict setValue:self.vis forKey:kWeatherNowNowVis];
    [mutableDict setValue:self.windSpd forKey:kWeatherNowNowWindSpd];
    [mutableDict setValue:self.windDeg forKey:kWeatherNowNowWindDeg];
    [mutableDict setValue:self.windSc forKey:kWeatherNowNowWindSc];
    [mutableDict setValue:self.pcpn forKey:kWeatherNowNowPcpn];
    [mutableDict setValue:self.condTxt forKey:kWeatherNowNowCondTxt];
    [mutableDict setValue:self.tmp forKey:kWeatherNowNowTmp];
    [mutableDict setValue:self.condCode forKey:kWeatherNowNowCondCode];

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

    self.hum = [aDecoder decodeObjectForKey:kWeatherNowNowHum];
    self.fl = [aDecoder decodeObjectForKey:kWeatherNowNowFl];
    self.windDir = [aDecoder decodeObjectForKey:kWeatherNowNowWindDir];
    self.pres = [aDecoder decodeObjectForKey:kWeatherNowNowPres];
    self.vis = [aDecoder decodeObjectForKey:kWeatherNowNowVis];
    self.windSpd = [aDecoder decodeObjectForKey:kWeatherNowNowWindSpd];
    self.windDeg = [aDecoder decodeObjectForKey:kWeatherNowNowWindDeg];
    self.windSc = [aDecoder decodeObjectForKey:kWeatherNowNowWindSc];
    self.pcpn = [aDecoder decodeObjectForKey:kWeatherNowNowPcpn];
    self.condTxt = [aDecoder decodeObjectForKey:kWeatherNowNowCondTxt];
    self.tmp = [aDecoder decodeObjectForKey:kWeatherNowNowTmp];
    self.condCode = [aDecoder decodeObjectForKey:kWeatherNowNowCondCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_hum forKey:kWeatherNowNowHum];
    [aCoder encodeObject:_fl forKey:kWeatherNowNowFl];
    [aCoder encodeObject:_windDir forKey:kWeatherNowNowWindDir];
    [aCoder encodeObject:_pres forKey:kWeatherNowNowPres];
    [aCoder encodeObject:_vis forKey:kWeatherNowNowVis];
    [aCoder encodeObject:_windSpd forKey:kWeatherNowNowWindSpd];
    [aCoder encodeObject:_windDeg forKey:kWeatherNowNowWindDeg];
    [aCoder encodeObject:_windSc forKey:kWeatherNowNowWindSc];
    [aCoder encodeObject:_pcpn forKey:kWeatherNowNowPcpn];
    [aCoder encodeObject:_condTxt forKey:kWeatherNowNowCondTxt];
    [aCoder encodeObject:_tmp forKey:kWeatherNowNowTmp];
    [aCoder encodeObject:_condCode forKey:kWeatherNowNowCondCode];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherNowNow *copy = [[WeatherNowNow alloc] init];
    
    
    
    if (copy) {

        copy.hum = [self.hum copyWithZone:zone];
        copy.fl = [self.fl copyWithZone:zone];
        copy.windDir = [self.windDir copyWithZone:zone];
        copy.pres = [self.pres copyWithZone:zone];
        copy.vis = [self.vis copyWithZone:zone];
        copy.windSpd = [self.windSpd copyWithZone:zone];
        copy.windDeg = [self.windDeg copyWithZone:zone];
        copy.windSc = [self.windSc copyWithZone:zone];
        copy.pcpn = [self.pcpn copyWithZone:zone];
        copy.condTxt = [self.condTxt copyWithZone:zone];
        copy.tmp = [self.tmp copyWithZone:zone];
        copy.condCode = [self.condCode copyWithZone:zone];
    }
    
    return copy;
}


@end
