//
//  AWGetVideoMoveInMoveOutistResponse.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 20/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "MoveInMoveOutBaseResponse.h"
#import "Equipment.h"

@interface GetEquipmentListResponse : MoveInMoveOutBaseResponse

@property (nonatomic) NSArray <Equipment> *result;

@end
