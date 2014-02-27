//
// Created by Terry Lewis II on 2/27/14.
// Copyright (c) 2014 Chai One. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (CHFunctionalDictionaryAdditions)

/**
 * Applies `block` to each element in the dictionary, then returns a new dictionary.
 * Block cannot return nil, as nil cannot be added to cocoa collections.
 *
 * @param block The function that will be applied to each element in the dictionary.
 * @return A new dictionary with the objects transformed by the block.
 */
- (NSDictionary *)__attribute__((nonnull(1)))ch_map:(id (^)(id key, id obj))block;

/**
 * Applies `block` to each element in the dictionary, then returns a new dictionary.
 * `block` cannot return nil, as nil cannot be added to cocoa collections.
 * Catches any errors in the block passed to the `catch` param.
 *
 * Useful for operations where you may have an error during enumeration.
 * @code
 * [filePaths tryMap:^id(NSString *key, NSString *obj, NSError **errorPtr) {
 *      return [NSData dataWithContentsOfFile:obj options:NSDataReadingUncached error:errorPtr];
 * } catch:^void(NSError *error) {
 *      NSLog(@"%@",error);
 * }];
 * @endcode
 *
 * @param block The function that will be applied to each element in the dictionary.
 * @param errorBlock A block that will be called if `errorPtr` is not nil.
 * @return A new dictionary with the objects transformed by the block, or nil if an error was caught.
 */
- (NSDictionary *)__attribute__((nonnull(1, 2)))ch_tryMap:(id (^)(id key, id obj, NSError **errorPtr))block catch:(void (^)(NSError *error))errorBlock;

/**
 * Applies `block` to each element in the dictionary, and returns a new dictionary of objects
 * that satisfy the predicate in `block`
 * @param block A predicate function that will be applied to each element in the dictionary.
 * If the function returns YES, that element will be added to the new dictionary, if it returns
 * NO, then that element will be rejected.
 * @return A new dictionary with the objects that satisfied the predicate in `block`.
 */
- (NSDictionary *)__attribute__((nonnull(1)))ch_filter:(BOOL (^)(id key, id obj))block;


@end