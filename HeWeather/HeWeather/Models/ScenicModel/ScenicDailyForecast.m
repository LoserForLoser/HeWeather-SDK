//
//  DailyForecast.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "ScenicDailyForecast.h"


NSString *const kDailyForecastCondCodeN = @"cond_code_n";
NSString *const kDailyForecastTmpMin = @"tmp_min";
NSString *const kDailyForecastSr = @"sr";
NSString *const kDailyForecastCondTxtD = @"cond_txt_d";
NSString *const kDailyForecastDate = @"date";
NSString *const kDailyForecastSs = @"ss";
NSString *const kDailyForecastTmpMax = @"tmp_max";
NSString *const kDailyForecastCondTxtN = @"cond_txt_n";
NSString *const kDailyForecastWindSc = @"wind_sc";
NSString *const kDailyForecastCondCodeD = @"cond_code_d";
NSString *const kDailyForecastWindDir = @"wind_dir";


@interface ScenicDailyForecast ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ScenicDailyForecast

@synthesize condCodeN = _condCodeN;
@synthesize tmpMin = _tmpMin;
@synthesize sr = _sr;
@synthesize condTxtD = _condTxtD;
@synthesize date = _date;
@synthesize ss = _ss;
@synthesize tmpMax = _tmpMax;
@synthesize condTxtN = _condTxtN;
@synthesize windSc = _windSc;
@synthesize condCodeD = _condCodeD;
@synthesize windDir = _windDir;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.condCodeN = [self objectOrNilForKey:kDailyForecastCondCodeN fromDictionary:dict];
            self.tmpMin = [self objectOrNilForKey:kDailyForecastTmpMin fromDictionary:dict];
            self.sr = [self objectOrNilForKey:kDailyForecastSr fromDictionary:dict];
            self.condTxtD = [self objectOrNilForKey:kDailyForecastCondTxtD fromDictionary:dict];
            self.date = [self objectOrNilForKey:kDailyForecastDate fromDictionary:dict];
            self.ss = [self objectOrNilForKey:kDailyForecastSs fromDictionary:dict];
            self.tmpMax = [self objectOrNilForKey:kDailyForecastTmpMax fromDictionary:dict];
            self.condTxtN = [self objectOrNilForKey:kDailyForecastCondTxtN fromDictionary:dict];
            self.windSc = [self objectOrNilForKey:kDailyForecastWindSc fromDictionary:dict];
            self.condCodeD = [self objectOrNilForKey:kDailyForecastCondCodeD fromDictionary:dict];
            self.windDir = [self objectOrNilForKey:kDailyForecastWindDir fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.condCodeN forKey:kDailyForecastCondCodeN];
    [mutableDict setValue:self.tmpMin forKey:kDailyForecastTmpMin];
    [mutableDict setValue:self.sr forKey:kDailyForecastSr];
    [mutableDict setValue:self.condTxtD forKey:kDailyForecastCondTxtD];
    [mutableDict setValue:self.date forKey:kDailyForecastDate];
    [mutableDict setValue:self.ss forKey:kDailyForecastSs];
    [mutableDict setValue:self.tmpMax forKey:kDailyForecastTmpMax];
    [mutableDict setValue:self.condTxtN forKey:kDailyForecastCondTxtN];
    [mutableDict setValue:self.windSc forKey:kDailyForecastWindSc];
    [mutableDict setValue:self.condCodeD forKey:kDailyForecastCondCodeD];
    [mutableDict setValue:self.windDir forKey:kDailyForecastWindDir];

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

    self.condCodeN = [aDecoder decodeObjectForKey:kDailyForecastCondCodeN];
    self.tmpMin = [aDecoder decodeObjectForKey:kDailyForecastTmpMin];
    self.sr = [aDecoder decodeObjectForKey:kDailyForecastSr];
    self.condTxtD = [aDecoder decodeObjectForKey:kDailyForecastCondTxtD];
    self.date = [aDecoder decodeObjectForKey:kDailyForecastDate];
    self.ss = [aDecoder decodeObjectForKey:kDailyForecastSs];
    self.tmpMax = [aDecoder decodeObjectForKey:kDailyForecastTmpMax];
    self.condTxtN = [aDecoder decodeObjectForKey:kDailyForecastCondTxtN];
    self.windSc = [aDecoder decodeObjectForKey:kDailyForecastWindSc];
    self.condCodeD = [aDecoder decodeObjectForKey:kDailyForecastCondCodeD];
    self.windDir = [aDecoder decodeObjectForKey:kDailyForecastWindDir];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_condCodeN forKey:kDailyForecastCondCodeN];
    [aCoder encodeObject:_tmpMin forKey:kDailyForecastTmpMin];
    [aCoder encodeObject:_sr forKey:kDailyForecastSr];
    [aCoder encodeObject:_condTxtD forKey:kDailyForecastCondTxtD];
    [aCoder encodeObject:_date forKey:kDailyForecastDate];
    [aCoder encodeObject:_ss forKey:kDailyForecastSs];
    [aCoder encodeObject:_tmpMax forKey:kDailyForecastTmpMax];
    [aCoder encodeObject:_condTxtN forKey:kDailyForecastCondTxtN];
    [aCoder encodeObject:_windSc forKey:kDailyForecastWindSc];
    [aCoder encodeObject:_condCodeD forKey:kDailyForecastCondCodeD];
    [aCoder encodeObject:_windDir forKey:kDailyForecastWindDir];
}

- (id)copyWithZone:(NSZone *)zone {
    ScenicDailyForecast *copy = [[ScenicDailyForecast alloc] init];
    
    
    
    if (copy) {

        copy.condCodeN = [self.condCodeN copyWithZone:zone];
        copy.tmpMin = [self.tmpMin copyWithZone:zone];
        copy.sr = [self.sr copyWithZone:zone];
        copy.condTxtD = [self.condTxtD copyWithZone:zone];
        copy.date = [self.date copyWithZone:zone];
        copy.ss = [self.ss copyWithZone:zone];
        copy.tmpMax = [self.tmpMax copyWithZone:zone];
        copy.condTxtN = [self.condTxtN copyWithZone:zone];
        copy.windSc = [self.windSc copyWithZone:zone];
        copy.condCodeD = [self.condCodeD copyWithZone:zone];
        copy.windDir = [self.windDir copyWithZone:zone];
    }
    
    return copy;
}


@end
