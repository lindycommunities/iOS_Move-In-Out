//
//  VideosManager.m
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 18/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "WebServiceManager.h"

@implementation WebServiceManager

+ (instancetype)sharedInstance {
    static WebServiceManager *_sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[WebServiceManager alloc] init];
    });
    return _sharedInstance;
}


//- (void)GetVideosForRequest:(AdminGetVideoMoveInMoveOutistRequest *)request
//                     success:(successBlock)success
//                     failure:(failureBlock)failure {
//    
//    request.action = @"get_trainer_videos";
//
//    
//    AWWebRequestHelper *webHelper = [AWWebRequestHelper sharedInstance];
//    [webHelper hitRequestServiceFor:request success:^(NSDictionary *result) {
//        
//        AWGetVideoMoveInMoveOutistResponse *response = [[AWGetVideoMoveInMoveOutistResponse alloc]initWithDictionary:result error:nil];
//        success(response);
//        
//    } failure:^(CustomError *error) {
//        failure(error);
//    }];
//    
//}
//
//
////- (void)GetEfficiencySkillsForRequest:(AcademyGetSkillListRequest *)request
////                              success:(successBlock)success
////                              failure:(failureBlock)failure{
////    
////    
////    request.action = @"get_all_expertise_areas";
////    
////    
////    AWWebRequestHelper *webHelper = [AWWebRequestHelper sharedInstance];
////    [webHelper hitRequestServiceFor:request success:^(NSDictionary *result) {
////        
////        AcademyGetSkillListResponse *response = [[AcademyGetSkillListResponse alloc]initWithDictionary:result error:nil];
////        success(response);
////        
////    } failure:^(CustomError *error) {
////        failure(error);
////    }];
////
////    
////}
//
- (void)GetPropertyListWithSuccess:(successBlock)success
                                    failure:(failureBlock)failure {
    
    MoveInMoveOutBaseRequest *getOpponentListRequest = [[MoveInMoveOutBaseRequest alloc]init];
    
    getOpponentListRequest.action = @"getProperty";
    getOpponentListRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];
    
    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:getOpponentListRequest success:^(NSDictionary *result) {
        
        GetPropertyListResponse *response = [[GetPropertyListResponse alloc]initWithDictionary:result error:nil];
        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
}
- (void)GetPropertyUnitListWithSuccess:(successBlock)success
                           failure:(failureBlock)failure {
    
    MoveInMoveOutBaseRequest *getOpponentListRequest = [[MoveInMoveOutBaseRequest alloc]init];
    
    
//    NSString *userID=[[NSUserDefaults standardUserDefaults]valueForKey:@"userID"];;

    getOpponentListRequest.action = [NSString stringWithFormat:@"getUnits"];
    getOpponentListRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:getOpponentListRequest success:^(NSDictionary *result) {
        
        GetPropertyUnitsListResponse *response = [[GetPropertyUnitsListResponse alloc]initWithDictionary:result error:nil];
        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
}
- (void)GetPropertyUnitListWithRequest:(GetUnitsRequest *)addSnowLogRequest
                               success:(successBlock)success
                               failure:(failureBlock)failure{
    
    
    addSnowLogRequest.action = @"getUnits";
    addSnowLogRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];
    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        
        GetPropertyUnitsListResponse *response = [[GetPropertyUnitsListResponse alloc]initWithDictionary:result error:nil];
        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];

    
    
}

- (void)GetPriceListWithSuccess:(successBlock)success
                        failure:(failureBlock)failure{
    
    MoveInMoveOutBaseRequest *getOpponentListRequest = [[MoveInMoveOutBaseRequest alloc]init];
    
    getOpponentListRequest.action = @"getCategoryPriceAll";
    getOpponentListRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:getOpponentListRequest success:^(NSDictionary *result) {
        
        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];

    
}
- (void)GetTechnicianListWithSuccess:(successBlock)success
                             failure:(failureBlock)failure{
    MoveInMoveOutBaseRequest *getOpponentListRequest = [[MoveInMoveOutBaseRequest alloc]init];
    
    getOpponentListRequest.action = @"getAllTechnician";
    getOpponentListRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:getOpponentListRequest success:^(NSDictionary *result) {
        
        
        GetTechnicianListResponse *response = [[GetTechnicianListResponse alloc]initWithDictionary:result error:nil];
        success(response);

        
        
    } failure:^(CustomError *error) {
        failure(error);
    }];

}
- (void)GetManagerListWithSuccess:(successBlock)success
                          failure:(failureBlock)failure{
    
    MoveInMoveOutBaseRequest *getOpponentListRequest = [[MoveInMoveOutBaseRequest alloc]init];
    
    getOpponentListRequest.action = @"getAllManagers";
    getOpponentListRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];
    
    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:getOpponentListRequest success:^(NSDictionary *result) {
        
        
        GetTechnicianListResponse *response = [[GetTechnicianListResponse alloc]initWithDictionary:result error:nil];
        success(response);
        
        
        
    } failure:^(CustomError *error) {
        failure(error);
    }];

}




- (void)GetQuantityListWithSuccess:(successBlock)success
                           failure:(failureBlock)failure {
    
    MoveInMoveOutBaseRequest *getOpponentListRequest = [[MoveInMoveOutBaseRequest alloc]init];
    
    getOpponentListRequest.action = @"getQuantity";
    getOpponentListRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:getOpponentListRequest success:^(NSDictionary *result) {
        
        GetQuantityListResponse *response = [[GetQuantityListResponse alloc]initWithDictionary:result error:nil];
        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
}
- (void)GetEquipmentListWithSuccess:(successBlock)success
                           failure:(failureBlock)failure {
    
    MoveInMoveOutBaseRequest *getOpponentListRequest = [[MoveInMoveOutBaseRequest alloc]init];
    
    getOpponentListRequest.action = @"getEquipment";
    getOpponentListRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:getOpponentListRequest success:^(NSDictionary *result) {
        
        GetEquipmentListResponse *response = [[GetEquipmentListResponse alloc]initWithDictionary:result error:nil];
        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
}
- (void)GetWeightListWithSuccess:(successBlock)success
                           failure:(failureBlock)failure {
    
    MoveInMoveOutBaseRequest *getOpponentListRequest = [[MoveInMoveOutBaseRequest alloc]init];
    
    getOpponentListRequest.action = @"getWeight";
    getOpponentListRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:getOpponentListRequest success:^(NSDictionary *result) {
        
        GetWeightListResponse *response = [[GetWeightListResponse alloc]initWithDictionary:result error:nil];
        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
}
//- (void)GetEfficiencyLevelsForPlayerWithSuccess:(successBlock)success
//                                        failure:(failureBlock)failure {
//    
//    AWBaseRequest *getOpponentListRequest = [[AWBaseRequest alloc]init];
//    
//    getOpponentListRequest.action = @"get_levels";
//    
//    AWWebRequestHelper *webHelper = [AWWebRequestHelper sharedInstance];
//    [webHelper hitRequestServiceFor:getOpponentListRequest success:^(NSDictionary *result) {
//        
//        AcademyGetLevelMoveInMoveOutistResponse *response = [[AcademyGetLevelMoveInMoveOutistResponse alloc]initWithDictionary:result error:nil];
//        success(response);
//        
//    } failure:^(CustomError *error) {
//        failure(error);
//    }];
//    
//}
//
//
//
//
//
- (void)AddMoveInMoveOutFormForRequest:(AddMoveInMoveOutRequest *)addSnowLogRequest
                         success:(successBlock)success
                         failure:(failureBlock)failure;
{

    addSnowLogRequest.action = @"addRecord";
    addSnowLogRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        
        GetMoveInMoveOutResponse *response = [[GetMoveInMoveOutResponse alloc]initWithDictionary:result error:nil];
        
        success(response);

        
//        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
//        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
}
- (void)AddTurnOverFormForRequest:(AddTurnOverRequest *)addSnowLogRequest
                          success:(successBlock)success
                          failure:(failureBlock)failure{
    
    
    addSnowLogRequest.action = @"addTurnover";
    addSnowLogRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        
        
        
        
                MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
                success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];

    
}
- (void)AddRenovatedUnitsFormForRequest:(AddRenovatedUnitsRequest *)addSnowLogRequest
                                success:(successBlock)success
                                failure:(failureBlock)failure{
    
    addSnowLogRequest.action = @"addRenovatedUnits";
    addSnowLogRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        
        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];

    
    
}
- (void)AddRentReadyUnitsFormForRequest:(AddRentReadyUnitsRequest *)addSnowLogRequest
                                success:(successBlock)success
                                failure:(failureBlock)failure{
    
    addSnowLogRequest.action = @"addRentReadyUnits";
    addSnowLogRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        
        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
    
    
}




- (void)AddMoveInMoveOutServiceForRequest:(AddMoveInMoveOutServiceRequest *)addSnowLogRequest
                                  success:(successBlock)success
                                  failure:(failureBlock)failure{
    
    addSnowLogRequest.action = @"addServices";
    addSnowLogRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        
        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        
        success(response);
        
        
        //        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        //        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];

}
- (void)AddMoveInMoveOutAllOKServiceForRequest:(AddMoveInMoveOutServiceRequest *)addSnowLogRequest
                                  success:(successBlock)success
                                  failure:(failureBlock)failure{
    
    addSnowLogRequest.action = @"addServicesAllOk";
    addSnowLogRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        
        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        
        success(response);
        
        
        //        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        //        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
}
- (void)SubmitMoveInMoveOutForRequest:(SubmitMoveInMoveOutRequest *)addSnowLogRequest
                              success:(successBlock)success
                              failure:(failureBlock)failure{
    
    
    addSnowLogRequest.action = @"submitRecord";
    addSnowLogRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        
        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        
        success(response);
        
        
        //        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        //        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];

}
- (void)SubmitLoginRequest:(LoginRequest *)addSnowLogRequest
                   success:(successBlock)success
                   failure:(failureBlock)failure{
    
    addSnowLogRequest.action = @"checkLogin";
    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        
        User *response = [[User alloc]initWithDictionary:[result valueForKey:@"result"] error:nil];
        
        success(response);
        
        
        //        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        //        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];

    
    
}
- (void)GetMyJobsRequest:(MyJobsListRequest *)addSnowLogRequest
                 success:(successBlock)success
                 failure:(failureBlock)failure{
    addSnowLogRequest.action = @"getTechnicianTaskList";
    addSnowLogRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        
        MyJobsListResponse *response = [[MyJobsListResponse alloc]initWithDictionary:result  error:nil];
        
        success(response);
        
        
        //        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        //        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];

    
}
- (void)GetMyJobsDetailsRequest:(MyJobsDetailsRequest *)addSnowLogRequest
                        success:(successBlock)success
                        failure:(failureBlock)failure{
    addSnowLogRequest.action = @"getTechnicianTaskDetail";
    addSnowLogRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        NSDictionary *dic = [result valueForKey:@"result"];
        
        MyJobDetail *response = [[MyJobDetail alloc]initWithDictionary:dic  error:nil];
        
        success(response);
        
        
        //        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        //        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];

    
}
- (void)GetMyJobsCountRequest:(MyJobsCountRequest *)addSnowLogRequest
                      success:(successBlockWithDictionay)success
                      failure:(failureBlock)failure{
    
    addSnowLogRequest.action = @"getTaskCount";
    addSnowLogRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        
        success(result);
        
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    

    
    
}

- (void)GetMyJobsComleteRequest:(MyJobsCompleteRequest *)addSnowLogRequest
                        success:(successBlockWithDictionay)success
                        failure:(failureBlock)failure{
    
    
    addSnowLogRequest.action = @"taskCompleted";
    addSnowLogRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        
        success(result);
        
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    

    
}

- (void)UpdateMyDeviceTokenRequest:(UpdateToken *)addSnowLogRequest
                      success:(successBlockWithDictionay)success
                      failure:(failureBlock)failure{
    
    addSnowLogRequest.action = @"updateDeviceToken";
    addSnowLogRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        
        success(result);
        
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
    
    
    
}
- (void)GetWorkOrderRequest:(WorkOrderListRequest *)addSnowLogRequest
                 success:(successBlock)success
                 failure:(failureBlock)failure{
    addSnowLogRequest.action = @"getWorkOrder";
    addSnowLogRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        
        MyJobsListResponse *response = [[MyJobsListResponse alloc]initWithDictionary:result  error:nil];
        
        success(response);
        
        
        //        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        //        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
    
}


- (void)ValidateMoveInMoveOutFormForRequest:(ValidateMoveInMoveOutRequest *)addSnowLogRequest
                                    success:(successBlock)success
                                    failure:(failureBlock)failure{

    addSnowLogRequest.action = @"checkMoveOutPending";
    addSnowLogRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        
        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        
        success(response);
        
        
        //        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        //        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];

    

}
- (void)GetMoveInFormForRequest:(ValidateMoveInMoveOutRequest *)addSnowLogRequest
                        success:(successBlock)success
                        failure:(failureBlock)failure{

    addSnowLogRequest.action = @"getSingleRecordDtl";
    addSnowLogRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        
        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        
        success(response);
        
        
        //        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        //        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
    
    
}


- (void)AddSnowLogFormImagesForRequest:(AddSnowLogImageRequest *)addSnowLogRequest
                         success:(successBlock)success
                         failure:(failureBlock)failure;
{
    
    addSnowLogRequest.action = @"addImages";
    addSnowLogRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        
//        GetSnowLogResponse *response = [[GetSnowLogResponse alloc]initWithDictionary:result error:nil];
//        
//        success(response);
        
        
                MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
                success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
}
//- (void)GetEfficiencyListForRequest:(AcademyGetEfficiencyRequest *)request
//                            success:(successBlock)success
//                            failure:(failureBlock)failure{
//    
//    
//    AWBaseRequest *getOpponentListRequest = [[AWBaseRequest alloc]init];
//    
//    getOpponentListRequest.action = @"get_all_efficiencies";
//    
//    AWWebRequestHelper *webHelper = [AWWebRequestHelper sharedInstance];
//    [webHelper hitRequestServiceFor:getOpponentListRequest success:^(NSDictionary *result) {
//        
//        
//        
//        AcademyGetSkillListResponse *response = [[AcademyGetSkillListResponse alloc]initWithDictionary:result error:nil];
//        success(response);
//        
//    } failure:^(CustomError *error) {
//        failure(error);
//    }];
//
//}

- (void)GetOfflineMoveOutStatusListWithSuccess:(successBlock)success
                        failure:(failureBlock)failure{
    
    MoveInMoveOutBaseRequest *getOpponentListRequest = [[MoveInMoveOutBaseRequest alloc]init];
    
    getOpponentListRequest.action = @"getOfflineMoveOutStatus";
    getOpponentListRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:getOpponentListRequest success:^(NSDictionary *result) {
        
        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
    
}
- (void)GetAllCompletedUnitsWithSuccess:(successBlock)success
                           failure:(failureBlock)failure {
    
    MoveInMoveOutBaseRequest *getOpponentListRequest = [[MoveInMoveOutBaseRequest alloc]init];
    
    getOpponentListRequest.action = @"getAllCompletedUnits";
    getOpponentListRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:getOpponentListRequest success:^(NSDictionary *result) {
        
        CompleteUnitListResponse *response = [[CompleteUnitListResponse alloc]initWithDictionary:result error:nil];
        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
}
- (void)AssignUnitToTechnicianForRequest:(AssignUnitToTechnicianRequest *)addSnowLogRequest
                                 success:(successBlock)success
                                 failure:(failureBlock)failure{
    
    
    
    addSnowLogRequest.action = @"addTechnicianUnits";
    addSnowLogRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        
        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];

    
    
}
- (void)GetAllTechnicianMoveInUnitsWithSuccess:(successBlock)success
                                failure:(failureBlock)failure {
    
    MoveInMoveOutBaseRequest *getOpponentListRequest = [[MoveInMoveOutBaseRequest alloc]init];
    
    getOpponentListRequest.action = @"getTechnicianMoveInUnits";
    getOpponentListRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:getOpponentListRequest success:^(NSDictionary *result) {
        
        CompleteUnitListResponse *response = [[CompleteUnitListResponse alloc]initWithDictionary:result error:nil];
        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
}
- (void)GetRentAdjustmentForRequest:(RentAdjustmentListRequest *)addSnowLogRequest
                            success:(successBlock)success
                            failure:(failureBlock)failure{
    
    addSnowLogRequest.action = @"getRentUnitDtl";
    addSnowLogRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        RentAdjustmentListResponse *response = [[RentAdjustmentListResponse alloc]initWithDictionary:result  error:nil];
        
        success(response);
        
        
        //        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        //        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];

    
    
}

- (BOOL)isInternetWorkingFine{
    
    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    
    return [webHelper isInternetWorking];

    
}
- (void)UpdateRentAdjustmenForRequest:(UpdateRentAdjustmenRequest *)addSnowLogRequest
                              success:(successBlock)success
                              failure:(failureBlock)failure{
    
    addSnowLogRequest.action = @"updateRentUnit";
    addSnowLogRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        RentAdjustmenID *response = [[RentAdjustmenID alloc]initWithDictionary:result error:nil];
        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    

    
}
- (void)UpdateRentAdjustmenAminitiesForRequest:(UpdateRentAdjustmenAminitiesRequest *)addSnowLogRequest
                                       success:(successBlock)success
                                       failure:(failureBlock)failure{
    
    addSnowLogRequest.action = @"updateRentUnitAmenities";
    addSnowLogRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        
        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        success(response);

        
    } failure:^(CustomError *error) {
        failure(error);
    }];

    
    
}
- (void)GetOfflineRentUnitsListWithSuccess:(successBlock)success
                                       failure:(failureBlock)failure{
    
    MoveInMoveOutBaseRequest *getOpponentListRequest = [[MoveInMoveOutBaseRequest alloc]init];
    
    getOpponentListRequest.action = @"getRentUnits";
    getOpponentListRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:getOpponentListRequest success:^(NSDictionary *result) {
        
        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
    
}
- (void)GetOfflineRentAmenitiesDescListWithSuccess:(successBlock)success
                                           failure:(failureBlock)failure{
    
    MoveInMoveOutBaseRequest *getOpponentListRequest = [[MoveInMoveOutBaseRequest alloc]init];
    
    getOpponentListRequest.action = @"getRentAmenitiesDesc";
    getOpponentListRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:getOpponentListRequest success:^(NSDictionary *result) {
        
        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
}
- (void)GetOfflineRentUniqueAmeniiesListWithSuccess:(successBlock)success
                                            failure:(failureBlock)failure{
    
    MoveInMoveOutBaseRequest *getOpponentListRequest = [[MoveInMoveOutBaseRequest alloc]init];
    
    getOpponentListRequest.action = @"getRentUniqueAmeniies";
    getOpponentListRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:getOpponentListRequest success:^(NSDictionary *result) {
        
        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];

    
}

- (void)submitPreventionFormDataForRequest:(AddPreventionRequest *)addSnowLogRequest
                              success:(successBlock)success
                              failure:(failureBlock)failure{
    
    addSnowLogRequest.action = @"addPreventMaint";
    addSnowLogRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];
    
    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        PreventionMaintenaneID *response = [[PreventionMaintenaneID alloc]initWithDictionary:result error:nil];
        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
    
    
}

- (void)submitPreventionServiceDataForRequest:(AddPreventionServiceRequestRequest *)addSnowLogRequest
                                       success:(successBlock)success
                                       failure:(failureBlock)failure{
    
    addSnowLogRequest.action = @"addPreventMaintService";
    addSnowLogRequest.comm_bld_id = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];
    
    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        
        MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:result error:nil];
        success(response);
        
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
    
    
}


@end
