//
//  detailTabViewController.h
//  AlgorithmPracticeHelper
//
//  Created by LILouis on 11/25/16.
//  Copyright © 2016 LILouis. All rights reserved.
//

#ifndef detailTabViewController_h
#define detailTabViewController_h

#import <UIKit/UIKit.h>
#import "detailTabViewController.h"
#import "AlgorithmProblemData.h"

@interface detailTabViewController: UITabBarController

@property(strong, nonatomic) AlgorithmProblemData *problemData;

- (void)setData: (AlgorithmProblemData*) data;

@end

#endif /* detailTabViewController_h */
