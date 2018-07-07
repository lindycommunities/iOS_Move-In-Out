//
//  WorkOrderOptionViewController.h
//  Move In-Out
//
//  Created by S S D on 08/10/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface WorkOrderOptionViewController : BaseViewController


-(IBAction)GoCompleted:(id)sender;
-(IBAction)GoPending:(id)sender;

@property(nonatomic,retain)NSString *status;

@end
