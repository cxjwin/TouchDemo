//
//  TDScrollViewController.m
//  TouchDemo
//
//  Created by smart on 2021/4/6.
//

#import "TDScrollViewController.h"
#import "TDScrollView.h"

@interface TDScrollViewController () {
    UIScrollView *_scrollView;
    UIScrollView *_subScrollView;
}

@end

@implementation TDScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // scroll view
    {
        CGRect frame = self.view.bounds;
        _scrollView = [[UIScrollView alloc] initWithFrame:frame];
        _scrollView.backgroundColor = [UIColor yellowColor];
        _scrollView.contentSize = CGSizeMake(CGRectGetWidth(frame), CGRectGetHeight(frame) * 2);
        [self.view addSubview:_scrollView];
    }
    
    // add button1
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.backgroundColor = [UIColor greenColor];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button setTitle:@"BUTTON-1" forState:UIControlStateNormal];
        [button sizeToFit];
        button.center = CGPointMake(CGRectGetMidX(_scrollView.bounds), 150);
        [_scrollView addSubview:button];
    }
    
    // sub scroll view
    {
        CGRect frame = CGRectMake(0, 0, 200, 200);
        _subScrollView = [[TDScrollView alloc] initWithFrame:frame];
        _subScrollView.backgroundColor = [UIColor redColor];
        _subScrollView.contentSize = CGSizeMake(200, 800);
        _subScrollView.center = _scrollView.center;
        // 控制回弹效果, 这样子 ScrollView 滚动到上下边界的时候 pan 手势失效, 直接启用父 ScrollView 的 pan 手势
        _subScrollView.bounces = NO;
        
        [_scrollView addSubview:_subScrollView];
    }
    
    // add button2
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.backgroundColor = [UIColor greenColor];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button setTitle:@"BUTTON-2" forState:UIControlStateNormal];
        [button sizeToFit];
        button.center = CGPointMake(CGRectGetMidX(_subScrollView.bounds), 50);
        [_subScrollView addSubview:button];
    }
    
    [self printAllScrollViewGestures];
    
    [self hookAllScrollViewGestures];
}

- (void)printAllScrollViewGestures {
    NSArray<__kindof UIGestureRecognizer *> *gestures = [_scrollView gestureRecognizers];
    NSLog(@"ScrollView gestureRecognizers : %@", gestures);
}

- (void)hookAllScrollViewGestures {
    NSArray<__kindof UIGestureRecognizer *> *gestures = [_scrollView gestureRecognizers];
    [gestures enumerateObjectsUsingBlock:^(__kindof UIGestureRecognizer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj addTarget:self action:@selector(hookGestureRecognizer:)];
    }];
}

- (void)hookGestureRecognizer:(UIGestureRecognizer *)gesture {
    NSLog(@"gesture : %@", gesture);
}

@end
