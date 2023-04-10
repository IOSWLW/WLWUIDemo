//
//  SectionFlowLayout+BackgroundView.m
//  HsCommonEngine
//
//  Created by wangliwei on 2022/12/11.
//  Copyright © 2022 tzyj. All rights reserved.
//

#import "SectionFlowLayout+BackgroundView.h"

@implementation SectionFlowLayout (BackgroundView)

- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewAtIndexPath:(NSIndexPath *)indexPath {
    if (!self.delegate) return nil;
    if (![self.delegate respondsToSelector:@selector(sectionFlowLayout:backgroundViewAtSecion:)]) return nil;
    Class iClass = [self.delegate sectionFlowLayout:self backgroundViewAtSecion:indexPath.section];
    if (!iClass) return nil;
    NSString *kind = NSStringFromClass(iClass);
    if (![self.registerDecorationViewAttrs containsObject:kind]) {
        [self registerClass:iClass forDecorationViewOfKind:kind];
        [self.registerDecorationViewAttrs addObject:kind];
    }
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:kind withIndexPath:indexPath];
    return attr;
}

- (void)addDecorationViewAttrsWithIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *decAttr = [self layoutAttributesForDecorationViewAtIndexPath:indexPath];
    if (!decAttr) return;
    NSInteger i = indexPath.section;
    long numberOfItems = [self.collectionView numberOfItemsInSection:i];
    
    if (numberOfItems <= 0) return;;
    
    UICollectionViewLayoutAttributes *firstItemAttr = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:i]];
    
    UICollectionViewLayoutAttributes *lastItemAttr = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:(numberOfItems - 1) inSection:i]];
    
    if (!firstItemAttr || !lastItemAttr) return;;
    
    CGRect sectionFrame =  CGRectUnion(firstItemAttr.frame, lastItemAttr.frame);
    
    UIEdgeInsets sectionInset = self.sectionInset;
    if ([self.collectionView.delegate conformsToProtocol:@protocol(UICollectionViewDelegateFlowLayout)]) {
        id<UICollectionViewDelegateFlowLayout> delegate = (id<UICollectionViewDelegateFlowLayout>) self.collectionView.delegate;
        sectionInset = [delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:i];
    }
    
    if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
        sectionFrame.origin.x = 0;
        sectionFrame.origin.y -= sectionInset.top;
        sectionFrame.size.width = self.collectionView.frame.size.width;
        sectionFrame.size.height += sectionInset.top + sectionInset.bottom;
    } else {
        sectionFrame.origin.x -= sectionInset.left;
        sectionFrame.origin.y = 0;
        sectionFrame.size.width += sectionInset.left + sectionInset.right;
        sectionFrame.size.height = CGRectGetMidX(firstItemAttr.frame) < CGRectGetMidX(lastItemAttr.frame) ? self.collectionView.frame.size.height : CGRectGetMaxY(lastItemAttr.frame)  + sectionInset.bottom;
    }
    
    UICollectionViewLayoutAttributes *headerAttr = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:indexPath];
    if (headerAttr) {
        CGRect headerFrame = headerAttr.frame;
        if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
            sectionFrame.origin.y -= headerFrame.size.height;
            sectionFrame.size.height += headerFrame.size.height;
        } else {
            sectionFrame.origin.x -= headerFrame.size.width;
            sectionFrame.size.width += headerFrame.size.width;
        }
    }
    
    UICollectionViewLayoutAttributes *footerAttr = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter atIndexPath:indexPath];
    
    if (footerAttr) {
        CGRect footerFrame = footerAttr.frame;
        if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
            sectionFrame.size.height += footerFrame.size.height;
        } else {
            sectionFrame.size.width += footerFrame.size.width;
        }
    }
    UIEdgeInsets inset = [self.delegate sectionFlowLayout:self backgroundViewEdgeAtSecion:indexPath.section];
    decAttr.frame = sectionFrame;
    decAttr.zIndex = -1;
    decAttr.frame = CGRectMake(decAttr.frame.origin.x + inset.left,
                               decAttr.frame.origin.y + inset.top,
                               decAttr.frame.size.width - inset.left - inset.right,
                               decAttr.frame.size.height - inset.top - inset.bottom);
    
    [self.decorationViewAttrs addObject:decAttr.copy];
}

- (void)layoutAttributesForDecorationView:(CGRect)rect attrs:(NSMutableArray<__kindof UICollectionViewLayoutAttributes *> *)attrs {
    for (UICollectionViewLayoutAttributes *dec in self.decorationViewAttrs) {
        if (CGRectIntersectsRect(dec.frame, rect)) {
            [attrs addObject:dec];
        }
    }
}

@end
