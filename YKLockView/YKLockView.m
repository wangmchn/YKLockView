//
//  YKLockView.m
//  YKLockView
//
//  Created by Mark on 15/4/4.
//  Copyright (c) 2015年 yq. All rights reserved.
//

#import "YKLockView.h"
#define Margin 30

@interface YKLockView ()
@property (nonatomic, strong) NSMutableArray *selectedButtons;
@property (nonatomic, assign) CGPoint currentPoint;
@property (nonatomic, copy)   NSMutableString *password;
@end
@implementation YKLockView
// init from code
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addLockButtons];
    }
    return self;
}
// init from xib or storyboard
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self addLockButtons];
    }
    return self;
}
#pragma mark - Private Methods
// 懒加载
- (NSMutableArray *)selectedButtons{
    if (_selectedButtons == nil) {
        _selectedButtons = [NSMutableArray array];
    }
    return _selectedButtons;
}
- (NSMutableString *)password{
    if (_password == nil) {
        _password = [NSMutableString string];
    }
    return _password;
}
// 当触点在button的frame内时，点亮button
- (void)brightButtonWithTouches:(NSSet *)touches{
    UITouch *touch = [touches anyObject];
    CGPoint pos = [touch locationInView:self];
    self.currentPoint = pos;
    NSArray *subviews = self.subviews;
    for (YKLockButton *btn in subviews) {
        if (CGRectContainsPoint(btn.frame, pos)) {
            btn.selected = YES;
            if (![self.selectedButtons containsObject:btn]) {
                [self.selectedButtons addObject:btn];
                [self.password appendFormat:@"%d",btn.tag];
            }
        }
    }
}
// 添加lockButton
- (void)addLockButtons{
    self.backgroundColor = [UIColor clearColor];
    CGFloat w = (self.frame.size.width-4*Margin)/3;
    CGFloat h = (self.frame.size.height-4*Margin)/3;
    for (int i = 0; i < 9; i++) {
        CGFloat x = i%3*w + (i%3+1)*Margin;
        CGFloat y = i/3*h + (i/3+1)*Margin;
        CGRect frame = CGRectMake(x, y, w, h);
        YKLockButton *lockBtn = [[YKLockButton alloc] initWithFrame:frame];
        lockBtn.tag = i;
        [self addSubview:lockBtn];
    }
    self.currentPoint = CGPointMake(0, 0);
}
#pragma mark - Touches
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self brightButtonWithTouches:touches];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [self brightButtonWithTouches:touches];
    [self setNeedsDisplay];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([self.delegate respondsToSelector:@selector(lockView:withPath:)]) {
        [self.delegate lockView:self withPath:self.password];
    }
    
    [self.selectedButtons makeObjectsPerformSelector:@selector(setSelected:) withObject:NO];
    [self.selectedButtons removeAllObjects];
    self.password = nil;
    [self setNeedsDisplay];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    [self touchesEnded:touches withEvent:event];
}
#pragma mark - DrawRect
- (void)drawRect:(CGRect)rect{
    if (self.selectedButtons.count == 0) return;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context,  2/255.f, 174/255.f, 240/255.f, 0.5f);
    CGContextSetLineWidth(context, 8);
    for (int i = 0; i < self.selectedButtons.count; i++) {
        YKLockButton *btn = self.selectedButtons[i];
        CGPoint center = btn.center;
        if (i == 0) {
            CGContextMoveToPoint(context, center.x, center.y);
        }else{
            CGContextAddLineToPoint(context, center.x, center.y);
        }
    }
    if (!CGPointEqualToPoint(self.currentPoint, CGPointZero)) {
        CGContextAddLineToPoint(context, self.currentPoint.x, self.currentPoint.y);
    }
    CGContextSetLineJoin(context, kCGLineJoinBevel);
    CGContextStrokePath(context);
}
@end
