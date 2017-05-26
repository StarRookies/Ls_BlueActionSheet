//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UIView (Common)

/**
 *	@brief	获取左上角横坐标
 *
 *	@return	坐标值
 */
- (CGFloat)viewLeft;

/**
 *	@brief	获取左上角纵坐标
 *
 *	@return	坐标值
 */
- (CGFloat)viewTop;

/**
 *	@brief	获取视图右下角横坐标
 *
 *	@return	坐标值
 */
- (CGFloat)viewRight;

/**
 *	@brief	获取视图右下角纵坐标
 *
 *	@return	坐标值
 */

- (CGFloat)viewBottom;

/**
 *	@brief	获取视图宽度
 *
 *	@return	宽度值（像素）
 */
- (CGFloat)viewWidth;

/**
 *	@brief	获取视图高度
 *
 *	@return	高度值（像素）
 */
- (CGFloat)viewHeight;

/**
 *	@brief	删除所有子对象
 */
- (void)removeAllSubviews;

/**
 *	@brief	取得下个相同元素Frame
 *   blank  间距 （像素）
 *
 *	@return	Frame（像素）
 */
-(CGRect)nextViewFrame:(CGFloat)blank;

@property (nonatomic, assign) CGFloat yv;


@end
