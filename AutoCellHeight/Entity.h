//
//  Entity.h
//  AutoCellHeight
//
//  Created by wenwang wang on 2019/6/27.
//  Copyright © 2019 wenwang wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Entity : NSObject

// 客户代码
@property (strong, nonatomic) NSString *PartCode;

// 客户名称
@property (strong, nonatomic) NSString *PartName;

// 客户地址
@property (strong, nonatomic) NSString *PartAds;

@end

NS_ASSUME_NONNULL_END
