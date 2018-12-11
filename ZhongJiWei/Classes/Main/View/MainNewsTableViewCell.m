//
//  MainNewsTableViewCell.m
//  ZhongJiWei
//
//  Created by Mc on 2018/12/6.
//  Copyright © 2018年 Mc. All rights reserved.
//

#import "MainNewsTableViewCell.h"
#import "UITableViewCell+ThemeChange.h"

@implementation MainNewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
         self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupViews];
        [self NightWithType:UIViewColorTypeNormal];

    }
    return self;
}

- (void)setupViews {
    CGFloat padding = 15.0f;
    _mainImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2"]];
    [self.contentView addSubview:_mainImageView];
    [_mainImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(padding);
        make.bottom.offset(-padding);
        make.width.equalTo(@150);
        make.height.equalTo(@90);
    }];
    
    _titleLabel = [UILabel new];
    _titleLabel.text = @"C罗破门，尤文尘封61年记录被追平";
    _titleLabel.numberOfLines = 0;
    _titleLabel.font = [UIFont systemFontOfSize:LargeFontSize];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mainImageView.mas_right).offset(padding);
        make.top.offset(padding);
        make.right.offset(-padding);
        make.height.greaterThanOrEqualTo(@10);
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.equalTo(@0.7);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
