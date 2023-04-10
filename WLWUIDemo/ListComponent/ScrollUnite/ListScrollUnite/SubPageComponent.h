//
//  SubPageComponent.h
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/4.
//

#import "ListViewComponent.h"

NS_ASSUME_NONNULL_BEGIN
@class ListContainerVC;
@interface SubPageComponent : ListViewComponent

@property (nonatomic, strong, readonly) NSMutableArray<ListContainerVC *> *subViewControllers;

@property (nonatomic, strong) NSArray<NSArray<ListViewComponent *> *> *datas;

@end

NS_ASSUME_NONNULL_END
