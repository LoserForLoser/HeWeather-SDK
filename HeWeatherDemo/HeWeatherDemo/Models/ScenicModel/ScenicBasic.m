//
//  Basic.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "ScenicBasic.h"


NSString *const kScenicBasicCnty = @"cnty";
NSString *const kScenicBasicTz = @"tz";
NSString *const kScenicBasicLocation = @"location";
NSString *const kScenicBasicLon = @"lon";
NSString *const kScenicBasicLat = @"lat";
NSString *const kScenicBasicParentCity = @"parent_city";
NSString *const kScenicBasicCid = @"cid";


@interface ScenicBasic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ScenicBasic

@synthesize cnty = _cnty;
@synthesize tz = _tz;
@synthesize location = _location;
@synthesize lon = _lon;
@synthesize lat = _lat;
@synthesize parentCity = _parentCity;
@synthesize cid = _cid;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.cnty = [self objectOrNilForKey:kScenicBasicCnty fromDictionary:dict];
            self.tz = [self objectOrNilForKey:kScenicBasicTz fromDictionary:dict];
            self.location = [self objectOrNilForKey:kScenicBasicLocation fromDictionary:dict];
            self.lon = [self objectOrNilForKey:kScenicBasicLon fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kScenicBasicLat fromDictionary:dict];
            self.parentCity = [self objectOrNilForKey:kScenicBasicParentCity fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kScenicBasicCid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.cnty forKey:kScenicBasicCnty];
    [mutableDict setValue:self.tz forKey:kScenicBasicTz];
    [mutableDict setValue:self.location forKey:kScenicBasicLocation];
    [mutableDict setValue:self.lon forKey:kScenicBasicLon];
    [mutableDict setValue:self.lat forKey:kScenicBasicLat];
    [mutableDict setValue:self.parentCity forKey:kScenicBasicParentCity];
    [mutableDict setValue:self.cid forKey:kScenicBasicCid];

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

    self.cnty = [aDecoder decodeObjectForKey:kScenicBasicCnty];
    self.tz = [aDecoder decodeObjectForKey:kScenicBasicTz];
    self.location = [aDecoder decodeObjectForKey:kScenicBasicLocation];
    self.lon = [aDecoder decodeObjectForKey:kScenicBasicLon];
    self.lat = [aDecoder decodeObjectForKey:kScenicBasicLat];
    self.parentCity = [aDecoder decodeObjectForKey:kScenicBasicParentCity];
    self.cid = [aDecoder decodeObjectForKey:kScenicBasicCid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_cnty forKey:kScenicBasicCnty];
    [aCoder encodeObject:_tz forKey:kScenicBasicTz];
    [aCoder encodeObject:_location forKey:kScenicBasicLocation];
    [aCoder encodeObject:_lon forKey:kScenicBasicLon];
    [aCoder encodeObject:_lat forKey:kScenicBasicLat];
    [aCoder encodeObject:_parentCity forKey:kScenicBasicParentCity];
    [aCoder encodeObject:_cid forKey:kScenicBasicCid];
}

- (id)copyWithZone:(NSZone *)zone {
    ScenicBasic *copy = [[ScenicBasic alloc] init];
    
    
    
    if (copy) {

        copy.cnty = [self.cnty copyWithZone:zone];
        copy.tz = [self.tz copyWithZone:zone];
        copy.location = [self.location copyWithZone:zone];
        copy.lon = [self.lon copyWithZone:zone];
        copy.lat = [self.lat copyWithZone:zone];
        copy.parentCity = [self.parentCity copyWithZone:zone];
        copy.cid = [self.cid copyWithZone:zone];
    }
    
    return copy;
}


@end
