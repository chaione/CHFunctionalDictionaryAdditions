//
//  CH_dict_tests.m
//  CHFunctionalDictionaryAdditions
//
//  Created by Terry Lewis II on 2/27/14.
//  Copyright (c) 2014 Chai One. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDictionary+CHFunctionalDictionaryAdditions.h"

@interface CH_dict_tests : XCTestCase

@end

@implementation CH_dict_tests

- (void)setUp {
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown {
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)test_map_function {
    NSDictionary *nums = @{@"1" : @1, @"2" : @2, @"3" : @3};
    NSDictionary *newNums = [nums ch_map:^id(NSString *key, NSNumber *obj) {
        return @(obj.integerValue * obj.integerValue);
    }];
    NSDictionary *finalDict = @{@"1" : @1, @"2" : @4, @"3" : @9};
    XCTAssertEqualObjects(newNums, finalDict ,@"Dictionaries should be equal");
}

- (void)test_filter_function {
    NSDictionary *nums = @{@"1" : @1, @"2" : @2, @"3" : @3, @"4" : @4};
    NSDictionary *newNums = [nums ch_filter:^BOOL(NSString *key, NSNumber *obj) {
        return obj.integerValue % 2 == 0;
    }];
    NSDictionary *finalDict = @{@"2" : @2, @"4" : @4};
    XCTAssertEqualObjects(newNums, finalDict ,@"Dictionaries should be equal");
}

- (void)test_try_map_function {
    NSDictionary *badFilePaths = @{@"path1" : @"Not a path", @"Path 2" : @"another bad path"};
    
    NSDictionary *dataFromPaths = [badFilePaths ch_tryMap:^id(id key, id obj, NSError *__autoreleasing *errorPtr) {
        return [NSData dataWithContentsOfFile:obj options:NSDataReadingMapped error:errorPtr];
    }                                               catch:^(NSError *error) {
        XCTAssertNotNil(error, @"Error should not be nil");
    }];
    XCTAssertNil(dataFromPaths, @"Should be nil");
}

@end
