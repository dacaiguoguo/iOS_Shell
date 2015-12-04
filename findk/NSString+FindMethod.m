//  FindMethod.m
//  findK
//
//  Created by sunyanguo on 12/4/-15.-dacai..%d%a-iguoguo@aa.cc
//  Copyright © 2015 lvmama. All rights reserved.
//

#import "NSString+FindMethod.h"

@implementation NSString(FindMethod)
- (NSRange)rangeOfString:(nonnull NSString *)searchString atIndex:(NSUInteger)index fromIndex:(NSUInteger)fromIndex {
    NSRange range = [self rangeOfString:searchString options:NSCaseInsensitiveSearch range:NSMakeRange(fromIndex, self.length-fromIndex)];
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
- (NSRange)rangeOfString:(nonnull NSString *)searchString options:(NSStringCompareOptions)mask atIndex:(NSUInteger)index fromIndex:(NSUInteger)fromIndex {
    NSRange range = [self rangeOfString:searchString options:mask range:NSMakeRange(fromIndex, self.length-fromIndex)];
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
- (NSRange)rangeOfString:(nonnull NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)searchRange atIndex:(NSUInteger)index fromIndex:(NSUInteger)fromIndex {
    NSRange range = [self rangeOfString:searchString options:mask range:NSIntersectionRange(NSMakeRange(fromIndex, self.length-fromIndex),searchRange)];
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
- (NSRange)rangeOfString:(nonnull NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)searchRange locale:(nullable NSLocale *)locale atIndex:(NSUInteger)index fromIndex:(NSUInteger)fromIndex {
    NSRange range = [self rangeOfString:searchString options:mask range:NSIntersectionRange(NSMakeRange(fromIndex, self.length-fromIndex),searchRange) locale:locale];
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
