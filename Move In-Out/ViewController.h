//
//  ViewController.h
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CustomBadge.h"

@interface ViewController : BaseViewController
{
    int counterData,AttemptCount;

}
@property(nonatomic,assign)int processcount;
@property(nonatomic,retain)NSString *form_id;

- (IBAction)MoveOUT_Click:(id)sender;
@property(nonatomic,retain)NSString *moveInOutType;
@property(nonatomic,retain)CustomBadge *badge6;
@property(nonatomic,retain)NSMutableArray *arrAllData;



- (IBAction)Logout_Click:(id)sender;

- (IBAction)RefreshData_Click:(id)sender;
- (IBAction)UploadData_Click:(id)sender;


@end

