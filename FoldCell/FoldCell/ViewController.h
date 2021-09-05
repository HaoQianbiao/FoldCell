//
//  ViewController.h
//  FoldCell
//
//  Created by haoqianbiao on 2021/9/5.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSMutableArray* nameArray;
@property (nonatomic, strong) UIButton* button;
@property BOOL selected;
@end

