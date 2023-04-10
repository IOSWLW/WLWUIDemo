//
//  DemoHorizontalComponent.m
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/10.
//

#import "DemoHorizontalComponent.h"
#import "DemoComponent4.h"
#import "SimpleCodeDefine.h"

@implementation DemoHorizontalComponent

- (NSArray<ListViewComponent *> *)configDataWithSection:(NSInteger)section {
    return @[[DemoComponent4.alloc initWithSection:section],
             [DemoComponent4.alloc initWithSection:section]];
}

// layout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(kScreenWidth - 24, 300);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 12, 12, 12);
}

@end
