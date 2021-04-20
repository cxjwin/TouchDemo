//
//  TDPanPinchViewController.m
//  TouchDemo
//
//  Created by smart on 2021/3/29.
//

#import "TDPanPinchViewController.h"
#import "TDView.h"
#import "TDPanGestureRecognizer.h"

@interface TDPanPinchViewController () <UIGestureRecognizerDelegate>

@end

@implementation TDPanPinchViewController {
    TDView *_tdView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TDView *view = [[TDView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _tdView = view;
    view.backgroundColor = [UIColor yellowColor];
    view.center = self.view.center;
    
    // add pan gesture
    {
        TDPanGestureRecognizer *pan = [[TDPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        pan.delegate = self;
        [view addGestureRecognizer:pan];
    }
    
    // add pinch gesture
    {
        UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
        pinch.delegate = self;
        [view addGestureRecognizer:pinch];
    }
    
    [self.view addSubview:view];
}

- (void)pan:(TDPanGestureRecognizer *)pan {
    NSLog(@"Pan Gesture State : %@", @(pan.state));
}

- (void)pinch:(UIPinchGestureRecognizer *)pinch {
    NSLog(@"Pinch Gesture State : %@", @(pinch.state));
}

#pragma mark - UIGestureRecognizerDelegate

/// This method is called when recognition of a gesture by either gestureRecognizer or otherGestureRecognizer would block the other gesture recognizer from recognizing its gesture. Note that returning YES is guaranteed to allow simultaneous recognition; returning NO, on the other hand, is not guaranteed to prevent simultaneous recognition because the other gesture recognizer's delegate may return YES.
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if ([gestureRecognizer isKindOfClass:[TDPanGestureRecognizer class]] &&
        [otherGestureRecognizer isKindOfClass:[UIPinchGestureRecognizer class]]) {
        return YES;
    }
    if ([gestureRecognizer isKindOfClass:[UIPinchGestureRecognizer class]] &&
        [otherGestureRecognizer isKindOfClass:[TDPanGestureRecognizer class]]) {
        return YES;
    }
    return NO;
}

@end
