//
//  DemoComponent2.m
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/1.
//

#import "DemoComponent2.h"
#import "DemoCell.h"
#import "DemoHeaderView.h"
#import "DemoBgView.h"


@implementation DemoComponent2

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DemoCell *cell = [collectionView dequeueReusableCellWithClass:DemoCell.class forIndexPath:indexPath xib:YES];
    cell.label.text = [NSString stringWithFormat:@"%ld-%ld", indexPath.section,indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        DemoHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withClass:DemoHeaderView.class forIndexPath:indexPath xib:YES];
        view.header.text = [NSString stringWithFormat:@"headre %ld", indexPath.section];
        return view;
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}


// layout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(kScreenWidth, 44);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(12, 12, 12, 12);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((kScreenWidth - 12*2), 64);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 16;
}

- (Class)sectionFlowLayout:(SectionFlowLayout *)layout backgroundViewAtSecion:(NSInteger)section {
    return DemoBgView.class;
}

- (UIEdgeInsets)sectionFlowLayout:(SectionFlowLayout *)layout backgroundViewEdgeAtSecion:(NSInteger)section {
    return UIEdgeInsetsMake(6, 6, 0, 6);
}

- (BOOL)sectionFlowLayout:(SectionFlowLayout *)layout headerPinToTop:(NSInteger)section {
    return YES;
}


@end
