# YKLockView
## Description
这几天简单看了下Quartz2D，算是有个初步的了解吧。很有意思，有待进一步深入学习！<br>
结合网上的手势解锁demo，自己动手写了下手势解锁这个demo，加深自己的学习。
## BGView
绘制一个渐变色背景视图。
## LockView
手势的视图载体，在该视图中，添加了9个按钮，以及绘制路径。<br>
提供一个代理方法，以传递解锁路径，如下：
```objective-c
/**
 *  代理方法，通过该方法传递解锁路径
 *
 *  @param lockView 解锁视图
 *  @param path     解锁路径
 */
- (void)lockView:(YKLockView *)lockView withPath:(NSString *)path;
```
## LockViewButton
继承UIView，必要时可自行重绘。<br>
当selected = YES，利用setNeedDisplay进行视图重绘，状态改变<br>
(注意，并非时时重绘，只是在view上做一个重绘的标记，当下次屏幕刷新的时候，才调用drawRect.)
