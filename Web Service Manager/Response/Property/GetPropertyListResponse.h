//
//  AWGetVideoMoveInMoveOutistResponse.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 20/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "MoveInMoveOutBaseResponse.h"
#import "Property.h"

@interface GetPropertyListResponse : MoveInMoveOutBaseResponse

@property (nonatomic) NSArray <Property> *result;

@end
