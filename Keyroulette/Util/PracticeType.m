//
//  PracticeType.m
//  Keyroulette
//
//  Created by Scott Cho on 6/15/16.
//  Copyright © 2016 Scott Cho. All rights reserved.
//

#import "PracticeType.h"
#import "TheoryLibrary.h"
#import <UIKit/UIKit.h>

@implementation PracticeType

- (instancetype)initWithIndex:(NSUInteger)index
{
    self = [super init];
    if (self) {
        TheoryLibrary *theoryLib = [[TheoryLibrary alloc] init];
        NSArray *theoryArray = theoryLib.resource;
        
        NSDictionary *practiceDictionary = [theoryArray objectAtIndex:index];
        
        _practiceTitle = [practiceDictionary objectForKey:kTitle];
        NSDictionary *colorDictionary = [practiceDictionary objectForKey:kColor];
        _practiceColor = [self colorFromDictionary:colorDictionary];
        _practiceContent = [practiceDictionary objectForKey:kNotes];
        
    }
    return self;
}


-(UIColor *) colorFromDictionary:(NSDictionary *)dictionary {
    
    CGFloat red = [[dictionary objectForKey:@"red"] doubleValue];
    CGFloat green = [[dictionary objectForKey:@"green"] doubleValue];
    CGFloat blue = [[dictionary objectForKey:@"blue"] doubleValue];
    
    UIColor *returnColor = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
    
    return returnColor;
}

-(NSString*) randomNotes {
    
    NSString *noteSequence = @"";
    
    for (int i = 0; i < [self.practiceContent count]; i ++) {
        
        NSString *temporaryNote = [self.practiceContent[i][(int)arc4random_uniform([self.practiceContent[i] count])]
                                   stringByAppendingString:@" "
                                   ];
        
        
        noteSequence = [noteSequence stringByAppendingString:temporaryNote];
        
    }
    return noteSequence;
}


@end
