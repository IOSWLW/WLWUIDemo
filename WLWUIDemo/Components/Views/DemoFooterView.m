//
//  DemoFooterView.m
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/1.
//

#import "DemoFooterView.h"

@implementation DemoFooterView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UIView *view = UIView.new;
    view.backgroundColor = UIColor.redColor;
    view.frame = CGRectMake(12, 0, UIScreen.mainScreen.bounds.size.width - 24, 30);
    [self addSubview:view];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

@end
