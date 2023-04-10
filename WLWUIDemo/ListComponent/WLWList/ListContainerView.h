//
//  ListContainerView.h
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/7.
//

#import <UIKit/UIKit.h>
#import "SimpleCodeDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListContainerView : UIView

@property (nonatomic, strong) SectionFlowLayout *layout;
@property (nonatomic, strong) ListViewLayoutContainer         *listContainer;
@property (nonatomic, strong) UICollectionView                *listView;

@end

NS_ASSUME_NONNULL_END
