//
//  TDScrollView.m
//  TouchDemo
//
//  Created by smart on 2021/4/21.
//

#import "TDScrollView.h"

// !!!: ScrollView 的 panGestureRecognizer 的 delegate 只能在 ScrollView 内部处理
@implementation TDScrollView

// override points for subclasses to control delivery of touch events to subviews of the scroll view
// called before touches are delivered to a subview of the scroll view. if it returns NO the touches will not be delivered to the subview
// this has no effect on presses
// default returns YES
- (BOOL)touchesShouldBegin:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event inContentView:(UIView *)view {
    return YES;
}

// called before scrolling begins if touches have already been delivered to a subview of the scroll view. if it returns NO the touches will continue to be delivered to the subview and scrolling will not occur
// not called if canCancelContentTouches is NO. default returns YES if view isn't a UIControl
// this has no effect on presses
- (BOOL)touchesShouldCancelInContentView:(UIView *)view {
    return YES;
}

#pragma mark - UIGestureRecognizerDelegate

// called when a gesture recognizer attempts to transition out of UIGestureRecognizerStatePossible. returning NO causes it to transition to UIGestureRecognizerStateFailed
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer API_AVAILABLE(ios(7.0)) {
    // 如果 otherGestureRecognizer 是一个 UIPanGestureRecognizer, 说明它是外层 ScrollView 的 UIPanGestureRecognizer
    // 这里返回 YES 让其失败, 只响应当前 ScrollView 的 UIPanGestureRecognizer
    if ([otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        return YES;
    }
    
    return NO;
}

@end
