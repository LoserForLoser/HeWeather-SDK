//
//  DailyForecast.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherDailyForecast.h"


NSString *const kWeatherDailyDailyForecastHum = @"hum";
NSString *const kWeatherDailyDailyForecastCondTxtD = @"cond_txt_d";
NSString *const kWeatherDailyDailyForecastWindDir = @"wind_dir";
NSString *const kWeatherDailyDailyForecastPres = @"pres";
NSString *const kWeatherDailyDailyForecastUvIndex = @"uv_index";
NSString *const kWeatherDailyDailyForecastTmpMax = @"tmp_max";
NSString *const kWeatherDailyDailyForecastVis = @"vis";
NSString *const kWeatherDailyDailyForecastWindSpd = @"wind_spd";
NSString *const kWeatherDailyDailyForecastCondCodeN = @"cond_code_n";
NSString *const kWeatherDailyDailyForecastDate = @"date";
NSString *const kWeatherDailyDailyForecastWindDeg = @"wind_deg";
NSString *const kWeatherDailyDailyForecastCondCodeD = @"cond_code_d";
NSString *const kWeatherDailyDailyForecastPcpn = @"pcpn";
NSString *const kWeatherDailyDailyForecastTmpMin = @"tmp_min";
NSString *const kWeatherDailyDailyForecastCondTxtN = @"cond_txt_n";
NSString *const kWeatherDailyDailyForecastWindSc = @"wind_sc";
NSString *const kWeatherDailyDailyForecastPop = @"pop";


@interface WeatherDailyForecast ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherDailyForecast

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
            self.hum = [self objectOrNilForKey:kWeatherDailyDailyForecastHum fromDictionary:dict];
            self.condTxtD = [self objectOrNilForKey:kWeatherDailyDailyForecastCondTxtD fromDictionary:dict];
            self.windDir = [self objectOrNilForKey:kWeatherDailyDailyForecastWindDir fromDictionary:dict];
            self.pres = [self objectOrNilForKey:kWeatherDailyDailyForecastPres fromDictionary:dict];
            self.uvIndex = [self objectOrNilForKey:kWeatherDailyDailyForecastUvIndex fromDictionary:dict];
            self.tmpMax = [self objectOrNilForKey:kWeatherDailyDailyForecastTmpMax fromDictionary:dict];
            self.vis = [self objectOrNilForKey:kWeatherDailyDailyForecastVis fromDictionary:dict];
            self.windSpd = [self objectOrNilForKey:kWeatherDailyDailyForecastWindSpd fromDictionary:dict];
            self.condCodeN = [self objectOrNilForKey:kWeatherDailyDailyForecastCondCodeN fromDictionary:dict];
            self.date = [self objectOrNilForKey:kWeatherDailyDailyForecastDate fromDictionary:dict];
            self.windDeg = [self objectOrNilForKey:kWeatherDailyDailyForecastWindDeg fromDictionary:dict];
            self.condCodeD = [self objectOrNilForKey:kWeatherDailyDailyForecastCondCodeD fromDictionary:dict];
            self.pcpn = [self objectOrNilForKey:kWeatherDailyDailyForecastPcpn fromDictionary:dict];
            self.tmpMin = [self objectOrNilForKey:kWeatherDailyDailyForecastTmpMin fromDictionary:dict];
            self.condTxtN = [self objectOrNilForKey:kWeatherDailyDailyForecastCondTxtN fromDictionary:dict];
            self.windSc = [self objectOrNilForKey:kWeatherDailyDailyForecastWindSc fromDictionary:dict];
            self.pop = [self objectOrNilForKey:kWeatherDailyDailyForecastPop fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.hum forKey:kWeatherDailyDailyForecastHum];
    [mutableDict setValue:self.condTxtD forKey:kWeatherDailyDailyForecastCondTxtD];
    [mutableDict setValue:self.windDir forKey:kWeatherDailyDailyForecastWindDir];
    [mutableDict setValue:self.pres forKey:kWeatherDailyDailyForecastPres];
    [mutableDict setValue:self.uvIndex forKey:kWeatherDailyDailyForecastUvIndex];
    [mutableDict setValue:self.tmpMax forKey:kWeatherDailyDailyForecastTmpMax];
    [mutableDict setValue:self.vis forKey:kWeatherDailyDailyForecastVis];
    [mutableDict setValue:self.windSpd forKey:kWeatherDailyDailyForecastWindSpd];
    [mutableDict setValue:self.condCodeN forKey:kWeatherDailyDailyForecastCondCodeN];
    [mutableDict setValue:self.date forKey:kWeatherDailyDailyForecastDate];
    [mutableDict setValue:self.windDeg forKey:kWeatherDailyDailyForecastWindDeg];
    [mutableDict setValue:self.condCodeD forKey:kWeatherDailyDailyForecastCondCodeD];
    [mutableDict setValue:self.pcpn forKey:kWeatherDailyDailyForecastPcpn];
    [mutableDict setValue:self.tmpMin forKey:kWeatherDailyDailyForecastTmpMin];
    [mutableDict setValue:self.condTxtN forKey:kWeatherDailyDailyForecastCondTxtN];
    [mutableDict setValue:self.windSc forKey:kWeatherDailyDailyForecastWindSc];
    [mutableDict setValue:self.pop forKey:kWeatherDailyDailyForecastPop];

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

    self.hum = [aDecoder decodeObjectForKey:kWeatherDailyDailyForecastHum];
    self.condTxtD = [aDecoder decodeObjectForKey:kWeatherDailyDailyForecastCondTxtD];
    self.windDir = [aDecoder decodeObjectForKey:kWeatherDailyDailyForecastWindDir];
    self.pres = [aDecoder decodeObjectForKey:kWeatherDailyDailyForecastPres];
    self.uvIndex = [aDecoder decodeObjectForKey:kWeatherDailyDailyForecastUvIndex];
    self.tmpMax = [aDecoder decodeObjectForKey:kWeatherDailyDailyForecastTmpMax];
    self.vis = [aDecoder decodeObjectForKey:kWeatherDailyDailyForecastVis];
    self.windSpd = [aDecoder decodeObjectForKey:kWeatherDailyDailyForecastWindSpd];
    self.condCodeN = [aDecoder decodeObjectForKey:kWeatherDailyDailyForecastCondCodeN];
    self.date = [aDecoder decodeObjectForKey:kWeatherDailyDailyForecastDate];
    self.windDeg = [aDecoder decodeObjectForKey:kWeatherDailyDailyForecastWindDeg];
    self.condCodeD = [aDecoder decodeObjectForKey:kWeatherDailyDailyForecastCondCodeD];
    self.pcpn = [aDecoder decodeObjectForKey:kWeatherDailyDailyForecastPcpn];
    self.tmpMin = [aDecoder decodeObjectForKey:kWeatherDailyDailyForecastTmpMin];
    self.condTxtN = [aDecoder decodeObjectForKey:kWeatherDailyDailyForecastCondTxtN];
    self.windSc = [aDecoder decodeObjectForKey:kWeatherDailyDailyForecastWindSc];
    self.pop = [aDecoder decodeObjectForKey:kWeatherDailyDailyForecastPop];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_hum forKey:kWeatherDailyDailyForecastHum];
    [aCoder encodeObject:_condTxtD forKey:kWeatherDailyDailyForecastCondTxtD];
    [aCoder encodeObject:_windDir forKey:kWeatherDailyDailyForecastWindDir];
    [aCoder encodeObject:_pres forKey:kWeatherDailyDailyForecastPres];
    [aCoder encodeObject:_uvIndex forKey:kWeatherDailyDailyForecastUvIndex];
    [aCoder encodeObject:_tmpMax forKey:kWeatherDailyDailyForecastTmpMax];
    [aCoder encodeObject:_vis forKey:kWeatherDailyDailyForecastVis];
    [aCoder encodeObject:_windSpd forKey:kWeatherDailyDailyForecastWindSpd];
    [aCoder encodeObject:_condCodeN forKey:kWeatherDailyDailyForecastCondCodeN];
    [aCoder encodeObject:_date forKey:kWeatherDailyDailyForecastDate];
    [aCoder encodeObject:_windDeg forKey:kWeatherDailyDailyForecastWindDeg];
    [aCoder encodeObject:_condCodeD forKey:kWeatherDailyDailyForecastCondCodeD];
    [aCoder encodeObject:_pcpn forKey:kWeatherDailyDailyForecastPcpn];
    [aCoder encodeObject:_tmpMin forKey:kWeatherDailyDailyForecastTmpMin];
    [aCoder encodeObject:_condTxtN forKey:kWeatherDailyDailyForecastCondTxtN];
    [aCoder encodeObject:_windSc forKey:kWeatherDailyDailyForecastWindSc];
    [aCoder encodeObject:_pop forKey:kWeatherDailyDailyForecastPop];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherDailyForecast *copy = [[WeatherDailyForecast alloc] init];
    
    
    
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
