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

#pragma mark - Preventing exclusion

- (BOOL)canPreventGestureRecognizer:(UIGestureRecognizer *)preventedGestureRecognizer {
    if ([preventedGestureRecognizer isKindOfClass:[TDSimpleTapGestureRecognizer class]] &&
        preventedGestureRecognizer.numberOfTouches > self.numberOfTapsRequired) {
        return NO;
    }
    return YES;
}

- (BOOL)canBePreventedByGestureRecognizer:(UIGestureRecognizer *)preventingGestureRecognizer {
    return YES;
}

@end
