//
//  UIView+Extension.m
//  HsCommonEngine
//
//  Created by wangliwei on 2022/3/5.
//

#import "UIView+SimpleEx.h"
//#import <ReactiveObjC/ReactiveObjC.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"

@implementation UIView (SimpleEx)
 
- (__kindof UIView *(^)(UIColor *))bgColor {
    
    return ^id(UIColor * bacgroundcolor) {
        self.backgroundColor = bacgroundcolor;
        return self;
    };
}

- (__kindof UIView *(^)(CGFloat))cornerRadius {
    return ^id(CGFloat cornerRadius) {
        self.layer.cornerRadius = cornerRadius;
        return self;
    };
}

- (__kindof UIView *(^)(CGFloat))heightAnchorValue {
    return ^id(CGFloat heightAnchor) {
        [self.heightAnchor constraintEqualToConstant:heightAnchor].active = YES;
        return self;
    };
}

- (__kindof UIView *(^)(CGFloat))widthAnchorValue {
    return ^id(CGFloat widthAnchor) {
        [self.widthAnchor constraintEqualToConstant:widthAnchor].active = YES;
        return self;
    };
}

- (__kindof UIView *(^)(BOOL))show {
    return ^id(BOOL show) {
        self.hidden = !show;
        return self;
    };
}

- (__kindof UIView *(^)(UIView *))inView {
    return ^id(UIView *superView) {
        [superView addSubview:self];
        return self;
    };
}

+ (UIView *)loadNibInMainBundle {
    return [NSBundle.mainBundle loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

- (void)fullLayoutInView:(UIView *)view {
    UIView *subview = self;
    UIView *parentView = view;
    [subview setTranslatesAutoresizingMaskIntoConstraints:NO];
    UILayoutGuide *guide = parentView.safeAreaLayoutGuide;
    NSLayoutConstraint *leadingConstraint = [subview.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor];
    NSLayoutConstraint *trailingConstraint = [subview.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor];
    NSLayoutConstraint *topConstraint = [subview.topAnchor constraintEqualToAnchor:guide.topAnchor];
    NSLayoutConstraint *bottomConstraint = [subview.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor];
    [parentView addConstraints:@[leadingConstraint, trailingConstraint, topConstraint, bottomConstraint]];
}

@end

@implementation UIControl (SimpleEx)

- (__kindof UIControl *(^)(UIControlContentVerticalAlignment ))verticalAlignment {
    return ^id(UIControlContentVerticalAlignment alignment) {
        self.contentVerticalAlignment = alignment;
        return self;
    };
}

- (__kindof UIControl *(^)(UIControlContentHorizontalAlignment ))horizontalAlignment {
    return ^id(UIControlContentHorizontalAlignment aligment) {
        self.contentHorizontalAlignment = aligment;
        return self;
    };
}

@end

@implementation UIButton (SimpleEx)

+ (__kindof UIButton *(^)(void))custom {
    return ^id() {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        return button;
    };
}

- (__kindof UIButton * (^)(UIFont * font))titleFont {
    return ^id(UIFont * font) {
        self.titleLabel.font = font;
        return self;
    };
}

- (__kindof UIButton * (^)(CGFloat size))titleFontSize {
    return ^id(CGFloat size) {
        return self.titleFont([UIFont systemFontOfSize:size]);
    };
}

- (__kindof UIButton *(^)(UIColor * color, UIControlState state))titleColor {
    return ^id(UIColor *color, UIControlState state) {
        [self setTitleColor:color forState:state];
        return self;
    };
}

- (__kindof UIButton *(^)(UIColor * color))normalTitleColor {
    return ^id(UIColor *color) {
        return self.titleColor(color,UIControlStateNormal);
    };
}

- (__kindof UIButton *(^)(UIImage *, UIControlState state))img {
    return ^id(UIImage *img, UIControlState state) {
        [self setImage:img forState:state];
        return self;
    };
}

- (__kindof UIButton *(^)(UIImage *))normalImg {
    return ^id(UIImage *img) {
        return self.img(img,UIControlStateNormal);
    };
}

- (__kindof UIButton *(^)(UIImage *))selectedImg {
    return ^id(UIImage *img) {
        return self.img(img,UIControlStateSelected);
    };
}

- (__kindof UIButton *(^)(NSString * title, UIControlState state))title {
    return ^id(NSString *title, UIControlState state) {
        [self setTitle:title forState:state];
        return self;
    };
}

- (__kindof UIButton *(^)(NSString * title))normalTitle {
    return ^id(NSString *title) {
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}

- (__kindof UIButton *(^)(NSString * title))selectedTitle {
    return ^id(NSString *title) {
        [self setTitle:title forState:UIControlStateSelected];
        return self;
    };
}

- (__kindof UIButton *(^)(UIEdgeInsets))imgEdge {
    return ^id(UIEdgeInsets make) {
        self.imageEdgeInsets = make;
        return self;
    };
}

- (__kindof UIButton *(^)(UIEdgeInsets))titleEdge {
    return ^id(UIEdgeInsets make) {
        self.titleEdgeInsets = make;
        return self;
    };
}

@end

@implementation UILabel (SimpleEx)

- (__kindof UILabel *(^)(UIFont * font))txtFont {
    return ^id(UIFont * font) {
        self.font = font;
        return self;
    };
}

- (__kindof UILabel *(^)(NSTextAlignment))alignment {
    return ^id(NSTextAlignment alignment) {
        self.textAlignment = alignment;
        return self;
    };
}

- (__kindof UILabel *(^)(BOOL))shouldFitWidth {
    return ^id(BOOL just) {
        self.adjustsFontSizeToFitWidth = just;
        return self;
    };
}

- (__kindof UILabel *(^)(UIColor *))txtColor {
    return ^id(UIColor *color) {
        self.textColor = color;
        return self;
    };
}

- (__kindof UILabel *(^)(NSInteger))lines {
    return ^id(NSInteger lines) {
        self.numberOfLines = lines;
        return self;
    };
}

- (__kindof UILabel *(^)(NSString *))txt {
    return ^id(NSString *txt) {
        self.text = txt;
        return self;
    };
}

- (__kindof UILabel *(^)(CGFloat))fontSize {
    return ^id(CGFloat size) {
        return self.txtFont([UIFont systemFontOfSize:size]);
    };
}

@end

@implementation UIStackView (SimpleEx)

+ (__kindof UIStackView *(^)(void))axisVertical {
    return ^id() {
        UIStackView *stack = UIStackView.new;
        stack.axis = UILayoutConstraintAxisVertical;
        return stack;
    };
}

- (__kindof UIStackView *(^)(NSArray<UIView *> *))addArrangedSubviews {
    return ^id(NSArray<UIView *> * views) {
        for (UIView *view in views) {
            [self addArrangedSubview:view];
        }
        return self;
    };
}

- (__kindof UIStackView *(^)(CGFloat))space {
    return ^id(CGFloat space) {
        self.spacing = space;
        return self;
    };
}

- (__kindof UIStackView *(^)(UIStackViewDistribution))viewDistribution {
    return ^id(UIStackViewDistribution dis) {
        self.distribution = dis;
        return self;
    };
}

@end

@implementation UITableView (SimpleEx)

+ (__kindof UITableView *(^)(void))creatPlainNoneSeparator {
    return ^id() {
        UITableView *temp = [UITableView.alloc initWithFrame:CGRectZero style:UITableViewStylePlain];
        temp.separatorStyle = UITableViewCellSeparatorStyleNone;
        return temp;
    };
}

- (__kindof UITableView *(^)(id))delegateAndDataSource {
    return ^id(id delege) {
        self.delegate = delege;
        self.dataSource = delege;
        return self;
    };
}

- (__kindof UITableView *(^)(CGFloat))rowHeightValue {
    return ^id(CGFloat rowheight) {
        self.rowHeight = rowheight;
        return self;
    };
}

@end

#pragma clang diagnostic pop
