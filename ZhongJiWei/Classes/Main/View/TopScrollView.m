//
//  TopScrollView.m
//  ZhongJiWei
//
//  Created by Mc on 2018/12/6.
//  Copyright © 2018年 Mc. All rights reserved.
//

#define IMAGEVIEW_COUNT                3
//#define _picHeight                300

#import "TopScrollView.h"
#import "BigPageControl.h"

@interface TopScrollView()<UIScrollViewDelegate>
//滚动视图
@property(nonatomic,retain)UIScrollView *scrollView;
//左图片
@property(nonatomic,retain)UIImageView *leftImageView;
//中间图片
@property(nonatomic,retain)UIImageView *centerImageView;
//右边图片
@property(nonatomic,retain)UIImageView *rightImageView;
//页面控制器
@property(nonatomic,retain)BigPageControl *pageControl;
//图片的标题
@property(nonatomic,retain)UILabel *label;
@property(nonatomic,assign)NSInteger currentImageIndex;//当前图片下标
@property(nonatomic,assign)NSInteger imageCount;//图片总数

@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, assign) CGFloat picHeight;

@end

@implementation TopScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _picHeight = frame.size.height;
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.imageCount = IMAGEVIEW_COUNT;
#pragma mark 添加scrollView控件
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    [self addSubview:_scrollView];
    //设置代理
    self.scrollView.delegate = self;
    //设置contentSize
    self.scrollView.contentSize = CGSizeMake(IMAGEVIEW_COUNT * SCREEN_WIDTH, 0) ;
    //设置当前显示的位置为中间图片
    self.scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    //设置分页
    self.scrollView.pagingEnabled = YES;
    //去掉滚动条
    self.scrollView.showsHorizontalScrollIndicator = NO;
#pragma mark 添加图片三个控件
    self.leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, _picHeight)];
    [self.scrollView addSubview:_leftImageView];
    self.centerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, _picHeight)];
    
    [self.scrollView addSubview:_centerImageView];
    self.rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(2 * SCREEN_WIDTH, 0, SCREEN_WIDTH, _picHeight)];
    
    [self.scrollView addSubview:_rightImageView];
    
#pragma mark 添加底部view
    _bottomView = [UIView new];
    _bottomView.backgroundColor = RGB(0, 0, 0, 0.7);
    [self addSubview:_bottomView];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.offset(0);
        make.height.equalTo(@40);
    }];
    
    self.pageControl = [[BigPageControl alloc]init];
    
    //设置总页数
    self.pageControl.numberOfPages = self.imageCount;
    [self.bottomView addSubview:_pageControl];
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.top.offset(0);
        make.width.equalTo(@80);
    }];
    
    _label = [UILabel new];
    _label.text = @"C罗破门，追平尤文尘封61年记录";
    _label.textColor = [UIColor whiteColor];
    [self.bottomView addSubview:_label];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.right.equalTo(self.pageControl.mas_left).offset(-15);
        make.left.offset(15);
    }];
    
#pragma mark 设置默认显示图片
    //加载默认图片
    self.leftImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.JPG",_imageCount - 1]];
    self.centerImageView.image = [UIImage imageNamed:@"0.jpg"];
    self.rightImageView.image = [UIImage imageNamed:@"1.JPG"];
    self.currentImageIndex = 0;
    //设置当前页
    self.pageControl.currentPage = self.currentImageIndex;
    
}

#pragma mark 滚动停止事件
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //重新加载图片
    [self reloadImage];
    //移动到中间
    self.scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    //设置分页
    self.pageControl.currentPage = self.currentImageIndex;
}

#pragma mark 重新加载图片
-(void)reloadImage{
    NSInteger leftImageIndex,rightImageIndex;
    CGPoint offset = [self.scrollView contentOffset];
    if (offset.x > SCREEN_WIDTH) { //向右滑动
        self.currentImageIndex = (self.currentImageIndex + 1) % self.imageCount;
    }else if(offset.x < SCREEN_WIDTH){ //向左滑动
        self.currentImageIndex = (self.currentImageIndex + self.imageCount - 1) % self.imageCount;
    }
    
    self.centerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.JPG",self.currentImageIndex]];
    
    //重新设置左右图片
    leftImageIndex = (self.currentImageIndex + self.imageCount - 1) % self.imageCount;
    rightImageIndex = (self.currentImageIndex + 1) % self.imageCount;
    self.leftImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.JPG",leftImageIndex]];
    self.rightImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.JPG",rightImageIndex]];
}

@end
