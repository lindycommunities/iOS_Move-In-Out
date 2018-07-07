//
//  MoveIN_OUT_TABLEViewController.h
//  Move In-Out
//
//  Created by S S D on 06/08/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+ImageCompress.h"
#import "SLSelectionViewController.h"
@interface Preventive_TABLEViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UITextViewDelegate,SLSelectionDelegate>
{
}
@property(nonatomic,retain)NSString *moveInOutType;
@property(nonatomic,retain)NSMutableDictionary *AllPriceData;
@property(nonatomic,retain)NSArray *AllTechnicianData;
@property(nonatomic,retain)NSString *Image_flag;
- (IBAction)SubmitData:(id)sender;

@end
