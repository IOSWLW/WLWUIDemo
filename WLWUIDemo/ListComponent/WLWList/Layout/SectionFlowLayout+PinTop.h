//
//  SectionFlowLayout+PinTop.h
//  HsCommonEngine
//
//  Created by wangliwei on 2022/12/11.
//  Copyright © 2022 tzyj. All rights reserved.
//

#import "SectionFlowLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface SectionFlowLayout (PinTop)

- (void)addPinHeaderAttrWithIndexPath:(NSIndexPath *)indexPath;

- (void)layoutAttributesForHeaderPinTop:(CGRect)rect attrs:(NSMutableArray<__kindof UICollectionViewLayoutAttributes *> *)attrs;

@end

NS_ASSUME_NONNULL_END
