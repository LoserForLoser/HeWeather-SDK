//
//  Lifestyle.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherLifestyleLifestyle.h"


NSString *const kWeatherLifestyleLifestyleBrf = @"brf";
NSString *const kWeatherLifestyleLifestyleTxt = @"txt";
NSString *const kWeatherLifestyleLifestyleType = @"type";


@interface WeatherLifestyleLifestyle ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherLifestyleLifestyle

@synthesize brf = _brf;
@synthesize txt = _txt;
@synthesize type = _type;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.brf = [self objectOrNilForKey:kWeatherLifestyleLifestyleBrf fromDictionary:dict];
            self.txt = [self objectOrNilForKey:kWeatherLifestyleLifestyleTxt fromDictionary:dict];
            self.type = [self objectOrNilForKey:kWeatherLifestyleLifestyleType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.brf forKey:kWeatherLifestyleLifestyleBrf];
    [mutableDict setValue:self.txt forKey:kWeatherLifestyleLifestyleTxt];
    [mutableDict setValue:self.type forKey:kWeatherLifestyleLifestyleType];

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

    self.brf = [aDecoder decodeObjectForKey:kWeatherLifestyleLifestyleBrf];
    self.txt = [aDecoder decodeObjectForKey:kWeatherLifestyleLifestyleTxt];
    self.type = [aDecoder decodeObjectForKey:kWeatherLifestyleLifestyleType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_brf forKey:kWeatherLifestyleLifestyleBrf];
    [aCoder encodeObject:_txt forKey:kWeatherLifestyleLifestyleTxt];
    [aCoder encodeObject:_type forKey:kWeatherLifestyleLifestyleType];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherLifestyleLifestyle *copy = [[WeatherLifestyleLifestyle alloc] init];
    
    
    
    if (copy) {

        copy.brf = [self.brf copyWithZone:zone];
        copy.txt = [self.txt copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
    }
    
    return copy;
}


@end
