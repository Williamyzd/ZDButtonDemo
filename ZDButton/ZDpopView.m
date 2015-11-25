//
//  ZDpopView.m
//  弹出菜单
//
//  Created by admin on 15/7/15.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "ZDpopView.h"


#define Margin 10
#define FixedSize 200

@interface ZDpopView ()
@property (nonatomic, copy) void (^finishBlock)();
@property (nonatomic, weak)UIView *contentView;
@end


@implementation ZDpopView

#pragma mark---------初始化并加载图片视图-----------
-(instancetype) initWithFrame:(CGRect)frame{
    self= [super initWithFrame:frame];
    self.backgroundColor = [UIColor clearColor];
    self.frame = [UIScreen mainScreen].bounds;
    [[[UIApplication sharedApplication].windows lastObject] addSubview:self];
    [self setImage];
     return self;
}

//加载背景图片
- (void)setImage{
    //下一步去尝试
//    CALayer *backLayer = [[CALayer alloc] init];
//    backLayer.contents = (id)[UIImage imageNamed:@"popover_background"].CGImage;
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [self adjustImageWithImageStr:@"popover_background"];
    imageView.userInteractionEnabled = YES;
    [imageView sizeToFit];
    [self addSubview:imageView];
    self.imageView = imageView;
}

//切图片
- (UIImage*)adjustImageWithImageStr:(NSString *)imagestr {
    if (imagestr) {
        UIImage *imagename1= [UIImage imageNamed:imagestr];
        UIImage *imagename = [imagename1 resizableImageWithCapInsets:UIEdgeInsetsMake(Margin, Margin, Margin, Margin) resizingMode:UIImageResizingModeStretch];
        return imagename;
    }
    NSLog(@"没有图片");
    return 0;
    
}
//预先加载内容视图
#pragma mark---------加载内容视图并设置Frame-----------
-(instancetype)initWithContentView:(UIView*) contentView andContentSize:(CGSize)aSize{
    self =[super init];
    contentView.backgroundColor = [UIColor clearColor];
    [self.imageView addSubview:contentView];
    self.contentView = contentView;
    [self setFramesWith:aSize];

 return self;
}
//设置Frame
-(void)setFramesWith:(CGSize) asize{
    if (!asize.width || !asize.height){
        asize = CGSizeMake(FixedSize, FixedSize);
    }
    self.imageView.bounds = CGRectMake(0, 0, asize.width+2*Margin, asize.height+3*Margin);
    self.contentView.frame = CGRectMake(Margin, 1.7*Margin, asize.width, asize.height);
}

#pragma mark---------确定显示的位置-----------
-(void)showInView:(UIView*)inView finish:(void(^)())complished{
       //将点转换为window内的点
    CGPoint centerPoint = [inView.superview convertPoint:inView.center toView:self];
    CGPoint Popcenter = CGPointMake(centerPoint.x,centerPoint.y+Margin);

    [self setSubView:self.imageView withLocation:Popcenter];
    self.finishBlock = complished;
}
//设置position
-(void)setSubView:(UIView*)subview withLocation:(CGPoint) point {
    subview.layer.anchorPoint =CGPointMake(0.5, 0);
    subview.layer.position =point;
}

#pragma mark---------设置点击视图消失并确定代理执行时间-----------
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.finishBlock();
    [self dismiss];
}


-(void)layoutSubviews{
    [super layoutSubviews];
    [self bringSubviewToFront:self.contentView];
}

-(void)dismiss{
    [self removeFromSuperview];
}

@end
