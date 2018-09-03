//
//  HeWeather6.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherHeWeather6.h"
#import "WeatherHourly.h"
#import "WeatherNow.h"
#import "WeatherDailyForecast.h"
#import "WeatherUpdate.h"
#import "WeatherBasic.h"
#import "WeatherLifestyle.h"


NSString *const kWeatherHeWeather6Status = @"status";
NSString *const kWeatherHeWeather6Hourly = @"hourly";
NSString *const kWeatherHeWeather6Now = @"now";
NSString *const kWeatherHeWeather6DailyForecast = @"daily_forecast";
NSString *const kWeatherHeWeather6Update = @"update";
NSString *const kWeatherHeWeather6Basic = @"basic";
NSString *const kWeatherHeWeather6Lifestyle = @"lifestyle";


@interface WeatherHeWeather6 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherHeWeather6

@synthesize status = _status;
@synthesize hourly = _hourly;
@synthesize now = _now;
@synthesize dailyForecast = _dailyForecast;
@synthesize update = _update;
@synthesize basic = _basic;
@synthesize lifestyle = _lifestyle;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [self objectOrNilForKey:kWeatherHeWeather6Status fromDictionary:dict];
    NSObject *receivedHourly = [dict objectForKey:kWeatherHeWeather6Hourly];
    NSMutableArray *parsedHourly = [NSMutableArray array];
    
    if ([receivedHourly isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHourly) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHourly addObject:[WeatherHourly modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHourly isKindOfClass:[NSDictionary class]]) {
       [parsedHourly addObject:[WeatherHourly modelObjectWithDictionary:(NSDictionary *)receivedHourly]];
    }

    self.hourly = [NSArray arrayWithArray:parsedHourly];
            self.now = [WeatherNow modelObjectWithDictionary:[dict objectForKey:kWeatherHeWeather6Now]];
    NSObject *receivedDailyForecast = [dict objectForKey:kWeatherHeWeather6DailyForecast];
    NSMutableArray *parsedDailyForecast = [NSMutableArray array];
    
    if ([receivedDailyForecast isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDailyForecast) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDailyForecast addObject:[WeatherDailyForecast modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDailyForecast isKindOfClass:[NSDictionary class]]) {
       [parsedDailyForecast addObject:[WeatherDailyForecast modelObjectWithDictionary:(NSDictionary *)receivedDailyForecast]];
    }

    self.dailyForecast = [NSArray arrayWithArray:parsedDailyForecast];
            self.update = [WeatherUpdate modelObjectWithDictionary:[dict objectForKey:kWeatherHeWeather6Update]];
            self.basic = [WeatherBasic modelObjectWithDictionary:[dict objectForKey:kWeatherHeWeather6Basic]];
    NSObject *receivedLifestyle = [dict objectForKey:kWeatherHeWeather6Lifestyle];
    NSMutableArray *parsedLifestyle = [NSMutableArray array];
    
    if ([receivedLifestyle isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLifestyle) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLifestyle addObject:[WeatherLifestyle modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLifestyle isKindOfClass:[NSDictionary class]]) {
       [parsedLifestyle addObject:[WeatherLifestyle modelObjectWithDictionary:(NSDictionary *)receivedLifestyle]];
    }

    self.lifestyle = [NSArray arrayWithArray:parsedLifestyle];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kWeatherHeWeather6Status];
    NSMutableArray *tempArrayForHourly = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.hourly) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHourly addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHourly addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHourly] forKey:kWeatherHeWeather6Hourly];
    [mutableDict setValue:[self.now dictionaryRepresentation] forKey:kWeatherHeWeather6Now];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDailyForecast] forKey:kWeatherHeWeather6DailyForecast];
    [mutableDict setValue:[self.update dictionaryRepresentation] forKey:kWeatherHeWeather6Update];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kWeatherHeWeather6Basic];
    NSMutableArray *tempArrayForLifestyle = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.lifestyle) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLifestyle addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLifestyle addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLifestyle] forKey:kWeatherHeWeather6Lifestyle];

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

    self.status = [aDecoder decodeObjectForKey:kWeatherHeWeather6Status];
    self.hourly = [aDecoder decodeObjectForKey:kWeatherHeWeather6Hourly];
    self.now = [aDecoder decodeObjectForKey:kWeatherHeWeather6Now];
    self.dailyForecast = [aDecoder decodeObjectForKey:kWeatherHeWeather6DailyForecast];
    self.update = [aDecoder decodeObjectForKey:kWeatherHeWeather6Update];
    self.basic = [aDecoder decodeObjectForKey:kWeatherHeWeather6Basic];
    self.lifestyle = [aDecoder decodeObjectForKey:kWeatherHeWeather6Lifestyle];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kWeatherHeWeather6Status];
    [aCoder encodeObject:_hourly forKey:kWeatherHeWeather6Hourly];
    [aCoder encodeObject:_now forKey:kWeatherHeWeather6Now];
    [aCoder encodeObject:_dailyForecast forKey:kWeatherHeWeather6DailyForecast];
    [aCoder encodeObject:_update forKey:kWeatherHeWeather6Update];
    [aCoder encodeObject:_basic forKey:kWeatherHeWeather6Basic];
    [aCoder encodeObject:_lifestyle forKey:kWeatherHeWeather6Lifestyle];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherHeWeather6 *copy = [[WeatherHeWeather6 alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.hourly = [self.hourly copyWithZone:zone];
        copy.now = [self.now copyWithZone:zone];
        copy.dailyForecast = [self.dailyForecast copyWithZone:zone];
        copy.update = [self.update copyWithZone:zone];
        copy.basic = [self.basic copyWithZone:zone];
        copy.lifestyle = [self.lifestyle copyWithZone:zone];
    }
    
    return copy;
}


@end
