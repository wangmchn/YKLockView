//
//  YKLockButton.m
//  YKLockView
//
//  Created by Mark on 15/4/4.
//  Copyright (c) 2015年 yq. All rights reserved.
//

#import "YKLockButton.h"
#define lineWidth 2.0f
#define btnMargin 2.0f

@implementation YKLockButton
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)setSelected:(BOOL)selected{
    _selected = selected;
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (_selected) {
        // 外圈线条颜色
        CGContextSetRGBStrokeColor(context, 2/255.f, 174/255.f, 240/255.f, 1.0f);
        // 内圈填充颜色
        CGContextSetRGBFillColor(context, 2/255.f, 174/255.f, 240/255.f, 1.0f);
        CGRect inframe = CGRectMake((width-width/4)/2, (width-width/4)/2, width/4, width/4);
        CGContextAddEllipseInRect(context, inframe);
        CGContextFillPath(context);
    }else{
        CGContextSetRGBStrokeColor(context, 1.0f, 1.0f, 1.0f, 1.0f);
    }
    CGContextSetLineWidth(context, lineWidth);
    
    CGFloat w = width-2*btnMargin;
    CGFloat h = height-2*btnMargin;
    CGRect exframe = CGRectMake(btnMargin, btnMargin, w, h);
    CGContextAddEllipseInRect(context, exframe);
    CGContextStrokePath(context);
    
    
    if (_selected) {
        // 选中时外圈填充色
        CGContextSetRGBFillColor(context, 2/255.f, 174/255.f, 240/255.f, 0.3f);
        CGContextAddEllipseInRect(context,exframe);
        CGContextFillPath(context);
    }
}

@end
