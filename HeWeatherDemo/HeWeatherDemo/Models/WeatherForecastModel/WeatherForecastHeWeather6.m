//
//  HeWeather6.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherForecastHeWeather6.h"
#import "WeatherForecastBasic.h"
#import "WeatherForecastUpdate.h"
#import "WeatherForecastDailyForecast.h"


NSString *const kWeatherForecastHeWeather6Status = @"status";
NSString *const kWeatherForecastHeWeather6Basic = @"basic";
NSString *const kWeatherForecastHeWeather6Update = @"update";
NSString *const kWeatherForecastHeWeather6DailyForecast = @"daily_forecast";


@interface WeatherForecastHeWeather6 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherForecastHeWeather6

@synthesize status = _status;
@synthesize basic = _basic;
@synthesize update = _update;
@synthesize dailyForecast = _dailyForecast;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [self objectOrNilForKey:kWeatherForecastHeWeather6Status fromDictionary:dict];
            self.basic = [WeatherForecastBasic modelObjectWithDictionary:[dict objectForKey:kWeatherForecastHeWeather6Basic]];
            self.update = [WeatherForecastUpdate modelObjectWithDictionary:[dict objectForKey:kWeatherForecastHeWeather6Update]];
    NSObject *receivedDailyForecast = [dict objectForKey:kWeatherForecastHeWeather6DailyForecast];
    NSMutableArray *parsedDailyForecast = [NSMutableArray array];
    
    if ([receivedDailyForecast isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDailyForecast) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDailyForecast addObject:[WeatherForecastDailyForecast modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDailyForecast isKindOfClass:[NSDictionary class]]) {
       [parsedDailyForecast addObject:[WeatherForecastDailyForecast modelObjectWithDictionary:(NSDictionary *)receivedDailyForecast]];
    }

    self.dailyForecast = [NSArray arrayWithArray:parsedDailyForecast];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kWeatherForecastHeWeather6Status];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kWeatherForecastHeWeather6Basic];
    [mutableDict setValue:[self.update dictionaryRepresentation] forKey:kWeatherForecastHeWeather6Update];
    NSMutableArray *tempArrayForDailyForecast = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.dailyForecast) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDailyForecast addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDailyForecast addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDailyForecast] forKey:kWeatherForecastHeWeather6DailyForecast];

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

    self.status = [aDecoder decodeObjectForKey:kWeatherForecastHeWeather6Status];
    self.basic = [aDecoder decodeObjectForKey:kWeatherForecastHeWeather6Basic];
    self.update = [aDecoder decodeObjectForKey:kWeatherForecastHeWeather6Update];
    self.dailyForecast = [aDecoder decodeObjectForKey:kWeatherForecastHeWeather6DailyForecast];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kWeatherForecastHeWeather6Status];
    [aCoder encodeObject:_basic forKey:kWeatherForecastHeWeather6Basic];
    [aCoder encodeObject:_update forKey:kWeatherForecastHeWeather6Update];
    [aCoder encodeObject:_dailyForecast forKey:kWeatherForecastHeWeather6DailyForecast];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherForecastHeWeather6 *copy = [[WeatherForecastHeWeather6 alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.basic = [self.basic copyWithZone:zone];
        copy.update = [self.update copyWithZone:zone];
        copy.dailyForecast = [self.dailyForecast copyWithZone:zone];
    }
    
    return copy;
}


@end
