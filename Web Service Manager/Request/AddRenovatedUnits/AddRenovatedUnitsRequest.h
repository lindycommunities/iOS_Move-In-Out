//
//  AddVideoRequest.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 18/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "MoveInMoveOutBaseRequest.h"

@interface AddRenovatedUnitsRequest : MoveInMoveOutBaseRequest
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
@property (nonatomic,strong) NSString *move_out;
@property (nonatomic,strong) NSString *move_in;
@property (nonatomic,strong) NSString *size;



@property (nonatomic,strong) NSString *demo;

@property (nonatomic,strong) NSString *cabinets;


@property (nonatomic,strong) NSString *tops;


@property (nonatomic,strong) NSString *plank;


@property (nonatomic,strong) NSString *maint;



@property (nonatomic,strong) NSString *clean;


@property (nonatomic,strong) NSString *locks;

@property (nonatomic,strong) NSString *comments;


//action=
//addTurnover&







@end

//https://www.whitelakeinteractive.com/lindy-certification/certificate-production_api/api/snow-log-api.php?action=addRecord

