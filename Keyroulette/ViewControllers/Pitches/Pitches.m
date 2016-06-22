//
//  Pitches.m
//  Keyroulette
//
//  Created by Scott Cho on 6/22/16.
//  Copyright © 2016 Scott Cho. All rights reserved.
//

#import "Pitches.h"
#import "PracticeType.h"
#import "MFSideMenu.h"
#import <AVFoundation/AVFoundation.h>


@interface Pitches ()

@end

@implementation Pitches

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initializeDesign];
    
    [self initializeFunction];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [timer invalidate];
    if(audioPlayer || audioPlayer.isPlaying) {
        [audioPlayer stop];
        audioPlayer = Nil;
    }
}


-(void)initializeFunction {
    startTimer = true;
    
    time = self.notesSlider.value + 0.1;
    
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.1 target:self selector:@selector(onTick) userInfo:nil repeats:YES];
    
    audioPlayer = Nil;
    [self getRandomNote];
    [audioPlayer play];
    
}

-(void)initializeDesign {
    
    self.notes = [[PracticeType alloc] initWithIndex:5];
    
    //Background
    self.view.backgroundColor = self.notes.practiceColor;
    
    //Up Label
    [self.notePageIndicatorText setTitle: self.notes.practiceTitle forState: UIControlStateNormal];
    
    //Label
    
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
    
    
    //Make Labels round
    self.notesReplayUIView.backgroundColor = [UIColor clearColor];
    self.notesReplayUIView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.notesReplayUIView.layer.borderWidth = 2.0f;
    self.notesReplayUIView.layer.cornerRadius = self.notesReplayUIView.bounds.size.width/2;
    self.notesReplayUIView.layer.masksToBounds = YES;
    self.notesAnswerUIView.backgroundColor = [UIColor clearColor];
    self.notesAnswerUIView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.notesAnswerUIView.layer.borderWidth = 2.0f;
    self.notesAnswerUIView.layer.cornerRadius = self.notesReplayUIView.bounds.size.width/2;
    self.notesAnswerUIView.layer.masksToBounds = YES;
}

-(void)onTick {
    time -= 0.1;
    self.notesTimer.text = [NSString stringWithFormat:@"%.01f", time];
    
    if (time < 0.1) {
        time = self.notesSlider.value;
        [self getRandomNote];
        [audioPlayer play];
        
        [self.answerLabel setTitle:@"ANSWER" forState:UIControlStateNormal];
        
    }
}

-(void)getRandomNote {
    
    [audioPlayer stop];
    audioPlayer = Nil;
    
    self.randomNote =[[self.notes randomNotes]
                           stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *fileName = [NSString stringWithFormat:@"%@.%@", self.randomNote, @"mp3"];
    NSString *path = [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath],fileName];
    NSURL *soundURL = [NSURL fileURLWithPath:path];

    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
    audioPlayer.volume = 1.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)notesSkip:(id)sender {
    time = self.notesSlider.value;
    
    [self.answerLabel setTitle:@"ANSWER" forState:UIControlStateNormal];

    audioPlayer = Nil;
    [self getRandomNote];
    [audioPlayer play];
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

- (IBAction)notesReplayButton:(id)sender {
    
    [audioPlayer stop];
    [audioPlayer play];
}

- (IBAction)notesAnswerButton:(id)sender {
    [self.answerLabel setTitle:self.randomNote forState:UIControlStateNormal];
}

- (IBAction)notePageIndicator:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}



@end
