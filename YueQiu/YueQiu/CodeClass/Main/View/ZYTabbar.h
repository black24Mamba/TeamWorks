//
//  ZYTabbar.h
//  微博
//
//  Created by 章鱼 on 16/3/1.
//  Copyright © 2016年 章鱼. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYTabbar;


@protocol ZYTabBarDelegate <UITabBarDelegate>
@optional
- (void)tabBarDidClickPlusButton:(ZYTabbar *)tabBar;
@end

@interface ZYTabbar : UITabBar
@property(nonatomic,weak)id <ZYTabBarDelegate> delegatee;
@end
