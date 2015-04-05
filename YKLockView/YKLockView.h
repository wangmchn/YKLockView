//
//  YKLockView.h
//  YKLockView
//
//  Created by Mark on 15/4/4.
//  Copyright (c) 2015年 yq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YKLockButton.h"
@class YKLockView;

@protocol YKLockViewDelegate <NSObject>
/**
 *  代理方法，通过该方法传递解锁路径
 *
 *  @param lockView 解锁视图
 *  @param path     解锁路径
 */
- (void)lockView:(YKLockView *)lockView withPath:(NSString *)path;
@end


@interface YKLockView : UIView
@property (nonatomic, weak) id<YKLockViewDelegate> delegate;
@end
