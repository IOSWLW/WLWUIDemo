//
//  DemoComponent1.m
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/1.
//

#import "DemoComponent1.h"
#import "DemoCell.h"
#import "DemoHeaderView.h"
#import "DemoBgView.h"
#import "DemoFooterView.h"


@implementation DemoComponent1

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DemoCell *cell = [collectionView dequeueReusableCellWithClass:DemoCell.class forIndexPath:indexPath xib:YES];
    cell.label.text = [NSString stringWithFormat:@"%ld-%ld", indexPath.section,indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        DemoHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withClass:DemoHeaderView.class forIndexPath:indexPath xib:YES];
        view.backgroundColor = UIColor.clearColor;
        view.header.text = [NSString stringWithFormat:@"headre %ld", indexPath.section];
        return view;
    }
    else if (kind == UICollectionElementKindSectionFooter) {
        DemoFooterView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withClass:DemoFooterView.class forIndexPath:indexPath xib:YES];
        return view;
    }
    return nil;
}

/// layout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(0, 44);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(0, 44);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(16, 16, 16, 16);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((kScreenWidth - 16*4) / 3, 80);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 16;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 16;
}

- (Class)sectionFlowLayout:(SectionFlowLayout *)layout backgroundViewAtSecion:(NSInteger)section {
    return DemoBgView.class;
}

- (UIEdgeInsets)sectionFlowLayout:(SectionFlowLayout *)layout backgroundViewEdgeAtSecion:(NSInteger)section {
    return UIEdgeInsetsMake(0, 6, 0, 6);
}

- (BOOL)sectionFlowLayout:(SectionFlowLayout *)layout headerPinToTop:(NSInteger)section {
    return YES;
}



@end
