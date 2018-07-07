//
//  AddVideoRequest.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 18/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "MoveInMoveOutBaseRequest.h"

@interface SubmitMoveInMoveOutRequest : MoveInMoveOutBaseRequest


@property (nonatomic,strong) NSString *move_in_out_id;
@property (nonatomic,strong) NSString *type;
@property (nonatomic,strong) NSString *user_id;


@property (nonatomic,strong) NSString *resident_name;
@property (nonatomic,strong) NSString *resident_inspection_date;
@property (nonatomic,strong) NSString *resident_signature;


@property (nonatomic,strong) NSString *leasing_agent;
@property (nonatomic,strong) NSString *agent_inspection_date;
@property (nonatomic,strong) NSString *agent_signature;


@property (nonatomic,strong) NSString *manager_name;
@property (nonatomic,strong) NSString *manager_inspection_date;
@property (nonatomic,strong) NSString *manager_signature;

@property (nonatomic,strong) NSString *inspection_date;
@property (nonatomic,strong) NSString *resident_not_avl_for_sign,*resident_refused_sign;





@end

//https://www.whitelakeinteractive.com/lindy-certification/certificate-production_api/api/snow-log-api.php?action=addRecord

