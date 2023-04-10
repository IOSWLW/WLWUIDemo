//
//  SectionFlowLayout+PinTop.m
//  HsCommonEngine
//
//  Created by wangliwei on 2022/12/11.
//  Copyright © 2022 tzyj. All rights reserved.
//

#import "SectionFlowLayout+PinTop.h"

@implementation SectionFlowLayout (PinTop)

- (void)addPinHeaderAttrWithIndexPath:(NSIndexPath *)indexPath {
    if (!self.delegate) return;
    if (![self.delegate respondsToSelector:@selector(sectionFlowLayout:headerPinToTop:)]) return;
    if ([self.delegate sectionFlowLayout:self headerPinToTop:indexPath.section] && !self.sectionHeadersPinToVisibleBounds) {
        UICollectionViewLayoutAttributes *headerAttr = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:indexPath];
        if (headerAttr) {
            self.hasPinnedSupplementaryItems = YES;
            [self.pinnedSupplementaryItems addObject:headerAttr.copy];
        }
    }
}

- (void)layoutAttributesForHeaderPinTop:(CGRect)rect attrs:(NSMutableArray<__kindof UICollectionViewLayoutAttributes *> *)attrs{
    if (self.delegate &&
        [self.delegate respondsToSelector:@selector(sectionFlowLayout:headerPinToTop:)] &&
        self.hasPinnedSupplementaryItems) {
        for (UICollectionViewLayoutAttributes *attr in [attrs reverseObjectEnumerator]) {
            if ([attr.representedElementKind isEqualToString:UICollectionElementKindSectionHeader]) {
                for (UICollectionViewLayoutAttributes *pinHeader in self.pinnedSupplementaryItems) {
                    if (pinHeader.indexPath.section == attr.indexPath.section) {
                        [attrs removeObject:attr];
                    }
                }
            }
        }
        
        for (UICollectionViewLayoutAttributes *headerAttr in self.pinnedSupplementaryItems) {
            CGPoint contentOffset = self.collectionView.contentOffset;
            if (@available(iOS 11.0, *)) {
                if ([self.collectionView respondsToSelector:@selector(safeAreaInsets)]) {
                    if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
                        contentOffset.y += self.collectionView.safeAreaInsets.top;
                    }
                    if (self.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
                        contentOffset.x += self.collectionView.safeAreaInsets.left;
                    }
                }
            }
            
            CGPoint nextHeaderOrigin = CGPointMake(INFINITY, INFINITY);
            NSInteger section = headerAttr.indexPath.section;
            if (section + 1 < self.pinnedSupplementaryItems.count) {
                UICollectionViewLayoutAttributes *nextHeaderAttributes = self.pinnedSupplementaryItems[section + 1];
                nextHeaderOrigin = nextHeaderAttributes.frame.origin;
            }
            
            CGRect frame = headerAttr.frame;
            if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
                frame.origin.y = MIN(MAX(contentOffset.y, frame.origin.y), nextHeaderOrigin.y - CGRectGetHeight(frame));
                if ([self.delegate respondsToSelector:@selector(sectionFlowLayout:section:headerPinToTopScorllOffset:)]) {
                    [self.delegate sectionFlowLayout:self section:section headerPinToTopScorllOffset:contentOffset.y - frame.origin.y];
                }
            }
            if (self.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
                frame.origin.x = MIN(MAX(contentOffset.x, frame.origin.x), nextHeaderOrigin.x - CGRectGetWidth(frame));
            }
            
            headerAttr.frame = frame;
            headerAttr.zIndex = 1000;
            
        }
        [attrs addObjectsFromArray:self.pinnedSupplementaryItems];
    }
}

@end
