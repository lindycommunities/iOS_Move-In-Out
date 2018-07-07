//
//  LessonSectionHeader.h
//  MySports Pro
//
//  Created by Bonnie Jaiswal on 02/01/17.
//  Copyright © 2017 Bonnie Jaiswal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LessonSectionHeader : UITableViewHeaderFooterView


@property(nonatomic,weak)IBOutlet UITextField *LblHeaderTitle;
@property(nonatomic,weak)IBOutlet UIButton *BtnAllOk;
@property(nonatomic,weak)IBOutlet UIImageView *ImgAllOk;
@property(nonatomic,weak)IBOutlet UIButton *BtnOpenAll;
@property(nonatomic,weak)IBOutlet UIImageView *ImgPlusMinus;
@property(nonatomic,weak)IBOutlet UILabel *LblAllOk;

@end

