//
//  UINavigationBar+ThemeChange.m
//  ZhongJiWei
//
//  Created by Mc on 2018/12/10.
//  Copyright © 2018年 Mc. All rights reserved.
//

#import "UINavigationBar+ThemeChange.h"
#import "ThemeManage.h"
#import "UIView+ThemeChange.h"

@implementation UINavigationBar (ThemeChange)

#pragma mark - 添加type的set,get方法

- (void)changeColor {
    
    [super changeColor];
    
    [self setBarTintColor:[ThemeManage shareThemeManage].bgColor];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTitleTextAttributes:@{NSForegroundColorAttributeName: [ThemeManage shareThemeManage].navBarColor}];
    
    // 改变电池栏Style
    if ([ThemeManage shareThemeManage].isNight) {
        [self setBarStyle:UIBarStyleBlackTranslucent];
    } else{
        [self setBarStyle:UIBarStyleDefault];
    }
}

@end
