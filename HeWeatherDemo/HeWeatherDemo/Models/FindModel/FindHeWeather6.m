//
//  HeWeather6.m
//
//  Created by 朝阳 宋 on 2018/9/3
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "FindHeWeather6.h"
#import "FindBasic.h"


NSString *const kFindHeWeather6Basic = @"basic";
NSString *const kFindHeWeather6Status = @"status";


@interface FindHeWeather6 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FindHeWeather6

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
    NSObject *receivedBasic = [dict objectForKey:kFindHeWeather6Basic];
    NSMutableArray *parsedBasic = [NSMutableArray array];
    
    if ([receivedBasic isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBasic) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBasic addObject:[FindBasic modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBasic isKindOfClass:[NSDictionary class]]) {
       [parsedBasic addObject:[FindBasic modelObjectWithDictionary:(NSDictionary *)receivedBasic]];
    }

    self.basic = [NSArray arrayWithArray:parsedBasic];
            self.status = [self objectOrNilForKey:kFindHeWeather6Status fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForBasic = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.basic) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBasic addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBasic addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBasic] forKey:kFindHeWeather6Basic];
    [mutableDict setValue:self.status forKey:kFindHeWeather6Status];

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

    self.basic = [aDecoder decodeObjectForKey:kFindHeWeather6Basic];
    self.status = [aDecoder decodeObjectForKey:kFindHeWeather6Status];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_basic forKey:kFindHeWeather6Basic];
    [aCoder encodeObject:_status forKey:kFindHeWeather6Status];
}

- (id)copyWithZone:(NSZone *)zone {
    FindHeWeather6 *copy = [[FindHeWeather6 alloc] init];
    
    
    
    if (copy) {

        copy.basic = [self.basic copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
    }
    
    return copy;
}


@end
