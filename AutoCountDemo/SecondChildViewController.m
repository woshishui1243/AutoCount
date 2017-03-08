//
//  SecondChildViewController.m
//  AutoCountDemo
//
//  Created by dayu on 17/3/6.
//  Copyright © 2017年 dayu. All rights reserved.
//

#import "SecondChildViewController.h"


@interface OneViewController : UIViewController

@end

@implementation OneViewController

- (void)viewDidLoad {
    NSLog(@"%@%s", [self class], __func__);
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 100, 100)];
    btn.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnDidClick:(UIButton *)btn {
    NSLog(@"%@-%s", [self class], __func__);
}

- (void)viewWillAppear:(BOOL)animated {

    NSLog(@"%@%s", [self class], __func__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (NSString *)alias {
    NSString *str = [NSStringFromClass([self class]) stringByReplacingOccurrencesOfString:@"ViewController" withString:@"VC"];
    return str;
}

@end

@interface TwoViewController : UIViewController

@end

@implementation TwoViewController

- (void)viewDidLoad {
    NSLog(@"%@%s", [self class], __func__);
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 400, 100, 100)];
    btn.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnDidClick:(UIButton *)btn {
    NSLog(@"%@-%s", [self class], __func__);
}

- (void)viewWillAppear:(BOOL)animated {
    

    NSLog(@"%@%s", [self class], __func__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (NSString *)alias {
    NSString *str = [NSStringFromClass([self class]) stringByReplacingOccurrencesOfString:@"ViewController" withString:@"VC"];
    return str;
}

@end

@interface ThreeViewController : UIViewController

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    NSLog(@"%@%s", [self class], __func__);
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(200, 200, 150, 150)];
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnDidClick:(UIButton *)btn {
    NSLog(@"%@-%s", [self class], __func__);
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%@%s", [self class], __func__);
}

- (NSString *)alias {
    NSString *str = [NSStringFromClass([self class]) stringByReplacingOccurrencesOfString:@"ViewController" withString:@"VC"];
    return str;
}

@end

@interface FourViewController : UIViewController

@end

@implementation FourViewController

- (void)viewDidLoad {
    NSLog(@"%@%s", [self class], __func__);
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(300, 400, 50, 150)];
    btn.backgroundColor = [UIColor blackColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnDidClick:(UIButton *)btn {
    NSLog(@"%@-%s", [self class], __func__);
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%@%s", [self class], __func__);
}

- (NSString *)alias {
    NSString *str = [NSStringFromClass([self class]) stringByReplacingOccurrencesOfString:@"ViewController" withString:@"VC"];
    return str;
}
@end


@interface SecondChildViewController ()

@property (nonatomic, weak) OneViewController *oneVC;
@property (nonatomic, weak) TwoViewController *twoVC;
@property (nonatomic, weak) ThreeViewController *threeVC;
@property (nonatomic, weak) FourViewController *fourVC;
@property (nonatomic, weak) UIViewController *currentVC;

@end

@implementation SecondChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    // Do any additional setup after loading the view.
    
    CGFloat x = 20;
    for (NSInteger i = 0; i < 3; i++) {
        x += i * 60;
        UIButton *topBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(x, 70, 50, 25)];
        topBtn1.backgroundColor = [UIColor redColor];
        topBtn1.tag = i;
        [self.view addSubview:topBtn1];
        [topBtn1 addTarget:self action:@selector(topBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];

    }
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    btn1.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(btn1DidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 250, 50, 50)];
    btn2.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(btn2DidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 50, 50)];
    btn3.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn3];
    [btn3 addTarget:self action:@selector(btn3DidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(200, 400, 50, 50)];
    btn4.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn4];
    [btn4 addTarget:self action:@selector(btn4DidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    NSLog(@"哈哈哈哈-%s", __func__);
    //self.childViewControllerForStatusBarHidden
    OneViewController *firstVC = [[OneViewController alloc] init];
    [self addChildViewController:firstVC];
   // [firstVC didMoveToParentViewController:self];
    firstVC.view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:firstVC.view];
    self.oneVC = firstVC;
    _currentVC = firstVC;
    
    
    
}

- (void)topBtnDidClick:(UIButton *)btn {
    switch (btn.tag) {
        case 0:{
            FourViewController *fourVC = [[FourViewController alloc] init];
            fourVC.view.backgroundColor = [UIColor lightGrayColor];
            [self addChildViewController:fourVC];
            self.fourVC = fourVC;
        }
            break;
        case 1:{
            TwoViewController *twoVC = [[TwoViewController alloc] init];
            [self addChildViewController:twoVC];
            twoVC.view.backgroundColor = [UIColor greenColor];
            [twoVC didMoveToParentViewController:self];
            self.twoVC = twoVC;
        }
            break;
        case 2:{
            ThreeViewController *threeVC = [[ThreeViewController alloc] init];
            threeVC.view.backgroundColor = [UIColor lightGrayColor];
            [self addChildViewController:threeVC];
            self.threeVC = threeVC;
        }
            break;
        default:
            break;
    }
    
}

- (void)btn4DidClick:(UIButton *)btn {
    NSLog(@"第三个界面第一个按钮被点击了");
    
    if (_currentVC == self.fourVC) {
        return;
    }
    [self transitionFromViewController:_currentVC toViewController:self.fourVC duration:0.25 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
        
    } completion:^(BOOL finished) {
        self.currentVC = self.fourVC;
    }];
}

- (void)btn1DidClick:(UIButton *)btn {
    NSLog(@"第三个界面第一个按钮被点击了");
    
    if (_currentVC == self.oneVC) {
        return;
    }
    [self transitionFromViewController:_currentVC toViewController:self.oneVC duration:0.25 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        
    } completion:^(BOOL finished) {
        self.currentVC = self.twoVC;
    }];
}

- (void)btn2DidClick:(UIButton *)btn {
    NSLog(@"第三个界面第二个按钮被点击了");
    
    if (_currentVC == self.twoVC) {
        return;
    }
    [self transitionFromViewController:_currentVC toViewController:self.twoVC duration:0.25 options:UIViewAnimationOptionTransitionCurlUp animations:^{
        
    } completion:^(BOOL finished) {
        self.currentVC = self.twoVC;
    }];
    /**
    TwoViewController *firstVC = [[TwoViewController alloc] init];
    firstVC.view.backgroundColor = [UIColor greenColor];
    firstVC.view.frame = CGRectMake(0, 180, self.view.bounds.size.width, 180);
    [self addChildViewController:firstVC];
    [firstVC didMoveToParentViewController:self];
    firstVC.view.frame = CGRectMake(0, 180, self.view.bounds.size.width, 180);
    [self.view addSubview:firstVC.view];
     */
}

- (void)btn3DidClick:(UIButton *)btn {
    NSLog(@"第三个界面第三个按钮被点击了");
    if (_currentVC == self.threeVC) {
        return;
    }
    [self transitionFromViewController:_currentVC toViewController:self.threeVC duration:0.25 options:UIViewAnimationOptionCurveEaseOut animations:nil completion:^(BOOL finished) {
        self.currentVC = self.threeVC;
    }];
    /**
    ThreeViewController *firstVC = [[ThreeViewController alloc] init];
    firstVC.view.backgroundColor = [UIColor lightGrayColor];
    firstVC.view.frame = CGRectMake(0, 360, self.view.bounds.size.width, 180);
    [self.view addSubview:firstVC.view];
    [self addChildViewController:firstVC];
     */
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"第三个控制器将要出现");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers {
    return YES;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods {
    return YES;
}

@end

