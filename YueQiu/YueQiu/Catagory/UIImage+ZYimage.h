//
//  UIImage+ZYimage.h
//  微博
//
//  Created by 章鱼 on 16/3/1.
//  Copyright © 2016年 章鱼. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZYimage)
//加载最原始的图片 不渲染
+ (instancetype)imageWithOrignalName:(NSString *)imageName;
@end
