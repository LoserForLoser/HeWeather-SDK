//
//  BaseClass.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "AlarmAllBaseClass.h"
#import "AlarmAllHeWeather6.h"


NSString *const kAlarmAllBaseClassHeWeather6 = @"HeWeather6";


@interface AlarmAllBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AlarmAllBaseClass

@synthesize heWeather6 = _heWeather6;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.heWeather6 = [AlarmAllHeWeather6 modelObjectWithDictionary:[dict objectForKey:kAlarmAllBaseClassHeWeather6]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.heWeather6 dictionaryRepresentation] forKey:kAlarmAllBaseClassHeWeather6];

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

    self.heWeather6 = [aDecoder decodeObjectForKey:kAlarmAllBaseClassHeWeather6];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_heWeather6 forKey:kAlarmAllBaseClassHeWeather6];
}

- (id)copyWithZone:(NSZone *)zone {
    AlarmAllBaseClass *copy = [[AlarmAllBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.heWeather6 = [self.heWeather6 copyWithZone:zone];
    }
    
    return copy;
}


@end
