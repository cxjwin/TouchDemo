//
//  TDTapGestureViewController.m
//  TouchDemo
//
//  Created by smart on 2021/3/18.
//

#import "TDTapGestureViewController.h"
#import "TDView.h"
#import "TDTapGestureRecognizer.h"

@interface TDTapGestureViewController () {
    TDView *_tdView;
    __weak TDTapGestureRecognizer *_singleTap;
    __weak TDTapGestureRecognizer *_doubleTap;
}

@end

@implementation TDTapGestureViewController

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
        [view addGestureRecognizer:tap];
        _singleTap = tap;
    }
    
    // add double tap gesture
    {
        TDTapGestureRecognizer *tap = [[TDTapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
        tap.numberOfTapsRequired = 2;
        tap.numberOfTouchesRequired = 1;
        [view addGestureRecognizer:tap];
        _doubleTap = tap;
    }
    
    // 如果不加这一行, 双击的时候会先触发单击手势
    // 注意是 otherGestureRecognizer 让当前调用的 GestureRecognizer 失败
    /*
     This method works fine when gesture recognizers aren’t created elsewhere in the app—or in a framework—and the set of gesture recognizers remains the same. If you need to set up failure requirements lazily or in different view hierarchies, use gestureRecognizer:shouldRequireFailureOfGestureRecognizer: and gestureRecognizer:shouldBeRequiredToFailByGestureRecognizer: instead. (Note that the shouldRequireFailureOfGestureRecognizer: and shouldBeRequiredToFailByGestureRecognizer: methods let subclasses define class-wide failure requirements.)
     This method creates a relationship with another gesture recognizer that delays the receiver’s transition out of UIGestureRecognizerStatePossible. The state that the receiver transitions to depends on what happens with otherGestureRecognizer:
     If otherGestureRecognizer transitions to UIGestureRecognizerStateFailed, the receiver transitions to its normal next state.
     if otherGestureRecognizer transitions to UIGestureRecognizerStateRecognized or UIGestureRecognizerStateBegan, the receiver transitions to UIGestureRecognizerStateFailed.
     An example where this method might be called is when you want a single-tap gesture require that a double-tap gesture fail.
     */
    [_singleTap requireGestureRecognizerToFail:_doubleTap];
    
    [self.view addSubview:view];
}

- (void)singleTap:(TDTapGestureRecognizer *)tap {
    NSLog(@"this is single tap, state : %@.", @(tap.state));
}

- (void)doubleTap:(TDTapGestureRecognizer *)tap {
    NSLog(@"this is double tap, state : %@.", @(tap.state));
}

@end
