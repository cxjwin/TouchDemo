//
//  TDPanGestureRecognizer.m
//  TouchDemo
//
//  Created by smart on 2021/3/29.
//

#import "TDPanGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@implementation TDPanGestureRecognizer

- (void)setState:(UIGestureRecognizerState)state {
    NSLog(@"[TDPanGestureRecognizer] state : %@", @(state));
    [super setState:state];
}

@end
