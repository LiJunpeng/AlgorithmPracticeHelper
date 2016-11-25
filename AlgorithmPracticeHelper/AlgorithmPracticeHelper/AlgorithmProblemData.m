//
//  AlgorithmProblemData.m
//  AlgorithmPracticeHelper
//
//  Created by LILouis on 11/18/16.
//  Copyright © 2016 LILouis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlgorithmProblemData.h"

@implementation AlgorithmProblemData

- (id)initWithProblemName:(NSString *)name
          ProblemPlatform:(NSString *)platform
    ProblemPlatformNumber:(NSString *)platform_number
             ProblemLevel:(NSString *)level
       ProblemDescription:(NSString *)description
          ProblemSolution:(NSString *)solution
             ProblemNotes:(NSString *)note{
    self.ProblemName = name;
    self.ProblemPlatform = platform;
    self.ProblemPlatformNumber = platform_number;
    self.ProblemLevel = level;
    self.ProblemDescription = description;
    self.ProblemSolution = solution;
    self.ProblemNotes = note;
    return self;
  }


+(id) createWithProblemName:(NSString *)name
            ProblemPlatform:(NSString *)platform
      ProblemPlatformNumber:(NSString *)platform_number
               ProblemLevel:(NSString *)level
         ProblemDescription:(NSString *)description
            ProblemSolution:(NSString *)solution
               ProblemNotes:(NSString *)note; {
    return [[self alloc] initWithProblemName:name
                             ProblemPlatform:(NSString *)platform
                       ProblemPlatformNumber:platform_number
                                ProblemLevel:level
                          ProblemDescription:description
                             ProblemSolution:solution
                                ProblemNotes:note];
  }


//ProblemPlatform:(NSString *)platform
//ProblemPlatformNumber:(NSString *)platform_number
//ProblemLevel:(NSString *)level
//ProblemDescription:(NSString *)description
//ProblemSolution:(NSString *)solution
//ProblemNotes:(NSString *)note;


//// init with multiple parameters
//- (id)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSInteger)age{
//    self.firstName = firstName;
//    self.lastName = lastName;
//    self.age = age;
//    return self;
//}
//
//// method with no parameter
//- (void)print{
//    NSLog(@"First Name: %@", self.firstName);
//    NSLog(@"Last Name: %@", self.lastName);
//    NSLog(@"Age: %ld", self.age);
//}
//
//// class method
//+(id) createWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSInteger)age{
//    return [[self alloc] initWithFirstName:firstName lastName:lastName age:age];
//}


@end

