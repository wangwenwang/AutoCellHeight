//
//  LMTableViewCell.m
//  AutoCellHeight
//
//  Created by wenwang wang on 2019/6/25.
//  Copyright © 2019 wenwang wang. All rights reserved.
//

#import "LMTableViewCell.h"

@implementation LMTableViewCell


- (void)setEntity:(Entity *)entity {
    
    self.partCoceLabel.text = entity.PartCode;
    self.partNameLabel.text = entity.PartName;
    self.partAdsLabel.text = entity.PartAds;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.contentView.bounds = [UIScreen mainScreen].bounds;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// If you are not using auto layout, override this method, enable it by setting
// "fd_enforceFrameLayout" to YES.
- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat totalHeight = 0;
    
//    totalHeight += [self.partCoceLabel sizeThatFits:size].height;
//    totalHeight += [self.partNameLabel sizeThatFits:size].height;
//    totalHeight += [self.partAdsLabel sizeThatFits:size].height;
    
    NSLog(@"partCoceLabel:%f,  width:%f", [self.partCoceLabel sizeThatFits:size].height, size.width);
    NSLog(@"partNameLabel:%f,  width:%f", [self.partNameLabel sizeThatFits:size].height, size.width);
    NSLog(@"dateLabel:%f,  width:%f", [self.partAdsLabel sizeThatFits:size].height, size.width);
    
    
    NSLog(@"partCoceLabelS:%f", [self getHeightOfString:self.partCoceLabel.text fontSize:15 andWidth:self.frame.size.width - (12 + 69.5 + 8)]);
    NSLog(@"partNameLabelS:%f", [self getHeightOfString:self.partNameLabel.text fontSize:15 andWidth:self.frame.size.width - (12 + 69.5 + 8)]);
    NSLog(@"dateLabelS:%f", [self getHeightOfString:self.partAdsLabel.text fontSize:15 andWidth:self.frame.size.width - (12 + 69.5 + 8)]);
    
    
    totalHeight += [self getHeightOfString:self.partCoceLabel.text fontSize:15 andWidth:self.frame.size.width - (12 + 69.5 + 8)];
    totalHeight += [self getHeightOfString:self.partNameLabel.text fontSize:15 andWidth:self.frame.size.width - (12 + 69.5 + 8)];
    totalHeight += [self getHeightOfString:self.partAdsLabel.text fontSize:15 andWidth:self.frame.size.width - (12 + 69.5 + 8)];
    
    totalHeight += 40; // margins
    return CGSizeMake(size.width, totalHeight);
}

- (CGFloat)getHeightOfString:(nullable NSString *)text fontSize:(CGFloat)fontSize andWidth:(CGFloat)width {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByCharWrapping;
    CGSize sizeToFit = [label sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return sizeToFit.height;
}

@end
