//
//  UICollectionView+RegistrerAble.h
//  HsCommonEngine
//
//  Created by wangliwei on 2022/11/13.
//  Copyright © 2022 tzyj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (RegistrerAble)

- (__kindof UICollectionViewCell *)dequeueReusableCellWithClass:(Class)iClass
                                                   forIndexPath:(NSIndexPath *)indexPath
                                                            xib:(BOOL)xib;

- (__kindof UICollectionViewCell *)dequeueReusableCellWithClass:(Class)iClass                                                                                              identifier:(NSString *)identifier
                                                   forIndexPath:(NSIndexPath *)indexPath
                                                            xib:(BOOL)xib;

- (__kindof UICollectionViewCell *)dequeueReusableCellWithClass:(Class)iClass
                                                   forIndexPath:(NSIndexPath *)indexPath
                                                           only:(BOOL)only
                                                            xib:(BOOL)xib;

- (__kindof UICollectionReusableView *)dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind
                                                                    withClass:(Class)iClass
                                                                 forIndexPath:(NSIndexPath *)indexPath
                                                                          xib:(BOOL)xib;



@end

NS_ASSUME_NONNULL_END
