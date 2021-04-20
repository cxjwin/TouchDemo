//
//  TDMutiGestureViewController.m
//  TouchDemo
//
//  Created by smart on 2021/3/19.
//

#import "TDMutiGestureViewController.h"
#import "TDView.h"
#import "TDTapGestureRecognizer.h"
#import "TDPinchGestureRecognizer.h"

#define TD_LOG 1

@interface TDMutiGestureViewController ()

@end

@implementation TDMutiGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat top = 150;
    CGFloat left = 100;
    CGFloat width = 200;
    CGFloat height = 150;
    
    // add top view
    {
        TDView *view = [[TDView alloc] initWithFrame:CGRectMake(left, top, width, height)];
        view.backgroundColor = [UIColor redColor];
        [self.view addSubview:view];
    }
    
    // add bottom view
    {
        top += 300;
        TDView *view = [[TDView alloc] initWithFrame:CGRectMake(left, top, width, height)];
        view.backgroundColor = [UIColor blueColor];
        
        TDTapGestureRecognizer *tap = [[TDTapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [tap setEnabledLog:YES];
        [view addGestureRecognizer:tap];
        [self.view addSubview:view];
    }
    
    TDPinchGestureRecognizer *pinch = [[TDPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [pinch setEnabledLog:YES];
    [self.view addGestureRecognizer:pinch];
}

- (void)pinch:(TDPinchGestureRecognizer *)pinch {
    //
}

- (void)tap:(TDTapGestureRecognizer *)tap {
    //
}

@end

#undef TD_LOG
