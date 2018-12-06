//
//  LeftViewController.m
//  ZhongJiWei
//
//  Created by Mc on 2018/12/4.
//  Copyright © 2018年 Mc. All rights reserved.
//

#import "LeftViewController.h"
#import "LeftWindowTableViewCell.h"

@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIImageView *topImageView;
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) UIView *mainView;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    
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
        make.left.top.bottom.offset(0);
        make.width.equalTo(@(SCREEN_WIDTH/4*3));
    }];
    
    _topImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leftwindow-img"]];
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
    static NSString *ID = @"LeftWindowTableViewCell";
    LeftWindowTableViewCell *cell = [[LeftWindowTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.backgroundColor = DominantGrayColor;
    switch (indexPath.row) {
        case 0: {

        }
            break;
        case 1: {
            cell.textLabel.text = @"信息公开";
        }
            break;
        case 2: {
            cell.textLabel.text = @"党纪法规";
        }
            break;
        case 3: {
            cell.textLabel.text = @"反“四风”一键通";
            cell.detailTextLabel.text = @"(欢迎举报)";
            //            [cell.imageView setImage:[UIImage imageNamed:@"collected"]];
            //            CGSize itemSize = CGSizeMake(25, 25);
            //            [self changeImageSize:itemSize andCell:cell];
        }
            break;
        case 4: {
            cell.textLabel.text = @"关于我们";
        }
            break;
        default:
            break;
    }
    return cell;
}

- (void)dismiss {
    self.view.backgroundColor = [UIColor clearColor];
    if (self.viewDismissBlock) {
        self.viewDismissBlock();
    }
}

@end
