//
//  TDTapGestureViewController.m
//  TouchDemo
//
//  Created by smart on 2021/3/18.
//

#import "TDTapGestureViewController.h"
#import "TDView.h"
#import "TDContainerView.h"
#import "TDTapGestureRecognizer.h"
#import "TDLongPressGestureRecognizer.h"

@interface TDTapGestureViewController () <UIGestureRecognizerDelegate> {
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
        tap.delegate = self;
        [view addGestureRecognizer:tap];
        _singleTap = tap;
    }
    
    // add double tap
    {
        TDTapGestureRecognizer *tap = [[TDTapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
        tap.numberOfTapsRequired = 2;
        tap.numberOfTouchesRequired = 1;
        [view addGestureRecognizer:tap];
        _doubleTap = tap;
    }
    
    // 如果不加这一行, 双击的时候会先触发单击手势
    [_singleTap requireGestureRecognizerToFail:_doubleTap];
    
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

@end
