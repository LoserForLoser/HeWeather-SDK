//
//  HeWeather6.m
//
//  Created by 朝阳 宋 on 2018/5/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "SearchHeWeather6.h"
#import "SearchBasic.h"


NSString *const kSearchHeWeather6Basic = @"basic";
NSString *const kSearchHeWeather6Status = @"status";


@interface SearchHeWeather6 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SearchHeWeather6

@synthesize basic = _basic;
@synthesize status = _status;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.basic = [SearchBasic modelObjectWithDictionary:[dict objectForKey:kSearchHeWeather6Basic]];
            self.status = [self objectOrNilForKey:kSearchHeWeather6Status fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kSearchHeWeather6Basic];
    [mutableDict setValue:self.status forKey:kSearchHeWeather6Status];

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

    self.basic = [aDecoder decodeObjectForKey:kSearchHeWeather6Basic];
    self.status = [aDecoder decodeObjectForKey:kSearchHeWeather6Status];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_basic forKey:kSearchHeWeather6Basic];
    [aCoder encodeObject:_status forKey:kSearchHeWeather6Status];
}

- (id)copyWithZone:(NSZone *)zone {
    SearchHeWeather6 *copy = [[SearchHeWeather6 alloc] init];
    
    
    
    if (copy) {

        copy.basic = [self.basic copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
    }
    
    return copy;
}


@end
