//
//  PracticeType.h
//  Keyroulette
//
//  Created by Scott Cho on 6/15/16.
//  Copyright © 2016 Scott Cho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PracticeType : NSObject

@property (strong, nonatomic) NSString *practiceTitle;
@property (strong, nonatomic) UIColor *practiceColor;
@property (strong, nonatomic) NSArray *practiceContent;

- (instancetype)initWithIndex:(NSUInteger)index;

- (NSString*) randomNotes;

@end
