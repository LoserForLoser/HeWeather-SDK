//
//  Now.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherNow.h"


NSString *const kNowHum = @"hum";
NSString *const kNowFl = @"fl";
NSString *const kNowWindDir = @"wind_dir";
NSString *const kNowPres = @"pres";
NSString *const kNowVis = @"vis";
NSString *const kNowWindSpd = @"wind_spd";
NSString *const kNowWindDeg = @"wind_deg";
NSString *const kNowWindSc = @"wind_sc";
NSString *const kNowPcpn = @"pcpn";
NSString *const kNowCondTxt = @"cond_txt";
NSString *const kNowTmp = @"tmp";
NSString *const kNowCondCode = @"cond_code";


@interface WeatherNow ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherNow

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
            self.hum = [self objectOrNilForKey:kNowHum fromDictionary:dict];
            self.fl = [self objectOrNilForKey:kNowFl fromDictionary:dict];
            self.windDir = [self objectOrNilForKey:kNowWindDir fromDictionary:dict];
            self.pres = [self objectOrNilForKey:kNowPres fromDictionary:dict];
            self.vis = [self objectOrNilForKey:kNowVis fromDictionary:dict];
            self.windSpd = [self objectOrNilForKey:kNowWindSpd fromDictionary:dict];
            self.windDeg = [self objectOrNilForKey:kNowWindDeg fromDictionary:dict];
            self.windSc = [self objectOrNilForKey:kNowWindSc fromDictionary:dict];
            self.pcpn = [self objectOrNilForKey:kNowPcpn fromDictionary:dict];
            self.condTxt = [self objectOrNilForKey:kNowCondTxt fromDictionary:dict];
            self.tmp = [self objectOrNilForKey:kNowTmp fromDictionary:dict];
            self.condCode = [self objectOrNilForKey:kNowCondCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.hum forKey:kNowHum];
    [mutableDict setValue:self.fl forKey:kNowFl];
    [mutableDict setValue:self.windDir forKey:kNowWindDir];
    [mutableDict setValue:self.pres forKey:kNowPres];
    [mutableDict setValue:self.vis forKey:kNowVis];
    [mutableDict setValue:self.windSpd forKey:kNowWindSpd];
    [mutableDict setValue:self.windDeg forKey:kNowWindDeg];
    [mutableDict setValue:self.windSc forKey:kNowWindSc];
    [mutableDict setValue:self.pcpn forKey:kNowPcpn];
    [mutableDict setValue:self.condTxt forKey:kNowCondTxt];
    [mutableDict setValue:self.tmp forKey:kNowTmp];
    [mutableDict setValue:self.condCode forKey:kNowCondCode];

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

    self.hum = [aDecoder decodeObjectForKey:kNowHum];
    self.fl = [aDecoder decodeObjectForKey:kNowFl];
    self.windDir = [aDecoder decodeObjectForKey:kNowWindDir];
    self.pres = [aDecoder decodeObjectForKey:kNowPres];
    self.vis = [aDecoder decodeObjectForKey:kNowVis];
    self.windSpd = [aDecoder decodeObjectForKey:kNowWindSpd];
    self.windDeg = [aDecoder decodeObjectForKey:kNowWindDeg];
    self.windSc = [aDecoder decodeObjectForKey:kNowWindSc];
    self.pcpn = [aDecoder decodeObjectForKey:kNowPcpn];
    self.condTxt = [aDecoder decodeObjectForKey:kNowCondTxt];
    self.tmp = [aDecoder decodeObjectForKey:kNowTmp];
    self.condCode = [aDecoder decodeObjectForKey:kNowCondCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_hum forKey:kNowHum];
    [aCoder encodeObject:_fl forKey:kNowFl];
    [aCoder encodeObject:_windDir forKey:kNowWindDir];
    [aCoder encodeObject:_pres forKey:kNowPres];
    [aCoder encodeObject:_vis forKey:kNowVis];
    [aCoder encodeObject:_windSpd forKey:kNowWindSpd];
    [aCoder encodeObject:_windDeg forKey:kNowWindDeg];
    [aCoder encodeObject:_windSc forKey:kNowWindSc];
    [aCoder encodeObject:_pcpn forKey:kNowPcpn];
    [aCoder encodeObject:_condTxt forKey:kNowCondTxt];
    [aCoder encodeObject:_tmp forKey:kNowTmp];
    [aCoder encodeObject:_condCode forKey:kNowCondCode];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherNow *copy = [[WeatherNow alloc] init];
    
    
    
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
