//
//  ViewController.m
//  AlgorithmPracticeHelper
//
//  Created by LILouis on 11/18/16.
//  Copyright © 2016 LILouis. All rights reserved.
//

#import "ViewController.h"
#import "AlgorithmProblemData.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AlgorithmProblemData *test = [AlgorithmProblemData createWithProblemName:@"test" ProblemDescription:@"dsf"];
    
    //NSLog(test.ProblemName);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
