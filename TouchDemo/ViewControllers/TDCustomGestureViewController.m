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
    
    // tap1
    {
        TDSimpleTapGestureRecognizer *tap = [[TDSimpleTapGestureRecognizer alloc] initWithTarget:self action:@selector(tap1:)];
        tap.numberOfTapsRequired = 2;
        [view addGestureRecognizer:tap];
    }
    
    // tap2
    {
        TDSimpleTapGestureRecognizer *tap = [[TDSimpleTapGestureRecognizer alloc] initWithTarget:self action:@selector(tap2:)];
        tap.numberOfTapsRequired = 3;
        [view addGestureRecognizer:tap];
    }
    
    [self.view addSubview:view];
}

- (void)tap1:(TDSimpleTapGestureRecognizer *)tap {
    NSLog(@"tap1");
}

- (void)tap2:(TDSimpleTapGestureRecognizer *)tap {
    NSLog(@"tap2");
}

@end
