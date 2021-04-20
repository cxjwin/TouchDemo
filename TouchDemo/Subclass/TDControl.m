//
//  TDControl.m
//  TouchDemo
//
//  Created by smart on 2021/3/19.
//

#import "TDControl.h"

@implementation TDControl

// called when the recognizer attempts to transition out of UIGestureRecognizerStatePossible if a touch hit-tested to this view will be cancelled as a result of gesture recognition
// returns YES by default. return NO to cause the gesture recognizer to transition to UIGestureRecognizerStateFailed
// subclasses may override to prevent recognition of particular gestures. for example, UISlider prevents swipes parallel to the slider that start in the thumb
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    // 如果是单击手势, 这里设置为 NO 进行屏蔽
    if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        return NO;
    }
    return YES;
}

@end
