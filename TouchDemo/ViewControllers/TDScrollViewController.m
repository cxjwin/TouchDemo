//
//  TDScrollViewController.m
//  TouchDemo
//
//  Created by smart on 2021/4/6.
//

#import "TDScrollViewController.h"

@interface TDScrollViewController () <UIScrollViewDelegate> {
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
    
    // sub scroll view
    {
        CGRect frame = CGRectMake(0, 0, 200, 200);
        _subScrollView = [[UIScrollView alloc] initWithFrame:frame];
        _subScrollView.backgroundColor = [UIColor redColor];
        _subScrollView.contentSize = CGSizeMake(200, 800);
        _subScrollView.center = _scrollView.center;
        _subScrollView.bounces = NO;
        [_scrollView addSubview:_subScrollView];
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //
}


@end
