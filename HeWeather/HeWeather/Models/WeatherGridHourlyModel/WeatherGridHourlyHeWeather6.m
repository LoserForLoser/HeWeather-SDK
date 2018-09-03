//
//  HeWeather6.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherGridHourlyHeWeather6.h"
#import "WeatherGridHourlyGridHourly.h"
#import "WeatherGridHourlyBasic.h"
#import "WeatherGridHourlyUpdate.h"


NSString *const kWeatherGridHourlyHeWeather6Status = @"status";
NSString *const kWeatherGridHourlyHeWeather6GridHourly = @"grid_hourly";
NSString *const kWeatherGridHourlyHeWeather6Basic = @"basic";
NSString *const kWeatherGridHourlyHeWeather6Update = @"update";


@interface WeatherGridHourlyHeWeather6 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherGridHourlyHeWeather6

@synthesize status = _status;
@synthesize gridHourly = _gridHourly;
@synthesize basic = _basic;
@synthesize update = _update;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [self objectOrNilForKey:kWeatherGridHourlyHeWeather6Status fromDictionary:dict];
    NSObject *receivedGridHourly = [dict objectForKey:kWeatherGridHourlyHeWeather6GridHourly];
    NSMutableArray *parsedGridHourly = [NSMutableArray array];
    
    if ([receivedGridHourly isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGridHourly) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGridHourly addObject:[WeatherGridHourlyGridHourly modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGridHourly isKindOfClass:[NSDictionary class]]) {
       [parsedGridHourly addObject:[WeatherGridHourlyGridHourly modelObjectWithDictionary:(NSDictionary *)receivedGridHourly]];
    }

    self.gridHourly = [NSArray arrayWithArray:parsedGridHourly];
            self.basic = [WeatherGridHourlyBasic modelObjectWithDictionary:[dict objectForKey:kWeatherGridHourlyHeWeather6Basic]];
            self.update = [WeatherGridHourlyUpdate modelObjectWithDictionary:[dict objectForKey:kWeatherGridHourlyHeWeather6Update]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kWeatherGridHourlyHeWeather6Status];
    NSMutableArray *tempArrayForGridHourly = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.gridHourly) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForGridHourly addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForGridHourly addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGridHourly] forKey:kWeatherGridHourlyHeWeather6GridHourly];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kWeatherGridHourlyHeWeather6Basic];
    [mutableDict setValue:[self.update dictionaryRepresentation] forKey:kWeatherGridHourlyHeWeather6Update];

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

    self.status = [aDecoder decodeObjectForKey:kWeatherGridHourlyHeWeather6Status];
    self.gridHourly = [aDecoder decodeObjectForKey:kWeatherGridHourlyHeWeather6GridHourly];
    self.basic = [aDecoder decodeObjectForKey:kWeatherGridHourlyHeWeather6Basic];
    self.update = [aDecoder decodeObjectForKey:kWeatherGridHourlyHeWeather6Update];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kWeatherGridHourlyHeWeather6Status];
    [aCoder encodeObject:_gridHourly forKey:kWeatherGridHourlyHeWeather6GridHourly];
    [aCoder encodeObject:_basic forKey:kWeatherGridHourlyHeWeather6Basic];
    [aCoder encodeObject:_update forKey:kWeatherGridHourlyHeWeather6Update];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherGridHourlyHeWeather6 *copy = [[WeatherGridHourlyHeWeather6 alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.gridHourly = [self.gridHourly copyWithZone:zone];
        copy.basic = [self.basic copyWithZone:zone];
        copy.update = [self.update copyWithZone:zone];
    }
    
    return copy;
}


@end
