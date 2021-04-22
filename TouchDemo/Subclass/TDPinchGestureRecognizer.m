//
//  TDPinchGestureRecognizer.m
//  TouchDemo
//
//  Created by smart on 2021/4/20.
//

#import "TDPinchGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>
#import "TDLog.h"

@implementation TDPinchGestureRecognizer {
    BOOL _enableLog;
}

- (void)setEnabledLog:(BOOL)enableLog {
    _enableLog = enableLog;
}

- (void)setState:(UIGestureRecognizerState)state {
    [super setState:state];
    TD_D_LOG(_enableLog, @"🟢➡️[TDPinchGestureRecognizer] get state : %@", @(state));
}

- (UIGestureRecognizerState)state {
    UIGestureRecognizerState state = [super state];
    TD_D_LOG(_enableLog, @"🟢⬅️[TDPinchGestureRecognizer] get state : %@", @(state));
    return state;
}

@end
