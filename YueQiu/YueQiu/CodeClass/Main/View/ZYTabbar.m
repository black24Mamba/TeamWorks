//
//  ZYTabbar.m
//  微博
//
//  Created by 章鱼 on 16/3/1.
//  Copyright © 2016年 章鱼. All rights reserved.
//

#import "ZYTabbar.h"

@interface ZYTabbar ()
@property(nonatomic,weak)UIButton *plusButton;
@end

@implementation ZYTabbar
//懒加载加号按钮 重写get方法
- (UIButton *)plusButton{
    if (_plusButton == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add@3x"] forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        _plusButton = btn;
//        默认按钮尺寸跟背景图片一般大
        [btn sizeToFit];
        [self addSubview:_plusButton];
    }
    [_plusButton addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
    return _plusButton;
}
//加号按钮点击
- (void)plusClick{
    if ([self.delegatee respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.delegatee tabBarDidClickPlusButton:self];
    }
}
//调整子控件的位置
- (void)layoutSubviews{
    [super layoutSubviews];
    self.tintColor = [UIColor orangeColor];
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = w / (self.items.count + 1);
    CGFloat btnH = h;
    int i = 0;
    //调整系统自带的tabbar上的按钮位置
    for (UIView *tabBarButton in self.subviews) {
        if (i == 2) {
            i = 3;
        }
        btnX = btnW * i;
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
            i ++;
        }
    }
    //设置添加按钮的位置
    self.plusButton.center = CGPointMake(w * 0.5, h * 0.5);
//    self.plusButton.bounds = CGRectMake(0, 0, self.plusButton.currentBackgroundImage.size.width, self.plusButton.currentBackgroundImage.size.height);   可以默认按钮尺寸跟背景图片一般大 代码在上面
}

@end
