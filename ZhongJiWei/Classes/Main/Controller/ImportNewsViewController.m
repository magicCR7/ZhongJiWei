//
//  ImportNewsViewController.m
//  ZhongJiWei
//
//  Created by Mc on 2018/12/5.
//  Copyright © 2018年 Mc. All rights reserved.
//

#import "ImportNewsViewController.h"
#import "TopScrollView.h"

@interface ImportNewsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainTableView;

@end

@implementation ImportNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews {
    UITableView *mainTableV = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    mainTableV.delegate = self;
    mainTableV.dataSource = self;
    mainTableV.showsVerticalScrollIndicator = NO;
    mainTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    mainTableV.sectionFooterHeight = 0;
    mainTableV.sectionHeaderHeight = 0;
    [self.view addSubview:mainTableV];
    self.mainTableView = mainTableV;
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(-Nav_Height-Statusbar_Height);
    }];
    
    TopScrollView *view = [[TopScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, (SCREEN_HEIGHT-Nav_Height-Statusbar_Height)/2)];
    [self.view addSubview:view];
}

#pragma mark - tableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    TopScrollView *headerView = [[TopScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, (SCREEN_HEIGHT-Statusbar_Height-Nav_Height)/2)];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return (SCREEN_HEIGHT-Statusbar_Height-Nav_Height)/2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


@end
