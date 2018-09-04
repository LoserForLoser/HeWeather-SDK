//
//  HeWeather6.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherGridForecastHeWeather6.h"
#import "WeatherGridForecastBasic.h"
#import "WeatherGridForecastGridForecast.h"
#import "WeatherGridForecastUpdate.h"


NSString *const kWeatherGridForecastHeWeather6Status = @"status";
NSString *const kWeatherGridForecastHeWeather6Basic = @"basic";
NSString *const kWeatherGridForecastHeWeather6GridForecast = @"grid_forecast";
NSString *const kWeatherGridForecastHeWeather6Update = @"update";


@interface WeatherGridForecastHeWeather6 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherGridForecastHeWeather6

@synthesize status = _status;
@synthesize basic = _basic;
@synthesize gridForecast = _gridForecast;
@synthesize update = _update;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [self objectOrNilForKey:kWeatherGridForecastHeWeather6Status fromDictionary:dict];
            self.basic = [WeatherGridForecastBasic modelObjectWithDictionary:[dict objectForKey:kWeatherGridForecastHeWeather6Basic]];
    NSObject *receivedGridForecast = [dict objectForKey:kWeatherGridForecastHeWeather6GridForecast];
    NSMutableArray *parsedGridForecast = [NSMutableArray array];
    
    if ([receivedGridForecast isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGridForecast) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGridForecast addObject:[WeatherGridForecastGridForecast modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGridForecast isKindOfClass:[NSDictionary class]]) {
       [parsedGridForecast addObject:[WeatherGridForecastGridForecast modelObjectWithDictionary:(NSDictionary *)receivedGridForecast]];
    }

    self.gridForecast = [NSArray arrayWithArray:parsedGridForecast];
            self.update = [WeatherGridForecastUpdate modelObjectWithDictionary:[dict objectForKey:kWeatherGridForecastHeWeather6Update]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kWeatherGridForecastHeWeather6Status];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kWeatherGridForecastHeWeather6Basic];
    NSMutableArray *tempArrayForGridForecast = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.gridForecast) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForGridForecast addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForGridForecast addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGridForecast] forKey:kWeatherGridForecastHeWeather6GridForecast];
    [mutableDict setValue:[self.update dictionaryRepresentation] forKey:kWeatherGridForecastHeWeather6Update];

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

    self.status = [aDecoder decodeObjectForKey:kWeatherGridForecastHeWeather6Status];
    self.basic = [aDecoder decodeObjectForKey:kWeatherGridForecastHeWeather6Basic];
    self.gridForecast = [aDecoder decodeObjectForKey:kWeatherGridForecastHeWeather6GridForecast];
    self.update = [aDecoder decodeObjectForKey:kWeatherGridForecastHeWeather6Update];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kWeatherGridForecastHeWeather6Status];
    [aCoder encodeObject:_basic forKey:kWeatherGridForecastHeWeather6Basic];
    [aCoder encodeObject:_gridForecast forKey:kWeatherGridForecastHeWeather6GridForecast];
    [aCoder encodeObject:_update forKey:kWeatherGridForecastHeWeather6Update];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherGridForecastHeWeather6 *copy = [[WeatherGridForecastHeWeather6 alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.basic = [self.basic copyWithZone:zone];
        copy.gridForecast = [self.gridForecast copyWithZone:zone];
        copy.update = [self.update copyWithZone:zone];
    }
    
    return copy;
}


@end
