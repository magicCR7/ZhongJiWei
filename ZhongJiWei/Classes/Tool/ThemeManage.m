//
//  ThemeManage.m
//  ZhongJiWei
//
//  Created by Mc on 2018/12/7.
//  Copyright © 2018年 Mc. All rights reserved.
//

#import "ThemeManage.h"

static ThemeManage *themeManage; // 单例


@implementation ThemeManage

#pragma mark - 单例的初始化

+ (ThemeManage *)shareThemeManage {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        themeManage = [[ThemeManage alloc] init];
    });
    return themeManage;
}

#pragma mark 重写isNight的set方法

- (void)setIsNight:(BOOL)isNight {
    
    _isNight = isNight;
    
    if (self.isNight) { // 夜间模式改变相关颜色
        
        self.bgColor = DominantNightColor;
        self.textColor = [UIColor whiteColor];
        self.color1 = RGB(13, 20, 31, 1);
        self.navBarColor = DominantNightColor;//[UIColor whiteColor];
        self.color2 = RGB(82, 94, 123, 1);
        self.textColorGray = [UIColor whiteColor];
        self.color3 = [UIColor whiteColor];
    } else{
        
        self.bgColor = [UIColor whiteColor];
        self.textColor = [UIColor blackColor];
        self.color1 = DominantGrayColor;
        self.color3 = DominantColor;
        self.navBarColor = [UIColor colorWithRed:0.31 green:0.73 blue:0.58 alpha:1];
        self.color2 = [UIColor whiteColor];
        self.textColorGray = [UIColor grayColor];
    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        self.colorClear = [UIColor clearColor];
    });
}

@end

