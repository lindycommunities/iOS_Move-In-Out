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
#import "UIImage+ImageCompress.h"

@interface AddRentAdjustmentViewController : BaseViewController<SLSelectionDelegate,UITextFieldDelegate,DatePickerViewControllerDelegate,UITextViewDelegate,UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,retain)NSMutableDictionary *AllOfflineData;
@property(nonatomic,retain)NSMutableDictionary *AllOfflineAmenitiesData;
@property(nonatomic,retain)NSMutableDictionary *AllOfflineUniqueAmenitiesData;

@property (strong, nonatomic)  UITextField *ActiveTextField;
@property (strong, nonatomic)  UITextView *ActiveTextView;

@property (strong, nonatomic) IBOutlet UILabel *TxtBaseRent;
@property (strong, nonatomic) IBOutlet UILabel *LblMissingAmitnities;

@property (strong, nonatomic) IBOutlet UITextField *TxtAdjustBaseRent;
@property (strong, nonatomic) IBOutlet UITextView *TxtComment;


@property (strong, nonatomic) IBOutlet UIButton *Btnimage1;
@property (strong, nonatomic) IBOutlet UIButton *Btnimage2;
@property (strong, nonatomic) IBOutlet UIButton *Btnimage3;
@property (strong, nonatomic) IBOutlet UITableView *ActiveTableView;


- (IBAction)SelectBtnExist:(id)sender;
- (IBAction)SelectBtnDoesNotExist:(id)sender;



- (IBAction)SelectImage1:(id)sender;
- (IBAction)SelectImage2:(id)sender;
- (IBAction)SelectImage3:(id)sender;
@property(nonatomic,retain)NSString *ControlFlag;
@property(nonatomic,retain)NSString *UnitNumber;
@property(nonatomic,assign)BOOL isExpand;
@property(nonatomic,retain)NSIndexPath *CurrentIndexPath;
@property(nonatomic,assign)int CurrentIndexPathRow;

@property(nonatomic,retain)NSString *rent_update_id;



@property (strong, nonatomic) IBOutlet UIView *ViewMainContainer;
//@property (strong, nonatomic) IBOutlet UIScrollView *ScrollView;

//@property (strong, nonatomic) IBOutlet UIButton *BtnNext;



@property (strong, nonatomic) IBOutlet UITableView *TblRentAdjustment;
@property (strong, nonatomic) IBOutlet UITableView *TblMissingRentAdjustment;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *TblRentAdjustmentHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *TblMissingRentAdjustmentHeight;


@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewMainContainerHeight;




@property (strong, nonatomic) IBOutlet UIScrollView *Scrollview;
@property (strong, nonatomic) IBOutlet UIButton *BtnNext;
- (IBAction)SubmitData:(id)sender;
- (IBAction)AddMissingAmenities:(id)sender;

@end

