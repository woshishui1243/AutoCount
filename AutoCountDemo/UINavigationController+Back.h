//
//  UINavigationController+Back.h
//  AutoCountDemo
//
//  Created by dayu on 17/2/27.
//  Copyright © 2017年 dayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Back)

@end

@protocol BackButtonHandlerProtocol <NSObject>

@optional

// Override this method in UIViewController derived class to handle 'Back' button click

-(BOOL)navigationShouldPopOnBackButton;

@end

@interface UIViewController (BackButtonHandler) <BackButtonHandlerProtocol>

@end
