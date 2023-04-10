//
//  UITableView+RegisterAble.m
//  WLWUIDemo
//
//  Created by wangliwei on 2023/4/1.
//

#import "UITableView+RegisterAble.h"
#import <objc/runtime.h>

@implementation UITableView (RegisterAble)

static char *cellIdetifiersKey = "cellIdetifiers";

-(void)setCellIdetifiers:(NSMutableArray *)cellIdetifiers {
    objc_setAssociatedObject(self, cellIdetifiersKey, cellIdetifiers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSMutableArray *)cellIdetifiers{
    NSMutableArray *array = objc_getAssociatedObject(self, cellIdetifiersKey);
    if (!array) {
        array = [NSMutableArray array];
        self.cellIdetifiers = array;
    }
    return array;
}

- (__kindof UITableViewCell *)dequeueReusableCellWithClass:(Class)iClass isXib:(BOOL)isXib {
    NSString *identifier = NSStringFromClass(iClass);
    return [self dequeueReusableCellWithClass:iClass identifier:identifier isXib:isXib];
}

- (__kindof UITableViewCell *)dequeueReusableCellWithClass:(Class)iClass identifier:(NSString *)identifier isXib:(BOOL)isXib {
    if (![self.cellIdetifiers containsObject:identifier]) {
        if (isXib) {
            [self registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellReuseIdentifier:identifier];
        } else {
            [self registerClass:iClass forCellReuseIdentifier:identifier];
        }
        [self.cellIdetifiers addObject:identifier];
    }
    
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:identifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
