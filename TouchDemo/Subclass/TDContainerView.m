//
//  TDContainerView.m
//  TouchDemo
//
//  Created by smart on 2021/3/18.
//

#import "TDContainerView.h"
#import "TDLog.h"

@implementation TDContainerView {
    BOOL _enableLog;
}

- (void)setEnabledLog:(BOOL)enableLog {
    _enableLog = enableLog;
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

@end
