//
//  TableViewController.m
//  TouchDemo
//
//  Created by smart on 2021/3/18.
//

#import "TableViewController.h"
#import "TDTouchViewController.h"
#import "TDTapGestureViewController.h"
#import "TDMutiGestureViewController.h"
#import "TDCustomGestureViewController.h"
#import "TDCircleGestureViewController.h"
#import "TDGestureRecognizerDelegateViewController.h"
#import "TDControlViewController.h"
#import "TDPanPinchViewController.h"
#import "TDScrollViewController.h"
#import "TouchDemo-Swift.h"

static NSString *const kTouchExampleCellId = @"touch_example";

@interface TableViewController () {
    NSArray<NSDictionary *> *_configs;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _configs = @[
        @{@"title" : @"Touch Example", @"class" : [TDTouchViewController class]},
        @{@"title" : @"Tap Gesture Example", @"class" : [TDTapGestureViewController class]},
        @{@"title" : @"Muti Gesture Example", @"class" : [TDMutiGestureViewController class]},
        @{@"title" : @"Control Example", @"class" : [TDControlViewController class]},
        @{@"title" : @"Pan & Pinch Example", @"class" : [TDPanPinchViewController class]},
        @{@"title" : @"Custom Gesture Example", @"class" : [TDCustomGestureViewController class]},
        @{@"title" : @"Circle Gesture Example", @"class" : [TDCircleGestureViewController class]},
        @{@"title" : @"Gesture Delegate Example", @"class" : [TDGestureRecognizerDelegateViewController class]},
        @{@"title" : @"Muti ScrollView", @"class" : [TDScrollViewController class]},
        @{@"title" : @"WWDC2014-235", @"class" : [WWDCViewController class]}
    ];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTouchExampleCellId];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _configs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTouchExampleCellId forIndexPath:indexPath];
    
    cell.textLabel.text = _configs[indexPath.row][@"title"];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Class clazz = _configs[indexPath.row][@"class"];
    if (clazz) {
        UIViewController *vc = [[clazz alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
