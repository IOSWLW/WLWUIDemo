//
//  WrapperCollectionViewCell.h
//  HsCommonEngine
//
//  Created by wangliwei on 2022/11/27.
//  Copyright © 2022 tzyj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class WrapperCollectionViewCell;
@protocol WrappedAbleViewToCollectionPotocol <NSObject>

@required
+ (UIView *)createWrapperView;

@optional
- (void)configWrapperData:(id)data;
- (void)layoutInWrapperView:(WrapperCollectionViewCell *)cell;

@end


@interface WrapperCollectionViewCell <T: UIView<WrappedAbleViewToCollectionPotocol>*, D> : UICollectionViewCell

@property (nonatomic, strong, readonly) T wrappedView;

@property (nonatomic, strong, readonly) D data;

- (void)configWrapperData:(D)data;

+ (__kindof WrapperCollectionViewCell *)dequeueReusableCellWithClass:(Class<WrappedAbleViewToCollectionPotocol>)iClass
                                                      collectionView:(__kindof UICollectionView *)collectionView
                                                        forIndexPath:(NSIndexPath *)indexPath;

@end



NS_ASSUME_NONNULL_END
