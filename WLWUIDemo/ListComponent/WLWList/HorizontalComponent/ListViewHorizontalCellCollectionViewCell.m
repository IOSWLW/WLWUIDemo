//
//  ListViewHorizontalCellCollectionViewCell.m
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/7.
//

#import "ListViewHorizontalCellCollectionViewCell.h"
#import "ListContainerView.h"


@interface ListViewHorizontalCellCollectionViewCell ()

@property (nonatomic, strong) ListContainerView * containerView;

@end

@implementation ListViewHorizontalCellCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

__lazy_var(ListContainerView, containerView, init, {
    _containerView.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
})

- (void)configUI {
    [self addSubview:self.containerView];
    [self.containerView fullLayoutInView:self];
}

- (void)configData:(NSArray<ListViewComponent *> *)datas {
    self.containerView.listContainer.components = datas;
}

@end
