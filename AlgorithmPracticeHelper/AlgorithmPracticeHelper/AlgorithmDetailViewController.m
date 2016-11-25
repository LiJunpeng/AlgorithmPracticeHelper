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

@property NSInteger screen_width;
@property NSInteger screen_height;
@property NSInteger screen_origin_x;

@end

@implementation AlgorithmDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    _screen_width = [[UIScreen mainScreen] bounds].size.width;
    _screen_height = [[UIScreen mainScreen] bounds].size.height;
    _screen_origin_x = [[UIScreen mainScreen] bounds].origin.x;
    
    [self.view setBackgroundColor:[UIColor colorWithWhite:0.5 alpha:1.0]];
    
    UILabel *problemNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _screen_width - 40, 80)];
    problemNameLabel.numberOfLines=2;
    problemNameLabel.center = CGPointMake(_screen_width/2, 100);
    problemNameLabel.text = _name;
   // problemNameLabel.textColor = [UIColor blackColor];
    //[problemNameLabel setBackgroundColor:[UIColor clearColor]]; // transparent label background
    [problemNameLabel setFont:[UIFont boldSystemFontOfSize:18.0]];
    [self.view addSubview:problemNameLabel];
    
    UILabel *levelLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    levelLabel.center = CGPointMake(_screen_origin_x + 70, 180);
    levelLabel.text = _level;
    [levelLabel setFont:[UIFont boldSystemFontOfSize:16.0]];
    [self.view addSubview:levelLabel];
    
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _screen_width - 20, _screen_height * 2 / 3)];
    descriptionLabel.center = CGPointMake(_screen_width / 2, (_screen_height - 200) / 2 + 200);
    descriptionLabel.text = _Description;
    [descriptionLabel setNumberOfLines:0];
    [descriptionLabel sizeToFit];
    [descriptionLabel setFont:[UIFont boldSystemFontOfSize:16.0]];
    [self.view addSubview:descriptionLabel];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

