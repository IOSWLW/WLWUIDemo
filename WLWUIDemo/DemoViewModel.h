//
//  DemoViewModel.h
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class ListViewComponent;
@interface DemoViewModel : NSObject

- (NSArray<ListViewComponent *> *)components;

@end

NS_ASSUME_NONNULL_END
