//
//  HeWeather6.m
//
//  Created by 朝阳 宋 on 2018/9/3
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "TopHeWeather6.h"
#import "TopBasic.h"


NSString *const kTopHeWeather6Basic = @"basic";
NSString *const kTopHeWeather6Status = @"status";


@interface TopHeWeather6 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TopHeWeather6

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
    NSObject *receivedBasic = [dict objectForKey:kTopHeWeather6Basic];
    NSMutableArray *parsedBasic = [NSMutableArray array];
    
    if ([receivedBasic isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBasic) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBasic addObject:[TopBasic modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBasic isKindOfClass:[NSDictionary class]]) {
       [parsedBasic addObject:[TopBasic modelObjectWithDictionary:(NSDictionary *)receivedBasic]];
    }

    self.basic = [NSArray arrayWithArray:parsedBasic];
            self.status = [self objectOrNilForKey:kTopHeWeather6Status fromDictionary:dict];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBasic] forKey:kTopHeWeather6Basic];
    [mutableDict setValue:self.status forKey:kTopHeWeather6Status];

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

    self.basic = [aDecoder decodeObjectForKey:kTopHeWeather6Basic];
    self.status = [aDecoder decodeObjectForKey:kTopHeWeather6Status];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_basic forKey:kTopHeWeather6Basic];
    [aCoder encodeObject:_status forKey:kTopHeWeather6Status];
}

- (id)copyWithZone:(NSZone *)zone {
    TopHeWeather6 *copy = [[TopHeWeather6 alloc] init];
    
    
    
    if (copy) {

        copy.basic = [self.basic copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
    }
    
    return copy;
}


@end
