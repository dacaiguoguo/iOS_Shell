//
//  main.m
//  findK
//
//  Created by sunyanguo on 12/3/15.
//  Copyright © 2015 lvmama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+FindMethod.h"

NSRange findDiJi(NSInteger ji, NSString *orgString, NSString *sub, NSInteger from) ;
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *filePath = @"/Users/sunyanguo/Documents/gitwork/findK/findK/delegatenoprotocol.m";
        NSString *fileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        // insert code here...
//        NSLog(@"Hello, World!%@",fileContent);
        NSRange range = [fileContent rangeOfString:@"{"];
        NSInteger start = NSNotFound;
        NSInteger end = NSNotFound;
        if (range.location != NSNotFound) {
            start = range.location;
            range = [fileContent rangeOfString:@"{" options:(NSCaseInsensitiveSearch) range:NSMakeRange(NSMaxRange(range), fileContent.length -NSMaxRange(range))];
            if (range.location == NSNotFound) {
                range = [fileContent rangeOfString:@"}" options:(NSCaseInsensitiveSearch) range:NSMakeRange(0,fileContent.length)];
                end = range.location- start + 1;
            } else {
                
            }
        }
//        NSLog(@"dacaiguoguo:\n%s\n%@",__func__,[fileContent substringWithRange:NSMakeRange(start, end)]);
//        NSString *shengrangeString = [fileContent substringWithRange:NSMakeRange(findrange.location, fileContent.length - findrange.location)];
//        NSLog(@"dacaiguoguo:\n%s\n%@",__func__,shengrangeString);
        NSRange findrange;// = ([fileContent rangeOfString:@"{"]);
        findrange = [fileContent rangeOfString:@"{" atIndex:6 fromIndex:0];
//        findrange = findDiJi(6, fileContent,@"{",0);
        if (findrange.location == NSNotFound) {
            NSLog(@"NSNotFound");
        } else {
            NSLog(@"%@",NSStringFromRange(findrange));
        }
    }
    return 0;
}
NSRange findDiJisub(NSInteger ji, NSString *orgString, NSString *sub, NSRange uprange22);
NSRange findDiJi(NSInteger ji, NSString *orgString, NSString *sub, NSInteger from) {
    NSRange range = [orgString rangeOfString:sub options:NSCaseInsensitiveSearch range:NSMakeRange(from, orgString.length - from)];
    if (ji==0) {
//        NSLog(@"%@",[orgString substringWithRange:range ]);
        return range;
    }
    ji--;
    if (range.location != NSNotFound) {
        return findDiJi(ji, orgString, sub,NSMaxRange(range));
    }
    return NSMakeRange(NSNotFound, 0);
}




