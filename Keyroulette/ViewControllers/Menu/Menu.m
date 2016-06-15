//
//  Menu.m
//  Keyroulette
//
//  Created by Scott Cho on 6/14/16.
//  Copyright © 2016 Scott Cho. All rights reserved.
//

#import "Menu.h"
#import "MenuCell.h"
#import "MFSideMenu.h"
#import "PracticeType.h"

@interface Menu ()

@end

@implementation Menu

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    rowNum = 5;
    PracticeType *practiceType = [[PracticeType alloc] initWithIndex:0];
    self.view.backgroundColor = practiceType.practiceColor;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return rowNum;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    float height = [[UIScreen mainScreen] bounds].size.height;
    CGSize statusBarSize = [[UIApplication sharedApplication] statusBarFrame].size;
    CGFloat statusBarHeight = MIN(statusBarSize.width, statusBarSize.height);
    
    return (height-statusBarHeight)/rowNum;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuCell *menuCell = [tableView dequeueReusableCellWithIdentifier:@"MenuCell"];
    if (menuCell == nil) {
        menuCell = [[MenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MenuCell"];
    }
    
    PracticeType *practiceType = [[PracticeType alloc] initWithIndex:indexPath.row];
    
    
    menuCell.cellText.text = practiceType.practiceTitle;
    menuCell.backgroundColor = practiceType.practiceColor;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    menuCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return menuCell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *viewControllerTypes= @[@"Notes", @"Intervals", @"Chords", @"Modes", @"Scales"];
    
    UIStoryboard *storyboardInit = [UIStoryboard storyboardWithName:viewControllerTypes[indexPath.row] bundle:[NSBundle mainBundle]];
    UIViewController *vcInit = [storyboardInit instantiateViewControllerWithIdentifier:viewControllerTypes[indexPath.row]];
    
    [self.menuContainerViewController setCenterViewController:vcInit];
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed completion:^{}];
    vcInit = nil;
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
