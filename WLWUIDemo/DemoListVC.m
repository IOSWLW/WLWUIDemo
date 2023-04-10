//
//  DemoListVC.m
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/2.
//

#import "DemoListVC.h"
#import "DemoViewModel.h"

@interface DemoListVC ()

@property (nonatomic, strong) DemoViewModel *vm;

@end

@implementation DemoListVC

__lazy_var(DemoViewModel, vm, init)

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.listContainer.components = self.vm.components;
}

@end
