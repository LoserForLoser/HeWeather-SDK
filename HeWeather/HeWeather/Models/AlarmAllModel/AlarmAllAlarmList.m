//
//  AlarmList.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "AlarmAllAlarmList.h"


NSString *const kAlarmListStat = @"stat";
NSString *const kAlarmListTitle = @"title";
NSString *const kAlarmListLevel = @"level";
NSString *const kAlarmListType = @"type";
NSString *const kAlarmListTxt = @"txt";
NSString *const kAlarmListCid = @"cid";


@interface AlarmAllAlarmList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AlarmAllAlarmList

@synthesize stat = _stat;
@synthesize title = _title;
@synthesize level = _level;
@synthesize type = _type;
@synthesize txt = _txt;
@synthesize cid = _cid;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.stat = [self objectOrNilForKey:kAlarmListStat fromDictionary:dict];
            self.title = [self objectOrNilForKey:kAlarmListTitle fromDictionary:dict];
            self.level = [self objectOrNilForKey:kAlarmListLevel fromDictionary:dict];
            self.type = [self objectOrNilForKey:kAlarmListType fromDictionary:dict];
            self.txt = [self objectOrNilForKey:kAlarmListTxt fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kAlarmListCid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.stat forKey:kAlarmListStat];
    [mutableDict setValue:self.title forKey:kAlarmListTitle];
    [mutableDict setValue:self.level forKey:kAlarmListLevel];
    [mutableDict setValue:self.type forKey:kAlarmListType];
    [mutableDict setValue:self.txt forKey:kAlarmListTxt];
    [mutableDict setValue:self.cid forKey:kAlarmListCid];

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

    self.stat = [aDecoder decodeObjectForKey:kAlarmListStat];
    self.title = [aDecoder decodeObjectForKey:kAlarmListTitle];
    self.level = [aDecoder decodeObjectForKey:kAlarmListLevel];
    self.type = [aDecoder decodeObjectForKey:kAlarmListType];
    self.txt = [aDecoder decodeObjectForKey:kAlarmListTxt];
    self.cid = [aDecoder decodeObjectForKey:kAlarmListCid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_stat forKey:kAlarmListStat];
    [aCoder encodeObject:_title forKey:kAlarmListTitle];
    [aCoder encodeObject:_level forKey:kAlarmListLevel];
    [aCoder encodeObject:_type forKey:kAlarmListType];
    [aCoder encodeObject:_txt forKey:kAlarmListTxt];
    [aCoder encodeObject:_cid forKey:kAlarmListCid];
}

- (id)copyWithZone:(NSZone *)zone {
    AlarmAllAlarmList *copy = [[AlarmAllAlarmList alloc] init];
    
    
    
    if (copy) {

        copy.stat = [self.stat copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.level = [self.level copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.txt = [self.txt copyWithZone:zone];
        copy.cid = [self.cid copyWithZone:zone];
    }
    
    return copy;
}


@end
