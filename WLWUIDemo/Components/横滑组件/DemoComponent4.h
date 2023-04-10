//
//  DemoComponent4.h
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/7.
//

#import "ListViewComponent.h"

NS_ASSUME_NONNULL_BEGIN

@interface DemoComponent4 : ListViewComponent

- (instancetype)initWithSection:(NSInteger)section;

@property (nonatomic, readonly) NSInteger section;


@end

NS_ASSUME_NONNULL_END
