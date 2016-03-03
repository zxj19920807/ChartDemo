//
//  Chart_OneView.m
//  ChartDemo
//
//  Created by 张学军 on 15/11/25.
//  Copyright © 2015年 张学军. All rights reserved.
//

#import "Chart_OneView.h"

@interface Chart_OneView()

@property(nonatomic,strong)CAShapeLayer *chartLayer;

@end

@implementation Chart_OneView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _chartLayer = [CAShapeLayer layer];
        _chartLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height/2);
        _chartLayer.strokeColor = [UIColor whiteColor].CGColor;
        _chartLayer.fillColor = [UIColor clearColor].CGColor;
        _chartLayer.lineWidth = 2;
        [self.layer addSublayer:_chartLayer];
    }
    return self;
}

- (void)setPoints:(NSArray *)points {
    if (_points != points) {
        _points = points;
    }
 


    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint pointOne = [_points[0] CGPointValue];
    [path moveToPoint:CGPointMake(pointOne.x, self.frame.size.height - pointOne.y)];
    for (int i = 0 ; i < [_points count]; i++) {
        CGPoint pointTwo = [_points[i] CGPointValue];
        [path addLineToPoint:CGPointMake(pointTwo.x , self.frame.size.height - pointTwo.y)];
    }
    _chartLayer.path = path.CGPath;
    
    
    for (int i = 1 ; i < [_points count]; i++) {
        CGPoint point_point = [_points[i] CGPointValue];
        CAShapeLayer *pointLayer = [CAShapeLayer layer];

        UIBezierPath *pointPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(point_point.x, self.frame.size.height-point_point.y) radius:5 startAngle:0 endAngle:M_PI*2 clockwise:YES];
        
        pointLayer.strokeColor = [UIColor whiteColor].CGColor;
        pointLayer.fillColor = [UIColor redColor].CGColor;
        pointLayer.lineWidth = 1;
        pointLayer.path = pointPath.CGPath;
        [self.layer addSublayer:pointLayer];
    }
    
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, self.frame.size.height*2/3, self.frame.size.width, self.frame.size.height/3);
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,
                             (__bridge id)[UIColor colorWithWhite:1 alpha:0.3].CGColor];
    [self.layer addSublayer:gradientLayer];
    
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    
    maskLayer.fillColor = [UIColor whiteColor].CGColor;
    maskLayer.lineWidth = 1;
    maskLayer.strokeColor = [UIColor whiteColor].CGColor;
    
    
    UIBezierPath * maskPath = [[UIBezierPath alloc]init];
    for(int i=0;i<_points.count;i++){
        CGPoint point = [_points[i] CGPointValue];
        if(i==0){
            [maskPath moveToPoint:CGPointMake( point.x , self.frame.size.height )];
            [maskPath  addLineToPoint:CGPointMake( point.x, self.frame.size.height  - point.y )];
        }
        else{
            [maskPath addLineToPoint:CGPointMake(  point.x , self.frame.size.height  - point.y )];
        }
        if(i == _points.count - 1){
            [maskPath addLineToPoint:CGPointMake(  point.x , self.frame.size.height)];
            [maskPath closePath];
        }
    }
    maskLayer.path = maskPath.CGPath;
    
    [gradientLayer addSublayer:maskLayer];
//    gradientLayer.mask = maskLayer;
 

    
}
@end
