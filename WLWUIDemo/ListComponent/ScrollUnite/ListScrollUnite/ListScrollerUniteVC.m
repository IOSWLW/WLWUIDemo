//
//  ListScrollerUniteVC.m
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/2.
//

#import "ListScrollerUniteVC.h"
#import "SimpleCodeDefine.h"
#import "ListContainerVC.h"
#import "SubPageComponent.h"

@interface ListScrollerUniteVC ()


@end

@implementation ListScrollerUniteVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self reloadPage];
}

- (void)reloadPage {
    NSMutableArray *arrays = self.components.mutableCopy;
    NSArray<NSArray<ListViewComponent *> *> *subs = self.subPageComponents;
    if (subs) {
        SubPageComponent *subPage = SubPageComponent.new;
        subPage.datas = subs;
        [arrays addObject:subPage];
    }
    self.listContainer.components = arrays;
}

- (NSArray<ListViewComponent *> *)components {
    return @[];
}

- (UIView *)pinTopView {
    return nil;
}

- (NSArray<NSArray<ListViewComponent *> *> *)subPageComponents {
    return nil;
}

@end
