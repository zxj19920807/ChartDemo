//
//  Chart_TwoView.m
//  ChartDemo
//
//  Created by 张学军 on 15/11/26.
//  Copyright © 2015年 张学军. All rights reserved.
//

#import "Chart_TwoView.h"



@implementation Chart_TwoView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor cyanColor];
    
        [self drawPassLine];
    }
    return self;
}

- (void)drawPassLine {
//画及格线
    UIBezierPath *passLinePath = [UIBezierPath bezierPath];
    [passLinePath moveToPoint:CGPointMake(0, self.frame.size.height*.4)];
    [passLinePath addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height*.4)];
    CAShapeLayer *passLine = [CAShapeLayer layer];
    passLine.path = passLinePath.CGPath;
    passLine.lineWidth = 2;
    passLine.strokeColor = [UIColor whiteColor].CGColor;
    passLine.fillColor = [UIColor whiteColor].CGColor;
    [self.layer addSublayer:passLine];
    
}

- (void)setPoints:(NSArray *)points {
    if (_points != points) {
        _points = points;
    }
    
    //渐变色方块
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,
                             (__bridge id)[UIColor whiteColor].CGColor];
    gradientLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self.layer addSublayer:gradientLayer];
                             
    //不规则路线（生成渐变）
    UIBezierPath *backColorPath = [UIBezierPath bezierPath];
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    for (int i = 0; i < _points.count; i++) {
        
        //背景渐变色区域
        CGPoint point = [_points[i] CGPointValue];
        if (i == 0) {
            [backColorPath moveToPoint:CGPointMake(0, self.frame.size.height)];
            [backColorPath addLineToPoint:CGPointMake(point.x, self.frame.size.height - point.y)];
        }
        [backColorPath addLineToPoint:CGPointMake(point.x, self.frame.size.height - point.y)];
        if (i == [_points count] - 1) {
            [backColorPath addLineToPoint:CGPointMake(point.x, self.frame.size.height)];
            [backColorPath closePath];
        }
        
        //折线
        if (i == 0) {
            [linePath moveToPoint:CGPointMake(point.x, self.frame.size.height - point.y)];
        }
        [linePath addLineToPoint:CGPointMake(point.x, self.frame.size.height - point.y)];
        
        
        //点
        UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(point.x, self.frame.size.height - point.y) radius:5 startAngle:0 endAngle:M_PI*2 clockwise:YES];
        CAShapeLayer *circleLayer = [CAShapeLayer layer];
        circleLayer.fillColor = [UIColor clearColor].CGColor;
        
        if (point.y >= self.frame.size.height*.6) {
            circleLayer.strokeColor = [UIColor blueColor].CGColor;
        } else {
            circleLayer.strokeColor = [UIColor redColor].CGColor;
        }
        circleLayer.lineWidth = 2;
        circleLayer.path = circlePath.CGPath;
        [self.layer addSublayer:circleLayer];
        
    }
    
    //背景渐变色
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.fillColor = [UIColor whiteColor].CGColor;
    shapeLayer.strokeColor = [UIColor clearColor].CGColor;

    shapeLayer.path = backColorPath.CGPath;
    [self.layer addSublayer:shapeLayer];
    gradientLayer.mask = shapeLayer;
    
    
    //棕色折线
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    lineLayer.strokeColor = [UIColor brownColor].CGColor;
    lineLayer.lineWidth = 2;
    lineLayer.path = linePath.CGPath;
    [self.layer addSublayer:lineLayer];
    
}

@end
