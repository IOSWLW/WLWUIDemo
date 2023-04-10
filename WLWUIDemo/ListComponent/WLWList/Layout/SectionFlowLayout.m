//
//  SectionFlowLayout.m
//  HsCommonEngine
//
//  Created by wangliwei on 2022/12/3.
//  Copyright © 2022 tzyj. All rights reserved.
//

#import "SectionFlowLayout.h"
#import "SimpleCodeDefine.h"
#import "SectionFlowLayout+PinTop.h"
#import "SectionFlowLayout+BackgroundView.h"
#import "SectionFlowLayout+Left.h"

@implementation SectionFlowLayout

__lazy_var(NSMutableArray, decorationViewAttrs, init)

__lazy_var(NSMutableArray, registerDecorationViewAttrs, init)

__lazy_var(NSMutableArray, pinnedSupplementaryItems, init)

__lazy_var(NSMutableArray, leftIndexPath, init)

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    if (!self.collectionView) {
        return NO;
    }
    if (self.hasPinnedSupplementaryItems || self.sectionHeadersPinToVisibleBounds) {
        return YES;
    }
    return !CGSizeEqualToSize(newBounds.size, self.collectionView.bounds.size);
}

- (void)reset {
    [self.decorationViewAttrs removeAllObjects];
    [self.pinnedSupplementaryItems removeAllObjects];
    [self.leftIndexPath removeAllObjects];
}

- (void)invalidateLayout {
    [self reset];
    [super invalidateLayout];
}

- (void)prepareLayout {
    [super prepareLayout];
    
    if (!self.collectionView) return;
    
    long numberOfSections = self.collectionView.numberOfSections;
    
    for (int i = 0; i < numberOfSections; i ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:i].copy;
        [self addDecorationViewAttrsWithIndexPath:indexPath];
        [self addPinHeaderAttrWithIndexPath:indexPath];
        [self addLeftAttrIndexPath:indexPath];
    }
}

- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *attrs = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray *attrsMutal = [NSMutableArray arrayWithArray:attrs];
    [self layoutAttributesForDecorationView:rect attrs:attrsMutal];
    [self layoutAttributesForHeaderPinTop:rect attrs:attrsMutal];
    attrsMutal = [self layoutAttributesForLeft:rect attrs:attrsMutal];
    return attrsMutal;
}

@end
