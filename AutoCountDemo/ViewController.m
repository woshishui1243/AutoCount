//
//  ViewController.m
//  AutoCountDemo
//
//  Created by dayu on 17/2/24.
//  Copyright © 2017年 dayu. All rights reserved.
//

#import "ViewController.h"
#import "HotelListViewController.h"

@interface LYTableViewCell : UITableViewCell

@end

@interface ViewController ()<UIAlertViewDelegate, UIActionSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    
    [[[UIAlertView alloc] initWithTitle:@"哈哈" message:@"😁😀😁😀" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil] show];
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"%@", [alertView buttonTitleAtIndex:buttonIndex]);
}
#pragma clang diagnostic pop



//在这个方法里写返回按钮的事件处理
- (BOOL) navigationShouldPopOnBackButton {
    [self.navigationController popViewControllerAnimated:YES];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"TableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        
        UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
        redView.backgroundColor = [UIColor redColor];
        [cell.contentView addSubview:redView];
        UITapGestureRecognizer *longRec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        [redView addGestureRecognizer:longRec];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 80, 20)];
        label.backgroundColor = [UIColor yellowColor];
        label.text = @"哈哈哈";
        [redView addSubview:label];
        
        UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(110, 10, 30, 20)];
        [btn1 setTitle:@"👀" forState:UIControlStateNormal];
        [btn1 addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cell.contentView addSubview:btn1];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(140, 10, 80, 20)];
        [btn setTitle:@"钉" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cell.contentView addSubview:btn];

        UISwitch *swch = [[UISwitch alloc] initWithFrame:CGRectMake(230, 10, 50, 20)];
        [cell.contentView addSubview:swch];
        
        UISegmentedControl *segC = [[UISegmentedControl alloc] initWithItems:@[@"电话", @"手机"]];
        [segC addTarget:self action:@selector(segmentedDidChange:) forControlEvents:UIControlEventValueChanged];
        segC.frame = CGRectMake(300, 10, 100, 20);
        [cell.contentView addSubview:segC];
        
    }
    return cell;
}

- (void)longPress:(UILongPressGestureRecognizer *)recongnizer {
    
}

- (void)btnDidClick:(UIButton *)btn {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    [[[UIActionSheet alloc] initWithTitle:@"提醒" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:@"等等", nil]showInView:self.view];
#pragma clang diagnostic pop

    
}

- (void)segmentedDidChange:(UISegmentedControl *)segC {
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(100, 100);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    HotelListViewController *listVC = [[HotelListViewController alloc] initWithCollectionViewLayout:layout];
    [self.navigationController pushViewController:listVC animated:YES];

    NSLog(@"%@%s", [self class],__FUNCTION__);
}
@end

@implementation LYTableViewCell : UITableViewCell


@end
