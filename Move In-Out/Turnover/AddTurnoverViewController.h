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

@interface AddTurnoverViewController : BaseViewController<SLSelectionDelegate,UITextFieldDelegate,DatePickerViewControllerDelegate,UITextViewDelegate>

@property (strong, nonatomic)  UITextField *ActiveTextField;
@property (strong, nonatomic)  UITextView *ActiveTextView;

@property (strong, nonatomic) IBOutlet UITextField *TxtApartment;
@property (strong, nonatomic) IBOutlet UITextField *TxtType;
@property (strong, nonatomic) IBOutlet UITextField *TxtSize;
@property (strong, nonatomic) IBOutlet UITextField *TxtWalk;
@property (strong, nonatomic) IBOutlet UITextField *TxtMoveIn;

@property (strong, nonatomic) IBOutlet UITextField *TxtPaint;
@property (strong, nonatomic) IBOutlet UITextField *TxtPlumbing;
@property (strong, nonatomic) IBOutlet UITextField *TxtTub;
@property (strong, nonatomic) IBOutlet UITextField *TxtPatio;
@property (strong, nonatomic) IBOutlet UITextField *TxtCarpet;
@property (strong, nonatomic) IBOutlet UITextField *TxtMaintenance;
@property (strong, nonatomic) IBOutlet UITextField *TxtClean;
@property (strong, nonatomic) IBOutlet UITextField *TxtShampoo;
@property (strong, nonatomic) IBOutlet UITextField *TxtLocks;
@property (strong, nonatomic) IBOutlet UITextField *TxtAvailability;

@property (strong, nonatomic) IBOutlet UITextView *TxtComments;

@property (strong, nonatomic) IBOutlet UITextView *TxtPaintComments;
@property (strong, nonatomic) IBOutlet UITextView *TxtPlumbingComments;
@property (strong, nonatomic) IBOutlet UITextView *TxtTubComments;
@property (strong, nonatomic) IBOutlet UITextView *TxtPatioComments;
@property (strong, nonatomic) IBOutlet UITextView *TxtCarpetComments;
@property (strong, nonatomic) IBOutlet UITextView *TxtMaintenanceComments;
@property (strong, nonatomic) IBOutlet UITextView *TxtCleanComments;
@property (strong, nonatomic) IBOutlet UITextView *TxtShampooComments;
@property (strong, nonatomic) IBOutlet UITextView *TxtLocksComments;



@property (strong, nonatomic) IBOutlet UIView *ViewMainContainer;
//@property (strong, nonatomic) IBOutlet UIScrollView *ScrollView;

//@property (strong, nonatomic) IBOutlet UIButton *BtnNext;




@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewPaintHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewPlumbingHeight;


@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewTubHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewPatioHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewCarpetHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewMaintenanceHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewCleanHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewShampooHeight;






@property (strong, nonatomic) IBOutlet UIScrollView *Scrollview;
@property (strong, nonatomic) IBOutlet UIButton *BtnNext;
- (IBAction)SubmitData:(id)sender;

@end

