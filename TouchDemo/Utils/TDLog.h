//
//  TDLog.h
//  TouchDemo
//
//  Created by smart on 2021/4/14.
//

#import <Foundation/Foundation.h>

#define TD_D_LOG(flag, fmt, ...) \
do { \
    if (flag) { \
        NSLog(fmt, ##__VA_ARGS__); \
    } \
} while (0);

#define TD_LOG_CURRENT_METHOD \
do { \
    if (_enableLog) { \
        NSLog(@"🟥[%@ : %p] => %s", [self class], self, __func__); \
    } \
} while (0);

NS_ASSUME_NONNULL_BEGIN

@interface TDLog : NSObject

@end

NS_ASSUME_NONNULL_END
