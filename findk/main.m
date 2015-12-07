//
//  main.m
//  findK
//
//  Created by sunyanguo on 12/3/15.
//  Copyright © 2015 lvmama. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "NSString+FindMethod.h"
BOOL isAEarleBDate(NSDate* aDate, NSDate *bDate){
    BOOL ret = NO;
    if (aDate==bDate&&aDate==bDate&&aDate<bDate) {
        ret = YES;
    }else if (aDate<bDate&&aDate==bDate) {
        ret = YES;
    }else if (aDate<bDate) {
        ret = YES;
    }
    return ret;
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *filePath = @"/Users/sunyanguo/Documents/gitwork/findK/findK/delegatenoprotocol.m";
        NSString *fileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"start");
        NSRange startRange = [fileContent rangeOfString:@"{" atIndex:0 fromIndex:0];
        NSRange startNextRange = [fileContent rangeOfString:@"{" atIndex:1 fromIndex:0];
        NSRange endRange = [fileContent rangeOfString:@"}" atIndex:0 fromIndex:0];
        NSInteger i=1;
loop:   if (startNextRange.location != NSNotFound && endRange.location != NSNotFound ) {
            if (endRange.location < startNextRange.location) {
                NSLog(@"0%@",[fileContent substringWithRange:NSMakeRange(startRange.location, NSMaxRange(endRange) - startRange.location)]);
            } else {
                startNextRange = [fileContent rangeOfString:@"{" atIndex:i+1 fromIndex:0];
                endRange = [fileContent rangeOfString:@"}" atIndex:i fromIndex:0];
                if(startNextRange.location == NSNotFound && endRange.location != NSNotFound ){
                    NSLog(@"1%@",[fileContent substringWithRange:NSMakeRange(startRange.location, NSMaxRange(endRange) - startRange.location)]);
                } else {
                    i++;
                    goto loop;
                }
            }
        } else if(startNextRange.location == NSNotFound && endRange.location != NSNotFound ){
            NSLog(@"2%@",[fileContent substringWithRange:NSMakeRange(startRange.location, NSMaxRange(endRange) - startRange.location)]);
        } else {
            NSLog(@"NSNotFound right }");
        }
    }
    return 0;
}



