//
//  ChannelViewController.m
//  ZhongJiWei
//
//  Created by Mc on 2018/12/6.
//  Copyright © 2018年 Mc. All rights reserved.
//

#import "ChannelViewController.h"

@interface ChannelViewController ()

@end

@implementation ChannelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加手势
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [self.view addGestureRecognizer:singleTap];
    // Do any additional setup after loading the view.
}

- (void)dismiss {
    self.view.backgroundColor = [UIColor clearColor];
    if (self.viewDismissBlock) {
        self.viewDismissBlock();
    }
}

@end
