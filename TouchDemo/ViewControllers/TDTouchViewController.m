//
//  TDTouchViewController.m
//  TouchDemo
//
//  Created by smart on 2021/3/18.
//

#import "TDTouchViewController.h"
#import "TDView.h"
#import "TDContainerView.h"

@interface TDTouchViewController ()

@end

@implementation TDTouchViewController

- (void)loadView {
    CGRect frame = [[UIScreen mainScreen] bounds];
    self.view = [[TDContainerView alloc] initWithFrame:frame];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    TDView *view = [[TDView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    view.backgroundColor = [UIColor redColor];
    view.center = self.view.center;
    [self.view addSubview:view];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"nextResponder : %@", self.nextResponder);
    [super touchesBegan:touches withEvent:event];
}

@end
