//
//  TDHookUtils.h
//  TouchDemo
//
//  Created by smart on 2021/3/18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (TDHook)

+ (void)startHook;

@end


@interface TDHookUtils : NSObject

+ (void)setup;

@end

NS_ASSUME_NONNULL_END
