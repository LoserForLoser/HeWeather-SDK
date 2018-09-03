//
//  SolarElevationAngle.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "SolarElevationAngleSolarElevationAngle.h"


NSString *const kSolarElevationAngleSolarElevationAngleHourAngle = @"hour_angle";
NSString *const kSolarElevationAngleSolarElevationAngleSolarAzimuthAngle = @"solar_azimuth_angle";
NSString *const kSolarElevationAngleSolarElevationAngleSolarElevationAngle = @"solar_elevation_angle";
NSString *const kSolarElevationAngleSolarElevationAngleSolarHour = @"solar_hour";


@interface SolarElevationAngleSolarElevationAngle ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SolarElevationAngleSolarElevationAngle

@synthesize hourAngle = _hourAngle;
@synthesize solarAzimuthAngle = _solarAzimuthAngle;
@synthesize solarElevationAngle = _solarElevationAngle;
@synthesize solarHour = _solarHour;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.hourAngle = [self objectOrNilForKey:kSolarElevationAngleSolarElevationAngleHourAngle fromDictionary:dict];
            self.solarAzimuthAngle = [self objectOrNilForKey:kSolarElevationAngleSolarElevationAngleSolarAzimuthAngle fromDictionary:dict];
            self.solarElevationAngle = [self objectOrNilForKey:kSolarElevationAngleSolarElevationAngleSolarElevationAngle fromDictionary:dict];
            self.solarHour = [self objectOrNilForKey:kSolarElevationAngleSolarElevationAngleSolarHour fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.hourAngle forKey:kSolarElevationAngleSolarElevationAngleHourAngle];
    [mutableDict setValue:self.solarAzimuthAngle forKey:kSolarElevationAngleSolarElevationAngleSolarAzimuthAngle];
    [mutableDict setValue:self.solarElevationAngle forKey:kSolarElevationAngleSolarElevationAngleSolarElevationAngle];
    [mutableDict setValue:self.solarHour forKey:kSolarElevationAngleSolarElevationAngleSolarHour];

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

    self.hourAngle = [aDecoder decodeObjectForKey:kSolarElevationAngleSolarElevationAngleHourAngle];
    self.solarAzimuthAngle = [aDecoder decodeObjectForKey:kSolarElevationAngleSolarElevationAngleSolarAzimuthAngle];
    self.solarElevationAngle = [aDecoder decodeObjectForKey:kSolarElevationAngleSolarElevationAngleSolarElevationAngle];
    self.solarHour = [aDecoder decodeObjectForKey:kSolarElevationAngleSolarElevationAngleSolarHour];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_hourAngle forKey:kSolarElevationAngleSolarElevationAngleHourAngle];
    [aCoder encodeObject:_solarAzimuthAngle forKey:kSolarElevationAngleSolarElevationAngleSolarAzimuthAngle];
    [aCoder encodeObject:_solarElevationAngle forKey:kSolarElevationAngleSolarElevationAngleSolarElevationAngle];
    [aCoder encodeObject:_solarHour forKey:kSolarElevationAngleSolarElevationAngleSolarHour];
}

- (id)copyWithZone:(NSZone *)zone {
    SolarElevationAngleSolarElevationAngle *copy = [[SolarElevationAngleSolarElevationAngle alloc] init];
    
    
    
    if (copy) {

        copy.hourAngle = [self.hourAngle copyWithZone:zone];
        copy.solarAzimuthAngle = [self.solarAzimuthAngle copyWithZone:zone];
        copy.solarElevationAngle = [self.solarElevationAngle copyWithZone:zone];
        copy.solarHour = [self.solarHour copyWithZone:zone];
    }
    
    return copy;
}


@end
