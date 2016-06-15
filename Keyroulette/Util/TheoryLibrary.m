//
//  TheoryLibrary.m
//  Keyroulette
//
//  Created by Scott Cho on 6/15/16.
//  Copyright © 2016 Scott Cho. All rights reserved.
//

#import "TheoryLibrary.h"

NSString *const kTitle = @"title";
NSString *const kColor = @"color";
NSString *const kNotes = @"notes";


@implementation TheoryLibrary


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _keyArray = @[@"C", @"D", @"E", @"F", @"G", @"A", @"B"];
        _sharpFlatArray = @[@"#", @"b", @""];
        _upDownArray = @[@"Up", @"Down"];
        _majorMinorArray = @[@"Minor", @"Major"];
        _intervalArray = @[@"2nd", @"2nd",
                               @"3rd", @"3rd",
                               @"4th", @"4th",
                               @"5th", @"5th", @"5th",
                               @"6th", @"6th",
                               @"7th", @"7th",
                               @"Halfstep", @"Wholestep", @"Tritone"];
        _modeArray = @[@"Ionian", @"Dorian", @"Phrygian", @"Lydian", @"Mixolydian", @"Aeolian", @"Locrian"];
        _scaleMajorMinorArray = @[@"Major", @"Major", @"Major", @"Major", @"Harmonic Minor", @"Minor", @"Minor", @"Minor"];
        _scaleArray = @[@"Arppeggio", @"Pentatonic", @"", @"", @"", @""];
        
        _redColor = @{@"red": @223, @"green": @86, @"blue": @94};
        _yellowColor = @{@"red": @222, @"green": @171, @"blue": @66, @"alpha": @1.0};
        _tealColor = @{@"red": @90, @"green": @187, @"blue": @181, @"alpha": @1.0};
        _purpleColor = @{@"red": @105, @"green": @94, @"blue": @133, @"alpha": @1.0};
        _greenColor = @{@"red": @85, @"green": @176, @"blue": @112, @"alpha": @1.0};

        
        
        _resource = @[@{
                        kTitle:@"Notes",
                        kColor:_redColor,
                        kNotes:@[_keyArray,
                                _sharpFlatArray]
                        },
                      
                      @{
                        kTitle:@"Intervals",
                        kColor:_tealColor,
                        kNotes:@[_upDownArray,
                                 _majorMinorArray,
                                 _intervalArray]
                        },
                      
                      @{
                        kTitle:@"Chords",
                        kColor:_yellowColor,
                        kNotes:@[_keyArray,
                                 @[@"#", @"b", @""]]
                        },
                      
                      @{
                        kTitle:@"Modes",
                        kColor:_purpleColor,
                        kNotes:@[_keyArray,
                                _sharpFlatArray,
                                _modeArray]
                        },
                      
                      @{
                        kTitle:@"Scales",
                        kColor:_greenColor,
                        kNotes:@[_keyArray,
                                _sharpFlatArray,
                                _scaleMajorMinorArray,
                                _scaleArray]
                        },
                      
                      
                      ];
    }
    return self;
}

@end
