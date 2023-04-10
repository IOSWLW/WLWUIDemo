//
//  ListViewContainer.h
//  HsCommonEngine
//
//  Created by wangliwei on 2022/11/13.
//  Copyright © 2022 tzyj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListViewComponent.h"
#import "SectionFlowLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListViewContainer<__covariant VC: UIViewController * >
: NSObject

@property (nonatomic, weak, readonly) __kindof UICollectionView *listView;
@property (nonatomic, weak, readonly) VC viewController;
@property (nonatomic, strong) NSArray<ListViewComponent *> *components;

- (instancetype)initWithListView:(__kindof UICollectionView *)listView
                  viewController:(VC _Nullable)vc;



@end

@interface ListViewLayoutContainer : ListViewContainer <UICollectionViewDelegateFlowLayout, SectionFlowLayoutDelegate>

@end

NS_ASSUME_NONNULL_END
