//
//  AddVideoRequest.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 18/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "MoveInMoveOutBaseRequest.h"

@interface AddPreventionServiceRequestRequest : MoveInMoveOutBaseRequest


@property (nonatomic,strong) NSString *preventmain_id;
@property (nonatomic,strong) NSString *parent_category_id;
@property (nonatomic,strong) NSString *child_category_id;
@property (nonatomic,strong) NSString *comment;
@property (nonatomic,strong) NSString *imageName1;
@property (nonatomic,strong) NSString *imageName2;
@property (nonatomic,strong) NSString *isFinal;
@property (nonatomic,strong) NSString *is_ok;
@property (nonatomic,strong) NSString *parent_category;
@property (nonatomic,strong) NSString *child_category;




@end

//https://www.whitelakeinteractive.com/lindy-certification/certificate-production_api/api/snow-log-api.php?action=addRecord

