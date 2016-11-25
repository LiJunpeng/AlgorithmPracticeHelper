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

        [self.view setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:1.0]];
        UILabel *problemNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
        problemNameLabel.center = CGPointMake(140,140);
        problemNameLabel.text = _problemData.ProblemName;
       // problemNameLabel.textColor = [UIColor blackColor];
        //[problemNameLabel setBackgroundColor:[UIColor clearColor]]; // transparent label background
        [problemNameLabel setFont:[UIFont boldSystemFontOfSize:24.0]];
        [self.view addSubview:problemNameLabel];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

