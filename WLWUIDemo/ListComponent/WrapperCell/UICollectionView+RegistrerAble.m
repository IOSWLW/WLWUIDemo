//
//  UICollectionView+RegistrerAble.m
//  HsCommonEngine
//
//  Created by wangliwei on 2022/11/13.
//  Copyright © 2022 tzyj. All rights reserved.
//

#import "UICollectionView+RegistrerAble.h"
#import <objc/runtime.h>

@interface UICollectionView (RegistrerAble)

@property (nonatomic, strong) NSMutableArray     *registeredCellIdentifiers;
@property (nonatomic, strong) NSMutableArray     *registeredSupplementaryViewIdentifiers;

@end

@implementation UICollectionView (RegistrerAble)

static char *cellIdetifiersKey = "cellIdetifiers_able";

static char *registeredSupplementaryViewIdentifiersKey = "registeredSupplementaryViewIdentifiersKey_able";


-(void)setRegisteredCellIdentifiers:(NSMutableArray *)registeredCellIdentifiers {
    objc_setAssociatedObject(self, cellIdetifiersKey, registeredCellIdentifiers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSMutableArray *)registeredCellIdentifiers{
    NSMutableArray *array = objc_getAssociatedObject(self, cellIdetifiersKey);
    if (!array) {
        array = [NSMutableArray array];
        self.registeredCellIdentifiers = array;
    }
    return array;
}

-(void)setRegisteredSupplementaryViewIdentifiers:(NSMutableArray *)registeredCellIdentifiers {
    objc_setAssociatedObject(self, registeredSupplementaryViewIdentifiersKey, registeredCellIdentifiers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSMutableArray *)registeredSupplementaryViewIdentifiers{
    NSMutableArray *array = objc_getAssociatedObject(self, registeredSupplementaryViewIdentifiersKey);
    if (!array) {
        array = [NSMutableArray array];
        self.registeredSupplementaryViewIdentifiers = array;
    }
    return array;
}

- (__kindof UICollectionViewCell *)dequeueReusableCellWithClass:(Class)iClass
                                                   forIndexPath:(NSIndexPath *)indexPath   only:(BOOL)only
                                                       xib:(BOOL)xib {
    NSString *identifier = NSStringFromClass(iClass);
    if (only) {
        identifier = [NSString stringWithFormat:@"%@_%ld_%ld",identifier, indexPath.section, indexPath.row];
    }
    return [self dequeueReusableCellWithClass:iClass identifier:identifier forIndexPath:indexPath xib:xib];
}

- (__kindof UICollectionViewCell *)dequeueReusableCellWithClass:(Class)iClass
                                              forIndexPath:(NSIndexPath *)indexPath
                                                       xib:(BOOL)xib {
    NSString *identifier = NSStringFromClass(iClass);
    return [self dequeueReusableCellWithClass:iClass identifier:identifier forIndexPath:indexPath xib:xib];
}

- (__kindof UICollectionViewCell *)dequeueReusableCellWithClass:(Class)iClass
                                                     identifier:(NSString *)identifier
                                              forIndexPath:(NSIndexPath *)indexPath
                                                       xib:(BOOL)xib {
    if (![self.registeredCellIdentifiers containsObject:identifier]) {
        if (xib) {
            [self registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellWithReuseIdentifier:identifier];
        } else {
            [self registerClass:iClass forCellWithReuseIdentifier:identifier];
        }
        [self.registeredCellIdentifiers addObject:identifier];
    }
    return [self dequeueReusableCellWithReuseIdentifier:identifier forIndexPath: indexPath];
}

- (__kindof UICollectionReusableView *)dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind
                                                                    withClass:(Class)iClass
                                                                 forIndexPath:(NSIndexPath *)indexPath
                                                                          xib:(BOOL)xib {
    NSString *identifier = NSStringFromClass(iClass);
    if (![self.registeredSupplementaryViewIdentifiers containsObject:identifier]) {
        if (xib) {
            [self registerNib:[UINib nibWithNibName:identifier bundle:nil] forSupplementaryViewOfKind:elementKind withReuseIdentifier:identifier];
        } else {
            [self registerClass:iClass forSupplementaryViewOfKind:elementKind withReuseIdentifier:identifier];
        }
        [self.registeredSupplementaryViewIdentifiers addObject:identifier];
    }
    
    return [self dequeueReusableSupplementaryViewOfKind:elementKind withReuseIdentifier:identifier forIndexPath:indexPath];
}

@end
