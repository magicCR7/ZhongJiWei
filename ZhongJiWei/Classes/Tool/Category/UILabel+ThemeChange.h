//
//  UILabel+ThemeChange.h
//  ZhongJiWei
//
//  Created by Mc on 2018/12/11.
//  Copyright © 2018年 Mc. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 * 字体颜色状态枚举值
 */
typedef enum : NSUInteger {
    LabelColorBlack, // 白天黑色, 夜间白色
    LabelColorGray, // 白天灰色, 夜间白色
} LabelColor;

@interface UILabel (ThemeChange)

@property(nonatomic, assign) id textType;

- (void)changeColor;

// 设置字体的颜色
- (void)NightTextType:(LabelColor)type;

@end
