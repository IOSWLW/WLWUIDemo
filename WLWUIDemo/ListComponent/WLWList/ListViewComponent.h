//
//  ListViewComponent.h
//  HsCommonEngine
//
//  Created by wangliwei on 2022/11/13.
//  Copyright © 2022 tzyj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "UICollectionView+RegistrerAble.h"

NS_ASSUME_NONNULL_BEGIN
@class SectionFlowLayout;
@protocol ListViewComponentProtocol <NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate>

@end

@interface ListViewComponent<__contravariant VC: UIViewController *>
: NSObject <ListViewComponentProtocol>

@property (nonatomic, weak) UICollectionView *listView;
@property (nonatomic, weak) VC viewController;
@property (nonatomic) NSInteger sectionIndex;

- (void)reloadComponent;
- (void)reloadDataScrollToTop;

@end

@interface ListViewComponent (Layout)

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;

- (UIEdgeInsets)sectionFlowLayout:(SectionFlowLayout *)layout backgroundViewEdgeAtSecion:(NSInteger)section;
- (Class)sectionFlowLayout:(SectionFlowLayout *)layout backgroundViewAtSecion:(NSInteger)section;
- (BOOL)sectionFlowLayout:(SectionFlowLayout *)layout headerPinToTop:(NSInteger)section;
- (BOOL)sectionFlowLayout:(SectionFlowLayout *)layout left:(NSInteger)section;

- (void)sectionFlowLayout:(SectionFlowLayout *)layout section:(NSInteger)section headerPinToTopScorllOffset:(CGFloat)offsetValue;

@end

NS_ASSUME_NONNULL_END
