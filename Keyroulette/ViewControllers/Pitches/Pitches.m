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
    
    [self initializeDesign];
    
    [self initializeFunction];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [timer invalidate];
    [self stopNotes:numberOfNotes];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [self stopNotes:numberOfNotes];
}

-(void)initializeFunction {
    
    numberOfNotes = 1;
    numberOfNotesSave = numberOfNotes;
    
    self.numberOfNotesLabel.text = [NSString stringWithFormat:@"%@: %i", @"Number of notes: ", numberOfNotes];
    
    self.audioArray = [[NSMutableArray alloc] initWithObjects: audioPlayer, audioPlayer2, audioPlayer3, audioPlayer4, audioPlayer5, nil];
    
    startTimer = true;
    
    time = self.notesSlider.value + 0.1;
    
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.1 target:self selector:@selector(onTick) userInfo:nil repeats:YES];
    
    [self playNotesReset:numberOfNotes];
    
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
}

-(void)onTick {
    time -= 0.1;
    self.notesTimer.text = [NSString stringWithFormat:@"%.01f", time];
    
    if (time < 0.1) {
        time = self.notesSlider.value;
        [self playNotesReset:numberOfNotes];
        
        [self.answerLabel setTitle:@"ANSWER" forState:UIControlStateNormal];
        
        numberOfNotesSave = numberOfNotes;
        
    }
}

-(void)getRandomNote:(int)times {
    
    [self.noteArray removeAllObjects];
    self.noteArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < times; i ++) {
        
        self.randomNote =[[self.notes randomNotes]
                          stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        //Makes sure notes don't repeat
        while ([self.noteArray containsObject:self.randomNote]) {
            self.randomNote =[[self.notes randomNotes]
                              stringByReplacingOccurrencesOfString:@" " withString:@""];
        }
        
        [self.noteArray addObject:self.randomNote];
        
        NSString *fileName = [NSString stringWithFormat:@"%@.%@", self.randomNote, @"mp3"];
        NSString *path = [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath],fileName];
        NSURL *soundURL = [NSURL fileURLWithPath:path];
        
        self.audioArray[i] = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
        
        ((AVAudioPlayer*)self.audioArray[i]).volume = 1.0;
        
    }
}

-(void)playNotes:(int)times {
    for (int i = 0; i < times; i++) {
        [((AVAudioPlayer*)self.audioArray[i]) play];
    }
}

-(void)playNotesReset:(int)times {
    
    [self getRandomNote: times];
    for (int i = 0; i < times; i++) {
        [((AVAudioPlayer*)self.audioArray[i]) play];
    }
}

-(void)stopNotes:(int)times {
    for (int i = 0; i < times; i++) {
        [((AVAudioPlayer*)self.audioArray[i]) stop];
    }
}

- (IBAction)notesSkip:(id)sender {
    time = self.notesSlider.value;
    
    [self.answerLabel setTitle:@"ANSWER" forState:UIControlStateNormal];

    [self playNotesReset:numberOfNotes];
    
    numberOfNotesSave = numberOfNotes;
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

- (IBAction)notesNumberOfNotesSliderAction:(id)sender {
    numberOfNotes = (int)(self.notesNumberOfNotesSlider.value);
    self.numberOfNotesLabel.text = [NSString stringWithFormat:@"%@: %i", @"Number of notes: ", numberOfNotes];
}

- (IBAction)notesReplayButton:(id)sender {
    
    [self playNotes:numberOfNotesSave];
}

- (IBAction)notesAnswerButton:(id)sender {
    
    NSString *answerString = @"";
    
    for (int i = 0; i < numberOfNotesSave; i ++) {
        answerString = [NSString stringWithFormat:@"%@ %@", answerString, self.noteArray[i]];
    }
    
    [self.answerLabel setTitle:answerString forState:UIControlStateNormal];
}

- (IBAction)notePageIndicator:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

@end
















