//
//  Video.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 20/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "MoveInMoveOutBaseModel.h"

@protocol RentAdjustment <NSObject>
@end

@interface RentAdjustment : MoveInMoveOutBaseModel

@property (nonatomic) NSString *unitRent;
@property (nonatomic) NSString *amenityName;
@property (nonatomic) NSString *amenityRate;
@property (nonatomic) NSString *amenityDesc;
@property (nonatomic) NSString *amenityType;//new old



@end
