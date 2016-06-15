//
//  Notes.m
//  Keyroulette
//
//  Created by Scott Cho on 6/14/16.
//  Copyright © 2016 Scott Cho. All rights reserved.
//

#import "Notes.h"
#import "PracticeType.h"

@interface Notes ()

@end

@implementation Notes

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    PracticeType *notes = [[PracticeType alloc] initWithIndex:0];
    
    self.view.backgroundColor = notes.practiceColor;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
