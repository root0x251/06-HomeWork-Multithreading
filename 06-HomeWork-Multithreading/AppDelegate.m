//
//  AppDelegate.m
//  06-HomeWork-Multithreading
//
//  Created by Slava on 11.03.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //
    //    Ученик.
    //
    //    Создайте класс студент. У него должен быть метод - угадать ответ :)
    //    В метод передается случайное целое число например в диапазоне от 0 - 100 (или больше) и сам диапазон, чтобы студент знал где угадывать
    //    Студент генерирует случайное число в том же диапазоне пока оно не будет искомым
    //    Весь процесс угадывания реализуется в потоке в классе студент
    //    Когда студент досчитал то пусть пишет в НСЛог
    //    Создайте 5 студентов и дайте им одну и туже задачу и посмотрите кто справился с ней лучше
    
    // Создайте 5 студентов и дайте им одну и туже задачу и посмотрите кто справился с ней лучше
    NSMutableArray *arrayStud = [NSMutableArray new];
    for (int i = 1; i < 6; i++) {
        Student *stud = [Student new];
        char randSymbol = arc4random_uniform(11) + 'A';
        stud.name = [NSString stringWithFormat:@"%c_student%d", randSymbol, i];
        [arrayStud addObject:stud];
    }
    dispatch_queue_t queue = dispatch_queue_create("parapapa.Multithreading.ru", DISPATCH_QUEUE_SERIAL);
    
    for (int i = 0 ; i < arrayStud.count; i++) {
        Student *sting = [arrayStud objectAtIndex:i];
        dispatch_async(queue, ^{
            [sting guessTheAnswer:22 inRangeStart:1 inRangeEnd:100];  // угадать число 15 в диапазоне 100
        });
    }
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}


- (void)applicationDidEnterBackground:(UIApplication *)application {

}


- (void)applicationWillEnterForeground:(UIApplication *)application {

}


- (void)applicationDidBecomeActive:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {

}


@end
