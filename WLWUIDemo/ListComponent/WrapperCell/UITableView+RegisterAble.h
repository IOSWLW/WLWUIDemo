//
//  UITableView+RegisterAble.h
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (RegisterAble)

- (__kindof UITableViewCell *)dequeueReusableCellWithClass:(Class)iClass isXib:(BOOL)isXib;

- (__kindof UITableViewCell *)dequeueReusableCellWithClass:(Class)iClass identifier:(NSString *)identifier isXib:(BOOL)isXib;

@end

NS_ASSUME_NONNULL_END
