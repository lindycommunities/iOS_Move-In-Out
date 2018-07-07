//
//  OfflineManager.h
//  Move In-Out
//
//  Created by S S D on 12/10/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OfflineManager : NSObject
+ (instancetype)sharedInstance;
-(NSArray*)getAllUnits;
-(void)saveAllUnits;
-(void)ClearOfflineStorage;
-(void)showToastForText:(NSString *)text;
@property(nonatomic,retain)NSString *isRefresh;

@property(nonatomic,retain)NSArray *arrPropertyUnits;
@property(nonatomic,retain)NSArray *AllTechnicianData;
-(void)SaveTechnicianData;
-(NSArray*)getAllTechnicianData;


-(void)SaveManagerData;
-(NSArray*)getAllManagerData;


-(void)SaveFormData:(NSMutableArray*)ValueArray;
-(void)SaveServiceData:(NSMutableArray*)DataArray;
-(NSMutableArray*)getFormData;
-(NSMutableArray*)getServiceData;

-(void)SaveServiceAllOKData:(NSMutableArray*)DataArray;
-(NSMutableArray*)getServiceAllOKData;



-(void)SaveFinalFormData:(NSMutableArray*)ValueArray;
-(NSMutableArray*)getFinalFormData;
-(void)SavePriceData;
-(NSMutableDictionary*)getPriceData;
-(NSMutableDictionary*)getOfflineMoveOutStatus;


-(NSMutableArray*)getAllTurnOverData;

-(void)SaveAllTurnOverData:(NSMutableArray*)ValueArray;

-(NSMutableArray*)getAllRenovatedUnitsData;

-(void)SaveAllRenovatedUnitsData:(NSMutableArray*)ValueArray;

-(NSMutableArray*)getAllRentReadyUnitsData;

-(void)SaveAllRentReadyUnitsData:(NSMutableArray*)ValueArray;

-(NSMutableDictionary*)getAllRentUnitsData;
-(void)SaveAllRentUnitsData;

-(NSMutableDictionary*)getAllRentAmenitiesDescData;
-(void)SaveAllRentAmenitiesDescData;


-(void)SaveRentUnitsFormData:(NSMutableArray*)ValueArray;
-(NSMutableArray*)getRentUnitsFormData;
-(void)SaveRentAmenitiesDescFormData:(NSMutableArray*)ValueArray;
-(NSMutableArray*)getRentAmenitiesDescFormData;


-(NSMutableArray*)getAllRentUniqueAmeniiesData;
-(void)SaveAllRentUniqueAmeniiesData;

-(NSMutableArray*)getPreventionFormData;
-(void)savePreventionFormData:(NSMutableArray*)ValueArray;

-(NSMutableArray*)getPreventionServiceData;
-(void)savePreventionServiceData:(NSMutableArray*)DataArray;

-(void)startLoading;
-(void)stopLoading;

@end
