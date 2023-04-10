//
//  DemoCell.h
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/1.
//

#import <UIKit/UIKit.h>

#define kScreenWidth UIScreen.mainScreen.bounds.size.width

NS_ASSUME_NONNULL_BEGIN

@interface DemoCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

NS_ASSUME_NONNULL_END
