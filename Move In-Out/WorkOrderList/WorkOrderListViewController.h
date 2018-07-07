//
//  ViewController.h
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface WorkOrderListViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak)IBOutlet UITableView *TblALLData;
@property(nonatomic,weak)IBOutlet UITextField *TxtTechName;

@property(nonatomic,retain)NSArray *AllTechnicianData;
@property(nonatomic,retain)NSString *User_Id;
@property(nonatomic,retain)NSString *status;


- (IBAction)ShowTechnician:(id)sender;
- (IBAction)ClearTechnician:(id)sender;



@end

