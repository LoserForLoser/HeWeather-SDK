//
//  Lifestyle.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "WeatherLifestyle.h"


NSString *const kLifestyleBrf = @"brf";
NSString *const kLifestyleTxt = @"txt";
NSString *const kLifestyleType = @"type";


@interface WeatherLifestyle ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherLifestyle

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
            self.brf = [self objectOrNilForKey:kLifestyleBrf fromDictionary:dict];
            self.txt = [self objectOrNilForKey:kLifestyleTxt fromDictionary:dict];
            self.type = [self objectOrNilForKey:kLifestyleType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.brf forKey:kLifestyleBrf];
    [mutableDict setValue:self.txt forKey:kLifestyleTxt];
    [mutableDict setValue:self.type forKey:kLifestyleType];

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

    self.brf = [aDecoder decodeObjectForKey:kLifestyleBrf];
    self.txt = [aDecoder decodeObjectForKey:kLifestyleTxt];
    self.type = [aDecoder decodeObjectForKey:kLifestyleType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_brf forKey:kLifestyleBrf];
    [aCoder encodeObject:_txt forKey:kLifestyleTxt];
    [aCoder encodeObject:_type forKey:kLifestyleType];
}

- (id)copyWithZone:(NSZone *)zone {
    WeatherLifestyle *copy = [[WeatherLifestyle alloc] init];
    
    
    
    if (copy) {

        copy.brf = [self.brf copyWithZone:zone];
        copy.txt = [self.txt copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
    }
    
    return copy;
}


@end
