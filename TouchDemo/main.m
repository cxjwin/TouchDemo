//
//  main.m
//  TouchDemo
//
//  Created by smart on 2021/3/18.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "TDHookUtils.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        [TDHookUtils setup];
        
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
