//
//  Video.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 20/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "MoveInMoveOutBaseModel.h"

@protocol Units <NSObject>
@end

@interface Units : MoveInMoveOutBaseModel

//@property (nonatomic) NSString *categoryID;
@property (nonatomic) NSString *unit;
@property (nonatomic) NSString *access_for;


@end
