//
//  AlgorithmDetailViewController.m
//  AlgorithmPracticeHelper
//
//  Created by LILouis on 11/18/16.
//  Copyright © 2016 LILouis. All rights reserved.
//

//
//  ViewController.m
//  AlgorithmPracticeHelper
//
//  Created by LILouis on 11/18/16.
//  Copyright © 2016 LILouis. All rights reserved.
//

#import "ViewController.h"
#import "AlgorithmDetailViewController.h"

@interface AlgorithmDetailViewController ()

@end

@implementation AlgorithmDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

        UILabel *problemNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
        problemNameLabel.center = CGPointMake(20,20);
        problemNameLabel.text = @"fffffff";
        problemNameLabel.textColor = [UIColor blackColor];
        [problemNameLabel setBackgroundColor:[UIColor clearColor]]; // transparent label background
        [problemNameLabel setFont:[UIFont boldSystemFontOfSize:20.0]];
        [self.view addSubview:problemNameLabel];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

