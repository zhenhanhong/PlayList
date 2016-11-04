//
//  ViewController.m
//  弹出框背景颜色
//
//  Created by Zhen hanhong on 16/2/3.
//  Copyright © 2016年 Makermeet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class RAlertView;

@protocol RAlertViewDelegate <NSObject>
@optional

- (void)alertView:(RAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface RAlertView : UIView{
    UIImageView *backgroundView;
//	id<RAlertViewDelegate> _delegate;
    
    UIWindow    *modelWindow;
    UIWindow    *resignWindow;
}
@property(nonatomic,assign)id<RAlertViewDelegate> _delegate;

- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id )delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... ;

-(void)setBackground:(UIImage*)image;

-(void)show;


- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, strong) UIViewController *shareController;



@property (nonatomic, copy) NSString *title;


@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) NSString *imgUrl;


@end
