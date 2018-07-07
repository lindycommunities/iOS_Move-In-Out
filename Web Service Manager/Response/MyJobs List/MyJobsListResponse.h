//
//  AWGetVideoMoveInMoveOutistResponse.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 20/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "MoveInMoveOutBaseResponse.h"
#import "MyJobs.h"

@interface MyJobsListResponse : MoveInMoveOutBaseResponse

@property (nonatomic) NSArray <MyJobs> *result;

@end
