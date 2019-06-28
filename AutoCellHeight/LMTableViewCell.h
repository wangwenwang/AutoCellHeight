//
//  LMTableViewCell.h
//  AutoCellHeight
//
//  Created by wenwang wang on 2019/6/25.
//  Copyright © 2019 wenwang wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entity.h"

NS_ASSUME_NONNULL_BEGIN

@interface LMTableViewCell : UITableViewCell

// 客户代码
@property (weak, nonatomic) IBOutlet UILabel *partCoceLabel;

// 客户名称
@property (weak, nonatomic) IBOutlet UILabel *partNameLabel;

// 客户地址
@property (weak, nonatomic) IBOutlet UILabel *partAdsLabel;


@property (strong, nonatomic) Entity *entity;

@end

NS_ASSUME_NONNULL_END
