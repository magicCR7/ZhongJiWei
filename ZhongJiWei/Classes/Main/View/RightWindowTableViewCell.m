//
//  RightWindowTableViewCell.m
//  ZhongJiWei
//
//  Created by Mc on 2018/12/4.
//  Copyright © 2018年 Mc. All rights reserved.
//

#import "RightWindowTableViewCell.h"

@interface RightWindowTableViewCell()

@end

@implementation RightWindowTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        //        self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

- (void)setupViews {
    [self.imageView setImage:[UIImage imageNamed:@"setting"]];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(30);
        make.width.height.equalTo(@20);
        make.top.offset(15);
        make.bottom.offset(-20);
    }];
    self.textLabel.font = [UIFont systemFontOfSize:LargeFontSize];
    self.textLabel.textColor = [UIColor grayColor];
    self.textLabel.text = @"搜    索";
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView.mas_right).offset(20);
        make.top.equalTo(self.imageView.mas_top);
    }];
    
//    UIImageView *rightImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow-right"]];
//    [self.contentView addSubview:rightImageV];
//    [rightImageV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.contentView.mas_centerY);
//        make.right.offset(-25);
//        make.height.width.equalTo(@15);
//    }];
    //右侧按钮
    UIButton *rightBtn = [UIButton new];
    rightBtn.hidden = YES;
    rightBtn.backgroundColor = [UIColor clearColor];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:LittleFontSize];
    [rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    rightBtn.layer.masksToBounds = YES;
    rightBtn.layer.cornerRadius = 15.5f;
    rightBtn.layer.borderWidth = 1.0f;
    rightBtn.layer.borderColor = [UIColor grayColor].CGColor;
    [self.contentView addSubview:rightBtn];
    self.rightButton = rightBtn;
    [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.offset(-25);
        make.height.equalTo(@31);
        make.width.greaterThanOrEqualTo(@51);
    }];
    
    self.rightSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    self.rightSwitch.onTintColor = DominantColor;
    self.rightSwitch.hidden = YES;
    self.rightSwitch.layer.borderColor = [UIColor grayColor].CGColor;
    self.rightSwitch.layer.borderWidth = 1.0f;
    self.rightSwitch.layer.masksToBounds = YES;
    self.rightSwitch.layer.cornerRadius = 15.5f;
    [self.rightSwitch addTarget:self action:@selector(swicthValueChange:) forControlEvents:UIControlEventValueChanged];
    [self.contentView addSubview:self.rightSwitch];
    [self.rightSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.offset(-25);
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)swicthValueChange:(UISwitch *)sender {
    
}

@end
