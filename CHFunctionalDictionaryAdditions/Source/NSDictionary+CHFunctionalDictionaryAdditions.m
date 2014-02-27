//
// Created by Terry Lewis II on 2/27/14.
// Copyright (c) 2014 Chai One. All rights reserved.
//

#import "NSDictionary+CHFunctionalDictionaryAdditions.h"


@implementation NSDictionary (CHFunctionalDictionaryAdditions)

- (NSDictionary *)ch_map:(id (^)(id key, id obj))block {
    NSMutableDictionary *projections = [NSMutableDictionary new];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        projections[key] = block(key, obj);
    }];

    return [NSDictionary dictionaryWithDictionary:projections];
}

- (NSDictionary *)ch_tryMap:(id (^)(id key, id obj, NSError **errorPtr))block catch:(void (^)(NSError *error))errorBlock {
    __block NSMutableDictionary *projections = [NSMutableDictionary new];
    __block NSError *error = nil;
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        id value = block(key, obj, &error);
        if(error) {
            errorBlock(error);
            projections = nil;
            *stop = YES;
        }
        else projections[key] = value;
    }];
    if(projections) return [NSDictionary dictionaryWithDictionary:projections];
    else return nil;
}

- (NSDictionary *)ch_filter:(BOOL (^)(id key, id obj))block {
    NSMutableDictionary *subset = [NSMutableDictionary new];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if(block(key, obj)) subset[key] = obj;
    }];

    return [NSDictionary dictionaryWithDictionary:subset];
}

@end