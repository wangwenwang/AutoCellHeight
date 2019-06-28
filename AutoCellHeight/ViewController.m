

//
//  ViewController.m
//  AutoCellHeight
//
//  Created by wenwang wang on 2019/6/25.
//  Copyright © 2019 wenwang wang. All rights reserved.
//

#import "ViewController.h"
#import "LMTableViewCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "Entity.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *datas;

@end

#define kCellName @"LMTableViewCell"

@implementation ViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.fd_debugLogEnabled = YES;
    
    [self registerCell];
    
    self.datas = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 12; i++) {
        
        Entity *e = [[Entity alloc] init];
        if(i == 2) {
            
            e.PartCode = [NSString stringWithFormat:@"00%d", i];
            e.PartName = [NSString stringWithFormat:@"天虹商场测试测试测试测试测试测试测试测试测试测试测试测试_%d", i];
            e.PartAds = [NSString stringWithFormat:@"深圳市测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试_%d", i];
        }else if(i == 7) {
            
            e.PartCode = [NSString stringWithFormat:@"00%d", i];
            e.PartName = [NSString stringWithFormat:@"0984712309847029874089127409812374098721094721094712302309847029874089127409812374098721094721094712308740874091824098217408971209847012974999"];
            e.PartAds = [NSString stringWithFormat:@"fdjkasfdjfkjasd;klklsdjf;klakdjf;kdklfds"];
        }else {
            
            e.PartCode = [NSString stringWithFormat:@"00%d", i];
            e.PartName = [NSString stringWithFormat:@"天虹商场_%d", i];
            e.PartAds = [NSString stringWithFormat:@"深圳市_%d", i];
        }
        [self.datas addObject:e];
    }
}


#pragma mark - 功能函数

// 注册Cell
- (void)registerCell {
    
    [self.tableView registerNib:[UINib nibWithNibName:kCellName bundle:nil] forCellReuseIdentifier:kCellName];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.datas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LMTableViewCell *cell = (LMTableViewCell *) [tableView dequeueReusableCellWithIdentifier:kCellName];
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}


- (void)configureCell:(LMTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    cell.entity = self.datas[indexPath.row];
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [self.tableView fd_heightForCellWithIdentifier:kCellName configuration:^(LMTableViewCell *cell) {
        
        [self configureCell:cell atIndexPath:indexPath];
    }];
}

@end
