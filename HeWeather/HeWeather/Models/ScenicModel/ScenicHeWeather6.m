//
//  HeWeather6.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "ScenicHeWeather6.h"
#import "ScenicBasic.h"
#import "ScenicUpdate.h"
#import "ScenicDailyForecast.h"


NSString *const kScenicHeWeather6Status = @"status";
NSString *const kScenicHeWeather6Basic = @"basic";
NSString *const kScenicHeWeather6Update = @"update";
NSString *const kScenicHeWeather6DailyForecast = @"daily_forecast";


@interface ScenicHeWeather6 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ScenicHeWeather6

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
            self.status = [self objectOrNilForKey:kScenicHeWeather6Status fromDictionary:dict];
            self.basic = [ScenicBasic modelObjectWithDictionary:[dict objectForKey:kScenicHeWeather6Basic]];
            self.update = [ScenicUpdate modelObjectWithDictionary:[dict objectForKey:kScenicHeWeather6Update]];
    NSObject *receivedDailyForecast = [dict objectForKey:kScenicHeWeather6DailyForecast];
    NSMutableArray *parsedDailyForecast = [NSMutableArray array];
    
    if ([receivedDailyForecast isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDailyForecast) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDailyForecast addObject:[ScenicDailyForecast modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDailyForecast isKindOfClass:[NSDictionary class]]) {
       [parsedDailyForecast addObject:[ScenicDailyForecast modelObjectWithDictionary:(NSDictionary *)receivedDailyForecast]];
    }

    self.dailyForecast = [NSArray arrayWithArray:parsedDailyForecast];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kScenicHeWeather6Status];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kScenicHeWeather6Basic];
    [mutableDict setValue:[self.update dictionaryRepresentation] forKey:kScenicHeWeather6Update];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDailyForecast] forKey:kScenicHeWeather6DailyForecast];

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

    self.status = [aDecoder decodeObjectForKey:kScenicHeWeather6Status];
    self.basic = [aDecoder decodeObjectForKey:kScenicHeWeather6Basic];
    self.update = [aDecoder decodeObjectForKey:kScenicHeWeather6Update];
    self.dailyForecast = [aDecoder decodeObjectForKey:kScenicHeWeather6DailyForecast];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kScenicHeWeather6Status];
    [aCoder encodeObject:_basic forKey:kScenicHeWeather6Basic];
    [aCoder encodeObject:_update forKey:kScenicHeWeather6Update];
    [aCoder encodeObject:_dailyForecast forKey:kScenicHeWeather6DailyForecast];
}

- (id)copyWithZone:(NSZone *)zone {
    ScenicHeWeather6 *copy = [[ScenicHeWeather6 alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.basic = [self.basic copyWithZone:zone];
        copy.update = [self.update copyWithZone:zone];
        copy.dailyForecast = [self.dailyForecast copyWithZone:zone];
    }
    
    return copy;
}


@end
