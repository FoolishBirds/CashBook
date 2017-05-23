//
//  BillVC.m
//  CashBook
//
//  Created by TLY on 2017/4/5.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import "BillVC.h"
#import "UIScrollView+TLYScrollView.h"

@interface BillVC () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *costMonthLabel;
@property (weak, nonatomic) IBOutlet UILabel *earningMonthLabel;
@property (weak, nonatomic) IBOutlet UILabel *costLabel;
@property (weak, nonatomic) IBOutlet UILabel *earningLabel;
@property (weak, nonatomic) IBOutlet UITableView *costTableView;
@end

@implementation BillVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI
{
    //获取当前月份
    NSString *currentMonth = [[[MyTool getCurrentDateString]substringWithRange:NSMakeRange(5, 1)]isEqualToString:@"0"] ? [[MyTool getCurrentDateString]substringWithRange:NSMakeRange(6, 1)] : [[MyTool getCurrentDateString]substringWithRange:NSMakeRange(5, 2)];
    _costMonthLabel.text = [NSString stringWithFormat:@"%@月收入", currentMonth];
    _earningMonthLabel.text = [NSString stringWithFormat:@"%@月支出", currentMonth];
    
}

#pragma mark - UIScrollView delegate
int _lastScrollPosition;
int _isLastScrollUp = -1;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 滚动时处理头部用户列表视图的隐藏&显示
    int currentPostion = scrollView.contentOffset.y;
    if (currentPostion - _lastScrollPosition > 15) {
        _lastScrollPosition = currentPostion;
        if (_isLastScrollUp == 0) {
            return;
        }
        if (scrollView.contentOffset.y < 0) {
            return;
        }
        _isLastScrollUp = 0;
        //        NSLog(@"ScrollDown now");
        if (_scrollDirectionChanged && !scrollView.tly_isScrolledToTop && !scrollView.tly_isScrolledToBottom) {
            _scrollDirectionChanged(NO);
        }
    }else if (_lastScrollPosition - currentPostion > 15) {
        _lastScrollPosition = currentPostion;
        if (_isLastScrollUp == 1) {
            return;
        }
        _isLastScrollUp = 1;
        //        NSLog(@"ScrollUp now");
        if (_scrollDirectionChanged && !scrollView.tly_isScrolledToTop && !scrollView.tly_isScrolledToBottom) {
            _scrollDirectionChanged(YES);
        }
    }
    if (scrollView.tly_isScrolledToTop || scrollView.tly_isScrolledToBottom) {
        _isLastScrollUp = -1;
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
