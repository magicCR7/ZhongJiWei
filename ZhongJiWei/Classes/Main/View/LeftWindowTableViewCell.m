//
//  LeftWindowTableViewCell.m
//  ZhongJiWei
//
//  Created by Mc on 2018/12/4.
//  Copyright © 2018年 Mc. All rights reserved.
//

#import "LeftWindowTableViewCell.h"

@implementation LeftWindowTableViewCell

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
//        make.bottom.offset(-20);
    }];
    self.textLabel.font = [UIFont systemFontOfSize:LargeFontSize];
    self.textLabel.textColor = [UIColor grayColor];
    self.textLabel.text = @"首    页";
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView.mas_right).offset(20);
        make.top.equalTo(self.imageView.mas_top);
    }];
    
    self.detailTextLabel.font = [UIFont systemFontOfSize:NormalFontSize];
    self.detailTextLabel.textColor = [UIColor lightGrayColor];
    [self.detailTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textLabel.mas_bottom).offset(5);
        make.left.equalTo(self.textLabel.mas_left);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-12);
    }];
    
    UIImageView *rightImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow-right"]];
    [self.contentView addSubview:rightImageV];
    [rightImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.offset(-25);
        make.height.width.equalTo(@15);
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
