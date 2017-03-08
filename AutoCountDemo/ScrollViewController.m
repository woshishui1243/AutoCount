//
//  ScrollViewController.m
//  AutoCountDemo
//
//  Created by dayu on 17/2/28.
//  Copyright © 2017年 dayu. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scrollView.delegate = self;
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    redView.backgroundColor = [UIColor redColor];
    self.scrollView.clipsToBounds = YES;
    self.scrollView.contentSize = CGSizeMake(400, 500);
    [self.scrollView addSubview:redView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
