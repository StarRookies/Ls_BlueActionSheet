//
//  ViewController.m
//  Ls_BlueActionSheet
//
//  Created by syh on 17/5/26.
//  Copyright © 2017年 liushuai. All rights reserved.
//

#import "ViewController.h"
#import "BlueActionSheet.h"
//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()<BlueActionSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:button];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)buttonAction:(UIButton *)sender {
    BlueActionSheet *sheet = [[BlueActionSheet alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) andTitle:@"上传照片" AndItemTitles:@[@"拍照",@"从相册中选择"]];
    sheet.delegate = self;
    [sheet show];
}

#pragma mark - AirCncActionSheetDelegate
- (void)sheet:(BlueActionSheet *)sheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"点击了%ld",buttonIndex);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
