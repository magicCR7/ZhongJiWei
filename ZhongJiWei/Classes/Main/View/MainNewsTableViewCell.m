//
//  MainNewsTableViewCell.m
//  ZhongJiWei
//
//  Created by Mc on 2018/12/6.
//  Copyright © 2018年 Mc. All rights reserved.
//

#import "MainNewsTableViewCell.h"

@implementation MainNewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
