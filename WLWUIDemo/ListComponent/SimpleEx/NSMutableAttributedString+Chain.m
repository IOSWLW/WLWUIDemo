//
//  NSMutableAttributedString+Chain.m
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/12/20.
//  Copyright © 2020 Shang. All rights reserved.
//

#import "NSMutableAttributedString+Chain.h"

@implementation NSMutableAttributedString (Chain)

- (NSMutableAttributedString * _Nonnull (^)(NSDictionary<NSAttributedStringKey, id> * _Nonnull))addAttrs{
    return ^(NSDictionary<NSAttributedStringKey, id> * dic) {
        [self addAttributes:dic range:NSMakeRange(0, self.length)];
        return self;
    };
}

- (NSMutableAttributedString * _Nonnull (^)(NSParagraphStyle * _Nonnull))paragraphStyle{
    return ^(NSParagraphStyle *style) {
        [self addAttributes:@{NSParagraphStyleAttributeName: style} range:NSMakeRange(0, self.length)];
        return self;
    };
}

- (NSMutableAttributedString *(^)(UIFont *))font {
    return ^(UIFont *font) {
        [self addAttributes:@{NSFontAttributeName: font} range:NSMakeRange(0, self.length)];
        return self;
    };
}

- (NSMutableAttributedString *(^)(CGFloat))fontSize {
    return ^(CGFloat fontSize) {
        [self addAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]} range:NSMakeRange(0, self.length)];
        return self;
    };
}

- (NSMutableAttributedString *(^)(UIColor *))color {
    return ^(UIColor *color) {
        [self addAttributes:@{NSForegroundColorAttributeName: color} range:NSMakeRange(0, self.length)];
        return self;
    };
}

- (NSMutableAttributedString *(^)(UIColor *))bgColor {
    return ^(UIColor *color) {
        [self addAttributes:@{NSBackgroundColorAttributeName: color} range:NSMakeRange(0, self.length)];
        return self;
    };
}

- (NSMutableAttributedString *(^)(NSString *))link {
    return ^(NSString *link) {
        [self addAttributes:@{NSLinkAttributeName: link} range:NSMakeRange(0, self.length)];
        return self;
    };
}

- (NSMutableAttributedString *(^)(NSURL *))linkURL {
    return ^(NSURL *link) {
        [self addAttributes:@{NSLinkAttributeName: link} range:NSMakeRange(0, self.length)];
        return self;
    };
}

- (NSMutableAttributedString *(^)(CGFloat))oblique {
    return ^(CGFloat value) {
        [self addAttributes:@{NSObliquenessAttributeName: @(value)} range:NSMakeRange(0, self.length)];
        return self;
    };
}

- (NSMutableAttributedString *(^)(CGFloat))kern {
    return ^(CGFloat kern) {
        [self addAttributes:@{NSKernAttributeName: @(kern)} range:NSMakeRange(0, self.length)];
        return self;
    };
}

- (NSMutableAttributedString *(^)(CGFloat))expansion {
    return ^(CGFloat value) {
        [self addAttributes:@{NSExpansionAttributeName: @(value)} range:NSMakeRange(0, self.length)];
        return self;
    };
}

- (NSMutableAttributedString *(^)(NSUInteger))ligature {
    return ^(NSUInteger ligature) {
        [self addAttributes:@{NSLigatureAttributeName: @(ligature)} range:NSMakeRange(0, self.length)];
        return self;
    };
}

- (NSMutableAttributedString *(^)(NSUnderlineStyle, UIColor *))underline {
    return ^(NSUnderlineStyle underline, UIColor *color) {
        [self addAttributes:@{NSUnderlineStyleAttributeName: @(underline)} range:NSMakeRange(0, self.length)];
        [self addAttributes:@{NSUnderlineColorAttributeName: color} range:NSMakeRange(0, self.length)];
        return self;
    };
}

- (NSMutableAttributedString *(^)(NSUnderlineStyle, UIColor *))strikethrough {
    return ^(NSUnderlineStyle underline, UIColor *color) {
        [self addAttributes:@{NSStrikethroughStyleAttributeName: @(underline)} range:NSMakeRange(0, self.length)];
        [self addAttributes:@{NSStrikethroughColorAttributeName: color} range:NSMakeRange(0, self.length)];
        return self;
    };
}

- (NSMutableAttributedString * _Nonnull (^)(UIColor * _Nonnull, CGFloat))stroke{
    return ^(UIColor *color, CGFloat value) {
        [self addAttributes:@{NSStrokeColorAttributeName: color} range:NSMakeRange(0, self.length)];
        [self addAttributes:@{NSStrokeWidthAttributeName: @(value)} range:NSMakeRange(0, self.length)];
        return self;
    };
}

- (NSMutableAttributedString *(^)(NSShadow *))shadow {
    return ^(NSShadow *shadow) {
        [self addAttributes:@{NSShadowAttributeName: shadow} range:NSMakeRange(0, self.length)];
        return self;
    };
}

- (NSMutableAttributedString *(^)(NSString *))textEffect {
    return ^(NSString *textEffect) {
        [self addAttributes:@{NSTextEffectAttributeName: textEffect} range:NSMakeRange(0, self.length)];
        return self;
    };
}

- (NSMutableAttributedString *(^)(NSTextAttachment *))attachment {
    return ^(NSTextAttachment *attachment) {
        [self addAttributes:@{NSAttachmentAttributeName: attachment} range:NSMakeRange(0, self.length)];
        return self;
    };
}

- (NSMutableAttributedString *(^)(CGFloat))baselineOffset {
    return ^(CGFloat value) {
        [self addAttributes:@{NSBaselineOffsetAttributeName: @(value)} range:NSMakeRange(0, self.length)];
        return self;
    };
}

- (NSMutableAttributedString *(^)(NSArray<NSAttributedString *>*))appedAttrStrings {
    return ^(NSArray<NSAttributedString *>* attrStrings) {
        for (NSAttributedString *temp in attrStrings) {
            [self appendAttributedString:temp];
        }
        return self;
    };
}

- (NSMutableAttributedString *(^)(UIImage *, CGRect))addImage {
    return ^(UIImage *image, CGRect bounds) {
        NSTextAttachment *iconAttachment = [[NSTextAttachment alloc] init];
        iconAttachment.image = image;
        iconAttachment.bounds = bounds;
        NSAttributedString *iconString = [NSAttributedString attributedStringWithAttachment:iconAttachment];
        [self appendAttributedString:iconString];
        return self;
    };
}


@end


@implementation NSString (Chain)

- (NSMutableAttributedString *)matt {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    return attributedString;
}

@end


@implementation NSAttributedString (Chain)

- (NSMutableAttributedString *)matt {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self];
    return attributedString;
}

@end
