//
//  SolutionViewController.m
//  AlgorithmPracticeHelper
//
//  Created by LILouis on 11/27/16.
//  Copyright © 2016 LILouis. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "ViewController.h"
#import "SolutionViewController.h"

@interface SolutionViewController ()

//@property NSInteger note;
//@property NSInteger solution;
@property NSInteger screen_width;
@property NSInteger screen_height;
@property NSInteger screen_origin_y;

@end

@implementation SolutionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _screen_width = [[UIScreen mainScreen] bounds].size.width;
    _screen_height = [[UIScreen mainScreen] bounds].size.height - self.tabBarController.tabBar.bounds.size.height - self.navigationController.navigationBar.bounds.size.height;
    _screen_origin_y = self.navigationController.navigationBar.bounds.size.height / 2 + self.navigationController.navigationBar.center.y;

    
    NSLog(@"w:%f , %f, %f", self.navigationController.navigationBar.bounds.size.height / 2,self.navigationController.navigationBar.center.y, _screen_origin_y);
    
    [self.view setBackgroundColor:[UIColor colorWithWhite:0.5 alpha:1.0]];
    
    UIScrollView *noteScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,_screen_width,_screen_height / 3 - 20)];
    noteScrollView.center = CGPointMake(_screen_width / 2, _screen_origin_y + _screen_height / 6 + 10);
    noteScrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:noteScrollView];
    
    
    UITextView *note = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, _screen_width, _screen_height)];
    note.adjustsFontForContentSizeCategory = YES; // adjustsFontSizeToFitWidth = YES;
    note.textColor = [UIColor blackColor];
    note.autoresizingMask=UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [note setFont:[UIFont fontWithName:@"Arial" size:14]];
    note.backgroundColor = [UIColor clearColor];
    note.delegate = self;
    note.userInteractionEnabled=YES;
    note.editable=NO;
    note.text = _note;
    [noteScrollView addSubview:note];
    [noteScrollView setContentSize:CGSizeMake( _screen_width, note.bounds.size.height)];
    
    
    UIScrollView *solutionScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,_screen_width,_screen_height * 2 / 3 - 20)];
    solutionScrollView.center = CGPointMake(_screen_width / 2, _screen_origin_y + _screen_height * 2 / 3 + 10);
    solutionScrollView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:solutionScrollView];
    
    
    UITextView *solution = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, _screen_width, _screen_height)];
    solution.adjustsFontForContentSizeCategory = YES; // adjustsFontSizeToFitWidth = YES;
    solution.textColor = [UIColor blackColor];
    solution.autoresizingMask=UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [solution setFont:[UIFont fontWithName:@"Arial" size:14]];
    solution.backgroundColor = [UIColor clearColor];
    solution.delegate = self;
    solution.userInteractionEnabled=YES;
    solution.editable=NO;
    solution.text = _solution;
    
    [solutionScrollView addSubview:solution];
    
    [solutionScrollView setContentSize:CGSizeMake( _screen_width, solution.frame.size.height)];
    
    
    UILabel *noteLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _screen_width, 20)];
    noteLabel.center = CGPointMake(_screen_width / 2, _screen_origin_y + 10);
    noteLabel.text =  @"Note:";
    noteLabel.textAlignment = NSTextAlignmentCenter;
    noteLabel.backgroundColor = [UIColor redColor];
    [noteLabel setFont:[UIFont boldSystemFontOfSize:16.0]];
    [self.view addSubview:noteLabel];
    
    UILabel *solutionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _screen_width, 20)];
    solutionLabel.center = CGPointMake(_screen_width / 2, _screen_height / 3 + _screen_origin_y + 10);
    solutionLabel.text =  @"Solution:";
    solutionLabel.textAlignment = NSTextAlignmentCenter;
    solutionLabel.backgroundColor = [UIColor blueColor];
    [solutionLabel setFont:[UIFont boldSystemFontOfSize:16.0]];
    [self.view addSubview:solutionLabel];
    
    //    UILabel *noteLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _screen_width - 20, _screen_height * 2 / 3)];
    //    noteLabel.center = CGPointMake(_screen_width / 2, 500);
    //    noteLabel.text = _solution;
    //    [noteLabel setNumberOfLines:0];
    //    [noteLabel sizeToFit];
    //    [noteLabel setFont:[UIFont boldSystemFontOfSize:16.0]];
    //    [self.view addSubview:noteLabel];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

