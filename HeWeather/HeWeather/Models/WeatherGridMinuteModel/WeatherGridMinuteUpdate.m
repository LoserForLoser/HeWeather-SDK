//
//  Update.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherGridMinuteUpdate.h"


NSString *const kWeatherGridMinuteUpdateLoc = @"loc";
NSString *const kWeatherGridMinuteUpdateUtc = @"utc";


@interface WeatherGridMinuteUpdate ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherGridMinuteUpdate

@synthesize loc = _loc;
@synthesize utc = _utc;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.loc = [self objectOrNilForKey:kWeatherGridMinuteUpdateLoc fromDictionary:dict];
            self.utc = [self objectOrNilForKey:kWeatherGridMinuteUpdateUtc fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.loc forKey:kWeatherGridMinuteUpdateLoc];
    [mutableDict setValue:self.utc forKey:kWeatherGridMinuteUpdateUtc];

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

    self.loc = [aDecoder decodeObjectForKey:kWeatherGridMinuteUpdateLoc];
    self.utc = [aDecoder decodeObjectForKey:kWeatherGridMinuteUpdateUtc];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_loc forKey:kWeatherGridMinuteUpdateLoc];
    [aCoder encodeObject:_utc forKey:kWeatherGridMinuteUpdateUtc];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherGridMinuteUpdate *copy = [[WeatherGridMinuteUpdate alloc] init];
    
    
    
    if (copy) {

        copy.loc = [self.loc copyWithZone:zone];
        copy.utc = [self.utc copyWithZone:zone];
    }
    
    return copy;
}


@end
