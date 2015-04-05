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
- (void)lockView:(YKLockView *)lockView withPath:(NSString *)path;
@end


@interface YKLockView : UIView
@property (nonatomic, weak) id<YKLockViewDelegate> delegate;
@end
