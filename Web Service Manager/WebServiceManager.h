//
//  VideosManager.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 18/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "MoveInMoveOutBaseManager.h"
//#import "AcademyAddEfficiencyRequest.h"
//#import "AdminGetVideoMoveInMoveOutistRequest.h"
//#import "AWGetVideoMoveInMoveOutistResponse.h"
//#import "AcademyGetLevelMoveInMoveOutistResponse.h"
//#import "AcademyGetEfficiencyRequest.h"
//
//
//
#import "GetPropertyListResponse.h"
#import "GetEquipmentListResponse.h"
#import "GetWeightListResponse.h"
#import "GetQuantityListResponse.h"
#import "AddMoveInMoveOutRequest.h"
#import "GetMoveInMoveOutResponse.h"
#import "AddSnowLogImageRequest.h"
#import "ValidateMoveInMoveOutRequest.h"
#import "ValidateMoveInMoveOutResponse.h"
#import "AddMoveInMoveOutServiceRequest.h"
#import "SubmitMoveInMoveOutRequest.h"
#import "GetPropertyUnitsListResponse.h"
#import "GetTechnicianListResponse.h"
#import "User.h"
#import "MyJobsListResponse.h"
#import "MyJobDetail.h"
#import "CompleteUnitListResponse.h"
#import "RentAdjustmentListResponse.h"
#import "RentAdjustmenID.h"
#import "PreventionMaintenaneID.h"




#import "AddTurnOverRequest.h"
#import "AddRenovatedUnitsRequest.h"
#import "AddRentReadyUnitsRequest.h"
#import "LoginRequest.h"
#import "MyJobsListRequest.h"
#import "MyJobsDetailsRequest.h"
#import "MyJobsCompleteRequest.h"
#import "MyJobsCountRequest.h"
#import "UpdateToken.h"
#import "WorkOrderListRequest.h"
#import "AssignUnitToTechnicianRequest.h"
#import "GetUnitsRequest.h"
#import "RentAdjustmentListRequest.h"
#import "UpdateRentAdjustmenRequest.h"
#import "UpdateRentAdjustmenAminitiesRequest.h"
#import "AddPreventionRequest.h"
#import "AddPreventionServiceRequestRequest.h"



@interface WebServiceManager: MoveInMoveOutBaseManager{
    
}

//- (void)GetVideosForRequest:(AdminGetVideoMoveInMoveOutistRequest *)request
//                    success:(successBlock)success
//                    failure:(failureBlock)failure;
//
//
- (void)AddMoveInMoveOutFormForRequest:(AddMoveInMoveOutRequest *)addSnowLogRequest
                   success:(successBlock)success
                   failure:(failureBlock)failure;
- (void)AddMoveInMoveOutAllOKServiceForRequest:(AddMoveInMoveOutServiceRequest *)addSnowLogRequest
                                       success:(successBlock)success
                                       failure:(failureBlock)failure;


- (void)AddMoveInMoveOutServiceForRequest:(AddMoveInMoveOutServiceRequest *)addSnowLogRequest
                               success:(successBlock)success
                               failure:(failureBlock)failure;

- (void)SubmitMoveInMoveOutForRequest:(SubmitMoveInMoveOutRequest *)addSnowLogRequest
                                  success:(successBlock)success
                                  failure:(failureBlock)failure;

- (void)SubmitLoginRequest:(LoginRequest *)addSnowLogRequest
                              success:(successBlock)success
                              failure:(failureBlock)failure;

- (void)GetMyJobsRequest:(MyJobsListRequest *)addSnowLogRequest
                   success:(successBlock)success
                   failure:(failureBlock)failure;

- (void)GetMyJobsDetailsRequest:(MyJobsDetailsRequest *)addSnowLogRequest
                 success:(successBlock)success
                 failure:(failureBlock)failure;


- (void)UpdateMyDeviceTokenRequest:(UpdateToken *)addSnowLogRequest
                           success:(successBlockWithDictionay)success
                           failure:(failureBlock)failure;


- (void)GetWorkOrderRequest:(WorkOrderListRequest *)addSnowLogRequest
                    success:(successBlock)success
                    failure:(failureBlock)failure;



- (void)GetMyJobsCountRequest:(MyJobsCountRequest *)addSnowLogRequest
                 success:(successBlockWithDictionay)success
                 failure:(failureBlock)failure;
- (void)GetMyJobsComleteRequest:(MyJobsCompleteRequest *)addSnowLogRequest
                 success:(successBlockWithDictionay)success
                 failure:(failureBlock)failure;


- (void)ValidateMoveInMoveOutFormForRequest:(ValidateMoveInMoveOutRequest *)addSnowLogRequest
                               success:(successBlock)success
                               failure:(failureBlock)failure;

- (void)GetMoveInFormForRequest:(ValidateMoveInMoveOutRequest *)addSnowLogRequest
                                    success:(successBlock)success
                        failure:(failureBlock)failure;




- (void)AddSnowLogFormImagesForRequest:(AddSnowLogImageRequest *)addSnowLogRequest
                         success:(successBlock)success
                         failure:(failureBlock)failure;


//- (void)GetPropertyForRequest:(MoveInMoveOutBaseRequest *)request
//                    success:(successBlock)success
//                    failure:(failureBlock)failure;


//- (void)GetEfficiencyListForRequest:(AcademyGetEfficiencyRequest *)request
//                              success:(successBlock)success
//                              failure:(failureBlock)failure;
//
//
- (void)GetPropertyListWithSuccess:(successBlock)success
                                        failure:(failureBlock)failure;
- (void)GetPropertyUnitListWithSuccess:(successBlock)success
failure:(failureBlock)failur;

- (void)GetEquipmentListWithSuccess:(successBlock)success
                           failure:(failureBlock)failure;
- (void)GetWeightListWithSuccess:(successBlock)success
                           failure:(failureBlock)failure;
- (void)GetQuantityListWithSuccess:(successBlock)success
                           failure:(failureBlock)failure;



- (void)AddTurnOverFormForRequest:(AddTurnOverRequest *)addSnowLogRequest
                               success:(successBlock)success
                               failure:(failureBlock)failure;

- (void)AddRenovatedUnitsFormForRequest:(AddRenovatedUnitsRequest *)addSnowLogRequest
                          success:(successBlock)success
                          failure:(failureBlock)failure;

- (void)AddRentReadyUnitsFormForRequest:(AddRentReadyUnitsRequest *)addSnowLogRequest
                                success:(successBlock)success
                                failure:(failureBlock)failure;

- (void)GetPriceListWithSuccess:(successBlock)success
                            failure:(failureBlock)failure;

- (void)GetTechnicianListWithSuccess:(successBlock)success
                        failure:(failureBlock)failure;
- (void)GetManagerListWithSuccess:(successBlock)success
                             failure:(failureBlock)failure;



- (void)GetOfflineMoveOutStatusListWithSuccess:(successBlock)success
                                       failure:(failureBlock)failure;
- (void)GetAllCompletedUnitsWithSuccess:(successBlock)success
                                failure:(failureBlock)failure;

- (void)AssignUnitToTechnicianForRequest:(AssignUnitToTechnicianRequest *)addSnowLogRequest
                                success:(successBlock)success
                                failure:(failureBlock)failure;

- (void)GetPropertyUnitListWithRequest:(GetUnitsRequest *)addSnowLogRequest
                        success:(successBlock)success
                               failure:(failureBlock)failure;
- (void)GetAllTechnicianMoveInUnitsWithSuccess:(successBlock)success
                                       failure:(failureBlock)failure;


- (BOOL)isInternetWorkingFine;

- (void)GetRentAdjustmentForRequest:(RentAdjustmentListRequest *)addSnowLogRequest
                        success:(successBlock)success
                        failure:(failureBlock)failure;

- (void)UpdateRentAdjustmenForRequest:(UpdateRentAdjustmenRequest *)addSnowLogRequest
                              success:(successBlock)success
                              failure:(failureBlock)failure;
- (void)UpdateRentAdjustmenAminitiesForRequest:(UpdateRentAdjustmenAminitiesRequest *)addSnowLogRequest
                              success:(successBlock)success
                              failure:(failureBlock)failure;

- (void)GetOfflineRentUnitsListWithSuccess:(successBlock)success
                                   failure:(failureBlock)failure;

- (void)GetOfflineRentAmenitiesDescListWithSuccess:(successBlock)success
                                   failure:(failureBlock)failure;

- (void)GetOfflineRentUniqueAmeniiesListWithSuccess:(successBlock)success
                                   failure:(failureBlock)failure;

- (void)submitPreventionFormDataForRequest:(AddPreventionRequest *)addSnowLogRequest
                                   success:(successBlock)success
                                   failure:(failureBlock)failure;

- (void)submitPreventionServiceDataForRequest:(AddPreventionServiceRequestRequest *)addSnowLogRequest
                                      success:(successBlock)success
                                      failure:(failureBlock)failure;

//- (void)GetEfficiencyLevelsForPlayerWithSuccess:(successBlock)success
//                                        failure:(failureBlock)failure;
//

@end
