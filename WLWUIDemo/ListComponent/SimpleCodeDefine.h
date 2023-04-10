//
//  SimpleCodeDefine.h
//  HsCommonEngine
//
//  Created by wangliwei on 2022/12/3.
//  Copyright © 2022 tzyj. All rights reserved.
//

#ifndef SimpleCodeDefine_h
#define SimpleCodeDefine_h

#import "UIView+SimpleEx.h"
#import "UICollectionView+RegistrerAble.h"
#import "UITableView+RegisterAble.h"
#import "ListViewHeader.h"
#import "NSMutableAttributedString+Chain.h"

#define kScreenWidth UIScreen.mainScreen.bounds.size.width

#define __lazy_var(cls,_ivar_, init, ...)\
- (cls *)_ivar_{\
    if(!_##_ivar_){\
        _##_ivar_ = [cls.alloc init];\
        __VA_ARGS__\
    }\
    return _##_ivar_;\
}

#define __func_init(...)\
- (instancetype)init{\
    if (self = [super init])\
        __VA_ARGS__\
    return self;\
}

#define __String(...)\
[NSString stringWithFormat:__VA_ARGS__]

#endif /* SimpleCodeDefine_h */
