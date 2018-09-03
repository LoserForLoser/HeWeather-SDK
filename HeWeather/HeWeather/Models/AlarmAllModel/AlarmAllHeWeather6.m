//
//  HeWeather6.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "AlarmAllHeWeather6.h"
#import "AlarmAllAlarmList.h"
#import "AlarmAllUpdate.h"


NSString *const kAlarmAllHeWeather6Status = @"status";
NSString *const kAlarmAllHeWeather6AlarmList = @"alarm_list";
NSString *const kAlarmAllHeWeather6Update = @"update";


@interface AlarmAllHeWeather6 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AlarmAllHeWeather6

@synthesize status = _status;
@synthesize alarmList = _alarmList;
@synthesize update = _update;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [self objectOrNilForKey:kAlarmAllHeWeather6Status fromDictionary:dict];
    NSObject *receivedAlarmList = [dict objectForKey:kAlarmAllHeWeather6AlarmList];
    NSMutableArray *parsedAlarmList = [NSMutableArray array];
    
    if ([receivedAlarmList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAlarmList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAlarmList addObject:[AlarmAllAlarmList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAlarmList isKindOfClass:[NSDictionary class]]) {
       [parsedAlarmList addObject:[AlarmAllAlarmList modelObjectWithDictionary:(NSDictionary *)receivedAlarmList]];
    }

    self.alarmList = [NSArray arrayWithArray:parsedAlarmList];
            self.update = [AlarmAllUpdate modelObjectWithDictionary:[dict objectForKey:kAlarmAllHeWeather6Update]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kAlarmAllHeWeather6Status];
    NSMutableArray *tempArrayForAlarmList = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.alarmList) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAlarmList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAlarmList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAlarmList] forKey:kAlarmAllHeWeather6AlarmList];
    [mutableDict setValue:[self.update dictionaryRepresentation] forKey:kAlarmAllHeWeather6Update];

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

    self.status = [aDecoder decodeObjectForKey:kAlarmAllHeWeather6Status];
    self.alarmList = [aDecoder decodeObjectForKey:kAlarmAllHeWeather6AlarmList];
    self.update = [aDecoder decodeObjectForKey:kAlarmAllHeWeather6Update];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kAlarmAllHeWeather6Status];
    [aCoder encodeObject:_alarmList forKey:kAlarmAllHeWeather6AlarmList];
    [aCoder encodeObject:_update forKey:kAlarmAllHeWeather6Update];
}

- (id)copyWithZone:(NSZone *)zone {
    AlarmAllHeWeather6 *copy = [[AlarmAllHeWeather6 alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.alarmList = [self.alarmList copyWithZone:zone];
        copy.update = [self.update copyWithZone:zone];
    }
    
    return copy;
}


@end
