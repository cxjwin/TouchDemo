//
//  TDHookUtils.m
//  TouchDemo
//
//  Created by smart on 2021/3/18.
//

#import "TDHookUtils.h"
#import "RSSwizzle.h"

@implementation TDHookUtils

#define HOOK_FLAG 1

+ (void)setup {
#if HOOK_FLAG == 1
    
    [self hookHitTest];
    
    [self hookEventInit];
    [self hookEventClone];
    [self hookEventDealloc];
    
    [self hookTouchInit];
    [self hookTouchDealloc];
    
    [self hookTouches];
    
#endif
}

NSString *shortDesc(id obj) {
    if ([obj isKindOfClass:[NSValue class]]) {
        return [obj description];
    }
    NSString *desc = [obj description];
    if (desc.length > 40) {
        return [NSString stringWithFormat:@"%@(%p)", [obj class], obj];
    } else {
        return desc;
    }
}

+ (void)catchArgs:(id)arg0, ... {
    
    static NSArray<Class> *array = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        array = @[
            [UIResponder class],
        ];
    });
    
    if (arg0) {
        __block BOOL contains = NO;
        [array enumerateObjectsUsingBlock:^(Class _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([arg0 isKindOfClass:obj]) {
                contains = YES;
                *stop = YES;
            }
        }];
        if (!contains) {
            return;
        }
        
        NSString *desc = [NSString stringWithFormat:@"🔥arg0 : %@", shortDesc(arg0)];
        va_list args;
        va_start(args, arg0);
        id next = nil;
        int idx = 1;
        while ((next = va_arg(args, id))) {
            desc = [desc stringByAppendingFormat:@" | arg%d : %@", idx, shortDesc(next)];
            ++idx;
        }
        va_end(args);
        NSLog(@"%@", desc);
    }
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
        // Calling original implementation
        UIView *res = RSSWCallOriginal(point, event);
        [TDHookUtils catchArgs:self, NSStringFromSelector(sel), [NSValue valueWithCGPoint:point], event, res ?: @"nil", nil];
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
    
    // - (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event;
    SEL sel2 = @selector(touchesMoved:withEvent:);
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
    
    // - (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event;
    SEL sel3 = @selector(touchesEnded:withEvent:);
    RSSwizzleInstanceMethod([UIResponder class],
                            sel3,
                            RSSWReturnType(void),
                            RSSWArguments(NSSet<UITouch *> *touches, UIEvent *event),
                            RSSWReplacement(
    {
        [TDHookUtils catchArgs:self, NSStringFromSelector(sel3), touches, event, nil];

        // Calling original implementation
        RSSWCallOriginal(touches, event);
    }), 0, NULL);
    
    // - (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event;
    SEL sel4 = @selector(touchesCancelled:withEvent:);
    RSSwizzleInstanceMethod([UIResponder class],
                            sel4,
                            RSSWReturnType(void),
                            RSSWArguments(NSSet<UITouch *> *touches, UIEvent *event),
                            RSSWReplacement(
    {
        [TDHookUtils catchArgs:self, NSStringFromSelector(sel4), touches, event, nil];

        // Calling original implementation
        RSSWCallOriginal(touches, event);
    }), 0, NULL);
}

@end
