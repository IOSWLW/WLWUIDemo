//
//  SubPageComponentCell.h
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/4.
//

#import <UIKit/UIKit.h>

@class ListViewComponent;
NS_ASSUME_NONNULL_BEGIN

@class ListContainerVC;
@class WLWScrollUnite;
@interface SubPageComponentCell : UICollectionViewCell

@property (nonatomic, strong, readonly) NSMutableArray<ListContainerVC *> *subViewControllers;

@property (nonatomic, strong, readonly) NSMutableArray<UIScrollView *> *subScrollViews;

@property (nonatomic, strong, readonly) NSArray<NSArray<ListViewComponent *> *> *datas;

@property (nonatomic, strong) WLWScrollUnite *scrollUnite;

- (void)configData:(NSArray<NSArray<ListViewComponent *> *> *)datas;

@end

NS_ASSUME_NONNULL_END
