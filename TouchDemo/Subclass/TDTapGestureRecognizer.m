//
//  TDTapGestureRecognizer.m
//  TouchDemo
//
//  Created by smart on 2021/3/18.
//

#import "TDTapGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>
#import "TDLog.h"

@implementation TDTapGestureRecognizer {
    BOOL _enableLog;
}

- (void)setEnabledLog:(BOOL)enableLog {
    _enableLog = enableLog;
}

- (void)setState:(UIGestureRecognizerState)state {
    [super setState:state];
    TD_D_LOG(_enableLog, @"🟡▶️[TDTapGestureRecognizer] set state : %@", @(state));
}

- (UIGestureRecognizerState)state {
    UIGestureRecognizerState state = [super state];
    TD_D_LOG(_enableLog, @"🟡◀️[TDTapGestureRecognizer] get state : %@", @(state));
    return state;
}

@end
