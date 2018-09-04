//
//  HeWeather6.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherLifestyleHeWeather6.h"
#import "WeatherLifestyleLifestyle.h"
#import "WeatherLifestyleBasic.h"
#import "WeatherLifestyleUpdate.h"


NSString *const kWeatherLifestyleHeWeather6Status = @"status";
NSString *const kWeatherLifestyleHeWeather6Lifestyle = @"lifestyle";
NSString *const kWeatherLifestyleHeWeather6Basic = @"basic";
NSString *const kWeatherLifestyleHeWeather6Update = @"update";


@interface WeatherLifestyleHeWeather6 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherLifestyleHeWeather6

@synthesize status = _status;
@synthesize lifestyle = _lifestyle;
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
            self.status = [self objectOrNilForKey:kWeatherLifestyleHeWeather6Status fromDictionary:dict];
    NSObject *receivedLifestyle = [dict objectForKey:kWeatherLifestyleHeWeather6Lifestyle];
    NSMutableArray *parsedLifestyle = [NSMutableArray array];
    
    if ([receivedLifestyle isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLifestyle) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLifestyle addObject:[WeatherLifestyleLifestyle modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLifestyle isKindOfClass:[NSDictionary class]]) {
       [parsedLifestyle addObject:[WeatherLifestyleLifestyle modelObjectWithDictionary:(NSDictionary *)receivedLifestyle]];
    }

    self.lifestyle = [NSArray arrayWithArray:parsedLifestyle];
            self.basic = [WeatherLifestyleBasic modelObjectWithDictionary:[dict objectForKey:kWeatherLifestyleHeWeather6Basic]];
            self.update = [WeatherLifestyleUpdate modelObjectWithDictionary:[dict objectForKey:kWeatherLifestyleHeWeather6Update]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kWeatherLifestyleHeWeather6Status];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLifestyle] forKey:kWeatherLifestyleHeWeather6Lifestyle];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kWeatherLifestyleHeWeather6Basic];
    [mutableDict setValue:[self.update dictionaryRepresentation] forKey:kWeatherLifestyleHeWeather6Update];

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

    self.status = [aDecoder decodeObjectForKey:kWeatherLifestyleHeWeather6Status];
    self.lifestyle = [aDecoder decodeObjectForKey:kWeatherLifestyleHeWeather6Lifestyle];
    self.basic = [aDecoder decodeObjectForKey:kWeatherLifestyleHeWeather6Basic];
    self.update = [aDecoder decodeObjectForKey:kWeatherLifestyleHeWeather6Update];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kWeatherLifestyleHeWeather6Status];
    [aCoder encodeObject:_lifestyle forKey:kWeatherLifestyleHeWeather6Lifestyle];
    [aCoder encodeObject:_basic forKey:kWeatherLifestyleHeWeather6Basic];
    [aCoder encodeObject:_update forKey:kWeatherLifestyleHeWeather6Update];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherLifestyleHeWeather6 *copy = [[WeatherLifestyleHeWeather6 alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.lifestyle = [self.lifestyle copyWithZone:zone];
        copy.basic = [self.basic copyWithZone:zone];
        copy.update = [self.update copyWithZone:zone];
    }
    
    return copy;
}


@end
