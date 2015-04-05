//
//  BackgroundView.m
//  YKLockView
//
//  Created by Mark on 15/4/4.
//  Copyright (c) 2015年 yq. All rights reserved.
//

#import "BackgroundView.h"

@implementation BackgroundView

- (void)drawRect:(CGRect)rect {
    // Drawing code
    // 绘制背景渐变
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef rgbSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] =
    {
        134 / 255.0, 157 / 255.0, 147 / 255.0, 1.00,
        3 / 255.0,  3 / 255.0, 37 / 255.0, 1.00
    };
    size_t count = sizeof(colors)/(sizeof(colors[0])*4);
    /**
     *  通过 CGGradientCreateWithColorComponents 返回一个线性渐变
     *
     *  @param space#>      色彩空间(色域)，这里通过 CGColorSpaceCreateDeviceRGB() 获得rgb的色域
     *  @param components#> 颜色元素，至少包含两个元素(起点终点)
     *  @param locations#>  位置数组，颜色数组中各个颜色的位置：此参数控制该渐变从一种颜色过渡到另一种颜色的速度
     *  @param count#>      位置的数量：这个参数指明了我们需要多少颜色和位置
     *
     *  @return CGGradientRef 线性渐变
     */
    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgbSpace, colors, NULL, count);
    CGColorSpaceRelease(rgbSpace);
    CGPoint startPoint = CGPointMake(0.0f, 0.0f);
    CGPoint endPoint = CGPointMake(0.0f, self.frame.size.height);
    CGContextDrawLinearGradient(context, gradient, startPoint,endPoint,kCGGradientDrawsBeforeStartLocation);
    // kCGGradientDrawsAfterEndLocation     扩展整个渐变到渐变的终点之后的所有点
    // kCGGradientDrawsBeforeStartLocation  扩展整个渐变到渐变的起点之前的所有点
}
@end
