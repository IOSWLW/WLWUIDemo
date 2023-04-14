//
//  HsScrollUnite.h
//  TzyjMainProj
//
//  Created by wangliwei on 2021/9/25.
//  Copyright © 2021 hundsun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface WLWScrollUnite : NSObject

@property (nonatomic) CGFloat    maxOffsetY;

/// 下拉刷新
@property(nonatomic, copy) void(^refresh)(void);

@property (nonatomic, strong) UIScrollView                *subScrollview;

/// 解决scrollView嵌套
/// @param view 父视图
/// @param mainScrollView 主
/// @param subSrollView 子
/// @param max 子距上主Y的偏移
- (void)addPanView:(UIView *)view mainScrollView:(UIScrollView *)mainScrollView subScrollview:(UIScrollView *)subSrollView maxOffsetY:(CGFloat)max;

@end

NS_ASSUME_NONNULL_END
