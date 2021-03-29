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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    TDView *view = [[TDView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.backgroundColor = [UIColor yellowColor];
    view.center = self.view.center;
    [self.view addSubview:view];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"nextResponder : %@", self.nextResponder);
    [super touchesBegan:touches withEvent:event];
}

@end
