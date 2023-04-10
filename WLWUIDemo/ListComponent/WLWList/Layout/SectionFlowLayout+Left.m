//
//  SectionFlowLayout+Left.m
//  HsCommonEngine
//
//  Created by wangliwei on 2022/12/11.
//  Copyright © 2022 tzyj. All rights reserved.
//

#import "SectionFlowLayout+Left.h"

@implementation SectionFlowLayout (Left)

- (void)addLeftAttrIndexPath:(NSIndexPath *)indexPath {
    if (!self.delegate) return;
    if (![self.delegate respondsToSelector:@selector(sectionFlowLayout:left:)]) return;
    if ([self.delegate sectionFlowLayout:self left:indexPath.section]) {
        [self.leftIndexPath addObject:indexPath];
    }
    
}

- (NSMutableArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForLeft:(CGRect)rect attrs:(NSMutableArray<__kindof UICollectionViewLayoutAttributes *> *)attrs {
    UIEdgeInsets sectionInset = self.sectionInset;
    CGFloat maxY = -1;
    CGFloat leftMargin = sectionInset.left;
    NSInteger currentSection = -1;
    NSMutableArray<__kindof UICollectionViewLayoutAttributes *> *array = @[].mutableCopy;
    for (UICollectionViewLayoutAttributes *attrObj in attrs) {
        UICollectionViewLayoutAttributes *attr = [attrObj copy];
        BOOL isLeftForce = NO;
        NSInteger section = attr.indexPath.section;
        if (attr.representedElementCategory == UICollectionElementCategoryCell) {
            for (NSIndexPath *leftIndex in self.leftIndexPath) {
                if (leftIndex.section == currentSection) {
                    isLeftForce = YES;
                    break;
                }
                if (leftIndex.section == section) {
                    isLeftForce = YES;
                    currentSection = section;
                    if ([self.collectionView.delegate conformsToProtocol:@protocol(UICollectionViewDelegateFlowLayout)]) {
                        id<UICollectionViewDelegateFlowLayout> delegate = (id<UICollectionViewDelegateFlowLayout>) self.collectionView.delegate;
                        sectionInset = [delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:section];
                        leftMargin = sectionInset.left;
                    }
                    break;
                }
            }
            if (section != currentSection || !isLeftForce) {
                [array addObject:attr];
                continue;
            }
            if (attr.frame.origin.y >= maxY) {
                leftMargin = sectionInset.left;
            }
            CGRect attrOrigin = attr.frame;
            attrOrigin.origin.x = leftMargin;
            attr.frame = attrOrigin;

            leftMargin += attr.frame.size.width;
            if ([self.delegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)]) {
                id<UICollectionViewDelegateFlowLayout> delegate = (id<UICollectionViewDelegateFlowLayout>) self.collectionView.delegate;
                leftMargin += [delegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:section];
            }
            maxY = MAX(CGRectGetMaxY(attr.frame), maxY);
        }
        [array addObject:attr];
    }
    return array;
}

@end
