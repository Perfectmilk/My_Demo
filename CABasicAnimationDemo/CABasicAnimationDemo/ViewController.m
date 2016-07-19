//
//  ViewController.m
//  CABasicAnimationDemo
//
//  Created by 李广鹏 on 16/7/19.
//  Copyright © 2016年 李广鹏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

static CGFloat const animationDuration = 2;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 50, 50);
    button.center = self.view.center;
    [button setBackgroundImage:[UIImage imageNamed:@"speak"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    
    // 外面的线圈
    CAShapeLayer *circularLayer = [CAShapeLayer layer];
    circularLayer.frame = button.bounds;
    
    UIBezierPath *bezier = [UIBezierPath bezierPathWithOvalInRect:button.bounds];
    circularLayer.fillColor = [UIColor clearColor].CGColor;
    circularLayer.strokeColor = [UIColor redColor].CGColor;
    circularLayer.lineWidth = 2;
    circularLayer.lineCap = kCALineCapRound;
    circularLayer.path = bezier.CGPath;
    [button.layer addSublayer:circularLayer];
    
    // 添加动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    // 2秒
    animation.duration = animationDuration;
    // 重复次数
    animation.repeatCount = 100;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.fromValue = @1;
    animation.toValue = @3;
    [circularLayer addAnimation:animation forKey:@"scale"];
    
    
    // 添加透明度 动画
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = animationDuration;
    opacityAnimation.repeatCount = 100;
    opacityAnimation.fromValue = @1;
    opacityAnimation.toValue = @0;
    [circularLayer addAnimation:opacityAnimation forKey:@"opacity"];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
