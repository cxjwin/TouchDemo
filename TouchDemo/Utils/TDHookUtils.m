//
//  TDHookUtils.m
//  TouchDemo
//
//  Created by smart on 2021/3/18.
//

#import "TDHookUtils.h"
#import "RSSwizzle.h"

@implementation TDHookUtils

+ (void)setup {
    
    [self hookEventInit];
    [self hookEventClone];
    [self hookEventDealloc];
    
    [self hookTouchInit];
    [self hookTouchDealloc];
    
}

+ (void)catchArgs:(id)arg0, ... {
    void (^block)(void) = ^{
//        if ([arg0 isKindOfClass:[UIEvent class]]) {
//            NSLog(@"-------------------------------------");
//        } else {
//            NSLog(@"=====================================");
//        }
    };
    
    block();
    
    va_list args;
    if (arg0) {
//        NSLog(@"arg0 : %@", arg0);
        va_start(args, arg0);
        id next = nil;
        int idx = 1;
        while ((next = va_arg(args, id))) {
//            NSLog(@"arg%d : %@", idx, next);
            ++idx;
        }
        va_end(args);
    }
    
    block();
}

+ (void)hookHitTest {
    // - (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event;
    SEL sel = @selector(hitTest:withEvent:);
    RSSwizzleInstanceMethod([UIView class],
                            sel,
                            RSSWReturnType(UIView *),
                            RSSWArguments(CGPoint point, UIEvent *event),
                            RSSWReplacement(
    {
        [TDHookUtils catchArgs:self, NSStringFromSelector(sel), [NSValue valueWithCGPoint:point], event, nil];
        // Calling original implementation
        UIView *res = RSSWCallOriginal(point, event);
        // Returning modified return value.
        return res;
    }), 0, NULL);
}

+ (void)hookEventInit {
    // init
    SEL sel = @selector(init);
    RSSwizzleInstanceMethod([UIEvent class],
                            sel,
                            RSSWReturnType(UITouch *),
                            RSSWArguments(),
                            RSSWReplacement(
    {
        [TDHookUtils catchArgs:self, NSStringFromSelector(sel), nil];
        // Calling original implementation
        UITouch *res = RSSWCallOriginal();
        return res;
    }), 0, NULL);
}

+ (void)hookEventClone {
    // -(id)_cloneEvent;
    SEL sel = NSSelectorFromString(@"_cloneEvent");
    RSSwizzleInstanceMethod([UIEvent class],
                            sel,
                            RSSWReturnType(id),
                            RSSWArguments(),
                            RSSWReplacement(
    {
        [TDHookUtils catchArgs:self, @"_cloneEvent", nil];
        // Calling original implementation
        id res = RSSWCallOriginal();
        return res;
    }), 0, NULL);
}

+ (void)hookEventDealloc {
    // dealloc
    SEL sel = NSSelectorFromString(@"dealloc");
    RSSwizzleInstanceMethod([UIEvent class],
                            sel,
                            RSSWReturnType(void),
                            RSSWArguments(),
                            RSSWReplacement(
    {
        [TDHookUtils catchArgs:self, @"dealloc", nil];
        // Calling original implementation
        RSSWCallOriginal();
    }), 0, NULL);
}

+ (void)hookTouchInit {
    // init
    SEL sel = @selector(init);
    RSSwizzleInstanceMethod([UITouch class],
                            sel,
                            RSSWReturnType(UITouch *),
                            RSSWArguments(),
                            RSSWReplacement(
    {
        [TDHookUtils catchArgs:self, NSStringFromSelector(sel), nil];
        // Calling original implementation
        UITouch *res = RSSWCallOriginal();
        return res;
    }), 0, NULL);
}

+ (void)hookTouchDealloc {
    // dealloc
    SEL sel = NSSelectorFromString(@"dealloc");
    RSSwizzleInstanceMethod([UITouch class],
                            sel,
                            RSSWReturnType(void),
                            RSSWArguments(),
                            RSSWReplacement(
    {
        [TDHookUtils catchArgs:self, @"dealloc", nil];
        // Calling original implementation
        RSSWCallOriginal();
    }), 0, NULL);
}

+ (void)hookTouches {
    // - (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event;
    SEL sel1 = @selector(touchesBegan:withEvent:);
    RSSwizzleInstanceMethod([UIResponder class],
                            sel1,
                            RSSWReturnType(void),
                            RSSWArguments(NSSet<UITouch *> *touches, UIEvent *event),
                            RSSWReplacement(
    {
        [TDHookUtils catchArgs:self, NSStringFromSelector(sel1), touches, event, nil];

        // Calling original implementation
        RSSWCallOriginal(touches, event);
    }), 0, NULL);
    
    // - (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event;
    SEL sel2 = @selector(touchesCancelled:withEvent:);
    RSSwizzleInstanceMethod([UIResponder class],
                            sel2,
                            RSSWReturnType(void),
                            RSSWArguments(NSSet<UITouch *> *touches, UIEvent *event),
                            RSSWReplacement(
    {
        [TDHookUtils catchArgs:self, NSStringFromSelector(sel2), touches, event, nil];

        // Calling original implementation
        RSSWCallOriginal(touches, event);
    }), 0, NULL);
}

@end
