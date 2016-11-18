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

  - (id)initWithProblemName:(NSString *)name ProblemDescription:(NSString *)description{
    self.ProblemName = name;
    self.ProblemDescription = description;
    return self;
  }


  +(id) createWithProblemName:(NSString *)name ProblemDescription:(NSString *)description {
    return [[self alloc] initWithProblemName:name ProblemDescription:description];
  }

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

