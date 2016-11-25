//
//  AlgorithmProblemData.h
//  AlgorithmPracticeHelper
//
//  Created by LILouis on 11/18/16.
//  Copyright © 2016 LILouis. All rights reserved.
//

#ifndef AlgorithmProblemData_h
#define AlgorithmProblemData_h

    @interface AlgorithmProblemData : NSObject

    //@property(nonatomic)  NSInteger dataID;
    @property(strong, nonatomic) NSString *ProblemName;  // eg: 2sum
    @property(strong, nonatomic) NSString *ProblemPlatform;  // eg: leetcode
    @property(strong, nonatomic) NSString *ProblemPlatformNumber;  // eg: 1
    @property(strong, nonatomic) NSString *ProblemLevel;  // eg: medium
    @property(strong, nonatomic) NSString *ProblemDescription;
    @property(strong, nonatomic) NSString *ProblemSolution;
    @property(strong, nonatomic) NSString *ProblemNotes;

    - (id)initWithProblemName:(NSString *)name
              ProblemPlatform:(NSString *)platform
        ProblemPlatformNumber:(NSString *)platform_number
                 ProblemLevel:(NSString *)level
           ProblemDescription:(NSString *)description
              ProblemSolution:(NSString *)solution
                 ProblemNotes:(NSString *)note;

    +(id) createWithProblemName:(NSString *)name
                ProblemPlatform:(NSString *)platform
          ProblemPlatformNumber:(NSString *)platform_number
                   ProblemLevel:(NSString *)level
             ProblemDescription:(NSString *)description
                ProblemSolution:(NSString *)solution
                   ProblemNotes:(NSString *)note;



//    - (id)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSInteger)age;
//    - (void)print;
//    +(id) createWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSInteger)age;

    @end

#endif /* AlgorithmProblemData_h */

