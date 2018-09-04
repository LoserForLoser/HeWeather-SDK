//
//  HeWeather6.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherNowHeWeather6.h"
#import "WeatherNowBasic.h"
#import "WeatherNowNow.h"
#import "WeatherNowUpdate.h"


NSString *const kWeatherNowHeWeather6Status = @"status";
NSString *const kWeatherNowHeWeather6Basic = @"basic";
NSString *const kWeatherNowHeWeather6Now = @"now";
NSString *const kWeatherNowHeWeather6Update = @"update";


@interface WeatherNowHeWeather6 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherNowHeWeather6

@synthesize status = _status;
@synthesize basic = _basic;
@synthesize now = _now;
@synthesize update = _update;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [self objectOrNilForKey:kWeatherNowHeWeather6Status fromDictionary:dict];
            self.basic = [WeatherNowBasic modelObjectWithDictionary:[dict objectForKey:kWeatherNowHeWeather6Basic]];
            self.now = [WeatherNowNow modelObjectWithDictionary:[dict objectForKey:kWeatherNowHeWeather6Now]];
            self.update = [WeatherNowUpdate modelObjectWithDictionary:[dict objectForKey:kWeatherNowHeWeather6Update]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kWeatherNowHeWeather6Status];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kWeatherNowHeWeather6Basic];
    [mutableDict setValue:[self.now dictionaryRepresentation] forKey:kWeatherNowHeWeather6Now];
    [mutableDict setValue:[self.update dictionaryRepresentation] forKey:kWeatherNowHeWeather6Update];

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

    self.status = [aDecoder decodeObjectForKey:kWeatherNowHeWeather6Status];
    self.basic = [aDecoder decodeObjectForKey:kWeatherNowHeWeather6Basic];
    self.now = [aDecoder decodeObjectForKey:kWeatherNowHeWeather6Now];
    self.update = [aDecoder decodeObjectForKey:kWeatherNowHeWeather6Update];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kWeatherNowHeWeather6Status];
    [aCoder encodeObject:_basic forKey:kWeatherNowHeWeather6Basic];
    [aCoder encodeObject:_now forKey:kWeatherNowHeWeather6Now];
    [aCoder encodeObject:_update forKey:kWeatherNowHeWeather6Update];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherNowHeWeather6 *copy = [[WeatherNowHeWeather6 alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.basic = [self.basic copyWithZone:zone];
        copy.now = [self.now copyWithZone:zone];
        copy.update = [self.update copyWithZone:zone];
    }
    
    return copy;
}


@end
