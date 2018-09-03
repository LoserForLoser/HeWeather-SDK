//
//  HeWeather6.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherHourlyHeWeather6.h"
#import "WeatherHourlyBasic.h"
#import "WeatherHourlyUpdate.h"
#import "WeatherHourlyHourly.h"


NSString *const kWeatherHourlyHeWeather6Status = @"status";
NSString *const kWeatherHourlyHeWeather6Basic = @"basic";
NSString *const kWeatherHourlyHeWeather6Update = @"update";
NSString *const kWeatherHourlyHeWeather6Hourly = @"hourly";


@interface WeatherHourlyHeWeather6 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherHourlyHeWeather6

@synthesize status = _status;
@synthesize basic = _basic;
@synthesize update = _update;
@synthesize hourly = _hourly;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [self objectOrNilForKey:kWeatherHourlyHeWeather6Status fromDictionary:dict];
            self.basic = [WeatherHourlyBasic modelObjectWithDictionary:[dict objectForKey:kWeatherHourlyHeWeather6Basic]];
            self.update = [WeatherHourlyUpdate modelObjectWithDictionary:[dict objectForKey:kWeatherHourlyHeWeather6Update]];
    NSObject *receivedHourly = [dict objectForKey:kWeatherHourlyHeWeather6Hourly];
    NSMutableArray *parsedHourly = [NSMutableArray array];
    
    if ([receivedHourly isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHourly) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHourly addObject:[WeatherHourlyHourly modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHourly isKindOfClass:[NSDictionary class]]) {
       [parsedHourly addObject:[WeatherHourlyHourly modelObjectWithDictionary:(NSDictionary *)receivedHourly]];
    }

    self.hourly = [NSArray arrayWithArray:parsedHourly];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kWeatherHourlyHeWeather6Status];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kWeatherHourlyHeWeather6Basic];
    [mutableDict setValue:[self.update dictionaryRepresentation] forKey:kWeatherHourlyHeWeather6Update];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHourly] forKey:kWeatherHourlyHeWeather6Hourly];

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

    self.status = [aDecoder decodeObjectForKey:kWeatherHourlyHeWeather6Status];
    self.basic = [aDecoder decodeObjectForKey:kWeatherHourlyHeWeather6Basic];
    self.update = [aDecoder decodeObjectForKey:kWeatherHourlyHeWeather6Update];
    self.hourly = [aDecoder decodeObjectForKey:kWeatherHourlyHeWeather6Hourly];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kWeatherHourlyHeWeather6Status];
    [aCoder encodeObject:_basic forKey:kWeatherHourlyHeWeather6Basic];
    [aCoder encodeObject:_update forKey:kWeatherHourlyHeWeather6Update];
    [aCoder encodeObject:_hourly forKey:kWeatherHourlyHeWeather6Hourly];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherHourlyHeWeather6 *copy = [[WeatherHourlyHeWeather6 alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.basic = [self.basic copyWithZone:zone];
        copy.update = [self.update copyWithZone:zone];
        copy.hourly = [self.hourly copyWithZone:zone];
    }
    
    return copy;
}


@end
