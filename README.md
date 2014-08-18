CHFunctionalDictionaryAdditions
===========

A few functional additions to NSDictionary such as `ch_map:` and `ch_filter:` that make working with NSDictionary much simpler and cleaner.

Whats in here?
===========
Functional methods that are missing from foundation collection classes. All of the methods provided give you easy ways to transform and compose dictionaries, without writing for...each
loops and having to add things to new mutable collections.

Usage
===========
Here are some examples of use cases for the provided methods.
```
NSDictionary *nums = @{@"1" : @1, @"2" : @2, @"3" : @3};
    NSDictionary *newNums = [nums ch_map:^id(NSString *key, NSNumber *obj) {
        return @(obj.integerValue * obj.integerValue);
    }];
NSLog(@"%@", nums); // @{@"1" : @1, @"2" : @4, @"3" : @9};
```

`-ch_filter:` applies a block to each element in the dictionary, and returns a new dictionary consisting of only elements that pass the predicate in the block.

`-ch_map:` applies a given block to each element in the dictionary, adds the result of the computation to a new dictionary with the same keys and returns it, leaving the source dictionary untouched.

Also available:

`-ch_tryMap:catch:` The same as `-ch_map:` expect with an error passed into the block, and a block that can be used to handle errors. Can be used as such:
```
[filePaths tryMap:^id(id key, NSString *obj, NSError **errorPtr) {
       return [NSData dataWithContentsOfFile:obj options:NSDataReadingUncached error:errorPtr];
  } catch:^void(NSError *error) {
       NSLog(@"%@",error);
  }];
```

Installation
===========
CHFunctionalDictionaryAdditions uses [cocoapods](http://cocoapods.org), though it requires a few steps since it is using the private [ChaiKit-Specs](http://gitlab.chaione.com/chaikit/chaikit-specs) repo, so a few additional steps are required to be able to pull it in, which you can find [here](http://guides.cocoapods.org/making/private-cocoapods.html). Once that is done just put `pod 'CHFunctionalDictionaryAdditions', :head` into your podfile and install like normal. then just `#import <NSDictionary+CHFunctionalDictionaryAdditions.h>` wherever you want to use it.

Contributing
===========
Contributions and improvements are welcome. Just fork the project and submit a pull request. Make sure you check out the [contributing document](http://gitlab.chaione.com/chaikit/chfunctionaldictionaryadditions/blob/master/CONTRIBUTING.md) first.
