//
//  MainNewsViewController.m
//  ZhongJiWei
//
//  Created by Mc on 2018/12/4.
//  Copyright © 2018年 Mc. All rights reserved.
//

#import "MainNewsViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "LySegmentMenu.h"
#import "ImportNewsViewController.h"
#import "ChannelViewController.h"
#import "ThemeManage.h"
#import "UIView+ThemeChange.h"
#import "UINavigationBar+ThemeChange.h"
#import <WebKit/WebKit.h>


@interface MainNewsViewController ()<WKNavigationDelegate>

@property (nonatomic, strong) UIWindow *leftWindow;
@property (nonatomic, strong) UIWindow *rightWindow;
@property (nonatomic, strong) UIWindow *channelWindow;
@property (nonatomic, strong) NSMutableArray *vcViewArray;
@property (nonatomic, strong) LySegmentMenu *segmentMenu;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) NSArray *webUrlArray;

@property (weak, nonatomic) WKWebView *webView;


@end

@implementation MainNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    [self setupViews];
    [self.navigationController.navigationBar NightWithType:UIViewColorTypeNormal];
    _webUrlArray = [[NSArray alloc] initWithObjects:@"",@"http://m.ccdi.gov.cn/xxgk/ldjg.html",@"http://www.ccdi.gov.cn/fgk/index",@"https://www.12388.gov.cn/m",@"https://www.baidu.com", nil];
}

//设置导航条
-(void)setupNavBar{
    
    //右上方设置
    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.frame = CGRectMake(0, 0, 20,20);
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(showRightWindow) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
    //左上方更多
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, 20,20);
    UIImage *barBtnImage = [ThemeManage shareThemeManage].isNight ? [UIImage imageNamed:@"setting"] : [UIImage imageNamed:@"more"];
    [leftBtn setBackgroundImage:barBtnImage forState:UIControlStateNormal];
//    [leftBtn setBackgroundImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(showLeftWindow) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nav-img"]];
}

- (void)setupViews {
    self.titleArray = [[NSArray alloc] initWithObjects:@"要闻",@"党风",@"审查调查",@"访谈",@"观点",@"巡视巡查",@"阅微",@"图说",@"专题", nil];
    self.vcViewArray = [[NSMutableArray alloc] init];
    for (int i = 0; i<self.titleArray.count; i++) {
        ImportNewsViewController *newsVc = [[ImportNewsViewController alloc]init];
        [self addChildViewController:newsVc];
        [self.vcViewArray addObject:newsVc.view];
    }
    [self.segmentMenu removeFromSuperview];
    CGRect Rect = CGRectMake(0, Nav_Height+Statusbar_Height, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.segmentMenu = [[LySegmentMenu alloc]initWithFrame:Rect
                                       ControllerViewArray:self.vcViewArray
                                                TitleArray:self.titleArray
                                           MaxShowTitleNum:5];
    [self.view addSubview:self.segmentMenu];
    
    _addButton = [UIButton new];
    _addButton.backgroundColor = DominantGrayColor;
    [_addButton addTarget:self action:@selector(addButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_addButton setTitle:@"+" forState:UIControlStateNormal];
    _addButton.titleEdgeInsets = UIEdgeInsetsMake(5, 10, 10, 0);
    _addButton.titleLabel.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:_addButton];
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.top.offset(Statusbar_Height+Nav_Height);
        make.height.width.equalTo(@44);
    }];
    
    //WebView
    WKWebView *webV = [[WKWebView alloc] init];
    webV.hidden = YES;
    [self.view addSubview:webV];
    
    webV.navigationDelegate = self;
    self.webView = webV;
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)showLeftWindow {
    LeftViewController *leftVc = [[LeftViewController alloc] init];
    self.leftWindow = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.leftWindow.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    self.leftWindow.windowLevel = UIWindowLevelAlert-10;
    self.leftWindow.layer.masksToBounds = YES;
    self.leftWindow.hidden=NO;
    self.leftWindow.rootViewController = leftVc;
    self.leftWindow.backgroundColor = RGB(0, 0, 0, 0.3);

    leftVc.view.frame=CGRectMake(-SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [UIView animateWithDuration:0.3 delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
        leftVc.view.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    } completion:^(BOOL finished) {
//        leftVc.view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
    }];
    
    __weak typeof(self) weakSelf = self;
    leftVc.viewDismissBlock = ^{
        [weakSelf dismissLeftWindow];
    };
    leftVc.showWebBlock = ^(NSInteger row) {
        [weakSelf dismissLeftWindow];
        if (row == 0) {
            self.webView.hidden = YES;
        } else {
            self.webView.hidden = NO;
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",weakSelf.webUrlArray[row]]];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            [weakSelf.webView loadRequest:request];

        }
    };
}

- (void)showRightWindow {
    RightViewController *rightVc = [[RightViewController alloc] init];
    self.rightWindow = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.rightWindow.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    self.rightWindow.windowLevel = UIWindowLevelAlert-10;
    self.rightWindow.layer.masksToBounds = YES;
    self.rightWindow.hidden=NO;
    self.rightWindow.rootViewController = rightVc;
    self.rightWindow.backgroundColor = RGB(0, 0, 0, 0.3);
    
    rightVc.view.frame=CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [UIView animateWithDuration:0.3 delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
        rightVc.view.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    } completion:^(BOOL finished) {
        //        leftVc.view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
    }];
    
    __weak typeof(self) weakSelf = self;
    rightVc.viewDismissBlock = ^{
        [weakSelf dismissRightWindow];
    };
}

-(void)dismissLeftWindow{
    UIViewController *vc=self.leftWindow.rootViewController;
    self.leftWindow.backgroundColor=[UIColor clearColor];
    [UIView animateWithDuration:0.3f animations:^{
    vc.view.frame=CGRectMake(-SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    } completion:^(BOOL finished) {
        self.leftWindow.hidden = YES;
        self.leftWindow = nil;
        
    }];
}

-(void)dismissRightWindow{
    UIViewController *vc=self.rightWindow.rootViewController;
    self.rightWindow.backgroundColor=[UIColor clearColor];
    [UIView animateWithDuration:0.3f animations:^{
        vc.view.frame=CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    } completion:^(BOOL finished) {
        self.rightWindow.hidden = YES;
        self.rightWindow = nil;
        
    }];
}

- (void)addButtonClicked:(UIButton *)sender {
    ChannelViewController *channalVc = [[ChannelViewController alloc] init];
    self.channelWindow = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.channelWindow.windowLevel = UIWindowLevelAlert-10;
    self.channelWindow.layer.masksToBounds = YES;
    self.channelWindow.hidden=NO;
    self.channelWindow.rootViewController = channalVc;
    [UIView animateWithDuration:0.3 delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
        channalVc.view.backgroundColor = RGB(0, 0, 0, 0.5);
    } completion:^(BOOL finished) {
        
    }];
    
    __weak typeof(self) weakSelf = self;
    channalVc.viewDismissBlock = ^{
        [weakSelf dismissChannalWindow];
    };
}

- (void)dismissChannalWindow {
    UIViewController *vc=self.channelWindow.rootViewController;
//    [UIView animateWithDuration:3.0 animations:^{
        vc.view.backgroundColor = RGB(0, 0, 0, 0.1);
//    } completion:^(BOOL finished) {
        self.channelWindow.hidden = YES;
        self.channelWindow = nil;
//    }];
}

@end
