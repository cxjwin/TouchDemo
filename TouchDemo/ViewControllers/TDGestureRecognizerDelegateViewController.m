//
//  TDGestureRecognizerDelegateViewController.m
//  TouchDemo
//
//  Created by smart on 2021/4/21.
//

#import "TDGestureRecognizerDelegateViewController.h"
#import "TDView.h"
#import "TDContainerView.h"
#import "TDTapGestureRecognizer.h"

@interface TDGestureRecognizerDelegateViewController () <UIGestureRecognizerDelegate> {
    TDView *_tdView;
    __weak TDTapGestureRecognizer *_singleTap;
    __weak TDTapGestureRecognizer *_doubleTap;
}

@end

@implementation TDGestureRecognizerDelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    TDView *view = [[TDView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _tdView = view;
    view.backgroundColor = [UIColor blueColor];
    view.center = self.view.center;
    
    // add single tap gesture
    {
        TDTapGestureRecognizer *tap = [[TDTapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        tap.delegate = self;
        [view addGestureRecognizer:tap];
        _singleTap = tap;
    }
    
    // add double tap gesture
    {
        TDTapGestureRecognizer *tap = [[TDTapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
        tap.numberOfTapsRequired = 2;
        tap.numberOfTouchesRequired = 1;
        tap.delegate = self;
        [view addGestureRecognizer:tap];
        _doubleTap = tap;
    }
    
    [self.view addSubview:view];
}

- (void)singleTap:(TDTapGestureRecognizer *)tap {
    NSLog(@"this is single tap, state : %@.", @(tap.state));
}

- (void)doubleTap:(TDTapGestureRecognizer *)tap {
    NSLog(@"this is double tap, state : %@.", @(tap.state));
}

#pragma mark - UIGestureRecognizerDelegate

// called when a gesture recognizer attempts to transition out of UIGestureRecognizerStatePossible. returning NO causes it to transition to UIGestureRecognizerStateFailed
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return YES;
}

// called when the recognition of one of gestureRecognizer or otherGestureRecognizer would be blocked by the other
// return YES to allow both to recognize simultaneously. the default implementation returns NO (by default no two gestures can be recognized simultaneously)
//
// note: returning YES is guaranteed to allow simultaneous recognition. returning NO is not guaranteed to prevent simultaneous recognition, as the other gesture's delegate may return YES
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

// called once per attempt to recognize, so failure requirements can be determined lazily and may be set up between recognizers across view hierarchies
// return YES to set up a dynamic failure requirement between gestureRecognizer and otherGestureRecognizer
//
// note: returning YES is guaranteed to set up the failure requirement. returning NO does not guarantee that there will not be a failure requirement as the other gesture's counterpart delegate or subclass methods may return YES
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer API_AVAILABLE(ios(7.0)) {
    
    if ([gestureRecognizer isKindOfClass:[TDTapGestureRecognizer class]] &&
        [otherGestureRecognizer isKindOfClass:[TDTapGestureRecognizer class]]) {
        
        if ([(TDTapGestureRecognizer *)gestureRecognizer numberOfTapsRequired] == 1 &&
            [(TDTapGestureRecognizer *)otherGestureRecognizer numberOfTapsRequired] > 1) {
            return YES;
        }
        
    }
    
    return NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer API_AVAILABLE(ios(7.0)) {
    return NO;
}

// called before touchesBegan:withEvent: is called on the gesture recognizer for a new touch. return NO to prevent the gesture recognizer from seeing this touch
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return YES;
}

// called before pressesBegan:withEvent: is called on the gesture recognizer for a new press. return NO to prevent the gesture recognizer from seeing this press
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceivePress:(UIPress *)press {
    // 不响应按压
    return NO;
}

// called once before either -gestureRecognizer:shouldReceiveTouch: or -gestureRecognizer:shouldReceivePress:
// return NO to prevent the gesture recognizer from seeing this event
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveEvent:(UIEvent *)event API_AVAILABLE(ios(13.4), tvos(13.4)) API_UNAVAILABLE(watchos) {
    return YES;
}

@end
