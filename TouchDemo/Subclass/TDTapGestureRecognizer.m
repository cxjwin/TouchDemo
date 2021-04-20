//
//  TDTapGestureRecognizer.m
//  TouchDemo
//
//  Created by smart on 2021/3/18.
//

#import "TDTapGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@implementation TDTapGestureRecognizer {
    BOOL _enableLog;
}

- (void)setEnabledLog:(BOOL)enableLog {
    _enableLog = enableLog;
}

- (void)setState:(UIGestureRecognizerState)state {
    if (_enableLog) {
        NSLog(@"[TDTapGestureRecognizer] set state : %@", @(state));
    }
    [super setState:state];
}

- (UIGestureRecognizerState)state {
    UIGestureRecognizerState state = [super state];
    if (_enableLog) {
        NSLog(@"[TDTapGestureRecognizer] get state : %@", @(state));
    }
    return state;
}

@end
