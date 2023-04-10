//
//  DemoComponent4.m
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/7.
//

#import "DemoComponent4.h"
#import "DemoCell.h"
#import "DemoHeaderView.h"
#import "DemoBgView.h"
#import "SimpleCodeDefine.h"

@implementation DemoComponent4

- (instancetype)initWithSection:(NSInteger)section {
    self = [super init];
    if (self) {
        _section = section;
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DemoCell *cell = [collectionView dequeueReusableCellWithClass:DemoCell.class forIndexPath:indexPath xib:YES];
    cell.label.text = [NSString stringWithFormat:@"%ld-%ld-%ld",_section, (long)indexPath.section,(long)indexPath.row];
    self.listView.pagingEnabled = YES;
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(12, section == 0 ? 12 : 24, 12, 12);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 8;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(kScreenWidth - 100, 60);
}

- (Class)sectionFlowLayout:(SectionFlowLayout *)layout backgroundViewAtSecion:(NSInteger)section {
    return DemoBgView.class;
}
- (UIEdgeInsets)sectionFlowLayout:(SectionFlowLayout *)layout backgroundViewEdgeAtSecion:(NSInteger)section {
    return UIEdgeInsetsMake(0, section == 0 ? 0 : 12, 0, 0);
}


@end
