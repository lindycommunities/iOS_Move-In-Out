//
//  ViewController.h
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface RentAdjusementHomeViewController : BaseViewController

- (IBAction)GoBack:(id)sender;
- (IBAction)StartRentAdjusement:(id)sender;
@property(nonatomic,retain)NSString *UnitNumber;

@end

