//
//  ListViewContainer.m
//  HsCommonEngine
//
//  Created by wangliwei on 2022/11/13.
//  Copyright © 2022 tzyj. All rights reserved.
//

#import "ListViewContainer.h"

@interface  ListViewContainer() <ListViewComponentProtocol>
@end

@implementation ListViewContainer

- (instancetype)initWithListView:(UICollectionView *)listView viewController:(UIViewController *)vc {
    if (self = [super init]) {
        _listView = listView;
        _viewController = vc;
        listView.delegate = self;
        listView.dataSource = self;
    }
    return self;
}

- (void)dealloc {
    self.listView.delegate = nil;
    self.listView.dataSource = nil;
}

- (void)setComponents:(NSArray<ListViewComponent *> *)components {
    _components = components;
    int i = 0;
    for (ListViewComponent *obj in _components) {
        obj.viewController = self.viewController;
        obj.listView = self.listView;
        obj.sectionIndex = i;
        i++;
    }
    [self.listView reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.components.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return [self.components[indexPath.section] collectionView:collectionView cellForItemAtIndexPath:indexPath];
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.components[section] collectionView:collectionView numberOfItemsInSection:section];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    return [self.components[indexPath.section] collectionView:collectionView viewForSupplementaryElementOfKind:kind atIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if(self.components.count <= indexPath.section) return;;
    return [self.components[indexPath.section] collectionView:collectionView didSelectItemAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if(self.components.count <= indexPath.section) return;;
    [self.components[indexPath.section] collectionView:collectionView willDisplayCell:cell forItemAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    if(self.components.count <= indexPath.section) return;;
    [self.components[indexPath.section] collectionView:collectionView willDisplaySupplementaryView:view forElementKind:elementKind atIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if(self.components.count <= indexPath.section) return;;
    [self.components[indexPath.section] collectionView:collectionView didEndDisplayingCell:cell forItemAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(UICollectionReusableView *)view forElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    if(self.components.count <= indexPath.section) return;;
    [self.components[indexPath.section] collectionView:collectionView didEndDisplayingSupplementaryView:view forElementOfKind:elementKind atIndexPath:indexPath];
}

@end

@implementation ListViewContainer (Scroll)

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    for (ListViewComponent *obj in _components) {
        [obj scrollViewDidScroll:scrollView];
    }
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    for (ListViewComponent *obj in _components) {
        [obj scrollViewDidZoom:scrollView];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    for (ListViewComponent *obj in _components) {
        [obj scrollViewWillBeginDragging:scrollView];
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    for (ListViewComponent *obj in _components) {
        [obj scrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    for (ListViewComponent *obj in _components) {
        [obj scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
    }
}

@end

@implementation ListViewLayoutContainer

- (instancetype)initWithListView:(__kindof UICollectionView *)listView viewController:(UIViewController *)vc {
    if (self = [super initWithListView: listView viewController:vc]) {
        if ([listView.collectionViewLayout isKindOfClass:SectionFlowLayout.class]) {
            SectionFlowLayout *layout = (SectionFlowLayout *)listView.collectionViewLayout;
            layout.delegate = self;
        }
    }
    return self;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section >= self.components.count ) return CGSizeZero;
    ListViewComponent *component = self.components[indexPath.section];
    return [component collectionView:collectionView
                              layout:collectionViewLayout
              sizeForItemAtIndexPath: indexPath];
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section >= self.components.count ) return UIEdgeInsetsZero;
    ListViewComponent *component = self.components[section];
    return [component collectionView:collectionView layout:collectionViewLayout insetForSectionAtIndex: section];
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (section >= self.components.count ) return 0;
    ListViewComponent *component = self.components[section];
    return [component collectionView:collectionView layout:collectionViewLayout minimumLineSpacingForSectionAtIndex:section];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    if (section >= self.components.count ) return 0;
    ListViewComponent *component = self.components[section];
    return [component collectionView:collectionView layout:collectionViewLayout minimumInteritemSpacingForSectionAtIndex:section];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section >= self.components.count ) return CGSizeZero;
    ListViewComponent *component = self.components[section];
    return [component collectionView:collectionView layout:collectionViewLayout referenceSizeForHeaderInSection:section];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (section >= self.components.count ) return CGSizeZero;
    ListViewComponent *component = self.components[section];
    return [component collectionView:collectionView layout:collectionViewLayout referenceSizeForFooterInSection:section];
}

- (UIEdgeInsets)sectionFlowLayout:(SectionFlowLayout *)layout backgroundViewEdgeAtSecion:(NSInteger)section {
    if (section >= self.components.count ) return UIEdgeInsetsZero;
    ListViewComponent *component = self.components[section];
    return [component sectionFlowLayout:layout backgroundViewEdgeAtSecion:section];
}

- (Class)sectionFlowLayout:(SectionFlowLayout *)layout backgroundViewAtSecion:(NSInteger)section {
    if (section >= self.components.count ) return nil;
    ListViewComponent *component = self.components[section];
    return [component sectionFlowLayout:layout backgroundViewAtSecion:section];
}

- (BOOL)sectionFlowLayout:(SectionFlowLayout *)layout headerPinToTop:(NSInteger)section {
    if (section >= self.components.count ) return NO;
    ListViewComponent *component = self.components[section];
    return [component sectionFlowLayout:layout headerPinToTop:section];
}

- (BOOL)sectionFlowLayout:(SectionFlowLayout *)layout left:(NSInteger)section {
    if (section >= self.components.count ) return NO;
    ListViewComponent *component = self.components[section];
    return [component sectionFlowLayout:layout left:section];
}

- (void)sectionFlowLayout:(SectionFlowLayout *)layout section:(NSInteger)section headerPinToTopScorllOffset:(CGFloat)offsetValue {
    if (section >= self.components.count ) return;
    ListViewComponent *component = self.components[section];
    return [component sectionFlowLayout:layout section:section headerPinToTopScorllOffset:offsetValue];
}

@end




