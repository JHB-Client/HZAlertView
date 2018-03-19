//
//  HZActionIamgeCell.h
//  HZAlertView
//
//  Created by 季怀斌 on 2018/3/16.
//  Copyright © 2018年 huazhuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HZActionIamgeCellDelegate<NSObject>
- (void)actionIamgeBtnClick:(NSInteger)actionIamgeBtnIndex;
@end

@interface HZActionIamgeCell : UITableViewCell
@property (nonatomic, assign) CGFloat cellHieght;
@property (nonatomic, strong) NSArray *actionImageArr;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
//
@property (nonatomic, weak) id<HZActionIamgeCellDelegate>delegate;
@end
