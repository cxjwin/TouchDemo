//
//  TDControlViewController.m
//  TouchDemo
//
//  Created by smart on 2021/3/19.
//

#import "TDControlViewController.h"
#import "TDControl.h"
#import "TDView.h"
#import "TDTapGestureRecognizer.h"

@interface TDControlViewController ()

@end

@implementation TDControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // add control
    TDControl *control = [[TDControl alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    control.backgroundColor = [UIColor greenColor];
    [control addTarget:self action:@selector(touch:) forControlEvents:UIControlEventTouchUpInside];
    
    // add button
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    
    // add normal view
    TDView *normalView = [[TDView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    normalView.userInteractionEnabled = YES;
    normalView.backgroundColor = [UIColor yellowColor];
    
    // add gesture
    {
        TDTapGestureRecognizer *tap = [[TDTapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self.view addGestureRecognizer:tap];
    }
    
    control.center = CGPointMake(self.view.center.x, self.view.center.y - 50);
    [self.view addSubview:control];
    button.center = CGPointMake(self.view.center.x, self.view.center.y + 50);
    [self.view addSubview:button];
    normalView.center = CGPointMake(self.view.center.x, self.view.center.y + 150);
    [self.view addSubview:normalView];
}

- (void)touch:(TDControl *)control {
    NSLog(@"control : %@", control);
}

- (void)button:(UIButton *)button {
    NSLog(@"button : %@", button);
}

- (void)tap:(TDTapGestureRecognizer *)tap {
    NSLog(@"tap : %@", tap);
}

@end
