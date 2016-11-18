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
    @property(strong, nonatomic) NSString *ProblemIdentifier;  // eg: leetcode 123
    @property(strong, nonatomic) NSString *ProblemName;  // eg: 2sum
    @property(strong, nonatomic) NSString *ProblemDescription;
    @property(strong, nonatomic) NSString *ProblemAnswer;
    @property(strong, nonatomic) NSString *ProblemHint;
    @property(strong, nonatomic) NSString *ProblemTags;
    @property(strong, nonatomic) NSString *ProblemNotes;
    @property(nonatomic)  NSInteger ProblemLevel;

    - (id)initWithProblemName:(NSString *)name
           ProblemDescription:(NSString *)description;

    +(id) createWithProblemName:(NSString *)name
                     ProblemDescription:(NSString *)description;




//    - (id)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSInteger)age;
//    - (void)print;
//    +(id) createWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSInteger)age;

    @end

#endif /* AlgorithmProblemData_h */

