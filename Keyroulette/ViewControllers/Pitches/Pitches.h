//
//  Pitches.h
//  Keyroulette
//
//  Created by Scott Cho on 6/22/16.
//  Copyright © 2016 Scott Cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PracticeType.h"
#import <AVFoundation/AVFoundation.h>

@interface Pitches : UIViewController {

int numberOfNotesSave;
int numberOfNotes;
    
NSTimer * timer;
CGFloat time;
bool startTimer;
AVAudioPlayer *audioPlayer;
AVAudioPlayer *audioPlayer2;
AVAudioPlayer *audioPlayer3;
AVAudioPlayer *audioPlayer4;
AVAudioPlayer *audioPlayer5;

}

@property (strong, nonatomic) NSMutableArray *noteArray;
@property (strong, nonatomic) NSMutableArray *audioArray;

@property (strong, nonatomic) PracticeType *notes;
@property (strong, nonatomic) NSString *randomNote;

@property (weak, nonatomic) IBOutlet UIButton *notePageIndicatorText;

@property (weak, nonatomic) IBOutlet UISlider *notesSlider;

@property (weak, nonatomic) IBOutlet UISlider *notesNumberOfNotesSlider;

@property (weak, nonatomic) IBOutlet UILabel *numberOfNotesLabel;

@property (weak, nonatomic) IBOutlet UILabel *notesSpeedIndicate;

@property (weak, nonatomic) IBOutlet UILabel *notesTimer;

@property (weak, nonatomic) IBOutlet UIButton *notesSkipLabel;

@property (weak, nonatomic) IBOutlet UIButton *notesPausePlayLabel;

@property (weak, nonatomic) IBOutlet UIView *notesReplayUIView;

@property (weak, nonatomic) IBOutlet UIButton *answerLabel;



- (IBAction)notesReplayButton:(id)sender;

- (IBAction)notesAnswerButton:(id)sender;

- (IBAction)notePageIndicator:(id)sender;

- (IBAction)notesSkip:(id)sender;

- (IBAction)notesPausePlay:(id)sender;

- (IBAction)notesSliderAction:(id)sender;

- (IBAction)notesNumberOfNotesSliderAction:(id)sender;



@end
