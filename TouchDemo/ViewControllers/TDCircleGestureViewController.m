//
//  TDCircleGestureViewController.m
//  TouchDemo
//
//  Created by smart on 2021/4/20.
//

#import "TDCircleGestureViewController.h"
#import "CircleView.h"
#import "MDCircleGestureRecognizer.h"

@interface TDCircleGestureViewController ()

@end

@implementation TDCircleGestureViewController

- (void)loadView {
    CGRect frame = [UIScreen mainScreen].bounds;
    self.view = [[CircleView alloc] initWithFrame:frame];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MDCircleGestureRecognizer *circleGesture = [[MDCircleGestureRecognizer alloc] initWithTarget:self.view action:@selector(handleGesture:)];
    [self.view addGestureRecognizer:circleGesture];
}

@end
