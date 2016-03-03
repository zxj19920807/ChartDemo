//
//  ViewController.m
//  ChartDemo
//
//  Created by 张学军 on 15/11/25.
//  Copyright © 2015年 张学军. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray *titles;

@property(nonatomic,strong)NSMutableArray *classNames;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titles = [NSMutableArray array];
    _classNames = [NSMutableArray array];
    
    [self addcell:@"Mask" andClass:@"MskController"];
    [self addcell:@"chart_1" andClass:@"Chart_OneController"];
    [self addcell:@"chart_2" andClass:@"Chart_TwoController"];
    
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
}

- (void)addcell:(NSString *)title andClass:(NSString *)className {
    [_titles addObject:title];
    [_classNames addObject:className];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_titles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [ tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Class class = NSClassFromString(_classNames[indexPath.row]);
    if (class) {
        UIViewController *vc = class.new;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
