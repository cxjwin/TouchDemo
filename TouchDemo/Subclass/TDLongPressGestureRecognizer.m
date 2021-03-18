//
//  TDLongPressGestureRecognizer.m
//  TouchDemo
//
//  Created by smart on 2021/3/18.
//

#import "TDLongPressGestureRecognizer.h"
#import "TDTapGestureRecognizer.h"

@implementation TDLongPressGestureRecognizer

- (BOOL)canPreventGestureRecognizer:(UIGestureRecognizer *)preventedGestureRecognizer {
    if ([preventedGestureRecognizer isKindOfClass:[TDTapGestureRecognizer class]]) {
        return NO;
    }
    return YES;
}

@end
