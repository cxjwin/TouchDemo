//
//  TDTouchViewController.m
//  TouchDemo
//
//  Created by smart on 2021/3/18.
//

#import "TDTouchViewController.h"
#import "TDView.h"
#import "TDContainerView.h"

@interface TDLeftTouchView : TDView

@end

@implementation TDLeftTouchView

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect touchArea = self.bounds;
    touchArea.size.width = touchArea.size.width * 0.5;
    if (CGRectContainsPoint(touchArea, point)) {
        return YES;
    }
    return NO;
}

@end

@interface TDRightTouchView : TDView

@end

@implementation TDRightTouchView

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect touchArea = self.bounds;
    touchArea.size.width = touchArea.size.width * 0.5;
    touchArea.origin.x = CGRectGetWidth(self.bounds) - touchArea.size.width;
    if (CGRectContainsPoint(touchArea, point)) {
        return YES;
    }
    return NO;
}

@end

@interface TDTouchViewController ()

@end

@implementation TDTouchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // [(TDContainerView *)self.view setEnabledLog:YES];
    
    // left touch view
    TDLeftTouchView *viewA = [[TDLeftTouchView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [viewA setEnabledLog:YES];
    viewA.backgroundColor = [UIColor blackColor];
    viewA.center = self.view.center;
    [self.view addSubview:viewA];
    
    // right touch view
    TDRightTouchView *viewB = [[TDRightTouchView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [viewB setEnabledLog:YES];
    viewB.backgroundColor = [UIColor whiteColor];
    viewB.alpha = 0.5;
    viewB.center = self.view.center;
    [self.view addSubview:viewB];
}

@end
