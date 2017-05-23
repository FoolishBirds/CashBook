//
//  WriteBillVC.m
//  CashBook
//
//  Created by TLY on 2017/4/6.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import "WriteBillVC.h"
#import "UISegmentedControl+TLYSeg.h"
#import "UIButton+btn.h"
#import "TLYKeyboardView.h"
@interface WriteBillVC ()

@end

@implementation WriteBillVC

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

#pragma mark - Init
- (void)initUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    //seg
    UISegmentedControl * segmentedControl = [UISegmentedControl TLYSegSetTitleName:@[@"收入", @"支出"] tintColor:KGetColor(0, 120, 250, 1) NormalTextColor:KGetColor(0, 120, 250, 1) SelectedTextColor:[UIColor whiteColor] valueChangedBlock:^{
        
    }];
    self.navigationItem.titleView = segmentedControl;
    //rightBarItem
    UIButton * btn = [AppHelper getNavigationBtnImage:[UIImage imageNamed:@"error"] target:self action:@selector(quit) frame:CGRectMake(0, 0, 30, 30)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    //
    UILabel * numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 60)];
    numberLabel.text = @"0.00";
    numberLabel.textColor = [UIColor blackColor];
    numberLabel.font = [UIFont systemFontOfSize:17];
    numberLabel.textAlignment = 2;
    [self.view addSubview:numberLabel];
    //keyboard
    TLYKeyboardView * keyboardView = [[TLYKeyboardView alloc]initWithFrame:CGRectMake(0, kScreenHeight *2/3., kScreenWidth, kScreenHeight/3.)];
    [self.view addSubview:keyboardView];
    
    keyboardView.resultBlock = ^(NSString * string) {
        dispatch_async(dispatch_get_main_queue(), ^{
            numberLabel.text = string;
        });
    };
}

- (void)quit
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Dealloc
- (void)dealloc
{
    KMyLog(@"WriteBillVC dealloc");
}

#pragma mark - Memory
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
