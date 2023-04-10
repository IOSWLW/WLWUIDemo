//
//  WrapperTableViewCell.m
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/1.
//

#import "WrapperTableViewCell.h"
#import "UITableView+RegisterAble.h"

@implementation WrapperTableViewCell

static Class<WrappedAbleViewToTableViewPotocol> tableTempClass;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _wrappedView =(UIView<WrappedAbleViewToTableViewPotocol> *)[tableTempClass createWrapperView];
        [self addSubview:_wrappedView];
        [_wrappedView layoutInWrapperView:self];
        if (_data) {
            [_wrappedView configWrapperData:_data];
        }
    }
    return self;
}

- (void)configWrapperData:(id)data {
    _data = data;
    [_wrappedView configWrapperData:data];
}

+ (__kindof WrapperTableViewCell *)dequeueReusableCellWithClass:(Class<WrappedAbleViewToTableViewPotocol>)iClass
                                                      tableView:(__kindof UITableView *)tableView
                                                   forIndexPath:(NSIndexPath *)indexPath {
    tableTempClass = iClass;
    WrapperTableViewCell *cell = [tableView dequeueReusableCellWithClass:WrapperTableViewCell.class
                                                              identifier:NSStringFromClass(iClass) isXib:NO];
    tableTempClass = nil;
    return cell;
}

@end


