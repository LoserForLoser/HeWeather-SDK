//
//  PcpnType.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherGridMinutePcpnType.h"


NSString *const kWeatherGridMinutePcpnTypePcpnType = @"pcpn_type";


@interface WeatherGridMinutePcpnType ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherGridMinutePcpnType

@synthesize pcpnType = _pcpnType;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.pcpnType = [self objectOrNilForKey:kWeatherGridMinutePcpnTypePcpnType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.pcpnType forKey:kWeatherGridMinutePcpnTypePcpnType];

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

    self.pcpnType = [aDecoder decodeObjectForKey:kWeatherGridMinutePcpnTypePcpnType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pcpnType forKey:kWeatherGridMinutePcpnTypePcpnType];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherGridMinutePcpnType *copy = [[WeatherGridMinutePcpnType alloc] init];
    
    
    
    if (copy) {

        copy.pcpnType = [self.pcpnType copyWithZone:zone];
    }
    
    return copy;
}


@end
