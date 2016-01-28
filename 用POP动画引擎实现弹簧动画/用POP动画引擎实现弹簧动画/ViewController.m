//
//  ViewController.m
//  用POP动画引擎实现弹簧动画
//
//  Created by RinpeChen on 16/1/28.
//  Copyright © 2016年 miaoqu. All rights reserved.
//

#import "ViewController.h"
#import <POP.h>

@interface ViewController ()

@property (nonatomic, weak) UIView *testView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    // 初始化测试控件
    UIView *testView         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    testView.center          = self.view.center;
    testView.backgroundColor = [UIColor redColor];
    self.testView            = testView;
    [self.view addSubview:testView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 初始化弹簧动画
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    springAnimation.springSpeed         = 0;                    // 设置动画速度(常用)
    springAnimation.springBounciness    = 20;                   // 设置弹性大小(常用)
    // springAnimation.dynamicsFriction    = 10;                // 设置阻止弹性的阻力(选用)
    // springAnimation.dynamicsTension     = 100;               // 设置弹性的张力(可以理解为每次变大的程度, 选用)
    if (self.testView.frame.size.width == 100) {
        springAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 50, 50)];
    } else {
        springAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 100, 100)];
    }
    
    // 添加动画
    [self.testView.layer pop_addAnimation:springAnimation forKey:nil];
}

@end
