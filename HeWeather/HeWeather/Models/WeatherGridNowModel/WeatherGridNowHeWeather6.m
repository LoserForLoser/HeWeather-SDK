//
//  HeWeather6.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherGridNowHeWeather6.h"
#import "WeatherGridNowGridNow.h"
#import "WeatherGridNowBasic.h"
#import "WeatherGridNowUpdate.h"


NSString *const kWeatherGridNowHeWeather6Status = @"status";
NSString *const kWeatherGridNowHeWeather6GridNow = @"grid_now";
NSString *const kWeatherGridNowHeWeather6Basic = @"basic";
NSString *const kWeatherGridNowHeWeather6Update = @"update";


@interface WeatherGridNowHeWeather6 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherGridNowHeWeather6

@synthesize status = _status;
@synthesize gridNow = _gridNow;
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
            self.status = [self objectOrNilForKey:kWeatherGridNowHeWeather6Status fromDictionary:dict];
            self.gridNow = [WeatherGridNowGridNow modelObjectWithDictionary:[dict objectForKey:kWeatherGridNowHeWeather6GridNow]];
            self.basic = [WeatherGridNowBasic modelObjectWithDictionary:[dict objectForKey:kWeatherGridNowHeWeather6Basic]];
            self.update = [WeatherGridNowUpdate modelObjectWithDictionary:[dict objectForKey:kWeatherGridNowHeWeather6Update]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kWeatherGridNowHeWeather6Status];
    [mutableDict setValue:[self.gridNow dictionaryRepresentation] forKey:kWeatherGridNowHeWeather6GridNow];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kWeatherGridNowHeWeather6Basic];
    [mutableDict setValue:[self.update dictionaryRepresentation] forKey:kWeatherGridNowHeWeather6Update];

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

    self.status = [aDecoder decodeObjectForKey:kWeatherGridNowHeWeather6Status];
    self.gridNow = [aDecoder decodeObjectForKey:kWeatherGridNowHeWeather6GridNow];
    self.basic = [aDecoder decodeObjectForKey:kWeatherGridNowHeWeather6Basic];
    self.update = [aDecoder decodeObjectForKey:kWeatherGridNowHeWeather6Update];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kWeatherGridNowHeWeather6Status];
    [aCoder encodeObject:_gridNow forKey:kWeatherGridNowHeWeather6GridNow];
    [aCoder encodeObject:_basic forKey:kWeatherGridNowHeWeather6Basic];
    [aCoder encodeObject:_update forKey:kWeatherGridNowHeWeather6Update];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherGridNowHeWeather6 *copy = [[WeatherGridNowHeWeather6 alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.gridNow = [self.gridNow copyWithZone:zone];
        copy.basic = [self.basic copyWithZone:zone];
        copy.update = [self.update copyWithZone:zone];
    }
    
    return copy;
}


@end
