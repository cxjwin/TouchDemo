//
//  TDWindow.m
//  TouchDemo
//
//  Created by smart on 2021/3/18.
//

#import "TDWindow.h"

@implementation TDWindow

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    return view;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL res = [super pointInside:point withEvent:event];
    return res;
}

- (void)sendEvent:(UIEvent *)event {
    [super sendEvent:event];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
}

@end
