//
//  Student.m
//  06-HomeWork-Multithreading
//
//  Created by Slava on 11.03.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import "Student.h"

@implementation Student

// В метод передается случайное целое число например в диапазоне от 0 - 100 (или больше) и сам диапазон, чтобы студент знал где угадывать
- (void) guessTheAnswer: (NSInteger) number inRangeStart: (NSInteger) rangeStart inRangeEnd: (NSInteger) rangeEnd {
    dispatch_queue_t concurent = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(concurent, ^{
        NSLog(@"Student %@ is started", _name);
        double startTime = CFAbsoluteTimeGetCurrent();
        NSInteger counOfAttemps = 0;    // количество шагов
        NSInteger randomNumber = (arc4random() % (rangeEnd - rangeStart) + rangeStart);
        
        while (randomNumber != number) {
            counOfAttemps++;
            randomNumber = (arc4random() % (rangeEnd - rangeStart) + rangeStart);
        }
        if (randomNumber == number) {
            NSLog(@"Student %@ found this number %ld in %f for %ld attemps", _name, randomNumber, CFAbsoluteTimeGetCurrent() - startTime, counOfAttemps);
        }

    });
}



@end
