//
//  HeWeather6.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "AlarmHeWeather6.h"
#import "AlarmBasic.h"
#import "AlarmUpdate.h"
#import "AlarmAlarm.h"


NSString *const kAlarmHeWeather6Status = @"status";
NSString *const kAlarmHeWeather6Basic = @"basic";
NSString *const kAlarmHeWeather6Update = @"update";
NSString *const kAlarmHeWeather6Alarm = @"alarm";


@interface AlarmHeWeather6 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AlarmHeWeather6

@synthesize status = _status;
@synthesize basic = _basic;
@synthesize update = _update;
@synthesize alarm = _alarm;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [self objectOrNilForKey:kAlarmHeWeather6Status fromDictionary:dict];
            self.basic = [AlarmBasic modelObjectWithDictionary:[dict objectForKey:kAlarmHeWeather6Basic]];
            self.update = [AlarmUpdate modelObjectWithDictionary:[dict objectForKey:kAlarmHeWeather6Update]];
    NSObject *receivedAlarm = [dict objectForKey:kAlarmHeWeather6Alarm];
    NSMutableArray *parsedAlarm = [NSMutableArray array];
    
    if ([receivedAlarm isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAlarm) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAlarm addObject:[AlarmAlarm modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAlarm isKindOfClass:[NSDictionary class]]) {
       [parsedAlarm addObject:[AlarmAlarm modelObjectWithDictionary:(NSDictionary *)receivedAlarm]];
    }

    self.alarm = [NSArray arrayWithArray:parsedAlarm];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kAlarmHeWeather6Status];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kAlarmHeWeather6Basic];
    [mutableDict setValue:[self.update dictionaryRepresentation] forKey:kAlarmHeWeather6Update];
    NSMutableArray *tempArrayForAlarm = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.alarm) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAlarm addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAlarm addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAlarm] forKey:kAlarmHeWeather6Alarm];

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

    self.status = [aDecoder decodeObjectForKey:kAlarmHeWeather6Status];
    self.basic = [aDecoder decodeObjectForKey:kAlarmHeWeather6Basic];
    self.update = [aDecoder decodeObjectForKey:kAlarmHeWeather6Update];
    self.alarm = [aDecoder decodeObjectForKey:kAlarmHeWeather6Alarm];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kAlarmHeWeather6Status];
    [aCoder encodeObject:_basic forKey:kAlarmHeWeather6Basic];
    [aCoder encodeObject:_update forKey:kAlarmHeWeather6Update];
    [aCoder encodeObject:_alarm forKey:kAlarmHeWeather6Alarm];
}

- (id)copyWithZone:(NSZone *)zone {
    AlarmHeWeather6 *copy = [[AlarmHeWeather6 alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.basic = [self.basic copyWithZone:zone];
        copy.update = [self.update copyWithZone:zone];
        copy.alarm = [self.alarm copyWithZone:zone];
    }
    
    return copy;
}


@end
