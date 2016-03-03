//
//  Chart_OneController.m
//  ChartDemo
//
//  Created by 张学军 on 15/11/25.
//  Copyright © 2015年 张学军. All rights reserved.
//

#import "Chart_OneController.h"
#import "Chart_OneView.h"

@interface Chart_OneController ()

@property(nonatomic,strong)Chart_OneView *oneView;

@end

@implementation Chart_OneController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:78/255.0 green:194/255.0 blue:178/255.0 alpha:1];
    
    _oneView = [[Chart_OneView alloc] initWithFrame:CGRectMake(20, 200, self.view.frame.size.width - 40, 200)];
    _oneView.points = @[[NSValue valueWithCGPoint:CGPointMake
                         (0, 30)],
                        [NSValue valueWithCGPoint:CGPointMake(20, 60)],
                        [NSValue valueWithCGPoint:CGPointMake(40, 20)],
                        [NSValue valueWithCGPoint:CGPointMake(60, 40)]];
    [self.view addSubview:_oneView];
    
}



@end
