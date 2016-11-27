//
//  detailTabViewController.m
//  AlgorithmPracticeHelper
//
//  Created by LILouis on 11/25/16.
//  Copyright © 2016 LILouis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailTabViewController.h"
#import "AlgorithmDetailViewController.h"
#import "SolutionViewController.h"

@interface detailTabViewController ()

@end

@implementation detailTabViewController : UITabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    AlgorithmDetailViewController *algorithDetailPage = [[AlgorithmDetailViewController alloc] init];
    algorithDetailPage.name = _problemData.ProblemName;
    algorithDetailPage.level = _problemData.ProblemLevel;
    algorithDetailPage.Description = _problemData.ProblemDescription;
    
    
    SolutionViewController *solutionPage = [[SolutionViewController alloc] init];
    solutionPage.solution = _problemData.ProblemSolution;
    solutionPage.note = _problemData.ProblemNotes;
    
    
    NSArray *viewControllers = [NSArray arrayWithObjects:algorithDetailPage, solutionPage, nil];
    [self setViewControllers:viewControllers animated:NO];
    
    [[self.viewControllers objectAtIndex:0] setTitle: @"Problem"];
    [[self.viewControllers objectAtIndex:1] setTitle: @"Solution"];
}

- (void)setData:(AlgorithmProblemData*) data {
    _problemData = data;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
