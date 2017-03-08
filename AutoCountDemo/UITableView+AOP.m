//
//  UITableView+AOP.m
//  AutoCountDemo
//
//  Created by dayu on 17/2/24.
//  Copyright © 2017年 dayu. All rights reserved.
//

#import "UITableView+AOP.h"
#import <objc/message.h>
#import <objc/runtime.h>
#import "SecondChildViewController.h"

@implementation UIScrollView (AOP)

+ (void)load {
    Method orgDelMtd = class_getInstanceMethod([self class], @selector(setDelegate:));
    Method swzDelMtd = class_getInstanceMethod([self class], @selector(ly_setScrollviewDelegate:));
    method_exchangeImplementations(orgDelMtd, swzDelMtd);
}

- (void)ly_setScrollviewDelegate:(id)delegate {
    if (!delegate) {
        [self ly_setScrollviewDelegate:delegate];
        return;
    }
 
    Method orgDelMtd = class_getInstanceMethod([delegate class], @selector(scrollViewDidEndScrollingAnimation:));
    SEL sel = @selector(ly_scrollViewDidEndScrollingAnimation:);
    Method func = class_getInstanceMethod([self class], sel);
    IMP imp = method_getImplementation(func);
    const char *types = method_getTypeEncoding(func);
    
    class_addMethod([delegate class], sel, imp, types);
    Method swzDelMtd = class_getInstanceMethod([delegate class], @selector(ly_scrollViewDidEndScrollingAnimation:));
    method_exchangeImplementations(orgDelMtd, swzDelMtd);
    
    
    Method orgScrMtd = class_getInstanceMethod([delegate class], @selector(scrollViewDidScroll:));
    SEL scrSel = @selector(ly_scrollViewDidScroll:);
    Method scrFunc = class_getInstanceMethod([self class], scrSel);
    IMP scrImp = method_getImplementation(scrFunc);
    const char *scrTypes = method_getTypeEncoding(scrFunc);
    
    class_addMethod([delegate class], scrSel, scrImp, scrTypes);
    Method swzScrMtd = class_getInstanceMethod([delegate class], @selector(ly_scrollViewDidScroll:));
    method_exchangeImplementations(orgScrMtd, swzScrMtd);
    [self ly_setScrollviewDelegate:delegate];

}

- (void)ly_scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scrollView-------打点了%@", NSStringFromCGPoint(scrollView.contentOffset));
    [self ly_scrollViewDidScroll:scrollView];
    
}

- (void)ly_scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    NSLog(@"scrollView-------打点了%@", NSStringFromCGPoint(scrollView.contentOffset));
    
    [self ly_scrollViewDidEndScrollingAnimation:scrollView];
}

@end

@implementation UITableView (AOP)

+ (void)load {
    Method orgDelMtd = class_getInstanceMethod([self class], @selector(setDelegate:));
    Method swzDelMtd = class_getInstanceMethod([self class], @selector(ly_setDelegate:));
    method_exchangeImplementations(orgDelMtd, swzDelMtd);
}

- (void)ly_setDelegate:(id)delegate {
    if (!delegate) {
        [self ly_setScrollviewDelegate:delegate];
        return;
    }
    [self ly_setDelegate:delegate];
    
    Method orgDelMtd = class_getInstanceMethod([delegate class], @selector(tableView:didSelectRowAtIndexPath:));
    SEL sel = @selector(ly_tableView:didSelectRowAtIndexPath:);
    Method func = class_getInstanceMethod([UITableView class], sel);
    IMP imp = method_getImplementation(func);
    const char *types = method_getTypeEncoding(func);
    
    class_addMethod([delegate class], sel, imp, types);
    Method swzDelMtd = class_getInstanceMethod([delegate class], @selector(ly_tableView:didSelectRowAtIndexPath:));
    method_exchangeImplementations(orgDelMtd, swzDelMtd);

}

- (void)ly_tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"UITableView-------打点了%@", [tableView description]);

    [self ly_tableView:tableView didSelectRowAtIndexPath:indexPath];
}

@end

@implementation UICollectionView (AOP)

+ (void)load {
    Method orgDelMtd = class_getInstanceMethod([self class], @selector(setDelegate:));
    Method swzDelMtd = class_getInstanceMethod([self class], @selector(ly_setDelegate:));
    method_exchangeImplementations(orgDelMtd, swzDelMtd);
}

- (void)ly_setDelegate:(id)delegate {
    if (!delegate) {
        [self ly_setScrollviewDelegate:delegate];
        return;
    }
    [self ly_setDelegate:delegate];
    
    Method orgDelMtd = class_getInstanceMethod([delegate class], @selector(collectionView:didSelectItemAtIndexPath:));
    SEL sel = @selector(ly_collectionView:didSelectItemAtIndexPath:);
    Method func = class_getInstanceMethod([UICollectionView class], sel);
    IMP imp = method_getImplementation(func);
    const char *types = method_getTypeEncoding(func);
    
    class_addMethod([delegate class], sel, imp, types);
    Method swzDelMtd = class_getInstanceMethod([delegate class], @selector(ly_collectionView:didSelectItemAtIndexPath:));
    method_exchangeImplementations(orgDelMtd, swzDelMtd);
    
}

- (void)ly_collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {
    
    NSLog(@"UICollectionView-------打点了%@", [collectionView description]);
    [self ly_collectionView:collectionView didSelectItemAtIndexPath:indexPath];
}

@end

@implementation UIControl (AOP)

+ (void)load {
    Method orgDelMtd = class_getInstanceMethod([self class], @selector(sendAction:to:forEvent:));
    Method swzDelMtd = class_getInstanceMethod([self class], @selector(ly_sendAction:to:forEvent:));
    method_exchangeImplementations(orgDelMtd, swzDelMtd);
}

- (void)ly_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    if (([self isKindOfClass:NSClassFromString(@"UITabBarButton")] && [NSStringFromSelector(action) isEqualToString:@"_sendAction:withEvent:"])) {
        NSString *viewPath = [self viewPath];
        NSLog(@"UIControl-------打点了%@-%@\n|||viewPath - %@|||", NSStringFromSelector(action), [target description], viewPath);
    }
    else if (![self isKindOfClass:NSClassFromString(@"UITabBarButton")]){
        NSString *viewPath = [self viewPath];
        NSLog(@"UIControl-------打点了%@-%@\n|||viewPath - %@|||", NSStringFromSelector(action), [target description], viewPath);
    }
    [self ly_sendAction:action to:target forEvent:event];
}

@end

@implementation UIApplication (AOP)

+ (void)load {
    
    Method orgDelMtd = class_getInstanceMethod(NSClassFromString(@"UIGestureRecognizerTarget"), NSSelectorFromString(@"_sendActionWithGestureRecognizer:"));

    SEL sel = @selector(ly_sendActionWithGestureRecognizer:);
    Method func = class_getInstanceMethod([self class], sel);
    //IMP imp = (IMP)ly_sendActionWithGestureRecognizer;
    
    IMP imp = method_getImplementation(func);
    
    const char *types = method_getTypeEncoding(func);
    
    class_addMethod(NSClassFromString(@"UIGestureRecognizerTarget"), sel, imp, types);
    //class_addMethod(NSClassFromString(@"UIGestureRecognizerTarget"), NSSelectorFromString(@"ly_sendActionWithGestureRecognizer:"), (IMP)ly_sendActionWithGestureRecognizer, "v@:@");
    //Method swzDelMtd = class_getInstanceMethod(NSClassFromString(@"UIGestureRecognizerTarget"), NSSelectorFromString(@"ly_sendActionWithGestureRecognizer:"));
    //Method swzDelMtd = class_getInstanceMethod(NSClassFromString(@"UIGestureRecognizerTarget"), @selector(ly_sendActionWithGestureRecognizer:));
    Method swzDelMtd = class_getInstanceMethod(NSClassFromString(@"UIGestureRecognizerTarget"), @selector(ly_sendActionWithGestureRecognizer:));
    method_exchangeImplementations(orgDelMtd, swzDelMtd);
}

//void ly_sendActionWithGestureRecognizer(id self, SEL _cmd, UIGestureRecognizer *recong) {
//    NSLog(@"打点了%@", recong);
//    [self performSelector:@selector(ly_sendActionWithGestureRecognizer:) withObject:recong];
    //[self ly_sendActionWithGestureRecognizer:recong];
//}

- (void)ly_sendActionWithGestureRecognizer:(UIGestureRecognizer *)recong {
    
    if (recong.state == UIGestureRecognizerStateEnded) {
        UIView *sourceView = recong.sourceView;
        NSString *viewPath = [sourceView viewPath];
        NSLog(@"手势-------打点了%@\n|||viewPath - %@|||", recong, viewPath);
    }
    [self ly_sendActionWithGestureRecognizer:recong];
}

@end

@implementation UIView (viewPath)

- (NSString *)viewPath {
    
    NSString *viewPath = nil;
    NSString *viewPathIndex = nil;
    
    UIView *view = self;
    //UIView *superView = self.superview;
    id superView = self.nextResponder;

    while (superView) {
        NSString *viewClsName = NSStringFromClass([view class]);
        Class cls = view.class;
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"class==%@",cls];
        unsigned long index = 0;
        if ([superView isKindOfClass:[UIView class]] && [view isKindOfClass:[UIView class]]) {
            UIView *superV = (UIView *)superView;
            NSArray *sameViewList = [superV.subviews filteredArrayUsingPredicate:predicate];
            if ([sameViewList containsObject:view]) {
                index = [sameViewList indexOfObject:view];
            }else {
                index = 0;
            }
        }
        else if ([view isKindOfClass:[UIViewController class]]){
            
            UIViewController *vc = (UIViewController *)view;
            /**
            UIViewController *parentVC = vc.parentViewController;
            if (parentVC && parentVC.childViewControllers.count > 1) {
                index = [parentVC.childViewControllers indexOfObject:vc];
            }else {
                index = 0;
            }
            NSLog(@"第%lu个child控制器", index);
             */
            if ([vc canPerformAction:@selector(alias) withSender:nil]) {
                NSString *alias = [vc performSelector:@selector(alias) withObject:nil];
                viewClsName = alias;
            }
        }
        else {
            index = 0;
        }
        
        // if ([viewClsName isEqualToString:@"UIViewControllerWrapperView"]) {
        //   view = superView;
        // superView = nil;
        //}
        //else {
        
        // }
        if (viewPath) {
            viewPath = [NSString stringWithFormat:@"%@-%@", viewClsName, viewPath];
            viewPathIndex = [NSString stringWithFormat:@"%lu-%@", index, viewPathIndex];
        }else {
            viewPath = viewClsName;
            viewPathIndex = [NSString stringWithFormat:@"%lu", index];
        }
        NSArray *breakList = @[@"UIWindow", @"UIViewController"];
        BOOL stop = NO;
        for (NSString *clsName in breakList) {
            if ([view isKindOfClass:NSClassFromString(clsName)]) {
                stop = YES;
                break;
            }
        }
        if (stop) {
            break;
        }
        view = superView;
        superView = view.nextResponder;
    }
    viewPath = [NSString stringWithFormat:@"%@&%@", viewPath, viewPathIndex];
    NSLog(@"viewPath - %@", viewPath);
    
    return viewPath;
}

+ (void)load {
    
    Method orgDelMtd = class_getInstanceMethod(self, @selector(addGestureRecognizer:));
    Method swzDelMtd = class_getInstanceMethod(self, @selector(ly_addGestureRecognizer:));
    method_exchangeImplementations(orgDelMtd, swzDelMtd);
}

- (void)ly_addGestureRecognizer:(UIGestureRecognizer *)recong {
    recong.sourceView = self;
    if (recong.state == UIGestureRecognizerStateEnded) {
        NSLog(@"手势-------打点了%@", recong);
    }
    [self ly_addGestureRecognizer:recong];
}
@end

@implementation UIGestureRecognizer (sourceView)

- (UIView *)sourceView {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setSourceView:(UIView *)sourceView {
    objc_setAssociatedObject(self, @selector(sourceView), sourceView, OBJC_ASSOCIATION_ASSIGN);
}

@end


