//
//  UINavigationBar+ThemeChange.h
//  ZhongJiWei
//
//  Created by Mc on 2018/12/10.
//  Copyright © 2018年 Mc. All rights reserved.
//

#import <UIKit/UIKit.h>

///**
// * 颜色状态枚举值 颜色的定义(一个代表一套)
// */
//typedef NS_ENUM(NSInteger, UIViewColorType) {
//
//    UIViewColorTypeNormal, // 白天白色, 夜间黑色
//    UIViewColorType1, // 白天蓝色, 夜间深灰
//    UIViewColorType2, // 白天浅蓝, 夜间浅蓝
//    UIViewColorTypeClear // 透明状态
//};



@interface UINavigationBar (ThemeChange)

// 改变颜色的方法
- (void)changeColor;

@end

