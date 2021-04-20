//
//  TDCustomGestureViewController.m
//  TouchDemo
//
//  Created by smart on 2021/4/20.
//

#import "TDCustomGestureViewController.h"
#import "TDView.h"
#import "TDSimpleTapGestureRecognizer.h"

@interface TDCustomGestureViewController () {
    TDView *_tdView;
}

@end

@implementation TDCustomGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    TDView *view = [[TDView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    _tdView = view;
    view.backgroundColor = [UIColor blueColor];
    view.center = self.view.center;
    
    // add one finger single tap gesture
    {
        TDSimpleTapGestureRecognizer *tap = [[TDSimpleTapGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerTap:)];
        tap.numberOfTapsRequired = 1;
        [view addGestureRecognizer:tap];
    }
    
    // add two fingers single tap gesture
    {
        TDSimpleTapGestureRecognizer *tap = [[TDSimpleTapGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingersTap:)];
        tap.numberOfTapsRequired = 2;
        [view addGestureRecognizer:tap];
    }
    
    [self.view addSubview:view];
}

- (void)oneFingerTap:(TDSimpleTapGestureRecognizer *)tap {
    NSLog(@"one finger tap");
}

- (void)twoFingersTap:(TDSimpleTapGestureRecognizer *)tap {
    NSLog(@"two fingers tap");
}

@end
