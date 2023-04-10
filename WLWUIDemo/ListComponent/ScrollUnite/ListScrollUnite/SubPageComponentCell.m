//
//  SubPageComponentCell.m
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/4.
//

#import "SubPageComponentCell.h"
#import "SimpleCodeDefine.h"
#import "WLWScrollUnite.h"

@interface SubPageComponentCell () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *hScrollView;
@property (nonatomic) NSInteger currentIndex;

@end

@implementation SubPageComponentCell

__lazy_var(UIScrollView, hScrollView, init, {
    _hScrollView.pagingEnabled = YES;
})

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.hScrollView];
    }
    return self;
}

- (void)configData:(NSArray<NSArray<ListViewComponent *> *> *)datas {
    _datas = datas;
    if (!datas && datas.count > 0) return;
    _subViewControllers = [NSMutableArray arrayWithCapacity:datas.count];
    _subScrollViews = [NSMutableArray arrayWithCapacity:datas.count];
    for (int i = 0 ; i < datas.count; i ++) {
        [_subViewControllers addObject:[NSNull null]];
        [_subScrollViews addObject:[NSNull null]];
    }
    _hScrollView.frame = self.bounds;
    _hScrollView.contentSize = CGSizeMake(kScreenWidth *datas.count, self.frame.size.height);
    _hScrollView.delegate = self;
    self.currentIndex = 0;
}

- (void)creatSubVC {
    if (![_subViewControllers[_currentIndex] isKindOfClass:NSNull.class]) return;
    ListContainerVC *subVC = ListContainerVC.new;
    subVC.view.frame = CGRectMake(kScreenWidth * _currentIndex, 0, kScreenWidth, self.frame.size.height);
    [_hScrollView addSubview:subVC.view];
    [subVC viewDidLoad];
    subVC.listContainer.components = _datas[_currentIndex];
    _subScrollViews[_currentIndex] = subVC.listView;
    _subViewControllers[_currentIndex] = subVC;
}

- (void)setCurrentIndex:(NSInteger)currentIndex {
    _currentIndex = currentIndex;
    [self creatSubVC];
    _scrollUnite.subScrollview = _subScrollViews[_currentIndex];
}

//
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger page = scrollView.contentOffset.x / kScreenWidth;
    if (page != _currentIndex) {
        self.currentIndex = page;
    }
}

@end
