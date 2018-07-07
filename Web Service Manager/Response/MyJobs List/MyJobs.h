//
//  Video.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 20/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "MoveInMoveOutBaseModel.h"

@protocol MyJobs <NSObject>
@end

@interface MyJobs : MoveInMoveOutBaseModel

@property (nonatomic) NSString *childCategoryTitle;
@property (nonatomic) NSString *moveInInspectionDate;
@property (nonatomic) NSString *moveInOutDtlID;
@property (nonatomic) NSString *moveInOutID;
@property (nonatomic) NSString *moveInOutType;
@property (nonatomic) NSString *parentCategoryTitle;
@property (nonatomic) NSString *units;
@property (nonatomic) NSString *property;

@property (nonatomic) NSString *taskCompletedBy;
@property (nonatomic) NSString *techinicans;




@end
