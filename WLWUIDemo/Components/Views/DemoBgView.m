//
//  DemoBgView.m
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/1.
//

#import "DemoBgView.h"

@implementation DemoBgView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.darkGrayColor;
        self.layer.cornerRadius = 6;
    }
    return self;
}

@end
