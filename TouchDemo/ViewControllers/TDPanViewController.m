//
//  TDPanViewController.m
//  TouchDemo
//
//  Created by smart on 2021/3/29.
//

#import "TDPanViewController.h"
#import "TDView.h"
#import "TDPanGestureRecognizer.h"

@interface TDPanViewController ()

@end

@implementation TDPanViewController {
    TDView *_tdView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TDView *view = [[TDView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _tdView = view;
    view.backgroundColor = [UIColor yellowColor];
    view.center = self.view.center;
    
    // add gesture
    {
        TDPanGestureRecognizer *pan = [[TDPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [view addGestureRecognizer:pan];
    }
    
    [self.view addSubview:view];
}

- (void)pan:(TDPanGestureRecognizer *)pan {
    NSLog(@"Pan Gesture : %@", pan);
}

@end
