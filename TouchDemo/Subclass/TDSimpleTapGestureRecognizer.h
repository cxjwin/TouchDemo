//
//  TDSimpleTapGestureRecognizer.h
//  TouchDemo
//
//  Created by smart on 2021/4/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TDSimpleTapGestureRecognizer : UIGestureRecognizer

@property (nonatomic, assign) NSUInteger numberOfTapsRequired;

@end

NS_ASSUME_NONNULL_END
