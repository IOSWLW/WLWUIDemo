//
//  SectionFlowLayout.h
//  HsCommonEngine
//
//  Created by wangliwei on 2022/12/3.
//  Copyright © 2022 tzyj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SectionFlowLayout;
NS_ASSUME_NONNULL_BEGIN

@protocol SectionFlowLayoutDelegate <NSObject>

- (UIEdgeInsets)sectionFlowLayout:(SectionFlowLayout *)layout backgroundViewEdgeAtSecion:(NSInteger)section;

- (Class)sectionFlowLayout:(SectionFlowLayout *)layout backgroundViewAtSecion:(NSInteger)section;

- (BOOL)sectionFlowLayout:(SectionFlowLayout *)layout left:(NSInteger)section;

- (BOOL)sectionFlowLayout:(SectionFlowLayout *)layout headerPinToTop:(NSInteger)section;

- (void)sectionFlowLayout:(SectionFlowLayout *)layout section:(NSInteger)section headerPinToTopScorllOffset:(CGFloat)offsetValue;

@end

@interface SectionFlowLayout : UICollectionViewFlowLayout

// 是否有置顶
@property (nonatomic) BOOL hasPinnedSupplementaryItems;

// 置顶header
@property (nonatomic, strong) NSMutableArray *pinnedSupplementaryItems;

// 装饰视图，背景
@property (nonatomic, strong) NSMutableArray *decorationViewAttrs;

//强制左对齐
@property (nonatomic, strong) NSMutableArray *leftIndexPath;

// 注册背景视图
@property (nonatomic, strong) NSMutableArray *registerDecorationViewAttrs;

@property (nonatomic, weak) id<SectionFlowLayoutDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
