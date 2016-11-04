//
//  ViewController.m
//  弹出框背景颜色
//
//  Created by Zhen hanhong on 16/2/3.
//  Copyright © 2016年 Makermeet. All rights reserved.
//

#import "RAlertView.h"
#import "header.h"
#import "SetColor.h"
#import "UMSocial.h"
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface RAlertView(private)  <UMSocialUIDelegate>

    
@end

@implementation RAlertView
@synthesize _delegate;

//初始化函数
- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id )delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...{
    
    self=[super initWithFrame:CGRectZero];
    if (self) {
        [self.layer setBorderColor:[SetColor colorWithHexString:boardColor].CGColor];
        [self.layer setBorderWidth:0.6];
        self.backgroundColor=[UIColor whiteColor];
        modelWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        UIColor *color = [UIColor blackColor];
        modelWindow.backgroundColor = [color colorWithAlphaComponent:0.3];
        resignWindow   = [[UIApplication sharedApplication] keyWindow];
        _delegate = delegate;
        
        
        
    
                
        self.layer.cornerRadius=1.0;
        backgroundView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        backgroundView.layer.cornerRadius=1.0;
        backgroundView.clipsToBounds = YES;
        [self addSubview:backgroundView];
        [self sendSubviewToBack:backgroundView];
        
        
        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
       
        [self addSubview:cancelBtn];
        
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancelBtn.titleLabel setFont:[UIFont systemFontOfSize:fontSize16]];
        [cancelBtn setTitleColor:[SetColor colorWithHexString:UserNameColor] forState:UIControlStateNormal];
        cancelBtn.backgroundColor = [SetColor colorWithHexString:BackgroudColor];
        [cancelBtn setBackgroundImage:[UIImage imageNamed:@"cancel_btn"] forState:UIControlStateNormal];
        [cancelBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        cancelBtn.tag=100;
        //[self creatView];
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, WIDTH - 20, 20)];
        title.textAlignment = NSTextAlignmentCenter;
        [title setTextColor:[SetColor colorWithHexString:UserNameColor]];
        [title setText:@"分享"];
        [title setFont:[UIFont systemFontOfSize:fontSize16]];
        
        float iconWith = (WIDTH - 40 * 4 ) / 3;
        
         for (int j = 0; j < 2; j++){
            
            for (int i = 0; i < 3; i++){
                UIImageView *img = [[UIImageView alloc]init];
                
                [img setBackgroundColor:[UIColor whiteColor]];
                [self addSubview:img];
                if (j == 0) {
                    img.frame = CGRectMake(40 + i * (iconWith + 40), title.frame.origin.y  + title.frame.size.height + 10 + j * (iconWith + 40), iconWith, iconWith);
                    [img.layer setCornerRadius:iconWith / 2];
                    UITapGestureRecognizer *tapreco1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickAction1:)];
                       UITapGestureRecognizer *tapreco2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickAction2:)];
                       UITapGestureRecognizer *tapreco3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickAction3:)];
                    img.userInteractionEnabled = YES;
                    if (i == 0) {
                        [img addGestureRecognizer:tapreco1];
                    }
                    if (i == 1) {
                        [img addGestureRecognizer:tapreco2];
                    }
                    if (i == 2) {
                        [img addGestureRecognizer:tapreco3];
                    }
                    
                    
                    
                    
                    
                    UILabel *label = [[UILabel alloc]init];
                    [label setBackgroundColor:[UIColor clearColor]];
                    [label setTextColor:[SetColor colorWithHexString:UserNameColor]];
                    [label setFont:[UIFont systemFontOfSize:fontSize11]];
                    [label setTextAlignment:NSTextAlignmentCenter];
                    NSArray *arr = [NSArray arrayWithObjects:@"微信好友",@"朋友圈",@"QQ空间", nil];
                    NSArray *icon = [NSArray arrayWithObjects:@"WX", @"PYQ",@"qz",nil];
                    [label setText:arr[i]];
//                    [img setImage:[[UIImage imageNamed:icon[i]]imageWithRenderingMode:UIImageRenderingModeAutomatic ] forState:UIControlStateNormal];
                    [img setImage:[UIImage imageNamed:icon[i]]];
                    [img setTag:[NSString stringWithFormat:@"100%d", i].intValue];
                    
                    [self addSubview:label];
                    label.frame = CGRectMake(40 + i * (iconWith + 40), img.frame.origin.y + img.frame.size.height + 5, iconWith, 20);

                    
                }
                if (j == 1 && i < 2) {
                    img.frame = CGRectMake(40 + i * (iconWith + 40), title.frame.origin.y  + title.frame.size.height + 10 + j * (iconWith + 40), iconWith, iconWith);
                    [img.layer setCornerRadius:iconWith / 2];
                    
                    
                    UILabel *label = [[UILabel alloc]init];
                    [label setBackgroundColor:[UIColor clearColor]];
                    [label setTextColor:[SetColor colorWithHexString:UserNameColor]];
                    [label setFont:[UIFont systemFontOfSize:fontSize11]];
                    NSArray *arr = [NSArray arrayWithObjects:@"QQ好友",@"新浪微博", nil];
                     NSArray *icon = [NSArray arrayWithObjects:@"QQ", @"wb",nil];
                    [label setTextAlignment:NSTextAlignmentCenter];
                    [label setText:arr[i]];
                    [img setImage:[UIImage imageNamed:icon[i]]];
                    
                    UITapGestureRecognizer *tapreco4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickAction4:)];
                    UITapGestureRecognizer *tapreco5 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickAction5:)];

                    img.userInteractionEnabled = YES;
                    if (i == 0) {
                        [img addGestureRecognizer:tapreco4];
                    }
                    if (i == 1) {
                        [img addGestureRecognizer:tapreco5];
                    }
  
                    
                    
                    
                    [self addSubview:label];
                    label.frame = CGRectMake(40 + i * (iconWith + 40), img.frame.origin.y + img.frame.size.height + 5, iconWith, 20);
                }
               
                
            }
                  }
        
        
        
        [self addSubview:title];
        
        
        

        self.frame = CGRectMake(0, ([UIScreen mainScreen].bounds.size.height - 270*[UIScreen mainScreen].bounds.size.height / 568), [UIScreen mainScreen].bounds.size.width, 270 *([UIScreen mainScreen].bounds.size.height / 568));
         cancelBtn.frame = CGRectMake(40, self.frame.size.height - 50, [UIScreen mainScreen].bounds.size.width - 80, 40);
        
    }
    return self;
}
//图标点击方法
-(void)clickAction1:(UITapGestureRecognizer *)tap{
    NSLog(@"微信好友");
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:_imgUrl]];
    [UMSocialData defaultData].extConfig.wechatSessionData.url = _url;
    
    [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeNone;
    [UMSocialData defaultData].extConfig.wechatSessionData.title = _title;
    
    
    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToWechatSession] content:_subTitle image:[UIImage imageWithData:data] location:nil urlResource:nil presentedController:nil completion:^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess) {
            NSLog(@"分享成功！");
        }
    }];
   
}
-(void)clickAction2:(UITapGestureRecognizer *)tap{
    NSLog(@"微信朋友圈");
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:_imgUrl]];
    
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = _url;
    
    [UMSocialData defaultData].extConfig.wechatTimelineData.title = _title;
    
    
    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToWechatTimeline] content:_subTitle image:[UIImage imageWithData:data] location:nil urlResource:nil presentedController:nil completion:^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess) {
            NSLog(@"分享成功！");
        }
    }];
    

    
}
-(void)clickAction3:(UITapGestureRecognizer *)tap{
    NSLog(@"QQ空间");
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:_imgUrl]];
    [UMSocialData defaultData].extConfig.qzoneData.url = _url;
    
    [UMSocialData defaultData].extConfig.qzoneData.title = _title;
    
    
    
    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToQzone] content:_subTitle image:[UIImage imageWithData:data] location:nil urlResource:nil presentedController:nil completion:^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess) {
            NSLog(@"分享成功！");
        }
    }];
    
    

    
}
-(void)clickAction4:(UITapGestureRecognizer *)tap{
    NSLog(@"QQ好友");
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:_imgUrl]];
    [UMSocialData defaultData].extConfig.qqData.url = _url;
    
    [UMSocialData defaultData].extConfig.qqData.title = _title;
    
    
    
    
    
    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToQQ] content:_subTitle image:[UIImage imageWithData:data] location:nil urlResource:nil presentedController:nil completion:^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess) {
            NSLog(@"分享成功！");
        }
    }];
    

    
}
-(void)clickAction5:(UITapGestureRecognizer *)tap{
    NSLog(@"新浪微博");
    /*
     使用分享API  自动授权后跳转到内容编辑页
     
     */

    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:_imgUrl]];
    
    [[UMSocialControllerService defaultControllerService] setShareText:[NSString stringWithFormat:@"%@ %@", _subTitle, _url] shareImage:[UIImage imageWithData:data] socialUIDelegate:self];
    [modelWindow resignKeyWindow];
    [resignWindow makeKeyAndVisible];//设置分享内容和回调对象
    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina].snsClickHandler(_shareController,[UMSocialControllerService defaultControllerService],YES);
}

//设置背景
-(void)setBackground:(UIImage*)image{
    CGSize size = [image size];
    CGFloat width=0,height=0;
    if (240-size.width>0) {
        width = 240-size.width;
    }
    if (self.frame.size.height-size.height>0) {
        height = self.frame.size.height-size.height;
    }
    [image stretchableImageWithLeftCapWidth:width topCapHeight:height];
    [backgroundView setImage:image];
}
-(void)show{
    [modelWindow makeKeyAndVisible];
	[modelWindow addSubview:self];
	self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    [UIView animateWithDuration:0.15 animations:^{
        self.transform = CGAffineTransformMakeScale(1.1f, 1.1f);
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.15 animations:^{
            self.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        }];
    }];
}

- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated{
    if (self) {
        if (animated) {
            [UIView animateWithDuration:0.2f 
                             animations:^{
                                 self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
                             }completion:^(BOOL finished){
                                 [modelWindow resignKeyWindow];
                                 [resignWindow makeKeyAndVisible];
                             
            }];
        }else{
            [modelWindow resignKeyWindow];
            [resignWindow makeKeyAndVisible];
          
        }
    }
}


-(void)buttonClicked:(id)sender{
    if (_delegate&&[_delegate respondsToSelector:@selector(alertView:clickedButtonAtIndex:)])
    {
        NSInteger index = [sender tag];
        if (index == 100) {
            index = 0;
        }
        [_delegate alertView:self clickedButtonAtIndex:index];
    }
    [modelWindow resignKeyWindow];
    [resignWindow makeKeyAndVisible];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(dismissWithClickedButtonIndex:animated:) object:nil];
   
}


@end
