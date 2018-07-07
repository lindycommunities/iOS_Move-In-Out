//
//  VideosListTableViewCell.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 19/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (nonatomic,weak)IBOutlet UILabel *Lbl_Title;
@property(nonatomic,weak)IBOutlet UIButton *BtnOk;
@property(nonatomic,weak)IBOutlet UIButton *BtnNotOk;
@property(nonatomic,weak)IBOutlet UIImageView *ImgAllOk;
@property(nonatomic,weak)IBOutlet UITextView *TxtComments;
@property(nonatomic,weak)IBOutlet UIButton *Image1;
@property(nonatomic,weak)IBOutlet UIButton *Image2;
@property(nonatomic,weak)IBOutlet UIButton *BtnCharges;
@property(nonatomic,weak)IBOutlet UITextField *TxtPrice;
@property (nonatomic,weak)IBOutlet UILabel *Lbl_Price_Title;
@property (nonatomic,weak)IBOutlet UIView *View_charges;
@property (nonatomic,weak)IBOutlet UIView *View_Image1;
@property (nonatomic,weak)IBOutlet UIView *View_Image2;

@property(nonatomic,weak)IBOutlet UIImageView *Image_Image1;
@property(nonatomic,weak)IBOutlet UIImageView *Image_Image2;
@property(nonatomic,weak)IBOutlet UIButton *BtnDelImage1;
@property(nonatomic,weak)IBOutlet UIButton *BtnDelImage2;

@property(nonatomic,weak)IBOutlet UIButton *BtnAssignToTech;
@property (nonatomic,weak)IBOutlet UILabel *Lbl_TechnitianName;
@property (strong, nonatomic)IBOutlet UIImageView *ImgCheckBox;



@end
