//
//  HsListContainerVC.m
//  HsMarketModule
//
//  Created by wangliwei on 2022/11/25.
//  Copyright © 2022 tzyj. All rights reserved.
//

#import "ListContainerVC.h"

@interface ListContainerVC ()

@end

@implementation ListContainerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configListContainer];
}

- (void)configListContainer {
    [self.view addSubview:self.listView];
    [self.listView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.listView fullLayoutInView:self.view];
}


__lazy_var(UICollectionView, listView,
           initWithFrame:self.view.bounds collectionViewLayout:self.layout, {
    _listView.backgroundColor = UIColor.clearColor;
})

__lazy_var(ListViewLayoutContainer, listContainer,
           initWithListView:self.listView viewController:self)

__lazy_var(SectionFlowLayout, layout, init)


@end
