//
//  TDSimpleTapGestureRecognizer.m
//  TouchDemo
//
//  Created by smart on 2021/4/20.
//

#import "TDSimpleTapGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@implementation TDSimpleTapGestureRecognizer

- (instancetype)initWithTarget:(id)target action:(SEL)action {
    self = [super initWithTarget:target action:action];
    if (self) {
        _numberOfTapsRequired = 1;
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([event touchesForGestureRecognizer:self].count > 1) {
        self.state = UIGestureRecognizerStateFailed;
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (touches.anyObject.tapCount != 1) {
        self.state = UIGestureRecognizerStateFailed;
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([event touchesForGestureRecognizer:self].count == 1 &&
        touches.anyObject.tapCount == 1) {
        self.state = UIGestureRecognizerStateRecognized;
    } else {
        self.state = UIGestureRecognizerStateFailed;
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.state = UIGestureRecognizerStateFailed;
}

// called automatically by the runtime after the gesture state has been set to UIGestureRecognizerStateEnded
// any internal state should be reset to prepare for a new attempt to recognize the gesture
// after this is received all remaining active touches will be ignored (no further updates will be received for touches that had already begun but haven't ended)
- (void)reset {
    //
}

// if a touch isn't part of this gesture it can be passed to this method to be ignored. ignored touches won't be cancelled on the view even if cancelsTouchesInView is YES
- (void)ignoreTouch:(UITouch*)touch forEvent:(UIEvent*)event {
    NSArray *gestureRecognizers = [touch gestureRecognizers];
    NSLog(@"gestureRecognizers : %@", gestureRecognizers);
}

#pragma mark - Preventing exclusion

/// Overriding these methods enables the same behavior as implementing the UIGestureRecognizerDelegate methods gestureRecognizerShouldBegin: and gestureRecognizer:shouldReceiveTouch:. However, by overriding them, subclasses can define class-wide prevention rules. For example, a UITapGestureRecognizer object never prevents another UITapGestureRecognizer object with a higher tap count.
- (BOOL)canPreventGestureRecognizer:(UIGestureRecognizer *)preventedGestureRecognizer {
    if ([preventedGestureRecognizer isKindOfClass:[TDSimpleTapGestureRecognizer class]] &&
        preventedGestureRecognizer.numberOfTouches > self.numberOfTapsRequired) {
        return NO;
    }
    return YES;
}

/// Overriding these methods enables the same behavior as implementing the UIGestureRecognizerDelegate methods gestureRecognizerShouldBegin: and gestureRecognizer:shouldReceiveTouch:. However, by overriding them, subclasses can define class-wide prevention rules. For example, a UITapGestureRecognizer object never prevents another UITapGestureRecognizer object with a higher tap count.
- (BOOL)canBePreventedByGestureRecognizer:(UIGestureRecognizer *)preventingGestureRecognizer {
    return YES;
}

@end
