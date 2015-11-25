//
//  ZDpopView.h
//  弹出菜单
//
//  Created by admin on 15/7/15.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDpopView : UIView
//添加图片
@property (nonatomic, weak) UIImageView *imageView;
//view消失时的回调
-(void)showInView:(UIView*)inView finish:(void(^)())complished;
//手动从当前view中remove
-(void)dismiss;
//下来菜单的view以及大小
-(instancetype)initWithContentView:(UIView*) contentView andContentSize:(CGSize)aSize;

@end
