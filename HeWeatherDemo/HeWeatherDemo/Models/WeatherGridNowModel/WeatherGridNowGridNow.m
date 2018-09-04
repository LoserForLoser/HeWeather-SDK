//
//  GridNow.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherGridNowGridNow.h"


NSString *const kGridNowPcpn10m = @"pcpn_10m";
NSString *const kGridNowCondTxt = @"cond_txt";
NSString *const kGridNowPres = @"pres";
NSString *const kGridNowCondCode = @"cond_code";
NSString *const kGridNowTmp = @"tmp";
NSString *const kGridNowHum = @"hum";
NSString *const kGridNowWindSc = @"wind_sc";
NSString *const kGridNowPcpn = @"pcpn";
NSString *const kGridNowWindDir = @"wind_dir";


@interface WeatherGridNowGridNow ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherGridNowGridNow

@synthesize pcpn10m = _pcpn10m;
@synthesize condTxt = _condTxt;
@synthesize pres = _pres;
@synthesize condCode = _condCode;
@synthesize tmp = _tmp;
@synthesize hum = _hum;
@synthesize windSc = _windSc;
@synthesize pcpn = _pcpn;
@synthesize windDir = _windDir;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.pcpn10m = [self objectOrNilForKey:kGridNowPcpn10m fromDictionary:dict];
            self.condTxt = [self objectOrNilForKey:kGridNowCondTxt fromDictionary:dict];
            self.pres = [self objectOrNilForKey:kGridNowPres fromDictionary:dict];
            self.condCode = [self objectOrNilForKey:kGridNowCondCode fromDictionary:dict];
            self.tmp = [self objectOrNilForKey:kGridNowTmp fromDictionary:dict];
            self.hum = [self objectOrNilForKey:kGridNowHum fromDictionary:dict];
            self.windSc = [self objectOrNilForKey:kGridNowWindSc fromDictionary:dict];
            self.pcpn = [self objectOrNilForKey:kGridNowPcpn fromDictionary:dict];
            self.windDir = [self objectOrNilForKey:kGridNowWindDir fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.pcpn10m forKey:kGridNowPcpn10m];
    [mutableDict setValue:self.condTxt forKey:kGridNowCondTxt];
    [mutableDict setValue:self.pres forKey:kGridNowPres];
    [mutableDict setValue:self.condCode forKey:kGridNowCondCode];
    [mutableDict setValue:self.tmp forKey:kGridNowTmp];
    [mutableDict setValue:self.hum forKey:kGridNowHum];
    [mutableDict setValue:self.windSc forKey:kGridNowWindSc];
    [mutableDict setValue:self.pcpn forKey:kGridNowPcpn];
    [mutableDict setValue:self.windDir forKey:kGridNowWindDir];

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

    self.pcpn10m = [aDecoder decodeObjectForKey:kGridNowPcpn10m];
    self.condTxt = [aDecoder decodeObjectForKey:kGridNowCondTxt];
    self.pres = [aDecoder decodeObjectForKey:kGridNowPres];
    self.condCode = [aDecoder decodeObjectForKey:kGridNowCondCode];
    self.tmp = [aDecoder decodeObjectForKey:kGridNowTmp];
    self.hum = [aDecoder decodeObjectForKey:kGridNowHum];
    self.windSc = [aDecoder decodeObjectForKey:kGridNowWindSc];
    self.pcpn = [aDecoder decodeObjectForKey:kGridNowPcpn];
    self.windDir = [aDecoder decodeObjectForKey:kGridNowWindDir];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pcpn10m forKey:kGridNowPcpn10m];
    [aCoder encodeObject:_condTxt forKey:kGridNowCondTxt];
    [aCoder encodeObject:_pres forKey:kGridNowPres];
    [aCoder encodeObject:_condCode forKey:kGridNowCondCode];
    [aCoder encodeObject:_tmp forKey:kGridNowTmp];
    [aCoder encodeObject:_hum forKey:kGridNowHum];
    [aCoder encodeObject:_windSc forKey:kGridNowWindSc];
    [aCoder encodeObject:_pcpn forKey:kGridNowPcpn];
    [aCoder encodeObject:_windDir forKey:kGridNowWindDir];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherGridNowGridNow *copy = [[WeatherGridNowGridNow alloc] init];
    
    
    
    if (copy) {

        copy.pcpn10m = [self.pcpn10m copyWithZone:zone];
        copy.condTxt = [self.condTxt copyWithZone:zone];
        copy.pres = [self.pres copyWithZone:zone];
        copy.condCode = [self.condCode copyWithZone:zone];
        copy.tmp = [self.tmp copyWithZone:zone];
        copy.hum = [self.hum copyWithZone:zone];
        copy.windSc = [self.windSc copyWithZone:zone];
        copy.pcpn = [self.pcpn copyWithZone:zone];
        copy.windDir = [self.windDir copyWithZone:zone];
    }
    
    return copy;
}


@end
