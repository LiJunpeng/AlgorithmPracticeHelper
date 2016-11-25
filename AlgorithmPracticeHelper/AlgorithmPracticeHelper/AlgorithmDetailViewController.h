//
//  AlgorithmDetailViewController.h
//  AlgorithmPracticeHelper
//
//  Created by LILouis on 11/18/16.
//  Copyright © 2016 LILouis. All rights reserved.
//

#ifndef AlgorithmDetailViewController_h
#define AlgorithmDetailViewController_h

#import <UIKit/UIKit.h>
#import "AlgorithmProblemData.h"

@interface AlgorithmDetailViewController: UIViewController

//@property(strong, nonatomic) AlgorithmProblemData *problemData;
@property(strong, nonatomic) NSString* name;
@property(strong, nonatomic) NSString* level;
@property(strong, nonatomic) NSString* Description;

@end

#endif /* AlgorithmDetailViewController_h */
