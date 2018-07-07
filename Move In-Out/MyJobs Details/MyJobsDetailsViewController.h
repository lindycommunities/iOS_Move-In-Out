//
//  ViewController.h
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface MyJobsDetailsViewController : BaseViewController<UIGestureRecognizerDelegate>

{
    MyJobDetail *response;
}
@property(nonatomic,retain)NSString * Str_flag;
@property (nonatomic,assign)BOOL GoAhead;

@property (nonatomic,weak)IBOutlet UILabel *LblParentCat;
@property (nonatomic,weak)IBOutlet UILabel *LblSubCat;
@property (nonatomic,weak)IBOutlet UILabel *LblDate;
@property (nonatomic,weak)IBOutlet UILabel *Lblproperty;
@property (nonatomic,weak)IBOutlet UILabel *Lblunit;
@property (nonatomic,retain)NSString *taskid;
@property(nonatomic,weak)IBOutlet UITextView *TxtComments;
@property(nonatomic,weak)IBOutlet UIImageView *Image_Image1;
@property(nonatomic,weak)IBOutlet UIImageView *Image_Image2;


@property(nonatomic,weak)IBOutlet UIImageView *Check_box;
@property(nonatomic,weak)IBOutlet UITextView *Txt_Comment;
@property(nonatomic,weak)IBOutlet UIView *Comment_View;

@property(nonatomic,weak)IBOutlet UIButton *Btn_ViewPDF;
@property(nonatomic,weak)IBOutlet UIButton *Btn_AdditionalComment;
@property(nonatomic,weak)IBOutlet UIButton *Btn_TaskComplete;



- (IBAction)Check_Click:(id)sender;
- (IBAction)Submit_Click:(id)sender;
- (IBAction)Close_Click:(id)sender;

- (IBAction)ViewPDF_Click:(id)sender;
- (IBAction)ViewComment_Click:(id)sender;

@end

