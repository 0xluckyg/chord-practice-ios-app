//
//  TheoryLibrary.h
//  Keyroulette
//
//  Created by Scott Cho on 6/15/16.
//  Copyright © 2016 Scott Cho. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kTitle;
extern NSString *const kColor;
extern NSString *const kNotes;

@interface TheoryLibrary : NSObject

@property (strong, nonatomic) NSArray *keyArray;
@property (strong, nonatomic) NSArray *sharpFlatArray;
@property (strong, nonatomic) NSArray *majorMinorArray;
@property (strong, nonatomic) NSArray *upDownArray;
@property (strong, nonatomic) NSArray *modeArray;

@property (strong, nonatomic) NSArray *intervalHalfWhole;
@property (strong, nonatomic) NSArray *intervalArray;

@property (strong, nonatomic) NSArray *scaleMajorMinorArray;
@property (strong, nonatomic) NSArray *scaleArray;
@property (strong, nonatomic) NSArray *scaleChromatic;

@property (strong, nonatomic) NSArray *chordMajMinAugDomDimSus;
@property (strong, nonatomic) NSArray *chord79;
@property (strong, nonatomic) NSArray *chordAdd;
@property (strong, nonatomic) NSArray *chordInversion;

@property (strong, nonatomic) NSArray *pitchArray;


@property (strong, nonatomic) NSDictionary *yellowColor;
@property (strong, nonatomic) NSDictionary *tealColor;
@property (strong, nonatomic) NSDictionary *redColor;
@property (strong, nonatomic) NSDictionary *greenColor;
@property (strong, nonatomic) NSDictionary *purpleColor;
@property (strong, nonatomic) NSDictionary *orangeColor;


@property (strong, nonatomic) NSArray *resource;

@end
