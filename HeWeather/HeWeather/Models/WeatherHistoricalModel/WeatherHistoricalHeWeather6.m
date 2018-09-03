//
//  HeWeather6.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherHistoricalHeWeather6.h"
#import "WeatherHistoricalBasic.h"
#import "WeatherHistoricalDailyWeather.h"
#import "WeatherHistoricalHourlyWeather.h"


NSString *const kWeatherHistoricalHeWeather6Status = @"status";
NSString *const kWeatherHistoricalHeWeather6Basic = @"basic";
NSString *const kWeatherHistoricalHeWeather6DailyWeather = @"daily_weather";
NSString *const kWeatherHistoricalHeWeather6HourlyWeather = @"hourly_weather";


@interface WeatherHistoricalHeWeather6 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherHistoricalHeWeather6

@synthesize status = _status;
@synthesize basic = _basic;
@synthesize dailyWeather = _dailyWeather;
@synthesize hourlyWeather = _hourlyWeather;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [self objectOrNilForKey:kWeatherHistoricalHeWeather6Status fromDictionary:dict];
            self.basic = [WeatherHistoricalBasic modelObjectWithDictionary:[dict objectForKey:kWeatherHistoricalHeWeather6Basic]];
            self.dailyWeather = [WeatherHistoricalDailyWeather modelObjectWithDictionary:[dict objectForKey:kWeatherHistoricalHeWeather6DailyWeather]];
    NSObject *receivedHourlyWeather = [dict objectForKey:kWeatherHistoricalHeWeather6HourlyWeather];
    NSMutableArray *parsedHourlyWeather = [NSMutableArray array];
    
    if ([receivedHourlyWeather isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHourlyWeather) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHourlyWeather addObject:[WeatherHistoricalHourlyWeather modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHourlyWeather isKindOfClass:[NSDictionary class]]) {
       [parsedHourlyWeather addObject:[WeatherHistoricalHourlyWeather modelObjectWithDictionary:(NSDictionary *)receivedHourlyWeather]];
    }

    self.hourlyWeather = [NSArray arrayWithArray:parsedHourlyWeather];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kWeatherHistoricalHeWeather6Status];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kWeatherHistoricalHeWeather6Basic];
    [mutableDict setValue:[self.dailyWeather dictionaryRepresentation] forKey:kWeatherHistoricalHeWeather6DailyWeather];
    NSMutableArray *tempArrayForHourlyWeather = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.hourlyWeather) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHourlyWeather addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHourlyWeather addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHourlyWeather] forKey:kWeatherHistoricalHeWeather6HourlyWeather];

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

    self.status = [aDecoder decodeObjectForKey:kWeatherHistoricalHeWeather6Status];
    self.basic = [aDecoder decodeObjectForKey:kWeatherHistoricalHeWeather6Basic];
    self.dailyWeather = [aDecoder decodeObjectForKey:kWeatherHistoricalHeWeather6DailyWeather];
    self.hourlyWeather = [aDecoder decodeObjectForKey:kWeatherHistoricalHeWeather6HourlyWeather];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kWeatherHistoricalHeWeather6Status];
    [aCoder encodeObject:_basic forKey:kWeatherHistoricalHeWeather6Basic];
    [aCoder encodeObject:_dailyWeather forKey:kWeatherHistoricalHeWeather6DailyWeather];
    [aCoder encodeObject:_hourlyWeather forKey:kWeatherHistoricalHeWeather6HourlyWeather];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherHistoricalHeWeather6 *copy = [[WeatherHistoricalHeWeather6 alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.basic = [self.basic copyWithZone:zone];
        copy.dailyWeather = [self.dailyWeather copyWithZone:zone];
        copy.hourlyWeather = [self.hourlyWeather copyWithZone:zone];
    }
    
    return copy;
}


@end
