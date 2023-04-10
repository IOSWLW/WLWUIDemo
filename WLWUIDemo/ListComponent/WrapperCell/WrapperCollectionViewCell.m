//
//  WrapperCollectionViewCell.m
//  HsCommonEngine
//
//  Created by wangliwei on 2022/11/27.
//  Copyright © 2022 tzyj. All rights reserved.
//

#import "WrapperCollectionViewCell.h"
#import "UICollectionView+RegistrerAble.h"

@implementation WrapperCollectionViewCell

static Class<WrappedAbleViewToCollectionPotocol> TempClass;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _wrappedView =(UIView<WrappedAbleViewToCollectionPotocol> *)[TempClass createWrapperView];
        [self addSubview:_wrappedView];
        [_wrappedView layoutInWrapperView:self];
        if (_data) {
            [_wrappedView configWrapperData:_data];
        }
    }
    return self;
}

- (void)configWrapperData:(id)data {
    _data = data;
    [_wrappedView configWrapperData:data];
}

+ (__kindof WrapperCollectionViewCell *)dequeueReusableCellWithClass:(Class<WrappedAbleViewToCollectionPotocol>)iClass
                                                      collectionView:(__kindof UICollectionView *)collectionView
                                                        forIndexPath:(NSIndexPath *)indexPath{
    TempClass = iClass;
    WrapperCollectionViewCell *cell = [collectionView dequeueReusableCellWithClass:WrapperCollectionViewCell.class identifier:NSStringFromClass(TempClass) forIndexPath:indexPath xib:nil];
    TempClass = nil;
    return cell;
}

@end

