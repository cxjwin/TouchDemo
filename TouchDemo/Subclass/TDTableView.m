//
//  TDTableView.m
//  TouchDemo
//
//  Created by smart on 2021/6/13.
//

#import "TDTableView.h"

@implementation TDTableView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitView = [super hitTest:point withEvent:event];
    if (hitView == self) {
        return nil;
    }
    return hitView;
}

#pragma mark - UIGestureRecognizerDelegate

// called when a gesture recognizer attempts to transition out of UIGestureRecognizerStatePossible. returning NO causes it to transition to UIGestureRecognizerStateFailed
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.lock && gestureRecognizer == self.panGestureRecognizer) {
        return NO;
    }
    return YES;
}

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer API_AVAILABLE(ios(7.0)) {
//    // 如果 otherGestureRecognizer 是一个 UIPanGestureRecognizer, 说明它是外层 ScrollView 的 UIPanGestureRecognizer
//    // 这里返回 YES 让其失败, 只响应当前 ScrollView 的 UIPanGestureRecognizer
//    if ([otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
//        return YES;
//    }
//    
//    return NO;
//}

@end
