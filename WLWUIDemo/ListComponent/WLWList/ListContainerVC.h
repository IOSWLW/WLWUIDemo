//
//  HsListContainerVC.h
//  HsMarketModule
//
//  Created by wangliwei on 2022/11/25.
//  Copyright © 2022 tzyj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimpleCodeDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListContainerVC : UIViewController

@property (nonatomic, strong) SectionFlowLayout *layout;
@property (nonatomic, strong) ListViewLayoutContainer         *listContainer;
@property (nonatomic, strong) UICollectionView                *listView;

- (void)configListContainer;

@end

NS_ASSUME_NONNULL_END
