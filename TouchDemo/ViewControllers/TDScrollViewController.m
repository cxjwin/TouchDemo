//
//  TDScrollViewController.m
//  TouchDemo
//
//  Created by smart on 2021/4/6.
//

#import "TDScrollViewController.h"
#import "TDScrollView.h"
#import "TDTableView.h"

@interface TDScrollViewController () <
UITableViewDataSource,
UITableViewDelegate,
UIScrollViewDelegate
> {
    TDScrollView *_scrollView;
    TDTableView *_tableView;
}

@end

@implementation TDScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    CGRect frame = self.view.bounds;

    // scroll view
    {
        CGRect sFrame = CGRectMake(0, 100, CGRectGetWidth(frame), 500);
        _scrollView = [[TDScrollView alloc] initWithFrame:sFrame];
        _scrollView.backgroundColor = [UIColor yellowColor];
        _scrollView.contentSize = CGSizeMake(CGRectGetWidth(frame), 1500);
        _scrollView.delegate = self;
        _scrollView.bounces = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        [self.view addGestureRecognizer:_scrollView.panGestureRecognizer];
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
        CGRect tframe = CGRectMake(0, 1000, CGRectGetWidth(_scrollView.frame), 500);
        _tableView = [[TDTableView alloc] initWithFrame:tframe];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor redColor];
        // 控制回弹效果, 这样子 ScrollView 滚动到上下边界的时候 pan 手势失效, 直接启用父 ScrollView 的 pan 手势
        _tableView.bounces = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        [self.view addGestureRecognizer:_tableView.panGestureRecognizer];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.lock = YES;
        [_scrollView addSubview:_tableView];
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

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}

#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = @(indexPath.row).stringValue;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == _scrollView) {
        if (scrollView.contentOffset.y < 1000) {
            _tableView.lock = YES;
        } else {
            _tableView.lock = NO;
        }
    } else if (scrollView == _tableView) {
        if (scrollView.contentOffset.y >= 0.001) {
            _scrollView.lock = YES;
        } else {
            _scrollView.lock = NO;
        }
    }
}

@end
