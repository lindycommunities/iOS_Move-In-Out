//
//  Video.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 20/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "MoveInMoveOutBaseModel.h"

@protocol Technician <NSObject>
@end

@interface Technician : MoveInMoveOutBaseModel

@property (nonatomic) NSString *userID;
@property (nonatomic) NSString *displayName;

@end
