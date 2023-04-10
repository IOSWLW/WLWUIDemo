//
//  HsDynamicItem.h
//  TzyjMainProj
//
//  Created by wangliwei on 2021/9/25.
//  Copyright © 2021 hundsun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLWDynamicItem : NSObject <UIDynamicItem>

@property (nonatomic, readwrite) CGPoint center;
@property (nonatomic, readonly) CGRect bounds;
@property (nonatomic, readwrite) CGAffineTransform transform;

@end

NS_ASSUME_NONNULL_END
