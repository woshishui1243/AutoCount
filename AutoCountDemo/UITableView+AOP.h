//
//  UITableView+AOP.h
//  AutoCountDemo
//
//  Created by dayu on 17/2/24.
//  Copyright © 2017年 dayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (AOP)

@end
 
@interface UITableView (AOP)

@end

@interface UICollectionView (AOP)

@end

@interface UIControl (AOP)

@end

@interface UIApplication (AOP)

@end

@interface UIView (viewPath)

- (NSString *)viewPath;

@end

@interface UIGestureRecognizer (sourceView)

@property (nonatomic, weak) UIView *sourceView;

@end
