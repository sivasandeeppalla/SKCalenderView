//
//  ViewController.h
//  SKCalenderView
//
//  Created by developer1 on 29/09/15.
//  Copyright (c) 2015 developer1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (strong, nonatomic) IBOutlet UILabel *month_Name;
- (IBAction)nextBtn:(UIButton *)sender;
- (IBAction)previousBtn:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UICollectionView *calenderColl;
@end

