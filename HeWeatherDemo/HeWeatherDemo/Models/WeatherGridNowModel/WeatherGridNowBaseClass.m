//
//  BaseClass.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherGridNowBaseClass.h"
#import "WeatherGridNowHeWeather6.h"


NSString *const kWeatherGridNowBaseClassHeWeather6 = @"HeWeather6";


@interface WeatherGridNowBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherGridNowBaseClass

@synthesize heWeather6 = _heWeather6;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedHeWeather6 = [dict objectForKey:kWeatherGridNowBaseClassHeWeather6];
    NSMutableArray *parsedHeWeather6 = [NSMutableArray array];
    
    if ([receivedHeWeather6 isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHeWeather6) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHeWeather6 addObject:[WeatherGridNowHeWeather6 modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHeWeather6 isKindOfClass:[NSDictionary class]]) {
       [parsedHeWeather6 addObject:[WeatherGridNowHeWeather6 modelObjectWithDictionary:(NSDictionary *)receivedHeWeather6]];
    }

    self.heWeather6 = [NSArray arrayWithArray:parsedHeWeather6];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForHeWeather6 = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.heWeather6) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHeWeather6 addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHeWeather6 addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHeWeather6] forKey:kWeatherGridNowBaseClassHeWeather6];

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

    self.heWeather6 = [aDecoder decodeObjectForKey:kWeatherGridNowBaseClassHeWeather6];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_heWeather6 forKey:kWeatherGridNowBaseClassHeWeather6];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherGridNowBaseClass *copy = [[WeatherGridNowBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.heWeather6 = [self.heWeather6 copyWithZone:zone];
    }
    
    return copy;
}


@end
