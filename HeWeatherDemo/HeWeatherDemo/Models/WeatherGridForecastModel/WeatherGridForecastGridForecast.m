//
//  GridForecast.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherGridForecastGridForecast.h"


NSString *const kGridForecastCondCodeN = @"cond_code_n";
NSString *const kGridForecastTmpMin = @"tmp_min";
NSString *const kGridForecastWindDirD = @"wind_dir_d";
NSString *const kGridForecastCondTxtD = @"cond_txt_d";
NSString *const kGridForecastWindScN = @"wind_sc_n";
NSString *const kGridForecastDate = @"date";
NSString *const kGridForecastTmpMax = @"tmp_max";
NSString *const kGridForecastWindDirN = @"wind_dir_n";
NSString *const kGridForecastCondTxtN = @"cond_txt_n";
NSString *const kGridForecastWindScD = @"wind_sc_d";
NSString *const kGridForecastCondCodeD = @"cond_code_d";


@interface WeatherGridForecastGridForecast ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherGridForecastGridForecast

@synthesize condCodeN = _condCodeN;
@synthesize tmpMin = _tmpMin;
@synthesize windDirD = _windDirD;
@synthesize condTxtD = _condTxtD;
@synthesize windScN = _windScN;
@synthesize date = _date;
@synthesize tmpMax = _tmpMax;
@synthesize windDirN = _windDirN;
@synthesize condTxtN = _condTxtN;
@synthesize windScD = _windScD;
@synthesize condCodeD = _condCodeD;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.condCodeN = [self objectOrNilForKey:kGridForecastCondCodeN fromDictionary:dict];
            self.tmpMin = [self objectOrNilForKey:kGridForecastTmpMin fromDictionary:dict];
            self.windDirD = [self objectOrNilForKey:kGridForecastWindDirD fromDictionary:dict];
            self.condTxtD = [self objectOrNilForKey:kGridForecastCondTxtD fromDictionary:dict];
            self.windScN = [self objectOrNilForKey:kGridForecastWindScN fromDictionary:dict];
            self.date = [self objectOrNilForKey:kGridForecastDate fromDictionary:dict];
            self.tmpMax = [self objectOrNilForKey:kGridForecastTmpMax fromDictionary:dict];
            self.windDirN = [self objectOrNilForKey:kGridForecastWindDirN fromDictionary:dict];
            self.condTxtN = [self objectOrNilForKey:kGridForecastCondTxtN fromDictionary:dict];
            self.windScD = [self objectOrNilForKey:kGridForecastWindScD fromDictionary:dict];
            self.condCodeD = [self objectOrNilForKey:kGridForecastCondCodeD fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.condCodeN forKey:kGridForecastCondCodeN];
    [mutableDict setValue:self.tmpMin forKey:kGridForecastTmpMin];
    [mutableDict setValue:self.windDirD forKey:kGridForecastWindDirD];
    [mutableDict setValue:self.condTxtD forKey:kGridForecastCondTxtD];
    [mutableDict setValue:self.windScN forKey:kGridForecastWindScN];
    [mutableDict setValue:self.date forKey:kGridForecastDate];
    [mutableDict setValue:self.tmpMax forKey:kGridForecastTmpMax];
    [mutableDict setValue:self.windDirN forKey:kGridForecastWindDirN];
    [mutableDict setValue:self.condTxtN forKey:kGridForecastCondTxtN];
    [mutableDict setValue:self.windScD forKey:kGridForecastWindScD];
    [mutableDict setValue:self.condCodeD forKey:kGridForecastCondCodeD];

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

    self.condCodeN = [aDecoder decodeObjectForKey:kGridForecastCondCodeN];
    self.tmpMin = [aDecoder decodeObjectForKey:kGridForecastTmpMin];
    self.windDirD = [aDecoder decodeObjectForKey:kGridForecastWindDirD];
    self.condTxtD = [aDecoder decodeObjectForKey:kGridForecastCondTxtD];
    self.windScN = [aDecoder decodeObjectForKey:kGridForecastWindScN];
    self.date = [aDecoder decodeObjectForKey:kGridForecastDate];
    self.tmpMax = [aDecoder decodeObjectForKey:kGridForecastTmpMax];
    self.windDirN = [aDecoder decodeObjectForKey:kGridForecastWindDirN];
    self.condTxtN = [aDecoder decodeObjectForKey:kGridForecastCondTxtN];
    self.windScD = [aDecoder decodeObjectForKey:kGridForecastWindScD];
    self.condCodeD = [aDecoder decodeObjectForKey:kGridForecastCondCodeD];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_condCodeN forKey:kGridForecastCondCodeN];
    [aCoder encodeObject:_tmpMin forKey:kGridForecastTmpMin];
    [aCoder encodeObject:_windDirD forKey:kGridForecastWindDirD];
    [aCoder encodeObject:_condTxtD forKey:kGridForecastCondTxtD];
    [aCoder encodeObject:_windScN forKey:kGridForecastWindScN];
    [aCoder encodeObject:_date forKey:kGridForecastDate];
    [aCoder encodeObject:_tmpMax forKey:kGridForecastTmpMax];
    [aCoder encodeObject:_windDirN forKey:kGridForecastWindDirN];
    [aCoder encodeObject:_condTxtN forKey:kGridForecastCondTxtN];
    [aCoder encodeObject:_windScD forKey:kGridForecastWindScD];
    [aCoder encodeObject:_condCodeD forKey:kGridForecastCondCodeD];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherGridForecastGridForecast *copy = [[WeatherGridForecastGridForecast alloc] init];
    
    
    
    if (copy) {

        copy.condCodeN = [self.condCodeN copyWithZone:zone];
        copy.tmpMin = [self.tmpMin copyWithZone:zone];
        copy.windDirD = [self.windDirD copyWithZone:zone];
        copy.condTxtD = [self.condTxtD copyWithZone:zone];
        copy.windScN = [self.windScN copyWithZone:zone];
        copy.date = [self.date copyWithZone:zone];
        copy.tmpMax = [self.tmpMax copyWithZone:zone];
        copy.windDirN = [self.windDirN copyWithZone:zone];
        copy.condTxtN = [self.condTxtN copyWithZone:zone];
        copy.windScD = [self.windScD copyWithZone:zone];
        copy.condCodeD = [self.condCodeD copyWithZone:zone];
    }
    
    return copy;
}


@end
