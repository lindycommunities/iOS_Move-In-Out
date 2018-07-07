//
//  VideosListTableViewCell.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 19/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RentAdjustmentTableViewCell : UITableViewCell

@property (nonatomic,weak)IBOutlet UILabel *LblamenityName;
@property (nonatomic,weak)IBOutlet UILabel *LblamenityRate;
@property (nonatomic,weak)IBOutlet UIButton *BtnInfo;
@property (nonatomic,weak)IBOutlet UIImageView *ImgPlusMinus;

@property (nonatomic,weak)IBOutlet UIButton *Image1;
@property (nonatomic,weak)IBOutlet UIButton *Image2;
@property (nonatomic,weak)IBOutlet UITextView *TxtComment;


@property (strong, nonatomic) IBOutlet UIButton *BtnExist;
@property (strong, nonatomic) IBOutlet UIButton *BtnDoesNotExist;

@property (strong, nonatomic) IBOutlet UIImageView *ImgExist;
@property (strong, nonatomic) IBOutlet UIImageView *ImgDoesNotExist;


@end
