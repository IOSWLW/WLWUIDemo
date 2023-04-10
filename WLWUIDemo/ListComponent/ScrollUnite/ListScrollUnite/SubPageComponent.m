//
//  SubPageComponent.m
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/4.
//

#import "SubPageComponent.h"
#import "SubPageComponentCell.h"
#import "DemoHeaderView.h"
#import "SimpleCodeDefine.h"
#import "WLWScrollUnite.h"

@interface SubPageComponent () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) SubPageComponentCell *cell;

@property (nonatomic, strong) WLWScrollUnite *scrollUnite;

@property (nonatomic) BOOL isPinTop;
@end

@implementation SubPageComponent

__lazy_var(WLWScrollUnite, scrollUnite, init)

- (void)setDatas:(NSArray<NSArray<ListViewComponent *> *> *)datas {
    _datas = datas;
    [self.listView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_cell) return _cell;
    _cell = [collectionView dequeueReusableCellWithClass:SubPageComponentCell.class forIndexPath:indexPath xib:NO];
    [_cell configData:_datas];
    [self.scrollUnite addPanView:self.listView.superview mainScrollView:self.listView subScrollview:_cell.subScrollViews.firstObject maxOffsetY:1000];
    _cell.scrollUnite = _scrollUnite;
    return _cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        DemoHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withClass:DemoHeaderView.class forIndexPath:indexPath xib:YES];
        view.backgroundColor = UIColor.blueColor;
        
        return view;
    }
    return nil;
}


// layout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(kScreenWidth, 60);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(kScreenWidth, collectionView.frame.size.height - 60);
}

- (BOOL)sectionFlowLayout:(SectionFlowLayout *)layout headerPinToTop:(NSInteger)section {
    return YES;
}

- (void)sectionFlowLayout:(SectionFlowLayout *)layout section:(NSInteger)section headerPinToTopScorllOffset:(CGFloat)offsetValue {
    self.scrollUnite.maxOffsetY = self.listView.contentOffset.y - offsetValue;
    if (offsetValue < 0 && _cell.subViewControllers.count > 0) {
        for (UIScrollView *scrollView in _cell.subScrollViews) {
            if (![scrollView isKindOfClass:UIScrollView.class]) return;
            [scrollView setContentOffset:CGPointZero];
        }
    }
}

@end
