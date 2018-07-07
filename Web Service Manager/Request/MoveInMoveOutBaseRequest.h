//
//  BaseModel.h
//  AxisWallet
//
//  Created by Hemant Chittora on 03/06/15.
//  Copyright (c) 2015 Hemant Chittora. All rights reserved.
//

#import "MoveInMoveOutBaseModel.h"


@interface MoveInMoveOutBaseRequest : MoveInMoveOutBaseModel
@property (nonatomic, strong) NSString *action;
@property (nonatomic, strong) NSString *comm_bld_id;


- (NSDictionary *)dictionary;
- (NSArray *)paramsOrderArray;
- (NSString *)requestString;
@end
