//
//  LeftViewController.h
//  ZhongJiWei
//
//  Created by Mc on 2018/12/4.
//  Copyright © 2018年 Mc. All rights reserved.
//

#import "PublicViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LeftViewController : PublicViewController

@property(nonatomic, copy)void(^viewDismissBlock)(void) ;
@property(nonatomic, copy)void(^showWebBlock)(NSInteger row) ;

@end

NS_ASSUME_NONNULL_END
