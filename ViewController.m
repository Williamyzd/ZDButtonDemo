//
//  ViewController.m
//  ZDButtonDemo
//
//  Created by admin on 15/11/25.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "ViewController.h"
#import "ZDButton/ZDButton.h"
#import "ZDTableCTR.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    ZDButton *abtn = [[ZDButton alloc] init];
    ZDTableCTR *table = [[ZDTableCTR alloc] init];
    [abtn setZDbtnTittle:@"点我"
             normalImage:@"navigationbar_arrow_down"
            selecedImage:@"navigationbar_arrow_up"
        targetController:table
          targetViewSize:CGSizeMake(160, 250)];
    self.navigationItem.titleView = abtn;
   

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
