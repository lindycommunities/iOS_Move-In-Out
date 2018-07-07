//
//  Video.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 20/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "MoveInMoveOutBaseModel.h"
#import "MoveInMoveOutBaseResponse.h"

@protocol RentAdjustmenID <NSObject>
@end

@interface RentAdjustmenID : MoveInMoveOutBaseResponse

@property (nonatomic) NSString *rent_update_id;



@end
