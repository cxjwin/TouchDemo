//
//  TDLog.h
//  TouchDemo
//
//  Created by smart on 2021/4/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define TD_LOG 0

#if TD_LOG
#define TD_LOG_CURRENT_METHOD NSLog(@"%@ - %s", self, __func__)
#else
#define TD_LOG_CURRENT_METHOD
#endif

@interface TDLog : NSObject

@end

NS_ASSUME_NONNULL_END
