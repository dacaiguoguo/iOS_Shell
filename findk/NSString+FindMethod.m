//
//  FindMethod.m
//  findK
//
//  Created by sunyanguo on 12/4/15.
//  Copyright © 2015 lvmama. All rights reserved.
//

#import "NSString+FindMethod.h"

@implementation NSString(FindMethod)
- (NSRange)rangeOfString:( NSString * _Nullable )searchString atIndex:(NSUInteger)index fromIndex:(NSUInteger)fromIndex {
    NSRange range = [self rangeOfString:searchString];
    if (index==0) {
        return range;
    }
    index--;
    if (range.location == NSNotFound) {
        return NSMakeRange(NSNotFound, 0);
    } else {
        return [self rangeOfString:searchString atIndex:index fromIndex:NSMaxRange(range)];
    }
}
- (NSRange)rangeOfString:( NSString * _Nullable )searchString options:(NSStringCompareOptions)mask atIndex:(NSUInteger)index fromIndex:(NSUInteger)fromIndex {
    NSRange range = [self rangeOfString:searchString options:mask];
    if (index==0) {
        return range;
    }
    index--;
    if (range.location == NSNotFound) {
        return NSMakeRange(NSNotFound, 0);
    } else {
        return [self rangeOfString:searchString options:mask atIndex:index fromIndex:NSMaxRange(range)];
    }
}
- (NSRange)rangeOfString:( NSString * _Nullable )searchString options:(NSStringCompareOptions)mask range:(NSRange)searchRange atIndex:(NSUInteger)index fromIndex:(NSUInteger)fromIndex {
    NSRange range = [self rangeOfString:searchString options:mask range:searchRange];
    if (index==0) {
        return range;
    }
    index--;
    if (range.location == NSNotFound) {
        return NSMakeRange(NSNotFound, 0);
    } else {
        return [self rangeOfString:searchString options:mask range:searchRange atIndex:index fromIndex:NSMaxRange(range)];
    }
}
- (NSRange)rangeOfString:( NSString * _Nullable )searchString options:(NSStringCompareOptions)mask range:(NSRange)searchRange locale:(nullable NSLocale *)locale atIndex:(NSUInteger)index fromIndex:(NSUInteger)fromIndex {
    NSRange range = [self rangeOfString:searchString options:mask range:searchRange locale:locale];
    if (index==0) {
        return range;
    }
    index--;
    if (range.location == NSNotFound) {
        return NSMakeRange(NSNotFound, 0);
    } else {
        return [self rangeOfString:searchString options:mask range:searchRange locale:locale atIndex:index fromIndex:NSMaxRange(range)];
    }
}
@end
