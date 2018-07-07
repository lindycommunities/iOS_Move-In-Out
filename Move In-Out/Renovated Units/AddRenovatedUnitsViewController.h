//
//  ViewController.h
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "SLSelectionViewController.h"
#import "DatePickerViewController.h"

@interface AddRenovatedUnitsViewController : BaseViewController<SLSelectionDelegate,UITextFieldDelegate,DatePickerViewControllerDelegate,UITextViewDelegate>

@property (strong, nonatomic)  UITextField *ActiveTextField;
@property (strong, nonatomic)  UITextView *ActiveTextView;

@property (strong, nonatomic) IBOutlet UITextField *TxtApartment;
@property (strong, nonatomic) IBOutlet UITextField *TxtSize;
@property (strong, nonatomic) IBOutlet UITextField *TxtMoveOut;
@property (strong, nonatomic) IBOutlet UITextField *TxtMoveIn;



@property (strong, nonatomic) IBOutlet UITextField *TxtDemo;
@property (strong, nonatomic) IBOutlet UITextField *TxtCabinets;
@property (strong, nonatomic) IBOutlet UITextField *TxtTops;
@property (strong, nonatomic) IBOutlet UITextField *TxtPlank;
@property (strong, nonatomic) IBOutlet UITextField *TxtMaintenance;
@property (strong, nonatomic) IBOutlet UITextField *TxtClean;
@property (strong, nonatomic) IBOutlet UITextField *TxtLocks;

@property (strong, nonatomic) IBOutlet UITextView *TxtComments;

@property (strong, nonatomic) IBOutlet UITextView *TxtDemoComments;
@property (strong, nonatomic) IBOutlet UITextView *TxtCabinetsComments;

@property (strong, nonatomic) IBOutlet UITextView *TxtTopsComments;
@property (strong, nonatomic) IBOutlet UITextView *TxtPlankComments;
@property (strong, nonatomic) IBOutlet UITextView *TxtMaintenanceComments;
@property (strong, nonatomic) IBOutlet UITextView *TxtCleanComments;

@property (strong, nonatomic) IBOutlet UITextView *TxtLocksComments;



@property (strong, nonatomic) IBOutlet UIView *ViewMainContainer;
//@property (strong, nonatomic) IBOutlet UIScrollView *ScrollView;

//@property (strong, nonatomic) IBOutlet UIButton *BtnNext;




@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewDemoHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewCabinetsHeight;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewTopsHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewPlankHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewMaintenanceHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewCleanHeight;






@property (strong, nonatomic) IBOutlet UIScrollView *Scrollview;
@property (strong, nonatomic) IBOutlet UIButton *BtnNext;
- (IBAction)SubmitData:(id)sender;

@end

