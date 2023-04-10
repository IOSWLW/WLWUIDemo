//
//  ListContainerView.m
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/7.
//

#import "ListContainerView.h"

@implementation ListContainerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI {
    [self addSubview:self.listView];
    [self.listView fullLayoutInView:self];
}

__lazy_var(UICollectionView, listView,
           initWithFrame:self.bounds collectionViewLayout:self.layout, {
    _listView.backgroundColor = UIColor.clearColor;
    _listView.showsVerticalScrollIndicator = NO;
    _listView.showsHorizontalScrollIndicator = NO;

})

__lazy_var(ListViewLayoutContainer, listContainer,
           initWithListView:self.listView viewController:self.getSuperViewController)

__lazy_var(SectionFlowLayout, layout, init)


- (UIViewController *)getSuperViewController {
    UIViewController *viewController = nil;
    UIResponder *responder = [self nextResponder];
    while (responder != nil) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            viewController = (UIViewController *)responder;
            break;
        }
        responder = [responder nextResponder];
    }
    return viewController;
}

@end
