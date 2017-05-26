//
//  BlueActionSheet.h
//  Ls_BlueActionSheet
//
//  Created by syh on 17/5/26.
//  Copyright © 2017年 liushuai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BlueActionSheet;
@protocol BlueActionSheetDelegate <NSObject>
@optional
/**
 * 点击各个选项所触发的代理方法
 */
- (void)sheet:(BlueActionSheet *)sheet clickedButtonAtIndex:(NSInteger)buttonIndex;
- (void)clickedButton:(UIButton *)sender;

@end
@interface BlueActionSheet : UIView

@property (nonatomic, weak) id<BlueActionSheetDelegate> delegate;

/**
 * init
 */
- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title AndItemTitles:(NSArray *)titles;

- (void)show;

/** 最下面的那个按钮的文字,默认为"取消" */
@property (nonatomic, copy) NSString *cancelTitle;

@end
