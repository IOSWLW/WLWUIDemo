//
//  ListViewHorizontalComponent.m
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/7.
//

#import "ListViewHorizontalComponent.h"
#import "SimpleCodeDefine.h"
#import "ListViewHorizontalCellCollectionViewCell.h"
#import "DemoComponent4.h"

@interface ListViewHorizontalComponent ()

@property (nonatomic, strong)ListViewHorizontalCellCollectionViewCell *cell;
@end

@implementation ListViewHorizontalComponent

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_cell) return _cell;
    _cell = [collectionView dequeueReusableCellWithClass:ListViewHorizontalCellCollectionViewCell.class
                                           forIndexPath:indexPath
                                                   only:YES
                                                    xib:NO];
    [_cell configData:[self configDataWithSection:indexPath.section]];
    return _cell;
}

- (NSArray<ListViewComponent *> *)configDataWithSection:(NSInteger)section {
    return @[];
}

@end
