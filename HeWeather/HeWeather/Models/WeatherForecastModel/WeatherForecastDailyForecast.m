//
//  DailyForecast.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherForecastDailyForecast.h"


NSString *const kWeatherForecastDailyForecastHum = @"hum";
NSString *const kWeatherForecastDailyForecastCondTxtD = @"cond_txt_d";
NSString *const kWeatherForecastDailyForecastWindDir = @"wind_dir";
NSString *const kWeatherForecastDailyForecastPres = @"pres";
NSString *const kWeatherForecastDailyForecastUvIndex = @"uv_index";
NSString *const kWeatherForecastDailyForecastTmpMax = @"tmp_max";
NSString *const kWeatherForecastDailyForecastVis = @"vis";
NSString *const kWeatherForecastDailyForecastWindSpd = @"wind_spd";
NSString *const kWeatherForecastDailyForecastCondCodeN = @"cond_code_n";
NSString *const kWeatherForecastDailyForecastDate = @"date";
NSString *const kWeatherForecastDailyForecastWindDeg = @"wind_deg";
NSString *const kWeatherForecastDailyForecastCondCodeD = @"cond_code_d";
NSString *const kWeatherForecastDailyForecastPcpn = @"pcpn";
NSString *const kWeatherForecastDailyForecastTmpMin = @"tmp_min";
NSString *const kWeatherForecastDailyForecastCondTxtN = @"cond_txt_n";
NSString *const kWeatherForecastDailyForecastWindSc = @"wind_sc";
NSString *const kWeatherForecastDailyForecastPop = @"pop";


@interface WeatherForecastDailyForecast ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherForecastDailyForecast

@synthesize hum = _hum;
@synthesize condTxtD = _condTxtD;
@synthesize windDir = _windDir;
@synthesize pres = _pres;
@synthesize uvIndex = _uvIndex;
@synthesize tmpMax = _tmpMax;
@synthesize vis = _vis;
@synthesize windSpd = _windSpd;
@synthesize condCodeN = _condCodeN;
@synthesize date = _date;
@synthesize windDeg = _windDeg;
@synthesize condCodeD = _condCodeD;
@synthesize pcpn = _pcpn;
@synthesize tmpMin = _tmpMin;
@synthesize condTxtN = _condTxtN;
@synthesize windSc = _windSc;
@synthesize pop = _pop;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.hum = [self objectOrNilForKey:kWeatherForecastDailyForecastHum fromDictionary:dict];
            self.condTxtD = [self objectOrNilForKey:kWeatherForecastDailyForecastCondTxtD fromDictionary:dict];
            self.windDir = [self objectOrNilForKey:kWeatherForecastDailyForecastWindDir fromDictionary:dict];
            self.pres = [self objectOrNilForKey:kWeatherForecastDailyForecastPres fromDictionary:dict];
            self.uvIndex = [self objectOrNilForKey:kWeatherForecastDailyForecastUvIndex fromDictionary:dict];
            self.tmpMax = [self objectOrNilForKey:kWeatherForecastDailyForecastTmpMax fromDictionary:dict];
            self.vis = [self objectOrNilForKey:kWeatherForecastDailyForecastVis fromDictionary:dict];
            self.windSpd = [self objectOrNilForKey:kWeatherForecastDailyForecastWindSpd fromDictionary:dict];
            self.condCodeN = [self objectOrNilForKey:kWeatherForecastDailyForecastCondCodeN fromDictionary:dict];
            self.date = [self objectOrNilForKey:kWeatherForecastDailyForecastDate fromDictionary:dict];
            self.windDeg = [self objectOrNilForKey:kWeatherForecastDailyForecastWindDeg fromDictionary:dict];
            self.condCodeD = [self objectOrNilForKey:kWeatherForecastDailyForecastCondCodeD fromDictionary:dict];
            self.pcpn = [self objectOrNilForKey:kWeatherForecastDailyForecastPcpn fromDictionary:dict];
            self.tmpMin = [self objectOrNilForKey:kWeatherForecastDailyForecastTmpMin fromDictionary:dict];
            self.condTxtN = [self objectOrNilForKey:kWeatherForecastDailyForecastCondTxtN fromDictionary:dict];
            self.windSc = [self objectOrNilForKey:kWeatherForecastDailyForecastWindSc fromDictionary:dict];
            self.pop = [self objectOrNilForKey:kWeatherForecastDailyForecastPop fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.hum forKey:kWeatherForecastDailyForecastHum];
    [mutableDict setValue:self.condTxtD forKey:kWeatherForecastDailyForecastCondTxtD];
    [mutableDict setValue:self.windDir forKey:kWeatherForecastDailyForecastWindDir];
    [mutableDict setValue:self.pres forKey:kWeatherForecastDailyForecastPres];
    [mutableDict setValue:self.uvIndex forKey:kWeatherForecastDailyForecastUvIndex];
    [mutableDict setValue:self.tmpMax forKey:kWeatherForecastDailyForecastTmpMax];
    [mutableDict setValue:self.vis forKey:kWeatherForecastDailyForecastVis];
    [mutableDict setValue:self.windSpd forKey:kWeatherForecastDailyForecastWindSpd];
    [mutableDict setValue:self.condCodeN forKey:kWeatherForecastDailyForecastCondCodeN];
    [mutableDict setValue:self.date forKey:kWeatherForecastDailyForecastDate];
    [mutableDict setValue:self.windDeg forKey:kWeatherForecastDailyForecastWindDeg];
    [mutableDict setValue:self.condCodeD forKey:kWeatherForecastDailyForecastCondCodeD];
    [mutableDict setValue:self.pcpn forKey:kWeatherForecastDailyForecastPcpn];
    [mutableDict setValue:self.tmpMin forKey:kWeatherForecastDailyForecastTmpMin];
    [mutableDict setValue:self.condTxtN forKey:kWeatherForecastDailyForecastCondTxtN];
    [mutableDict setValue:self.windSc forKey:kWeatherForecastDailyForecastWindSc];
    [mutableDict setValue:self.pop forKey:kWeatherForecastDailyForecastPop];

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

    self.hum = [aDecoder decodeObjectForKey:kWeatherForecastDailyForecastHum];
    self.condTxtD = [aDecoder decodeObjectForKey:kWeatherForecastDailyForecastCondTxtD];
    self.windDir = [aDecoder decodeObjectForKey:kWeatherForecastDailyForecastWindDir];
    self.pres = [aDecoder decodeObjectForKey:kWeatherForecastDailyForecastPres];
    self.uvIndex = [aDecoder decodeObjectForKey:kWeatherForecastDailyForecastUvIndex];
    self.tmpMax = [aDecoder decodeObjectForKey:kWeatherForecastDailyForecastTmpMax];
    self.vis = [aDecoder decodeObjectForKey:kWeatherForecastDailyForecastVis];
    self.windSpd = [aDecoder decodeObjectForKey:kWeatherForecastDailyForecastWindSpd];
    self.condCodeN = [aDecoder decodeObjectForKey:kWeatherForecastDailyForecastCondCodeN];
    self.date = [aDecoder decodeObjectForKey:kWeatherForecastDailyForecastDate];
    self.windDeg = [aDecoder decodeObjectForKey:kWeatherForecastDailyForecastWindDeg];
    self.condCodeD = [aDecoder decodeObjectForKey:kWeatherForecastDailyForecastCondCodeD];
    self.pcpn = [aDecoder decodeObjectForKey:kWeatherForecastDailyForecastPcpn];
    self.tmpMin = [aDecoder decodeObjectForKey:kWeatherForecastDailyForecastTmpMin];
    self.condTxtN = [aDecoder decodeObjectForKey:kWeatherForecastDailyForecastCondTxtN];
    self.windSc = [aDecoder decodeObjectForKey:kWeatherForecastDailyForecastWindSc];
    self.pop = [aDecoder decodeObjectForKey:kWeatherForecastDailyForecastPop];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_hum forKey:kWeatherForecastDailyForecastHum];
    [aCoder encodeObject:_condTxtD forKey:kWeatherForecastDailyForecastCondTxtD];
    [aCoder encodeObject:_windDir forKey:kWeatherForecastDailyForecastWindDir];
    [aCoder encodeObject:_pres forKey:kWeatherForecastDailyForecastPres];
    [aCoder encodeObject:_uvIndex forKey:kWeatherForecastDailyForecastUvIndex];
    [aCoder encodeObject:_tmpMax forKey:kWeatherForecastDailyForecastTmpMax];
    [aCoder encodeObject:_vis forKey:kWeatherForecastDailyForecastVis];
    [aCoder encodeObject:_windSpd forKey:kWeatherForecastDailyForecastWindSpd];
    [aCoder encodeObject:_condCodeN forKey:kWeatherForecastDailyForecastCondCodeN];
    [aCoder encodeObject:_date forKey:kWeatherForecastDailyForecastDate];
    [aCoder encodeObject:_windDeg forKey:kWeatherForecastDailyForecastWindDeg];
    [aCoder encodeObject:_condCodeD forKey:kWeatherForecastDailyForecastCondCodeD];
    [aCoder encodeObject:_pcpn forKey:kWeatherForecastDailyForecastPcpn];
    [aCoder encodeObject:_tmpMin forKey:kWeatherForecastDailyForecastTmpMin];
    [aCoder encodeObject:_condTxtN forKey:kWeatherForecastDailyForecastCondTxtN];
    [aCoder encodeObject:_windSc forKey:kWeatherForecastDailyForecastWindSc];
    [aCoder encodeObject:_pop forKey:kWeatherForecastDailyForecastPop];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherForecastDailyForecast *copy = [[WeatherForecastDailyForecast alloc] init];
    
    
    
    if (copy) {

        copy.hum = [self.hum copyWithZone:zone];
        copy.condTxtD = [self.condTxtD copyWithZone:zone];
        copy.windDir = [self.windDir copyWithZone:zone];
        copy.pres = [self.pres copyWithZone:zone];
        copy.uvIndex = [self.uvIndex copyWithZone:zone];
        copy.tmpMax = [self.tmpMax copyWithZone:zone];
        copy.vis = [self.vis copyWithZone:zone];
        copy.windSpd = [self.windSpd copyWithZone:zone];
        copy.condCodeN = [self.condCodeN copyWithZone:zone];
        copy.date = [self.date copyWithZone:zone];
        copy.windDeg = [self.windDeg copyWithZone:zone];
        copy.condCodeD = [self.condCodeD copyWithZone:zone];
        copy.pcpn = [self.pcpn copyWithZone:zone];
        copy.tmpMin = [self.tmpMin copyWithZone:zone];
        copy.condTxtN = [self.condTxtN copyWithZone:zone];
        copy.windSc = [self.windSc copyWithZone:zone];
        copy.pop = [self.pop copyWithZone:zone];
    }
    
    return copy;
}


@end
