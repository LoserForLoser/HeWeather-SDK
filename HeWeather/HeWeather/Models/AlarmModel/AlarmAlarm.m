//
//  Alarm.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "AlarmAlarm.h"


NSString *const kAlarmTitle = @"title";
NSString *const kAlarmLevel = @"level";
NSString *const kAlarmTxt = @"txt";
NSString *const kAlarmStat = @"stat";
NSString *const kAlarmType = @"type";


@interface AlarmAlarm ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AlarmAlarm

@synthesize title = _title;
@synthesize level = _level;
@synthesize txt = _txt;
@synthesize stat = _stat;
@synthesize type = _type;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.title = [self objectOrNilForKey:kAlarmTitle fromDictionary:dict];
            self.level = [self objectOrNilForKey:kAlarmLevel fromDictionary:dict];
            self.txt = [self objectOrNilForKey:kAlarmTxt fromDictionary:dict];
            self.stat = [self objectOrNilForKey:kAlarmStat fromDictionary:dict];
            self.type = [self objectOrNilForKey:kAlarmType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kAlarmTitle];
    [mutableDict setValue:self.level forKey:kAlarmLevel];
    [mutableDict setValue:self.txt forKey:kAlarmTxt];
    [mutableDict setValue:self.stat forKey:kAlarmStat];
    [mutableDict setValue:self.type forKey:kAlarmType];

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

    self.title = [aDecoder decodeObjectForKey:kAlarmTitle];
    self.level = [aDecoder decodeObjectForKey:kAlarmLevel];
    self.txt = [aDecoder decodeObjectForKey:kAlarmTxt];
    self.stat = [aDecoder decodeObjectForKey:kAlarmStat];
    self.type = [aDecoder decodeObjectForKey:kAlarmType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kAlarmTitle];
    [aCoder encodeObject:_level forKey:kAlarmLevel];
    [aCoder encodeObject:_txt forKey:kAlarmTxt];
    [aCoder encodeObject:_stat forKey:kAlarmStat];
    [aCoder encodeObject:_type forKey:kAlarmType];
}

- (id)copyWithZone:(NSZone *)zone {
    AlarmAlarm *copy = [[AlarmAlarm alloc] init];
    
    
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.level = [self.level copyWithZone:zone];
        copy.txt = [self.txt copyWithZone:zone];
        copy.stat = [self.stat copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
    }
    
    return copy;
}


@end
