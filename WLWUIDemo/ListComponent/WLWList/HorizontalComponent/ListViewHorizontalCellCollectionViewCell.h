//
//  ListViewHorizontalCellCollectionViewCell.h
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/7.
//

#import <UIKit/UIKit.h>
@class ListViewComponent;
NS_ASSUME_NONNULL_BEGIN

@interface ListViewHorizontalCellCollectionViewCell : UICollectionViewCell

- (void)configData:(NSArray<ListViewComponent *> *)datas;

@end

NS_ASSUME_NONNULL_END
