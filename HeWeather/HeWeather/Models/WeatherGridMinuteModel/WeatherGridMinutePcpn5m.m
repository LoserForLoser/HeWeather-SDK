//
//  Pcpn5m.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherGridMinutePcpn5m.h"


NSString *const kPcpn5mPcpn = @"pcpn";
NSString *const kPcpn5mTime = @"time";


@interface WeatherGridMinutePcpn5m ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherGridMinutePcpn5m

@synthesize pcpn = _pcpn;
@synthesize time = _time;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.pcpn = [self objectOrNilForKey:kPcpn5mPcpn fromDictionary:dict];
            self.time = [self objectOrNilForKey:kPcpn5mTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.pcpn forKey:kPcpn5mPcpn];
    [mutableDict setValue:self.time forKey:kPcpn5mTime];

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

    self.pcpn = [aDecoder decodeObjectForKey:kPcpn5mPcpn];
    self.time = [aDecoder decodeObjectForKey:kPcpn5mTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pcpn forKey:kPcpn5mPcpn];
    [aCoder encodeObject:_time forKey:kPcpn5mTime];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherGridMinutePcpn5m *copy = [[WeatherGridMinutePcpn5m alloc] init];
    
    
    
    if (copy) {

        copy.pcpn = [self.pcpn copyWithZone:zone];
        copy.time = [self.time copyWithZone:zone];
    }
    
    return copy;
}


@end
