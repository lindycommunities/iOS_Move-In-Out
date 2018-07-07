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
    int counterData;
}

- (IBAction)GoBack:(id)sender;
@property(nonnull,retain)NSArray *arrProperty;
@property(nonatomic,retain)NSString *DATEYYMMDD1,*DATEYYMMDD2,*DATEYYMMDD3,*form_id;
- (IBAction)SubmitData:(id)sender;
@property (strong, nonatomic) IBOutlet UviSignatureView * _Nullable Signature3;
@property (strong, nonatomic) IBOutlet UviSignatureView * _Nonnull Signature2;
@property (strong, nonatomic) IBOutlet UviSignatureView * _Nullable Signature1;

@end

