//
//  UIImage+ZYimage.m
//  微博
//
//  Created by 章鱼 on 16/3/1.
//  Copyright © 2016年 章鱼. All rights reserved.
//

#import "UIImage+ZYimage.h"

@implementation UIImage (ZYimage)
+ (instancetype)imageWithOrignalName:(NSString *)imageName{
   UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

}
@end
