//
//  GridMinuteForecast.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherGridMinuteGridMinuteForecast.h"


NSString *const kGridMinuteForecastDate = @"date";


@interface WeatherGridMinuteGridMinuteForecast ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherGridMinuteGridMinuteForecast

@synthesize date = _date;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.date = [self objectOrNilForKey:kGridMinuteForecastDate fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.date forKey:kGridMinuteForecastDate];

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

    self.date = [aDecoder decodeObjectForKey:kGridMinuteForecastDate];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_date forKey:kGridMinuteForecastDate];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherGridMinuteGridMinuteForecast *copy = [[WeatherGridMinuteGridMinuteForecast alloc] init];
    
    
    
    if (copy) {

        copy.date = [self.date copyWithZone:zone];
    }
    
    return copy;
}


@end
