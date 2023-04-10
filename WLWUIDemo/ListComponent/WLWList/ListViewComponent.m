//
//  ListViewComponent.m
//  HsCommonEngine
//
//  Created by wangliwei on 2022/11/13.
//  Copyright © 2022 tzyj. All rights reserved.
//

#import "ListViewComponent.h"

@implementation ListViewComponent

- (void)reloadComponent {}
- (void)reloadDataScrollToTop {
    [self.listView reloadData];
    [self.listView setContentOffset:CGPointZero];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    NSAssert(NO, @"Must Override");
    return [UICollectionViewCell new];
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSAssert(NO, @"Must Override");
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {}


@end

@implementation ListViewComponent (Scroll)

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return nil;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view {}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale {}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
    return YES;
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {}

@end

@implementation ListViewComponent (Collection)

- (void)collectionView:(UICollectionView *)collectionView performPrimaryActionForItemAtIndexPath:(NSIndexPath *)indexPath {}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {}

- (void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(UICollectionReusableView *)view forElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

@end

@implementation ListViewComponent (Layout)

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeZero;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeZero;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeZero;
}

- (UIEdgeInsets)sectionFlowLayout:(SectionFlowLayout *)layout backgroundViewEdgeAtSecion:(NSInteger)section {
    return UIEdgeInsetsZero;
}

- (Class)sectionFlowLayout:(SectionFlowLayout *)layout backgroundViewAtSecion:(NSInteger)section {
    return nil;
}

- (BOOL)sectionFlowLayout:(SectionFlowLayout *)layout headerPinToTop:(NSInteger)section {
    return NO;
}

- (BOOL)sectionFlowLayout:(SectionFlowLayout *)layout left:(NSInteger)section {
    return NO;
}

- (void)sectionFlowLayout:(SectionFlowLayout *)layout section:(NSInteger)section headerPinToTopScorllOffset:(CGFloat)offsetValue {}

@end

