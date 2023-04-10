//
//  HsScrollUnite.m
//  TzyjMainProj
//
//  Created by wangliwei on 2021/9/25.
//  Copyright © 2021 hundsun. All rights reserved.
//

#import "WLWDynamicItem.h"
#import "WLWScrollUnite.h"

@interface WLWScrollUnite () <UIGestureRecognizerDelegate> {
}

@property (nonatomic, strong) NSMutableDictionary< NSString *,WLWDynamicItem *>   *dynamicItems;

@property (nonatomic, strong) WLWDynamicItem              *dynamicItem;
@property (nonatomic, strong) UIDynamicAnimator           *animator;
@property (nonatomic, strong) UIPanGestureRecognizer      *pan;
@property (nonatomic, strong) UIDynamicItemBehavior       *decelerationBehavior;
@property (nonatomic, strong) UIAttachmentBehavior        *springBehavior;
@property (nonatomic, strong) UIScrollView                *mainScrollView;
@property (nonatomic, strong) UIView                      *view;
@property (nonatomic) BOOL                                 isVertical;

@property (nonatomic, strong) UIScrollView *scrollingView; // 正在滚动的子视图;

@end

@implementation WLWScrollUnite

- (void)setSubScrollview:(UIScrollView *)subScrollview {
    [_animator removeAllBehaviors];
    NSString *addrStr = [NSString stringWithFormat:@"%p", subScrollview];
    _subScrollview = subScrollview;
    _subScrollview.scrollEnabled = NO;
    WLWDynamicItem *item = _dynamicItems[addrStr];
    if (!item) {
        self.dynamicItem = WLWDynamicItem.new;
    } else {
        self.dynamicItem = item;
    }
}

- (void)addPanView:(UIView *)view mainScrollView:(UIScrollView *)mainScrollView subScrollview:(UIScrollView *)subSrollView maxOffsetY:(CGFloat)max {
    self.mainScrollView = mainScrollView;
    self.view = view;
    self.maxOffsetY = max;
    self.mainScrollView.scrollEnabled = NO;
    self.dynamicItems = @{}.mutableCopy;
    
    if (self.pan) {
        [view removeGestureRecognizer:self.pan];
    }
    self.pan = [UIPanGestureRecognizer.alloc initWithTarget:self action:@selector(panGestureRecognizerAction:)];
    self.pan.delegate = self;
    [view addGestureRecognizer:self.pan];
    self.animator = [UIDynamicAnimator.alloc initWithReferenceView:view];
    self.subScrollview = subSrollView;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    UIPanGestureRecognizer *panGestureRecognizer = (UIPanGestureRecognizer *)gestureRecognizer;
    CGFloat currentY = [panGestureRecognizer translationInView:self.view].y;
    CGFloat currentX = [panGestureRecognizer translationInView:self.view].x;
    currentY = currentY == 0 ? 0.1 : currentY;
    _isVertical = !(fabs(currentX)/currentY >= 10.0);
    if ([_view.superview isKindOfClass:UIScrollView.class]) {
        UIScrollView *scrollView = (UIScrollView *)self.view.superview;
        scrollView.scrollEnabled = !self.isVertical;
    }
    return YES;
}

- (void)panGestureRecognizerAction:(UIPanGestureRecognizer *)recognizer {
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan: {
            [_animator removeAllBehaviors];
            _springBehavior = nil;
            _decelerationBehavior = nil;
            break;
        }
        case UIGestureRecognizerStateChanged: {
            if (!_isVertical) {return;}
            CGFloat currentY = [recognizer translationInView:_view].y;
            [self controlScrollForVertical:currentY];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            if ([_view.superview isKindOfClass:UIScrollView.class]) {
                UIScrollView *scrollView = (UIScrollView *)_view.superview;
                scrollView.scrollEnabled = YES;
            }
            if (!_isVertical) {return;}
            [self scrollAnimation: recognizer];
            break;
        }
        default:
            break;
    }
    //保证每次只是移动的距离，不是从头一直移动的距离
    [recognizer setTranslation:CGPointZero inView:_view];
}

//控制上下滚动的方法
- (void)controlScrollForVertical:(CGFloat)detal {
    //判断是主ScrollView滚动还是子ScrollView滚动,detal为手指移动的距离
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    if (_mainScrollView.contentOffset.y >= _maxOffsetY - 1) {
        // 滑动subScrollview
        CGFloat offsetY = _subScrollview.contentOffset.y - detal;
        if (offsetY < 0) {
            offsetY = 0;
            _mainScrollView.contentOffset = CGPointMake(_mainScrollView.frame.origin.x,
                                                       _mainScrollView.contentOffset.y - detal);
        } else if (offsetY > (_subScrollview.contentSize.height - _subScrollview.frame.size.height)) {
            offsetY = _subScrollview.contentOffset.y - rubberBandDistance(detal, height);
        }
        _subScrollview.contentOffset = CGPointMake(0, offsetY);
        _scrollingView = _subScrollview;
    } else {
        CGFloat mainOffsetY = _mainScrollView.contentOffset.y - detal;
        if (mainOffsetY < 0) {
            mainOffsetY = _mainScrollView.contentOffset.y - rubberBandDistance(detal, height);
        } else if (mainOffsetY > _maxOffsetY) {
            mainOffsetY = _maxOffsetY;
        }
        _mainScrollView.contentOffset = CGPointMake(_mainScrollView.frame.origin.x, mainOffsetY);
        if (mainOffsetY == 0) {
            _subScrollview.contentOffset = CGPointZero;
        }
        [self setRefreshType:mainOffsetY];
    }
    [self bouncesAnimation];
}

- (void)scrollAnimation:(UIPanGestureRecognizer *)recognizer {
    _dynamicItem.center = _view.bounds.origin;
    //velocity是在手势结束的时候获取的竖直方向的手势速度
    CGPoint velocity = [recognizer velocityInView:_view];
    UIDynamicItemBehavior *inertialBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[_dynamicItem]];
    [inertialBehavior addLinearVelocity:CGPointMake(0, velocity.y) forItem:_dynamicItem];
    inertialBehavior.resistance = 2.0;
    __block CGPoint lastCenter = CGPointZero;
    __weak typeof(self) weakSelf = self;
    inertialBehavior.action = ^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf.isVertical) {
            //得到每次移动的距离
            CGFloat currentY = strongSelf.dynamicItem.center.y - lastCenter.y;
            [strongSelf controlScrollForVertical:currentY];
        }
        lastCenter = strongSelf.dynamicItem.center;
    };
    [_animator addBehavior:inertialBehavior];
    self.decelerationBehavior = inertialBehavior;
}

- (void)setRefreshType:(CGFloat)offsetY {

}

- (void)bouncesAnimation {
    BOOL outsideFrame = [self outsideFrame];

    if (outsideFrame && (_decelerationBehavior && !_springBehavior)) {
        CGPoint target = CGPointZero;
        CGFloat targetY = _subScrollview.contentSize.height - _subScrollview.frame.size.height;
        BOOL isMian = NO;
        if (_mainScrollView.contentOffset.y < 0) {
            _dynamicItem.center = _mainScrollView.contentOffset;
            target = CGPointZero;
            isMian = YES;
        } else if (_subScrollview.contentOffset.y > targetY) {
            _dynamicItem.center = _subScrollview.contentOffset;
            target.x = _subScrollview.contentOffset.x;
            BOOL notZero = _subScrollview.contentSize.height > _subScrollview.frame.size.height;
            target.y =  notZero ? targetY : 0;
            isMian = NO;
        }
        
        [_animator removeBehavior:_decelerationBehavior];
        [_animator removeBehavior:_springBehavior];
        __weak typeof(self) weakSelf = self;
        UIAttachmentBehavior *springBehavior = [[UIAttachmentBehavior alloc] initWithItem:_dynamicItem
                                                                         attachedToAnchor:target];
        springBehavior.length = 0;
        springBehavior.damping = 1;
        springBehavior.frequency = 2;
        springBehavior.action = ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            if (isMian) {
                [strongSelf mainBounces];
            } else {
                strongSelf.subScrollview.contentOffset = self.dynamicItem.center;
            }
        };
       [_animator addBehavior:springBehavior];
       self.springBehavior = springBehavior;
    }
}

- (void)mainBounces {
    _mainScrollView.contentOffset = _dynamicItem.center;
    if (_mainScrollView.contentOffset.y == 0) {
        _mainScrollView.contentOffset = CGPointZero;
    }
}

- (BOOL)outsideFrame {
    if (_mainScrollView.contentOffset.y < 0) {
        return YES;
    }
    if (_subScrollview.contentSize.height > _subScrollview.frame.size.height) {
        CGFloat subOutsideHeight = _subScrollview.contentSize.height - _subScrollview.frame.size.height;
        return _subScrollview.contentOffset.y > subOutsideHeight;
    } else {
        return _subScrollview.contentOffset.y > 0;
    }
    return NO;
}

static CGFloat rubberBandDistance(CGFloat offset, CGFloat dimension) {
    const CGFloat constant = 0.55f;
    CGFloat result = (constant * fabs(offset) * dimension) / (dimension + constant * fabs(offset));
    return offset < 0.0f ? -result : result;
}

@end
