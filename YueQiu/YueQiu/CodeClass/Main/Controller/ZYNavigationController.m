//
//  ZYNavigationController.m
//  微博
//
//  Created by 章鱼 on 16/3/2.
//  Copyright © 2016年 章鱼. All rights reserved.
//

#import "ZYNavigationController.h"
//#import "UIBarButtonItem+ZYTabBarItem.h"
@interface ZYNavigationController ()

@end

@implementation ZYNavigationController
+ (void)initialize
{
    //设置项目所有item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *textAttribute = [NSMutableDictionary dictionary];
    textAttribute[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:textAttribute forState:UIControlStateNormal];
    
   //设置不可用状态
    NSMutableDictionary *disabletextAttribute = [NSMutableDictionary dictionary];
     disabletextAttribute[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
    disabletextAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:disabletextAttribute forState:UIControlStateDisabled];
}
- (void)viewDidLoad {
    [super viewDidLoad];

}
//重写push 让push之后的页面不出现tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //判断是否栈底控制器 因为首页也是push进栈的 self.viewControllers不为0  说明不是栈底控制器
//    if (self.viewControllers.count > 0) {
//        viewController.hidesBottomBarWhenPushed = YES;
//        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_back" hightLightImageName:@"navigationbar_back_highlighted" target:self action:@selector(back)];
//        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_more" hightLightImageName:@"navigationbar_more_highlighted" target:self action:@selector(more)];
//
//    }
    //设置导航栏按钮

        [super pushViewController:viewController animated:animated];
}
- (void)back{

    [self popViewControllerAnimated:YES];
}
- (void)more{
    [self popToRootViewControllerAnimated:YES];
}
@end
