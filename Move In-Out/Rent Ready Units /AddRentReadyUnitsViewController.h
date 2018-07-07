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

@interface AddRentReadyUnitsViewController : BaseViewController<SLSelectionDelegate,UITextFieldDelegate,DatePickerViewControllerDelegate,UITextViewDelegate>

@property (strong, nonatomic)  UITextField *ActiveTextField;
@property (strong, nonatomic) IBOutlet UITextField *TxtApartment;
@property (strong, nonatomic) IBOutlet UITextField *TxtType;
@property (strong, nonatomic) IBOutlet UITextField *TxtSize;
@property (strong, nonatomic) IBOutlet UITextField *TxtFinishDate;
@property (strong, nonatomic) IBOutlet UITextField *TxtKeys;

@property (strong, nonatomic) IBOutlet UIView *ViewMainContainer;






@property (strong, nonatomic) IBOutlet UIScrollView *Scrollview;
@property (strong, nonatomic) IBOutlet UIButton *BtnNext;
- (IBAction)SubmitData:(id)sender;

@end

