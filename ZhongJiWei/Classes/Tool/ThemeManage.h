//
//  ThemeManage.h
//  ZhongJiWei
//
//  Created by Mc on 2018/12/7.
//  Copyright © 2018年 Mc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ThemeManage : NSObject

#pragma mark - 颜色属性
@property(nonatomic, retain) UIColor *bgColor;
@property(nonatomic, retain) UIColor *color1;
@property(nonatomic, retain) UIColor *color2;
@property(nonatomic, retain) UIColor *color3;
@property(nonatomic, retain) UIColor *color4;
@property(nonatomic, retain) UIColor *textColor;
@property(nonatomic, retain) UIColor *textColorGray;
@property(nonatomic, retain) UIColor *navBarColor;
@property(nonatomic, retain) UIColor *colorClear;

#pragma mark -

// 是否是夜间 YES表示夜间, NO为正常
@property(nonatomic, assign) BOOL isNight;

/**
 * 模式管理单例
 */
+ (ThemeManage *)shareThemeManage;

@end
