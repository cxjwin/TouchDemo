//
//  TDView.h
//  TouchDemo
//
//  Created by smart on 2021/3/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TDView : UIView

- (NSInteger)viewId;

- (void)setEnabledLog:(BOOL)enableLog;

- (NSString *)shortDescription;

@end

NS_ASSUME_NONNULL_END
