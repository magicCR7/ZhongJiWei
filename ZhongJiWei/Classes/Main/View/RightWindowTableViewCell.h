//
//  RightWindowTableViewCell.h
//  ZhongJiWei
//
//  Created by Mc on 2018/12/4.
//  Copyright © 2018年 Mc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RightWindowTableViewCell : UITableViewCell

@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UISwitch *rightSwitch;

@property(nonatomic, copy)void(^switchValueChanged)(void);

@end

NS_ASSUME_NONNULL_END
