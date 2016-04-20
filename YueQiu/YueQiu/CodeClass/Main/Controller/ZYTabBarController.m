//
//  ZYTabBarController.m
//  微博
//
//  Created by 章鱼 on 16/3/1.
//  Copyright © 2016年 章鱼. All rights reserved.
//

#import "ZYTabBarController.h"
#import "UIImage+ZYimage.h"
#import "ZYTabbar.h"
#import "HomeTableViewController.h"
#import "MessageTableViewController.h"
#import "DiscoverTableViewController.h"
#import "ProfileTableViewController.h"
#import "ZYNavigationController.h"
@interface ZYTabBarController ()<ZYTabBarDelegate>

@end

@implementation ZYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = [UIColor orangeColor];
    //设置控制器
    [self setAllViewControllers];
    //自定义tabbar
    ZYTabbar *tabBar = [[ZYTabbar alloc]initWithFrame:self.tabBar.frame];
    //利用kvc把readly的属性
    [self setValue:tabBar forKeyPath:@"tabBar"];
    tabBar.delegatee = self;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)setAllViewControllers{
    //首页
    HomeTableViewController *home = [[HomeTableViewController alloc]init];
    [self setUpOneChildController:home imageName:@"tabbar_home.png"  selectedImageName:@"tabbar_home_selected.png" title:@"首页"];
    //消息
    MessageTableViewController *message = [[MessageTableViewController alloc]init];
        [self setUpOneChildController:message imageName:@"tabbar_message_center.png" selectedImageName:@"tabbar_message_center_selected.png" title:@"消息"];
    //发现
    DiscoverTableViewController *discover = [[DiscoverTableViewController alloc]init];
   
          [self setUpOneChildController:discover imageName:@"tabbar_discover.png" selectedImageName:@"tabbar_discover_selected.png" title:@"发现"];
    //我
    ProfileTableViewController *profile = [[ProfileTableViewController alloc]init];
    
     [self setUpOneChildController:profile imageName:@"tabbar_profile.png" selectedImageName:@"tabbar_profile_selected.png"  title:@"我"];
    
}
#pragma mark----ZYTabBarDelegate代理方法
- (void)tabBarDidClickPlusButton:(ZYTabbar *)tabBar{
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor redColor];
    [self presentViewController:vc animated:YES completion:nil];
}
#pragma mark----添加一个子控制器的方法
- (void)setUpOneChildController:(UIViewController *)vc imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName title:(NSString *)title{
//    vc.tabBarItem.title = title;
//    vc.tabBarItem.badgeValue = @"0";  用下面一句代码完成这两句
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageWithOrignalName:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageWithOrignalName:selectedImageName];
    ZYNavigationController *naVC = [[ZYNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:naVC];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
