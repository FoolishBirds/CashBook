//
//  BaseTabbarController.m
//  CashBook
//
//  Created by TLY on 2017/4/5.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import "BaseTabbarController.h"
#import "BaseVC.h"
#import "BaseNavi.h"
#import "WriteBillVC.h"
@interface BaseTabbarController ()

@end

@implementation BaseTabbarController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    DCPathButton * centerButton = [[DCPathButton alloc]initWithCenterImage:[UIImage imageNamed:@"add"] highlightedImage:[UIImage imageNamed:@"add"]];
    UIImage * backImage = [UIImage imageNamed:@"popSendbg"];
    UIImage * billImage = [UIImage imageNamed:@"记账"];
    UIImage * shareImage = [UIImage imageNamed:@"share"];
    DCPathItemButton * item1 = [[DCPathItemButton alloc]initWithImage:billImage highlightedImage:billImage backgroundImage:backImage backgroundHighlightedImage:backImage];
    DCPathItemButton * item2 = [[DCPathItemButton alloc]initWithImage:shareImage highlightedImage:shareImage backgroundImage:backImage backgroundHighlightedImage:backImage];
    [centerButton addPathItems:@[
                                item1,
                                item2
                                ]];
    centerButton.bloomRadius = 100.f;
    centerButton.dcButtonCenter = CGPointMake(kScreenWidth /2.f, kScreenHeight - 35.f);
    centerButton.allowSounds = YES;
    centerButton.allowSubItemRotation = YES;
    centerButton.allowCenterButtonRotation = YES;
    centerButton.bloomDirection = kDCPathButtonBloomDirectionTop;
    centerButton.bottomViewColor = KGetColor(200, 200, 200, 0.8); 
    [self.view addSubview:centerButton];
    centerButton.delegate = self;
}

#pragma mark - Init
- (instancetype)initWithClassName:(NSArray *)className titleName:(NSArray *)titleName unSelectedImageName:(NSArray *)unSelImage SelectedImageName:(NSArray *)selImage
{
    if (self = [super init]) {
        NSInteger count = className.count;
        if (count == 0 || titleName.count != count || unSelImage.count != count ||selImage.count != count) {
            KMyLog(@"baseTabBarController数组设置错误");
            return nil;
        }
        [className enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            BaseVC * vc = [NSClassFromString(obj) new];
            vc.title = titleName[idx];
            BaseNavi * navi = [[BaseNavi alloc]initWithRootViewController:vc];
            UITabBarItem *item = navi.tabBarItem;
            item.title = titleName[idx];
            item.image = [UIImage imageNamed:unSelImage[idx]];
            item.selectedImage = [UIImage imageNamed:selImage[idx]];
            [self addChildViewController:navi];
        }];
    }
    return self;
}

#pragma mark - DCPath delegate
- (void)pathButton:(DCPathButton *)dcPathButton clickItemButtonAtIndex:(NSUInteger)itemButtonIndex
{
    switch (itemButtonIndex) {
        case 0:
        {
            KMyLog(@"write pressed");
            WriteBillVC * writeBillVC = [[WriteBillVC alloc]init];
//            [self.navigationController pushViewController:writeBillVC animated:YES];
            UIViewController * viewVC = [[UINavigationController alloc]initWithRootViewController:writeBillVC];
            [[MyTool getCurrentVC] presentViewController:viewVC animated:YES completion:nil];
            break;
        }
        default:
            KMyLog(@"share pressed");
            break;
    }
}

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
