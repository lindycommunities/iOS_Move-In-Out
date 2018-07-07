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
#import "AppDelegate.h"
#import "ValidateMoveInMoveOutRequest.h"
#import "AddMoveInMoveOutServiceRequest.h"
#import "MoveInMoveOutBaseRequest.h"

@interface MoveOUTViewController :BaseViewController<SLSelectionDelegate,UITextFieldDelegate,DatePickerViewControllerDelegate>{

    AppDelegate *app;
    ValidateMoveInMoveOutRequest *validateRequest;

}
- (IBAction)GoBack:(id)sender;
@property(nonatomic,retain)NSArray *arrProperty;
@property(nonatomic,retain)NSArray *arrPropertyUnits;

@property(nonatomic,retain)NSString *DATEYYMMDD;
@property(nonatomic,retain)NSString *moveInOutType;
@property(nonatomic,retain)UITextField *ActiveTextField;
@property(nonatomic,retain)NSMutableDictionary *AllOfflineData;

@end

