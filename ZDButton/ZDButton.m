//
//  ZDButton.m
//  ZDAPP
//
//  Created by admin on 15/11/21.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "ZDButton.h"
#import "UIView+Extension.h"
#import "ZDpopView.h"

@implementation ZDButton
#pragma mark---------初始化与自动布局-----------
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.titleLabel.text = @"首页";
    NSAssert(self, @"ZDbutton为空");
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addTarget:self action:@selector(tittle_click) forControlEvents:UIControlEventTouchUpInside];
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.x = 0;
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + 5;
    
}

#pragma mark---------设置图片与文字-----------
- (void)setZDbtnTittle:(NSString *)tittleName normalImage:(NSString *)normalImage selecedImage:(NSString *)selectedImage targetController:(UIViewController *)targetController targetViewSize:(CGSize)aSize{
    [self setTitle:tittleName forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    self.targetCTR = targetController;
    self.listviewSize = aSize;
    
}
- (void) setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    [self adjustSize];
}
- (void)setImage:(UIImage *)image forState:(UIControlState)state{
    [super setImage:image forState:state];
    [self adjustSize];
}
//调节按钮宽度
- (void) adjustSize{
    [self sizeToFit];
    self.width = CGRectGetMaxX(self.imageView.frame);
}

#pragma mark---------处理点击-----------
- (void)tittle_click{
    self.selected  = !self.selected;
    ZDpopView *pop = [[ZDpopView alloc] initWithContentView:self.targetCTR.view andContentSize:self.listviewSize];
    __weak typeof(self) weakself = self;
    [pop showInView:self finish:^{
        weakself.selected  = !weakself.selected;
    }];
}
@end
