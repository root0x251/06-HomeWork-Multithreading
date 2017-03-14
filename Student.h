//
//  Student.h
//  06-HomeWork-Multithreading
//
//  Created by Slava on 11.03.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (strong, nonatomic) NSString *name;

// Создайте класс студент. У него должен быть метод - угадать ответ :)
- (void) guessTheAnswer: (NSInteger) number inRangeStart: (NSInteger) rangeStart inRangeEnd: (NSInteger) rangeEnd;


@end
