//
//  TDPinchGestureRecognizer.m
//  TouchDemo
//
//  Created by smart on 2021/4/20.
//

#import "TDPinchGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@implementation TDPinchGestureRecognizer {
    BOOL _enableLog;
}

- (void)setEnabledLog:(BOOL)enableLog {
    _enableLog = enableLog;
}

- (void)setState:(UIGestureRecognizerState)state {
    if (_enableLog) {
        NSLog(@"[TDPinchGestureRecognizer] set state : %@", @(state));
    }
    [super setState:state];
}

- (UIGestureRecognizerState)state {
    UIGestureRecognizerState state = [super state];
    if (_enableLog) {
        NSLog(@"[TDPinchGestureRecognizer] get state : %@", @(state));
    }
    return state;
}

@end
