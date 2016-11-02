//
//  PlayListTableViewCell.m
//  PlayList
//
//  Created by 甄翰宏 on 2016/11/1.
//  Copyright © 2016年 甄翰宏. All rights reserved.
//

#import "PlayListTableViewCell.h"
#import "Masonry.h"
#import "Header.h"
@implementation PlayListTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self addSubview:self.img];
    [self addSubview:self.motion];
    [self addSubview:self.result];
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self.img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [self.motion mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.img.mas_right).offset(10);
        make.centerY.mas_equalTo(self.img);
    }];
    [self.result mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-10);
        make.centerY.mas_equalTo(self.img);
    }];

    
}
-(void)setPlayListWithMode:(PlayList *)playlist{
    
    [self.img setImage:playlist.icon];
    self.motion.text = playlist.motion;
    self.result.text = playlist.result;
}
-(UIImageView *)img{
    if (_img == nil) {
        _img = [[UIImageView alloc]init];
    }
    return _img;
}
-(UILabel *)motion{
    if (_motion == nil) {
        _motion = [[UILabel alloc]init];
        [_motion setFont:[UIFont systemFontOfSize:CUSTOM_FONT_SIZE13]];
        [_motion setTextColor:[SetColor colorWithHexString:CUSTOM_COLOR_DEEPGRAY]];
    }
    return _motion;
}
-(UILabel *)result{
    if (_result == nil) {
        _result = [[UILabel alloc]init];
        [_result setFont:[UIFont boldSystemFontOfSize:CUSTOM_FONT_SIZE18]];
        [_result setTextColor:[SetColor colorWithHexString:CUSTOM_COLOR_RED]];
    }
    return _result;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
