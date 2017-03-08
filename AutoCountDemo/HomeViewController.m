//
//  HomeViewController.m
//  AutoCountDemo
//
//  Created by dayu on 17/2/24.
//  Copyright © 2017年 dayu. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UITapGestureRecognizer *recong = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hahhaa)];
    [self.redView addGestureRecognizer:recong];
    
}
- (IBAction)addReduceDidClick:(UIStepper *)sender {
    NSLog(@"%@%s", [sender class],__FUNCTION__);

}
- (IBAction)sliderDidChange:(UISlider *)sender {
    NSLog(@"%@%s", [sender class],__FUNCTION__);

}
- (IBAction)segmentedDidSelected:(UISegmentedControl *)sender {
    NSLog(@"%@%s", [sender class],__FUNCTION__);

}
- (IBAction)btnDidcClick:(UIButton *)sender {
    NSLog(@"%@%s", [sender class],__FUNCTION__);
    
}

- (void)hahhaa {
    
}


- (IBAction)valueDidChange:(UISwitch *)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
}

@end
