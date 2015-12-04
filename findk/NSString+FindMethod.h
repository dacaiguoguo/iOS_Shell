//
//  FindMethod.h
//  findK
//
//  Created by sunyanguo on 12/4/15.
//  Copyright © 2015 lvmama. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(FindMethod)
- (NSRange)rangeOfString:( NSString * _Nullable )searchString atIndex:(NSUInteger)index fromIndex:(NSUInteger)fromIndex;
- (NSRange)rangeOfString:( NSString * _Nullable )searchString options:(NSStringCompareOptions)mask atIndex:(NSUInteger)index fromIndex:(NSUInteger)fromIndex;
- (NSRange)rangeOfString:( NSString * _Nullable )searchString options:(NSStringCompareOptions)mask range:(NSRange)searchRange atIndex:(NSUInteger)index fromIndex:(NSUInteger)fromIndex;
- (NSRange)rangeOfString:( NSString * _Nullable )searchString options:(NSStringCompareOptions)mask range:(NSRange)searchRange locale:(nullable NSLocale *)locale atIndex:(NSUInteger)index fromIndex:(NSUInteger)fromIndex;
@end
