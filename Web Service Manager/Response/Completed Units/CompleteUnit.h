//
//  Video.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 20/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "MoveInMoveOutBaseModel.h"

@protocol CompleteUnit <NSObject>
@end

@interface CompleteUnit : MoveInMoveOutBaseModel

@property (nonatomic) NSString *moveOutInspectionDate;
@property (nonatomic) NSString *not_ok;
@property (nonatomic) NSString *ok;
@property (nonatomic) NSString *pdfPath;
@property (nonatomic) NSString *property;
@property (nonatomic) NSString *units;
@property (nonatomic) NSString *moveInOutID;
@property (nonatomic) NSString *displayName;



@end
