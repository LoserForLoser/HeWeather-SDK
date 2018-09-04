//
//  HeWeather6.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "SolarElevationAngleHeWeather6.h"
#import "SolarElevationAngleSolarElevationAngle.h"


NSString *const kSolarElevationAngleHeWeather6Status = @"status";
NSString *const kSolarElevationAngleHeWeather6SolarElevationAngle = @"solar_elevation_angle";


@interface SolarElevationAngleHeWeather6 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SolarElevationAngleHeWeather6

@synthesize status = _status;
@synthesize solarElevationAngle = _solarElevationAngle;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [self objectOrNilForKey:kSolarElevationAngleHeWeather6Status fromDictionary:dict];
            self.solarElevationAngle = [SolarElevationAngleSolarElevationAngle modelObjectWithDictionary:[dict objectForKey:kSolarElevationAngleHeWeather6SolarElevationAngle]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kSolarElevationAngleHeWeather6Status];
    [mutableDict setValue:[self.solarElevationAngle dictionaryRepresentation] forKey:kSolarElevationAngleHeWeather6SolarElevationAngle];

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

    self.status = [aDecoder decodeObjectForKey:kSolarElevationAngleHeWeather6Status];
    self.solarElevationAngle = [aDecoder decodeObjectForKey:kSolarElevationAngleHeWeather6SolarElevationAngle];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kSolarElevationAngleHeWeather6Status];
    [aCoder encodeObject:_solarElevationAngle forKey:kSolarElevationAngleHeWeather6SolarElevationAngle];
}

- (id)copyWithZone:(NSZone *)zone {
    SolarElevationAngleHeWeather6 *copy = [[SolarElevationAngleHeWeather6 alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.solarElevationAngle = [self.solarElevationAngle copyWithZone:zone];
    }
    
    return copy;
}


@end
