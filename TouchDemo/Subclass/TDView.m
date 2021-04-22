//
//  TDView.m
//  TouchDemo
//
//  Created by smart on 2021/3/18.
//

#import "TDView.h"
#import "TDLog.h"

@interface UIView (TDView)

@end

@implementation TDView {
    NSInteger _viewId;
    BOOL _enableLog;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

static NSInteger g_viewId = 0;

- (void)commonInit {
    _viewId = ++g_viewId;
}

- (NSInteger)viewId {
    return _viewId;
}

- (void)setEnabledLog:(BOOL)enableLog {
    _enableLog = enableLog;
}

// recursively calls -pointInside:withEvent:. point is in the receiver's coordinate system
- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    return view;
}

// default returns YES if point is in bounds
- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event {
    BOOL res = [super pointInside:point withEvent:event];
    return res;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    TD_LOG_CURRENT_METHOD;
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    TD_LOG_CURRENT_METHOD;
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    TD_LOG_CURRENT_METHOD;
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    TD_LOG_CURRENT_METHOD;
    [super touchesCancelled:touches withEvent:event];
}

- (NSString *)shortDescription {
    return [NSString stringWithFormat:@"view id : %@ | address : %p", @(_viewId), self];
}

@end
