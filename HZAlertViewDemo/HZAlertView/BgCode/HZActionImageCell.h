//
//  HZActionImageCell.h
//  HZAlertViewDemo
//
//  Created by 季怀斌 on 2018/3/19.
//  Copyright © 2018年 huazhuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HZActionImageCellDelegate<NSObject>
- (void)actionImageBtnClick:(NSInteger)actionImageBtnIndex;
@end

@interface HZActionImageCell : UITableViewCell
@property (nonatomic, assign) CGFloat cellHieght;
@property (nonatomic, strong) NSArray *actionImageArr;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
//
@property (nonatomic, weak) id<HZActionImageCellDelegate>delegate;
@end
