//
//  StarsView.m
//  Stars
//
//  Created by 耿荣林 on 2018/6/25.
//  Copyright © 2018年 耿荣林. All rights reserved.
//
#import "StarsView.h"
#define SpaseWidth self.bounds.size.width / 5 * 1 / 5
#define StarImgWidth self.bounds.size.width / 5 * 3 / 5
#define StarAllWidth self.bounds.size.width / 5
#define ViewWidth self.bounds.size.width
#define ViewHeight self.bounds.size.height

@implementation StarsView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.v_addcomment = [[UIView alloc]init];
        self.v_addcomment.frame = self.bounds;
        [self addSubview:_v_addcomment];
        
        _img_star1 = [[UIImageView alloc]init];
        [_v_addcomment addSubview:_img_star1];

        _img_star2 = [[UIImageView alloc]init];
        [_v_addcomment addSubview:_img_star2];

        _img_star3 = [[UIImageView alloc]init];
        [_v_addcomment addSubview:_img_star3];

        _img_star4 = [[UIImageView alloc]init];
        [_v_addcomment addSubview:_img_star4];

        _img_star5 = [[UIImageView alloc]init];
        [_v_addcomment addSubview:_img_star5];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self setUI];
}

- (void)setUI{
    _img_star1.frame = CGRectMake(SpaseWidth, (ViewHeight - StarImgWidth) / 2, StarImgWidth, StarImgWidth);
    
    _img_star2.frame = CGRectMake(StarAllWidth + SpaseWidth, (ViewHeight - StarImgWidth) / 2, StarImgWidth, StarImgWidth);

    _img_star3.frame = CGRectMake(StarAllWidth * 2 + SpaseWidth, (ViewHeight - StarImgWidth) / 2, StarImgWidth, StarImgWidth);

    _img_star4.frame = CGRectMake(StarAllWidth * 3 + SpaseWidth, (ViewHeight - StarImgWidth) / 2, StarImgWidth, StarImgWidth);

    _img_star5.frame = CGRectMake(StarAllWidth * 4 + SpaseWidth, (ViewHeight - StarImgWidth) / 2, StarImgWidth, StarImgWidth);
    [self clearStar];
}

- (void)clearStar{
    [self.img_star1 setImage:[UIImage imageNamed:@"StarUnSelect"]];
    [self.img_star2 setImage:[UIImage imageNamed:@"StarUnSelect"]];
    [self.img_star3 setImage:[UIImage imageNamed:@"StarUnSelect"]];
    [self.img_star4 setImage:[UIImage imageNamed:@"StarUnSelect"]];
    [self.img_star5 setImage:[UIImage imageNamed:@"StarUnSelect"]];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:_v_addcomment];
    if ((point.x > 0 && point.x < _v_addcomment.bounds.size.width) && (point.y > 0)) {
        [self changeStarForegroundViewWithPoint:point];
        self.canAddStar = YES;
    }else{
        self.canAddStar = NO;
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.canAddStar) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:_v_addcomment];
        [self changeStarForegroundViewWithPoint:point];
    }
    return;
}

-(void)changeStarForegroundViewWithPoint:(CGPoint)point{
    NSInteger count = 0;
    count = count + [self changeImg:point.x image:self.img_star1];
    count = count + [self changeImg:point.x image:self.img_star2];
    count = count + [self changeImg:point.x image:self.img_star3];
    count = count + [self changeImg:point.x image:self.img_star4];
    count = count + [self changeImg:point.x image:self.img_star5];
    self.getCount(count);
}

-(NSInteger)changeImg:(float)x image:(UIImageView*)img{
    if(x > (img.frame.origin.x + img.frame.size.width/2)){
        [img setImage:[UIImage imageNamed:@"StarSelected"]];
        return 2;
    }else if(x> img.frame.origin.x){
        [img setImage:[UIImage imageNamed:@"StarSelectHeaf"]];
        return 1;
    }else{
        [img setImage:[UIImage imageNamed:@"StarUnSelect"]];
        return 0;
    }
}

-(void)setImageAnimation:(UIView *)v{
    CGRect rec = v.frame;
    [UIView animateWithDuration:0.1 animations:^{
        v.frame = CGRectMake(v.frame.origin.x, v.frame.origin.y -3, v.frame.size.width, v.frame.size.height);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            v.frame = rec;
        } completion:^(BOOL finished) {
            v.frame = rec;
        }];
    }];
}
@end
