//
//  UIView+Extension.h
//  HsCommonEngine
//
//  Created by wangliwei on 2022/3/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView  (SimpleEx)

- (__kindof UIView *(^)(UIColor *))bgColor;

- (__kindof UIView *(^)(BOOL))show;

- (__kindof UIView *(^)(CGFloat))cornerRadius;

- (__kindof UIView *(^)(CGFloat))heightAnchorValue;

- (__kindof UIView *(^)(CGFloat))widthAnchorValue;

- (__kindof UIView *(^)(UIView *))inView;

+ (UIView *)loadNibInMainBundle;

- (void)fullLayoutInView:(UIView *)view;

@end

@interface UIControl (SimpleEx)

- (__kindof UIControl *(^)(UIControlContentVerticalAlignment ))verticalAlignment;

- (__kindof UIControl *(^)(UIControlContentHorizontalAlignment ))horizontalAlignment;

@end

@interface UIButton (SimpleEx)

- (__kindof UIButton *(^)(UIView *))inView;

- (__kindof UIButton *(^)(UIFont * font))titleFont;

- (__kindof UIButton * (^)(CGFloat size))titleFontSize;

- (__kindof UIButton *(^)(UIColor * color, UIControlState state))titleColor;

- (__kindof UIButton *(^)(UIColor * color))normalTitleColor;

- (__kindof UIButton *(^)(NSString * color, UIControlState state))title;

- (__kindof UIButton *(^)(NSString * title))normalTitle;

- (__kindof UIButton *(^)(UIImage *, UIControlState state))img;

- (__kindof UIButton *(^)(UIImage *))normalImg;

- (__kindof UIButton *(^)(UIImage *))selectedImg;

- (__kindof UIButton *(^)(NSString * title))selectedTitle;

- (__kindof UIButton *(^)(UIColor *))bgColor;

- (__kindof UIButton *(^)(CGFloat))cornerRadius;

- (__kindof UIButton *(^)(CGFloat))heightAnchorValue;

- (__kindof UIButton *(^)(CGFloat))widthAnchorValue;

- (__kindof UIButton *(^)(BOOL))show;

- (__kindof UIButton *(^)(UIControlContentVerticalAlignment ))verticalAlignment;

- (__kindof UIButton *(^)(UIControlContentHorizontalAlignment ))horizontalAlignment;

- (__kindof UIButton *(^)(UIEdgeInsets))imgEdge;

- (__kindof UIButton *(^)(UIEdgeInsets))titleEdge;

+ (__kindof UIButton *(^)(void))custom;

@end

@interface UILabel (SimpleEx)

- (__kindof UILabel *(^)(NSString *))txt;

- (__kindof UILabel *(^)(UIColor *))bgColor;

- (__kindof UILabel *(^)(BOOL))show;

- (__kindof UILabel *(^)(CGFloat))cornerRadius;

- (__kindof UILabel *(^)(CGFloat))heightAnchorValue;

- (__kindof UILabel *(^)(CGFloat))widthAnchorValue;

- (__kindof UILabel *(^)(UIView *))inView;

- (__kindof UILabel *(^)(UIFont * font))txtFont;

- (__kindof UILabel *(^)(CGFloat))fontSize;

- (__kindof UILabel *(^)(NSTextAlignment alignment))alignment;

- (__kindof UILabel *(^)(BOOL))shouldFitWidth;

- (__kindof UILabel *(^)(UIColor *))txtColor;

- (__kindof UILabel *(^)(NSInteger))lines;

@end

@interface UIStackView (SimpleEx)

- (__kindof UIStackView *(^)(BOOL))show;

- (__kindof UIStackView *(^)(CGFloat))cornerRadius;

- (__kindof UIStackView *(^)(CGFloat))heightAnchorValue;

- (__kindof UIStackView *(^)(CGFloat))widthAnchorValue;

- (__kindof UIStackView *(^)(UIView *))inView;

- (__kindof UIStackView *(^)(NSArray<UIView *> *))addArrangedSubviews;

- (__kindof UIStackView *(^)(CGFloat))space;

+ (__kindof UIStackView *(^)(void))axisVertical;

- (__kindof UIStackView *(^)(UIStackViewDistribution))viewDistribution;

@end

@interface UITableView (SimpleEx)

- (__kindof UITableView *(^)(UIColor *))bgColor;

- (__kindof UITableView *(^)(BOOL))show;

- (__kindof UITableView *(^)(CGFloat))cornerRadius;

- (__kindof UITableView *(^)(CGFloat))heightAnchorValue;

- (__kindof UITableView *(^)(CGFloat))widthAnchorValue;

- (__kindof UITableView *(^)(UIView *))inView;

- (__kindof UITableView *(^)(id))delegateAndDataSource;

- (__kindof UITableView *(^)(CGFloat))rowHeightValue;

+ (__kindof UITableView *(^)(void))creatPlainNoneSeparator;


@end


NS_ASSUME_NONNULL_END
