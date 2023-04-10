//
//  SectionFlowLayout+Left.h
//  HsCommonEngine
//
//  Created by wangliwei on 2022/12/11.
//  Copyright © 2022 tzyj. All rights reserved.
//

#import "SectionFlowLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface SectionFlowLayout (Left)

- (void)addLeftAttrIndexPath:(NSIndexPath *)indexPath;

- (NSMutableArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForLeft:(CGRect)rect attrs:(NSMutableArray<__kindof UICollectionViewLayoutAttributes *> *)attrs;

@end

NS_ASSUME_NONNULL_END
