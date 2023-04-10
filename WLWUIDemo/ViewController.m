//
//  ViewController.m
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/1.
//

#import "ViewController.h"
#import "DemoViewModel.h"
#import "DemoComponent1.h"
#import "DemoComponent2.h"
#import "DemoComponent3.h"

@interface ViewController ()

@property (nonatomic, strong) DemoViewModel *vm;

@end

@implementation ViewController

__lazy_var(DemoViewModel, vm, init)

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (NSArray<ListViewComponent *> *)components {
    return self.vm.components;
}

- (UIView *)pinTopView {
    return nil;
}

- (NSArray<NSArray<ListViewComponent *> *> *)subPageComponents {
    return @[self.vm.components, self.vm.components];
}


@end
