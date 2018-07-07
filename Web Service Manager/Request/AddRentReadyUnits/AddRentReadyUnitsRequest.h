//
//  AddVideoRequest.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 18/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "MoveInMoveOutBaseRequest.h"

@interface AddRentReadyUnitsRequest : MoveInMoveOutBaseRequest
//action=addRenovatedUnits&
//demo=Testing demo&
//cabinets=Testing cabinets&
//tops=Testing tops&
//plank=Testing plank&
//maint=Testing maint&
//clean=Testing clean&
//locks=Testing locks&
//comments=Testing comments

@property (nonatomic,strong) NSString *apt;
@property (nonatomic,strong) NSString *type;
@property (nonatomic,strong) NSString *finish_date;
@property (nonatomic,strong) NSString *size;
@property (nonatomic,strong) NSString *keys;




//action=
//addTurnover&







@end

//https://www.whitelakeinteractive.com/lindy-certification/certificate-production_api/api/snow-log-api.php?action=addRecord

