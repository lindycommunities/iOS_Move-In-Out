//
//  AddVideoRequest.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 18/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "MoveInMoveOutBaseRequest.h"

@interface AddMoveInMoveOutServiceRequest : MoveInMoveOutBaseRequest


@property (nonatomic,strong) NSString *move_in_out_id;
@property (nonatomic,strong) NSString *type;
@property (nonatomic,strong) NSString *parent_category;
@property (nonatomic,strong) NSString *child_category;
@property (nonatomic,strong) NSString *is_ok;
@property (nonatomic,strong) NSString *comment;
@property (nonatomic,strong) NSString *image1;
@property (nonatomic,strong) NSString *image2;
@property (nonatomic,strong) NSString *charges;
@property (nonatomic,strong) NSString *charges_type;
@property (nonatomic,strong) NSString *tech_id;
@property (nonatomic,strong) NSString *Technician_Name;





@end

//https://www.whitelakeinteractive.com/lindy-certification/certificate-production_api/api/snow-log-api.php?action=addRecord

