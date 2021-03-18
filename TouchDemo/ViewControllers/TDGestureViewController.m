//
//  TDGestureViewController.m
//  TouchDemo
//
//  Created by smart on 2021/3/18.
//

#import "TDGestureViewController.h"
#import "TDView.h"
#import "TDContainerView.h"
#import "TDTapGestureRecognizer.h"
#import "TDLongPressGestureRecognizer.h"

@interface TDGestureViewController () <UIGestureRecognizerDelegate> {
    TDView *_tdView;
    
    __weak UIEvent *_event;
    __weak UITouch *_touch;
}

@end

@implementation TDGestureViewController

- (void)loadView {
    CGRect frame = [[UIScreen mainScreen] bounds];
    self.view = [[TDContainerView alloc] initWithFrame:frame];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    TDView *view = [[TDView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    _tdView = view;
    view.backgroundColor = [UIColor blueColor];
    view.center = self.view.center;
    
    {
        TDTapGestureRecognizer *tap = [[TDTapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        tap.delegate = self;
        tap.allowedTouchTypes = @[@(UITouchTypeDirect)];
        [view addGestureRecognizer:tap];
  
        TDLongPressGestureRecognizer *press = [[TDLongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        press.minimumPressDuration = 1;
        press.allowableMovement = 20;
        [view addGestureRecognizer:press];
        
    }
    
    [self.view addSubview:view];
}

- (void)tap:(TDTapGestureRecognizer *)tap {
//    NSLog(@"TapGesture : %@", tap);
    if (_event) {
        NSSet <UITouch *> *touchs = [_event touchesForGestureRecognizer:tap];
        UITouch *touch = touchs.anyObject;
        NSLog(@"touch : %@", touch);
    }
    NSLog(@"timestamp 2 : %@", @(_touch.timestamp));
}

- (void)longPress:(TDLongPressGestureRecognizer *)press {
//    NSLog(@"PressGesture : %@", press);
    if (_event) {
        NSSet <UITouch *> *touchs = [_event touchesForGestureRecognizer:press];
        UITouch *touch = touchs.anyObject;
        NSLog(@"touch : %@", touch);
    }
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
    return NO;
}

// called once per attempt to recognize, so failure requirements can be determined lazily and may be set up between recognizers across view hierarchies
// return YES to set up a dynamic failure requirement between gestureRecognizer and otherGestureRecognizer
//
// note: returning YES is guaranteed to set up the failure requirement. returning NO does not guarantee that there will not be a failure requirement as the other gesture's counterpart delegate or subclass methods may return YES
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer API_AVAILABLE(ios(7.0)) {
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
    return YES;
}

// called once before either -gestureRecognizer:shouldReceiveTouch: or -gestureRecognizer:shouldReceivePress:
// return NO to prevent the gesture recognizer from seeing this event
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveEvent:(UIEvent *)event API_AVAILABLE(ios(13.4), tvos(13.4)) API_UNAVAILABLE(watchos) {
    
    _event = event;
    
    NSSet *touchs = event.allTouches;
    _touch = [touchs anyObject];
    NSLog(@"timestamp 1 : %@", @(_touch.timestamp));
    
//    NSLog(@"allTouches : %@", touchs);
    touchs = [event touchesForView:_tdView];
//    NSLog(@"tdView allTouches : %@", touchs);
    touchs = [event touchesForWindow:_tdView.window];
//    NSLog(@"window allTouches : %@", touchs);
    touchs = [event touchesForGestureRecognizer:gestureRecognizer];
//    NSLog(@"gestureRecognizer allTouches : %@", touchs);
    
    return YES;
}

@end
