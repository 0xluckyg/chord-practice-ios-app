//
//  Modes.m
//  Keyroulette
//
//  Created by Scott Cho on 6/15/16.
//  Copyright © 2016 Scott Cho. All rights reserved.
//

#import "Modes.h"
#import "PracticeType.h"
#import "MFSideMenu.h"

@interface Modes ()

@end

@implementation Modes

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initializeDesign];
    
    [self initializeFunction];
    
}


-(void)initializeFunction {
    startTimer = true;
    
    time = self.notesSlider.value + 0.1;
    
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.1 target:self selector:@selector(onTick) userInfo:nil repeats:YES];
    
}

-(void)onTick {
    time -= 0.1;
    self.notesTimer.text = [NSString stringWithFormat:@"%.01f", time];
    
    if (time < 0.1) {
        time = self.notesSlider.value;
        self.noteMainLabel.text = [self.notes randomNotes];
    }
}

-(void)initializeDesign {
    
    self.notes = [[PracticeType alloc] initWithIndex:3];
    
    //Background
    self.view.backgroundColor = self.notes.practiceColor;
    
    //Up Label
    [self.notePageIndicatorText setTitle: self.notes.practiceTitle forState: UIControlStateNormal];
    
    //Label
    self.noteMainLabel.text = [self.notes randomNotes];
    
    //Bottom buttons and labels
    self.notesSpeedIndicate.backgroundColor = self.notes.practiceColor;
    self.notesSpeedIndicate.textColor = [UIColor whiteColor];
    self.notesSpeedIndicate.text = [NSString stringWithFormat:@"%.00f", self.notesSlider.value];
    
    self.notesTimer.backgroundColor = self.notes.practiceColor;
    self.notesTimer.textColor = [UIColor whiteColor];
    
    self.notesSkipLabel.backgroundColor = self.notes.practiceColor;
    self.notesSkipLabel.tintColor = [UIColor whiteColor];
    
    self.notesPausePlayLabel.backgroundColor = self.notes.practiceColor;
    self.notesPausePlayLabel.tintColor = [UIColor whiteColor];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)notesSkip:(id)sender {
    time = self.notesSlider.value;
    self.noteMainLabel.text = [self.notes randomNotes];
}

- (IBAction)notesPausePlay:(id)sender {
    if (startTimer == true) {
        [timer invalidate];
        timer = nil;
        startTimer = false;
        [self.notesPausePlayLabel setTitle:@"START" forState:UIControlStateNormal];
    } else if (startTimer == false){
        timer = [NSTimer scheduledTimerWithTimeInterval: 0.1 target:self selector:@selector(onTick) userInfo:nil repeats:YES];
        startTimer = true;
        [self.notesPausePlayLabel setTitle:@"STOP" forState:UIControlStateNormal];
    }
}

- (IBAction)notesSliderAction:(id)sender {
    self.notesSpeedIndicate.text =  [NSString stringWithFormat:@"%.00f", self.notesSlider.value];
}

- (IBAction)notePageIndicator:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}



@end
