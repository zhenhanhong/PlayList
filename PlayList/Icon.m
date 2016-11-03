//
//  IconView.m
//  PlayList
//
//  Created by 甄翰宏 on 2016/11/3.
//  Copyright © 2016年 甄翰宏. All rights reserved.
//

#import "IconView.h"

@implementation IconView

-(instancetype)init{
    self = [super init];
    self.iconButton.frame = self.frame;
    [self addSubview:self.iconButton];
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.iconButton.frame = CGRectMake(0, 0, , <#CGFloat height#>)
}
-(UIButton *)iconButton{
    if (_iconButton == nil) {
        _iconButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_iconButton setBackgroundColor:[UIColor redColor]];
        [_iconButton.layer setCornerRadius:self.frame.size.width / 2];
        [_iconButton setBackgroundImage:self.image forState:UIControlStateNormal];
    }
    return _iconButton;
}

@end
