//
//  Video.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 20/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "MoveInMoveOutBaseResponse.h"

@protocol MyJobDetail <NSObject>
@end

@interface MyJobDetail : MoveInMoveOutBaseResponse

@property (nonatomic) NSString *parentCategoryTitle;
@property (nonatomic) NSString *childCategoryTitle;
@property (nonatomic) NSString *property;
@property (nonatomic) NSString *units;
@property (nonatomic) NSString *moveInInspectionDate;
@property (nonatomic) NSString *comment;
@property (nonatomic) NSString *imageName1;
@property (nonatomic) NSString *imageName2;
@property (nonatomic) NSString *pdfPath;
@property (nonatomic) NSString *taskCompletedComment;









@end
