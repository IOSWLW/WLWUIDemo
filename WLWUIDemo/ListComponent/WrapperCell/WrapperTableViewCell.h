//
//  WrapperTableViewCell.h
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class WrapperTableViewCell;
@protocol WrappedAbleViewToTableViewPotocol <NSObject>

@required
+ (UIView *)createWrapperView;

@optional
- (void)configWrapperData:(id)data;
- (void)layoutInWrapperView:(WrapperTableViewCell *)cell;

@end

@interface WrapperTableViewCell <T: UIView<WrappedAbleViewToTableViewPotocol>*, D> : UITableViewCell

@property (nonatomic, strong, readonly) T wrappedView;

@property (nonatomic, strong, readonly) D data;

- (void)configWrapperData:(D)data;

+ (__kindof WrapperTableViewCell *)dequeueReusableCellWithClass:(Class<WrappedAbleViewToTableViewPotocol>)iClass
                                                      tableView:(__kindof UITableView *)tableView
                                                   forIndexPath:(NSIndexPath *)indexPath;

@end

@interface UIView (WrapperView)

- (void)layoutInWrapperView:(UIView *)cell;

@end

NS_ASSUME_NONNULL_END
