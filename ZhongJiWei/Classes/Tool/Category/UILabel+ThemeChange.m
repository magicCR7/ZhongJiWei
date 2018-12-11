
//
//  UILabel+ThemeChange.m
//  ZhongJiWei
//
//  Created by Mc on 2018/12/11.
//  Copyright © 2018年 Mc. All rights reserved.
//

#import "UILabel+ThemeChange.h"
// 添加runtime头文件
#import <objc/runtime.h>
#import "ThemeManage.h"
#import "UIView+ThemeChange.h"

@implementation UILabel (ThemeChange)


#pragma mark - 添加字体颜色枚举的属性

- (void)setTextType:(id)textType {
    objc_setAssociatedObject(self, @selector(textType), textType, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)textType {
    return objc_getAssociatedObject(self, @selector(textType));
}

#pragma mark - 重写changeColor方法

- (void)changeColor {
    
    [super changeColor];
    
    switch ([self.textType integerValue]) {
        case LabelColorBlack:
            self.textColor = [ThemeManage shareThemeManage].textColor;
            break;
        case LabelColorGray:
            self.textColor = [ThemeManage shareThemeManage].color3;
            break;
            
        default:
            break;
    }
}

- (void)NightTextType:(LabelColor)type {
    self.textType = [NSNumber numberWithInteger:type];
    [self changeColor];
}


#pragma mark - 初始化字体的颜色

- (void)initTextColor {
    switch ([self.textType integerValue]) {
        case LabelColorBlack:
            self.textColor = [ThemeManage shareThemeManage].textColor;
            break;
        case LabelColorGray:
            self.textColor = [ThemeManage shareThemeManage].color3;
            break;
            
        default:
            break;
    }
}

@end
