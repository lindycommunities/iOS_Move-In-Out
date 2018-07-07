//
//  Video.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 20/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "MoveInMoveOutBaseResponse.h"

@protocol User <NSObject>
@end

@interface User : MoveInMoveOutBaseResponse

@property (nonatomic) NSString *userID;
@property (nonatomic) NSString *roleAID;
@property (nonatomic) NSString *displayName;
@property (nonatomic) NSString *communityBuildingID;


@end
