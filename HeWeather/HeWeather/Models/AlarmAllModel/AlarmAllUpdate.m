//
//  Update.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "AlarmAllUpdate.h"


NSString *const kAlarmAllUpdateLoc = @"loc";
NSString *const kAlarmAllUpdateUtc = @"utc";


@interface AlarmAllUpdate ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AlarmAllUpdate

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
            self.loc = [self objectOrNilForKey:kAlarmAllUpdateLoc fromDictionary:dict];
            self.utc = [self objectOrNilForKey:kAlarmAllUpdateUtc fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.loc forKey:kAlarmAllUpdateLoc];
    [mutableDict setValue:self.utc forKey:kAlarmAllUpdateUtc];

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

    self.loc = [aDecoder decodeObjectForKey:kAlarmAllUpdateLoc];
    self.utc = [aDecoder decodeObjectForKey:kAlarmAllUpdateUtc];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_loc forKey:kAlarmAllUpdateLoc];
    [aCoder encodeObject:_utc forKey:kAlarmAllUpdateUtc];
}

- (id)copyWithZone:(NSZone *)zone {
    AlarmAllUpdate *copy = [[AlarmAllUpdate alloc] init];
    
    
    
    if (copy) {

        copy.loc = [self.loc copyWithZone:zone];
        copy.utc = [self.utc copyWithZone:zone];
    }
    
    return copy;
}


@end
