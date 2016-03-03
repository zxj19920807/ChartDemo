//
//  Chart_TwoController.m
//  ChartDemo
//
//  Created by 张学军 on 15/11/26.
//  Copyright © 2015年 张学军. All rights reserved.
//

#import "Chart_TwoController.h"
#import "Chart_TwoView.h"

@interface Chart_TwoController ()

@end

@implementation Chart_TwoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    Chart_TwoView *chart = [[Chart_TwoView alloc] initWithFrame:CGRectMake(30, 100, self.view.frame.size.width - 60, 150)];
    chart.points = @[[NSValue valueWithCGPoint:CGPointMake(0, 50)],
                     [NSValue valueWithCGPoint:CGPointMake(30, 20)],
                     [NSValue valueWithCGPoint:CGPointMake(60, 120)],
                     [NSValue valueWithCGPoint:CGPointMake(90, 40)],
                     [NSValue valueWithCGPoint:CGPointMake(120, 90)],
                     [NSValue valueWithCGPoint:CGPointMake(150, 30)],
                     [NSValue valueWithCGPoint:CGPointMake(180, 120)],
                     [NSValue valueWithCGPoint:CGPointMake(210, 50)],
                     [NSValue valueWithCGPoint:CGPointMake(260, 20)]];
    [self.view addSubview:chart];
    
    
    
 
}



@end
