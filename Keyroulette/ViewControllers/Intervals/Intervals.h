//
//  Intervals.h
//  Keyroulette
//
//  Created by Scott Cho on 6/15/16.
//  Copyright © 2016 Scott Cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PracticeType.h"

@interface Intervals : UIViewController {

NSTimer * timer;
CGFloat time;
bool startTimer;

}

@property (strong, nonatomic) PracticeType *notes;


@property (weak, nonatomic) IBOutlet UIButton *notePageIndicatorText;

@property (weak, nonatomic) IBOutlet UILabel *noteMainLabel;


@property (weak, nonatomic) IBOutlet UISlider *notesSlider;

@property (weak, nonatomic) IBOutlet UILabel *notesSpeedIndicate;

@property (weak, nonatomic) IBOutlet UILabel *notesTimer;

@property (weak, nonatomic) IBOutlet UIButton *notesSkipLabel;

@property (weak, nonatomic) IBOutlet UIButton *notesPausePlayLabel;


- (IBAction)notePageIndicator:(id)sender;

- (IBAction)notesSkip:(id)sender;

- (IBAction)notesPausePlay:(id)sender;

- (IBAction)notesSliderAction:(id)sender;



@end
