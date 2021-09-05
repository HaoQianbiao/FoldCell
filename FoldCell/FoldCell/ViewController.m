//
//  ViewController.m
//  FoldCell
//
//  Created by haoqianbiao on 2021/9/5.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _nameArray = [[NSMutableArray alloc] initWithObjects:@"1", @"2", @"3", @"4",nil];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(150, 200, 120, 40) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"0"];
    [self.view addSubview:_tableView];
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake(250, 210, 25, 25);
    [_button setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/合上.png"] forState:UIControlStateNormal];
    _selected = NO;
    [_button addTarget:self action:@selector(pressCell) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_selected == 0) {
        return 1;
    } else {
        return 4;
    }
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"0" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithString:_nameArray[indexPath.row]];
    cell.textLabel.font = [UIFont systemFontOfSize:25];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *labelStr = [NSString stringWithString:_nameArray[indexPath.row]];
    [_nameArray insertObject:labelStr atIndex:0];
    [_nameArray removeObjectAtIndex:indexPath.row + 1];
    [_tableView reloadData];
    [self pressCell];
}

-(void) pressCell {
    if (_selected == 0) {
        _selected = 1;
        _tableView.frame = CGRectMake(150, 200, 120, 160);
        [_button setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/zhankai.png"] forState:UIControlStateNormal];
    } else {
        _selected = 0;
        _tableView.frame = CGRectMake(150, 200, 120, 40);
        [_button setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/合上.png"] forState:UIControlStateNormal];
    }
    [_tableView reloadData];
}
@end
