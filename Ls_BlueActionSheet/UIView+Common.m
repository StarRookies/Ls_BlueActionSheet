//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "UIView+Common.h"

@implementation UIView (Common)

- (CGFloat)viewLeft
{
    return self.frame.origin.x;
}

- (CGFloat)viewTop
{
    return self.frame.origin.y;
}

- (CGFloat)viewRight
{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)viewBottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)viewWidth
{
    return self.frame.size.width;
}

- (CGFloat)viewHeight
{
    return self.frame.size.height;
}

- (void)setYv:(CGFloat)yv
{
    CGRect frame = self.frame;
    frame.origin.y = yv;
    self.frame = frame;
}

- (CGFloat)yv
{
    return self.frame.origin.y;
}


-(CGRect)nextViewFrame:(CGFloat)blank{
    return CGRectMake(self.viewLeft, self.viewBottom+blank, self.viewWidth, self.viewHeight);
}


- (void)removeAllSubviews
{
	while (self.subviews.count) 
    {
		UIView *child = self.subviews.lastObject;
		[child removeFromSuperview];
	}
}

@end
