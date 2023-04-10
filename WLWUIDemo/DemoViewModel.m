//
//  DemoViewModel.m
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/1.
//

#import "DemoViewModel.h"
#import "DemoComponent1.h"
#import "DemoComponent2.h"
#import "DemoComponent3.h"
#import "DemoHorizontalComponent.h"

@implementation DemoViewModel

- (NSArray<ListViewComponent *> *)components {
    return @[DemoComponent1.new,
             DemoComponent2.new,
             DemoComponent3.new,
             DemoHorizontalComponent.new];
}

@end
