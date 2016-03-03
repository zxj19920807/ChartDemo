//
//  MskController.m
//  ChartDemo
//
//  Created by 张学军 on 15/11/26.
//  Copyright © 2015年 张学军. All rights reserved.
//

#import "MskController.h"

@interface MskController ()

@end

@implementation MskController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self draw];
}

- (void)draw {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(100, 100, 200, 200);
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,
                             (__bridge id)[UIColor yellowColor].CGColor];
    [self.view.layer addSublayer:gradientLayer];
    
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor clearColor].CGColor;
    shapeLayer.fillColor = [UIColor whiteColor].CGColor;
    shapeLayer.lineWidth = 2;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 100)];
    [path addLineToPoint:CGPointMake(0, 200)];
    [path addLineToPoint:CGPointMake(180, 200)];
    [path addLineToPoint:CGPointMake(50, 100)];
    [path closePath];
    shapeLayer.path = path.CGPath;
    
    
    [self.view.layer addSublayer:shapeLayer];
    
    gradientLayer.mask = shapeLayer;
    
    
    
    
    
    
    
    
    
//    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200,500) radius:4 startAngle:0 endAngle:M_PI*2 clockwise:YES];
//    
//    CAShapeLayer *circleLayer = [CAShapeLayer layer];
//    circleLayer.fillColor = [UIColor greenColor].CGColor;
//    circleLayer.strokeColor = [UIColor redColor].CGColor;
//    circleLayer.lineWidth = 1;
//    circleLayer.path = circlePath.CGPath;
//    [self.view.layer addSublayer:circleLayer];
//}

}



@end
