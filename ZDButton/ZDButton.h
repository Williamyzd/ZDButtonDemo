//
//  ZDButton.h
//  ZDAPP
//
//  Created by admin on 15/11/21.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDButton : UIButton
//点击后的下来菜单控制器
@property (nonatomic, strong)UIViewController *targetCTR;
//下来菜单的尺寸
@property (nonatomic, assign)CGSize            listviewSize;
//设置button的标题文字,下来菜单控制器,以及下来菜单大小
- (void)setZDbtnTittle:(NSString*)tittleName
           normalImage:(NSString*)normalImage
           selecedImage:(NSString*)selectedImage
           targetController:(UIViewController*)targetController
           targetViewSize:(CGSize)aSize;


@end
