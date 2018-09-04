//
//  GridHourly.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherGridHourlyGridHourly.h"


NSString *const kGridHourlyPcpn = @"pcpn";
NSString *const kGridHourlyCondTxt = @"cond_txt";
NSString *const kGridHourlyTime = @"time";
NSString *const kGridHourlyCondCode = @"cond_code";
NSString *const kGridHourlyWindSc = @"wind_sc";
NSString *const kGridHourlyTmp = @"tmp";
NSString *const kGridHourlyWindDir = @"wind_dir";


@interface WeatherGridHourlyGridHourly ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherGridHourlyGridHourly

@synthesize pcpn = _pcpn;
@synthesize condTxt = _condTxt;
@synthesize time = _time;
@synthesize condCode = _condCode;
@synthesize windSc = _windSc;
@synthesize tmp = _tmp;
@synthesize windDir = _windDir;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.pcpn = [self objectOrNilForKey:kGridHourlyPcpn fromDictionary:dict];
            self.condTxt = [self objectOrNilForKey:kGridHourlyCondTxt fromDictionary:dict];
            self.time = [self objectOrNilForKey:kGridHourlyTime fromDictionary:dict];
            self.condCode = [self objectOrNilForKey:kGridHourlyCondCode fromDictionary:dict];
            self.windSc = [self objectOrNilForKey:kGridHourlyWindSc fromDictionary:dict];
            self.tmp = [self objectOrNilForKey:kGridHourlyTmp fromDictionary:dict];
            self.windDir = [self objectOrNilForKey:kGridHourlyWindDir fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.pcpn forKey:kGridHourlyPcpn];
    [mutableDict setValue:self.condTxt forKey:kGridHourlyCondTxt];
    [mutableDict setValue:self.time forKey:kGridHourlyTime];
    [mutableDict setValue:self.condCode forKey:kGridHourlyCondCode];
    [mutableDict setValue:self.windSc forKey:kGridHourlyWindSc];
    [mutableDict setValue:self.tmp forKey:kGridHourlyTmp];
    [mutableDict setValue:self.windDir forKey:kGridHourlyWindDir];

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

    self.pcpn = [aDecoder decodeObjectForKey:kGridHourlyPcpn];
    self.condTxt = [aDecoder decodeObjectForKey:kGridHourlyCondTxt];
    self.time = [aDecoder decodeObjectForKey:kGridHourlyTime];
    self.condCode = [aDecoder decodeObjectForKey:kGridHourlyCondCode];
    self.windSc = [aDecoder decodeObjectForKey:kGridHourlyWindSc];
    self.tmp = [aDecoder decodeObjectForKey:kGridHourlyTmp];
    self.windDir = [aDecoder decodeObjectForKey:kGridHourlyWindDir];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pcpn forKey:kGridHourlyPcpn];
    [aCoder encodeObject:_condTxt forKey:kGridHourlyCondTxt];
    [aCoder encodeObject:_time forKey:kGridHourlyTime];
    [aCoder encodeObject:_condCode forKey:kGridHourlyCondCode];
    [aCoder encodeObject:_windSc forKey:kGridHourlyWindSc];
    [aCoder encodeObject:_tmp forKey:kGridHourlyTmp];
    [aCoder encodeObject:_windDir forKey:kGridHourlyWindDir];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherGridHourlyGridHourly *copy = [[WeatherGridHourlyGridHourly alloc] init];
    
    
    
    if (copy) {

        copy.pcpn = [self.pcpn copyWithZone:zone];
        copy.condTxt = [self.condTxt copyWithZone:zone];
        copy.time = [self.time copyWithZone:zone];
        copy.condCode = [self.condCode copyWithZone:zone];
        copy.windSc = [self.windSc copyWithZone:zone];
        copy.tmp = [self.tmp copyWithZone:zone];
        copy.windDir = [self.windDir copyWithZone:zone];
    }
    
    return copy;
}


@end
