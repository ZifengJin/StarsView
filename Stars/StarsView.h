//
//  StarsView.h
//  Stars
//
//  Created by 耿荣林 on 2018/6/25.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarsView : UIView
@property (nonatomic,strong) UIView *v_addcomment;
@property(strong,nonatomic)  UIView *v_star;

@property(strong,nonatomic)  UIImageView *img_star1;
@property(strong,nonatomic)  UIImageView *img_star2;
@property(strong,nonatomic)  UIImageView *img_star3;
@property(strong,nonatomic)  UIImageView *img_star4;
@property(strong,nonatomic)  UIImageView *img_star5;

@property (nonatomic,copy) void (^getCount) (NSInteger count);

@property BOOL canAddStar;
@end
