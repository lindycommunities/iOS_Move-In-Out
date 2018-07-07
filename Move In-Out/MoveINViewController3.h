//
//  ViewController.h
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLSelectionViewController.h"
#import "DatePickerViewController.h"
#import "UviSignatureView.h"
#import "SubmitMoveInMoveOutRequest.h"
#import "AppDelegate.h"

@interface MoveINViewController3 :BaseViewController<SLSelectionDelegate,UITextFieldDelegate,DatePickerViewControllerDelegate>

{
    
    SubmitMoveInMoveOutRequest *moveinmoveoutformtoAdd;
    int counterData,AttemptCount;
    BOOL ResidentNotAvailable,ResidentRefused;
    
}
@property (strong, nonatomic) IBOutlet UIView *ViewMoveOutDate;
@property (strong, nonatomic) IBOutlet UITextField *TxtMoveOutDate;
@property (strong, nonatomic) IBOutlet UIImageView *ImgResidentNotAvailable;
@property (strong, nonatomic) IBOutlet UIImageView *ImgResidentRefused;
@property(nonatomic,retain)NSString *moveInOutType;
@property (nonatomic,strong) NSString *resident_not_avl_for_sign,*resident_refused_sign;


- (IBAction)GoBack:(id)sender;
@property(nonnull,retain)NSArray *arrProperty;
@property(nonnull,retain)NSMutableArray *arrAllokProperty;
@property(nonatomic,retain)NSString *DATEYYMMDD1,*DATEYYMMDD2,*DATEYYMMDD3,*form_id;
- (IBAction)SubmitData:(id)sender;
@property (strong, nonatomic) IBOutlet UviSignatureView * _Nullable Signature3;
@property (strong, nonatomic) IBOutlet UviSignatureView * _Nonnull Signature2;
@property (strong, nonatomic) IBOutlet UviSignatureView * _Nullable Signature1;
- (IBAction)ResidentnotAvailable_Click:(id)sender;
- (IBAction)ResidentRefused_Click:(id)sender;
- (IBAction)Clear1:(id)sender;
- (IBAction)Clear2:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *ViewCharges;
@property (strong, nonatomic) IBOutlet UILabel *LblPrice;
@property (strong, nonatomic) IBOutlet UIView *ViewResident;
@property (strong, nonatomic) IBOutlet UIView *ViewResidentcheckbox1;
@property (strong, nonatomic) IBOutlet UIView *ViewResidentcheckbox2;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewResidentHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewResidentcheckbox1Height;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewResidentcheckbox2Height;

@end

