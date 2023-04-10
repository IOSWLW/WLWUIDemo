//
//  UIView+Wrapper.m
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/1.
//

#import "UIView+Wrapper.h"
#import "UIView+SimpleEx.h"

@implementation UIView (Wrapper)

- (void)layoutInWrapperView:(UIView *)cell {
    [cell fullLayoutInView:self];
}

@end
