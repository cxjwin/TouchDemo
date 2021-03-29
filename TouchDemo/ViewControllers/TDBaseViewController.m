//
//  TDBaseViewController.m
//  TouchDemo
//
//  Created by smart on 2021/3/19.
//

#import "TDBaseViewController.h"
#import "TDContainerView.h"

@interface TDBaseViewController ()

@end

@implementation TDBaseViewController

- (void)loadView {
    CGRect frame = [[UIScreen mainScreen] bounds];
    self.view = [[TDContainerView alloc] initWithFrame:frame];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
