//
//  RightViewController.m
//  ZhongJiWei
//
//  Created by Mc on 2018/12/4.
//  Copyright © 2018年 Mc. All rights reserved.
//

#import "RightViewController.h"
#import "RightWindowTableViewCell.h"
#import "ThemeManage.h"
//#import "UIView+ThemeChange.h"

@interface RightViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIImageView *topImageView;
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) UIView *mainView;

@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
//    [self.view NightWithType:UIViewColorTypeNormal];
}

- (void)setupViews {
    self.view.backgroundColor = [UIColor clearColor];
    //加手势
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [self.view addGestureRecognizer:singleTap];
    //    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:self.view.bounds];
    //    toolbar.barStyle = UIBarStyleBlackTranslucent;
    //    [self.view addSubview:toolbar];
    
    _mainView = [UIView new];
    _mainView.backgroundColor = DominantGrayColor;
    [self.view addSubview:_mainView];
    [_mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.offset(0);
        make.width.equalTo(@(SCREEN_WIDTH/4*3));
    }];
    
    _topImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rightwindow-img"]];
    [self.mainView addSubview:_topImageView];
    [_topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.mainView);
        make.height.equalTo(self.mainView.mas_width);
    }];
    
    //TableView
    UITableView *tableView = [UITableView new];
    tableView.backgroundColor = DominantGrayColor;
    tableView.scrollEnabled = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.mainView addSubview:tableView];
    self.mainTableView = tableView;
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topImageView.mas_bottom).offset(40);
        make.left.right.offset(0);
        make.bottom.offset(-30);
    }];
    
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = DominantColor;
    [self.mainView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.equalTo(@5);
    }];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"RightWindowTableViewCell";
    RightWindowTableViewCell *cell = [[RightWindowTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    cell.backgroundColor = DominantGrayColor;
    switch (indexPath.row) {
        case 0: {
            cell.rightButton.hidden = NO;
            [cell.rightButton setImage:[UIImage imageNamed:@"arrow-right"] forState:UIControlStateNormal];
            cell.rightButton.imageEdgeInsets = UIEdgeInsetsMake(8, 15, 8, 15);
        }
            break;
        case 1: {
            cell.rightButton.hidden = NO;
            [cell.rightButton setTitle:@"无" forState:UIControlStateNormal];
            cell.textLabel.text = @"我的收藏";
        }
            break;
        case 2: {
            cell.rightSwitch.hidden = NO;
            cell.rightSwitch.tag = 01;
            [cell.rightSwitch setOn:[ThemeManage shareThemeManage].isNight];
            cell.textLabel.text = @"护眼模式";
        }
            break;
        case 3: {
            cell.rightSwitch.hidden = NO;
            [cell.rightSwitch setOn:YES];
            cell.textLabel.text = @"启动声音";
        }
            break;
        case 4: {
            cell.textLabel.text = @"清除缓存";
            cell.rightButton.hidden = NO;
            [cell.rightButton setTitleColor:DominantColor forState:UIControlStateNormal];
            [cell.rightButton setTitle:@"0.0MB" forState:UIControlStateNormal];
        }
            break;
        default:
            break;
    }
    //switch
    __weak typeof(RightWindowTableViewCell *) weakCell = cell;
    cell.switchValueChanged = ^{
        if (weakCell.rightSwitch.tag == 01) {
            if (weakCell.rightSwitch.on) {
                [ThemeManage shareThemeManage].isNight = YES;
                [[NSNotificationCenter defaultCenter] postNotificationName:@"changeColor" object:nil];
                [[NSUserDefaults standardUserDefaults] setBool:[ThemeManage shareThemeManage].isNight forKey:@"night"];
                
            } else {
                [ThemeManage shareThemeManage].isNight = NO;
                [[NSUserDefaults standardUserDefaults] setBool:[ThemeManage shareThemeManage].isNight forKey:@"night"];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"changeColor" object:nil];

            }
        }
    };
    return cell;
}

#pragma mark - 移除监听
- (void)dealloc {
    // 移除监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)dismiss {
    self.view.backgroundColor = [UIColor clearColor];
    if (self.viewDismissBlock) {
        self.viewDismissBlock();
    }
}



@end
