//
//  BlueActionSheet.m
//  Ls_BlueActionSheet
//
//  Created by syh on 17/5/26.
//  Copyright © 2017年 liushuai. All rights reserved.
//

#import "BlueActionSheet.h"
#import "UIView+Common.h"

//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)

// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
#define MainColor RGB(0, 170, 240)
#define WhiteColor RGB(255, 255, 255)
//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define GetViewSize_Width(a) ((a)*SCREEN_WIDTH/750)
#define GetViewSize_Height(a) ((a)*SCREEN_HEIGHT/1334)

@interface BlueActionSheet ()
@property (nonatomic, strong)UIView *grayBgView;//灰底
@property (nonatomic, strong)UILabel *actionSheetTitleLabel;
/** 最下面的取消按钮 */
@property (nonatomic, strong)UIButton *cancleBtn;

@end

@implementation BlueActionSheet{
    UIView *bgView;//弹窗
    
}

- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title AndItemTitles:(NSArray *)titles {
    self = [super initWithFrame:frame];
    if (self) {
        [self createSexAlertFrame:frame andTitle:title AndItemTitles:titles];
    }
    return self;
}

- (UIView *)grayBgView {
    if (_grayBgView == nil) {
        _grayBgView = [[UIView alloc] init];
        _grayBgView.backgroundColor = [UIColor whiteColor];
    }
    return _grayBgView;
}

- (UILabel *)actionSheetTitleLabel{
    if (_actionSheetTitleLabel == nil) {
        _actionSheetTitleLabel = [[UILabel alloc] init];
        _actionSheetTitleLabel.backgroundColor = MainColor;
        _actionSheetTitleLabel.textColor = WhiteColor;
        _actionSheetTitleLabel.font = [UIFont systemFontOfSize:14.0f];
        _actionSheetTitleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _actionSheetTitleLabel;
}

- (UIButton *)cancleBtn {
    if (_cancleBtn == nil) {
        _cancleBtn = [[UIButton alloc] init];
        [_cancleBtn setTitle:NSLocalizedString(@"取消", @"") forState:UIControlStateNormal];
        [_cancleBtn setTitleColor:MainColor forState:UIControlStateNormal];
        [_cancleBtn setTitleColor:WhiteColor forState:UIControlStateHighlighted];
        [_cancleBtn setBackgroundImage:[self imageWithColor:MainColor] forState:UIControlStateHighlighted];
        [_cancleBtn.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        _cancleBtn.layer.borderColor = [MainColor CGColor];
        _cancleBtn.layer.borderWidth = GetViewSize_Width(1);
        [_cancleBtn addTarget:self action:@selector(closeView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancleBtn;
}



#pragma mark - create称呼弹窗视图
- (void)createSexAlertFrame:(CGRect)frame andTitle:(NSString *)title AndItemTitles:(NSArray *)titles {
    UIWindow * keyWindow = [UIApplication sharedApplication].keyWindow;
    // 设置自己的frame为全屏
    self.frame = keyWindow.bounds;
    [keyWindow addSubview:self];
    
    // 透明度变化从0 -- 0.4:初始状态是隐藏的
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    self.grayBgView.frame = CGRectMake(0, self.viewHeight, self.viewWidth, GetViewSize_Height(200) + [titles count] * GetViewSize_Height(141));
    [self addSubview:self.grayBgView];
    
    /**
     标题
     */
    self.actionSheetTitleLabel.frame = CGRectMake(0, 0, self.grayBgView.viewWidth, GetViewSize_Height(80));
    [self.grayBgView addSubview:self.actionSheetTitleLabel];
    _actionSheetTitleLabel.text = title;
    /**
     选项
     */
    for (NSInteger idx = 0; idx != [titles count]; ++idx) {
        UIButton *button = [[UIButton  alloc] initWithFrame:CGRectMake(GetViewSize_Width(60), _actionSheetTitleLabel.viewBottom + GetViewSize_Height(20) + idx*(GetViewSize_Height(141)), self.grayBgView.viewWidth - GetViewSize_Width(120), GetViewSize_Height(100))];
        [self.grayBgView addSubview:button];
        button.selected = NO;
        button.tag = idx + 10;
        [button setTitle:titles[idx] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
        [button setTitleColor:RGB(154, 154, 154) forState:UIControlStateNormal];
        [button setTitleColor:MainColor forState:UIControlStateSelected];
        [button addTarget:self action:@selector(selectedAction:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *lineLab = [[UILabel alloc] initWithFrame:CGRectMake(button.viewLeft, button.viewBottom + GetViewSize_Height(20), button.viewWidth, GetViewSize_Height(1))];
        lineLab.backgroundColor = RGB(230, 230, 230);
        if ( idx != [titles count]-1) {
            [self.grayBgView addSubview:lineLab];
        } else {
            /**
             取消
             */
            self.cancleBtn.frame = CGRectMake((self.grayBgView.viewWidth - GetViewSize_Width(300))/2, button.viewBottom + GetViewSize_Height(20), GetViewSize_Width(300), GetViewSize_Height(60));
            [self.grayBgView addSubview:self.cancleBtn];
        }
    }
    
    //如果没有数据
    if (kArrayIsEmpty(titles)) {
        self.grayBgView.frame = CGRectMake(0, self.viewHeight, self.viewWidth, GetViewSize_Height(200) + GetViewSize_Height(141));
        
        self.cancleBtn.frame = CGRectMake((self.grayBgView.viewWidth - GetViewSize_Width(300))/2, self.actionSheetTitleLabel.viewBottom + GetViewSize_Height(80), GetViewSize_Width(300), GetViewSize_Height(60));
        [self.grayBgView addSubview:self.cancleBtn];
    }
}

- (void)selectedAction:(UIButton *)btn
{
    if (btn.selected == YES) {
        btn.selected = NO;
    } else {
        btn.selected = YES;
    }
    if([_delegate respondsToSelector:@selector(sheet:clickedButtonAtIndex:)]) {
        [_delegate sheet:self clickedButtonAtIndex:btn.tag];
        [self closeView];
    }
    
    if ([_delegate respondsToSelector:@selector(clickedButton:)]) {
        [_delegate clickedButton:btn];
        [self closeView];
    }
}

- (void)show
{
    [UIView animateWithDuration:0.33 animations:^{
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        self.grayBgView.yv = self.viewHeight - self.grayBgView.viewHeight;
    }];
}

- (void)closeView
{
    [UIView animateWithDuration:0.33 animations:^{
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        self.grayBgView.yv = self.viewHeight;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)setCancelTitle:(NSString *)cancelTitle{
    [self.cancleBtn setTitle:cancelTitle forState:UIControlStateNormal];
}

//  颜色转换为背景图片
- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


@end
