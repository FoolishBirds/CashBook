//
//  TLYKeyboardView.m
//  CashBook
//
//  Created by TLY on 2017/4/6.
//  Copyright © 2017年 hampoo. All rights reserved.

#import "TLYKeyboardView.h"
#import "UIView+TLYLayout.h"

static float interval = 1.f;
@implementation TLYKeyboardView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    self.backgroundColor = [UIColor blackColor];
    //按键背景色
    UIColor * keyColor = KGetColor(70, 70, 70, 1);
    //非数字按键title颜色
    UIColor * nonNumTitleColor = KGetColor(200, 150, 27, 1);
    float width = (self.width - interval * 3)/4.f;
    float height = (self.height - interval * 3)/4.f;
    NSArray *keyboardTitleArr = @[@"7", @"8", @"9", @"", @"4", @"5", @"6", @"+", @"1", @"2", @"3", @"-", @"." , @"0", @"OK"];
    //calculate the keyboard's layout
    for (int i = 0; i < keyboardTitleArr.count; i++) {
        float x = width * (i % 4) + (i % 4) *interval;
        float y = height * (i /4) + (i / 4) * interval;
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(x, y, width, height)];
        if (i == keyboardTitleArr.count - 1) {
            button.width = 2 * width + interval;
        }
        [button setTitle:keyboardTitleArr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setBackgroundColor:keyColor];
        if (i == 7 | i == 11 | i == 15) {
            [button setTitleColor:nonNumTitleColor forState:UIControlStateNormal];
        }
        if (i == 3) {
            [button setImage:[UIImage imageNamed:@"keyboard_delete"] forState:UIControlStateNormal];
        }
        button.tag = 1000 + i;
        [button addTarget:self action:@selector(btnTappedAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
}

- (void)btnTappedAction:(UIButton *)btn
{
    //state用来记录，下次“+”，“-”，“confirm”键的作用
    NSInteger index = btn.tag - 1000;
    UIButton * confirmButton = [self viewWithTag:(14 + 1000)];
    
    [self confirmStringContainsOpearatorLocatedInLast:self.contentString selectedIndex:index selectedButton:confirmButton];
//    switch (index) {
//        case 3:
//            [confirmButton setTitle:@"=" forState:UIControlStateNormal];
//         
//            self.keyboardActionBlock(KeyboardActionDelete);
//            break;
//        case 7:
//            [confirmButton setTitle:@"=" forState:UIControlStateNormal];
//            
//            break;
//        case 11:
//            [confirmButton setTitle:@"=" forState:UIControlStateNormal];
//            
//            break;
//        case 15:
//            [confirmButton setTitle:@"OK" forState:UIControlStateNormal];
//            self.keyboardActionBlock(KeyboardActionConfirm);
//            break;
//        default:
//            self.keyboardNumBlock(btn.titleLabel.text);
//            break;
//    }
}

//判断字符串是否包含运算符，且不为最后，直接计算结果
- (NSRange)StringContainsOpearator:(NSString *)string
{
    NSArray *arr = @[@"+", @"-"];
    NSString *lastChar = [string substringFromIndex:string.length - 1];
    for (int i = 0; i< arr.count; i++) {
        NSString *obj = (NSString *)arr[i];
        if ([string containsString:obj] && ![lastChar isEqualToString:obj]) {
            NSRange range = [string rangeOfString:obj];
            return range;
        }
    }
    NSRange ran = {0,0};
    return ran;
}

- (void)confirmStringContainsOpearatorLocatedInLast:(NSString *)string selectedIndex:(NSInteger)index selectedButton:(UIButton *)btn
{
    NSString *lastChar = [string substringFromIndex:string.length - 1];
    switch (index) {
        case 3:
            if (string.length > 0) {
                string = [string substringToIndex:string.length - 1];
                if (string.length == 0) {
                    string = @"0";
                }
                if (self.resultBlock) {
                    self.resultBlock(string);
                }
            }
            break;
        case 7:
            if ([lastChar isEqualToString:@"+"]) {
                return;
            }
            else if ([lastChar isEqualToString:@"-"]) {
                NSMutableString *str = [string mutableCopy];
                string = [str stringByReplacingOccurrencesOfString:@"-" withString:@"+" options:NSBackwardsSearch range:NSMakeRange(str.length - 1, 1)];
//                self.keyboardActionBlock(KeyboardActionPlus);
                if (self.resultBlock) {
                    self.resultBlock(string);
                }
                return;
            }
            else if ([self StringContainsOpearator:string].length) {
                NSRange range = [self StringContainsOpearator:string];
                NSString *operatorStr = [string substringWithRange:range];
                long long arg1 = [[string substringToIndex:range.location]longLongValue];
                long long arg2 = [[string substringFromIndex:range.location +1]longLongValue];
                long long result = [operatorStr isEqualToString:@"+"] ? arg1 + arg2 : arg1 - arg2;
                if (self.resultBlock) {
                    self.resultBlock([NSString stringWithFormat:@"%@%@", @(result), @"+"]);
                }
            }
            break;
        case 11:
            if ([lastChar isEqualToString:@"-"]) {
                return;
            }
            else if ([lastChar isEqualToString:@"+"]){
                NSMutableString *str = [string mutableCopy];
                string = [str stringByReplacingOccurrencesOfString:@"+" withString:@"-" options:NSBackwardsSearch range:NSMakeRange(str.length - 1, 1)];
                
                if (self.resultBlock) {
                    self.resultBlock(string);
                }
                return;
            }
            else if ([self StringContainsOpearator:string].length) {
                NSRange range = [self StringContainsOpearator:string];
                NSString *operatorStr = [string substringWithRange:range];
                long long arg1 = [[string substringToIndex:range.location]longLongValue];
                long long arg2 = [[string substringFromIndex:range.location +1]longLongValue];
                long long result = [operatorStr isEqualToString:@"+"] ? arg1 + arg2 : arg1 - arg2;
                if (self.resultBlock) {
                    self.resultBlock([NSString stringWithFormat:@"%@%@", @(result), @"-"]);
                }
            }
            
            break;
        case 15:
            if ([lastChar isEqualToString:@"+"]||[lastChar isEqualToString:@"-"]) {
                NSMutableString *str = [string mutableCopy];
                string = [str substringToIndex:str.length - 1];
                string = str;
                if (self.resultBlock) {
                    self.resultBlock(string);
                }
                return;
            }
            else if ([self StringContainsOpearator:string].length) {
                NSRange range = [self StringContainsOpearator:string];
                NSString *operatorStr = [string substringWithRange:range];
                long long arg1 = [[string substringToIndex:range.location]longLongValue];
                long long arg2 = [[string substringFromIndex:range.location +1]longLongValue];
                long long result = [operatorStr isEqualToString:@"+"] ? arg1 + arg2 : arg1 - arg2;
                if (self.resultBlock) {
                    self.resultBlock([@(result)stringValue]);
                }
            }
            break;
        default:
            if (self.resultBlock) {
                if ([string floatValue] == 0) {
                    
                }
                self.resultBlock(btn.titleLabel.text);
            }
            break;
    }
}
//判断字符串是否包含数字
- (BOOL)StringContainsNum:(NSString *)string
{
    return YES;
}
@end
