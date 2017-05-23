//
//  BaseVC.m
//  CashBook
//
//  Created by TLY on 2017/4/5.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import "BaseVC.h"

@interface BaseVC ()

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.navigationController.viewControllers.count > 1) {
        UIButton *backButton = [AppHelper getNavigationBtnImage:[UIImage imageNamed:@"返回icon"] target:self action:@selector(goBack) frame:CGRectMake(0, 0, 22, 22)];
        UIBarButtonItem *leftBarbuttonItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
        self.navigationItem.leftBarButtonItem = leftBarbuttonItem;
    }
}

- (void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    KMyLog(@"BaseVC dealloc");
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
