//
//  PlayListTableViewCell.h
//  PlayList
//
//  Created by 甄翰宏 on 2016/11/1.
//  Copyright © 2016年 甄翰宏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayList.h"
@interface PlayListTableViewCell : UITableViewCell
@property(nonatomic, strong)UIImageView *img;
@property(nonatomic, strong)UILabel *motion;
@property(nonatomic, strong)UILabel *result;
-(void)setPlayListWithMode:(PlayList *)playlist;

@end
