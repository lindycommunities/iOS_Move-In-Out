//
//  OfflineManager.m
//  Move In-Out
//
//  Created by S S D on 12/10/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import "OfflineManager.h"
#import "WebServiceManager.h"
#import "AppDelegate.h"
#import "MBProgressHud.h"

@implementation OfflineManager


+ (instancetype)sharedInstance {
    static OfflineManager *_sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[OfflineManager alloc] init];
    });
    return _sharedInstance;
}

-(void)ClearOfflineStorage{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:@"PropertyUnits"];
    [userDefaults removeObjectForKey:@"TechnicianData"];
    [userDefaults removeObjectForKey:@"ManagerData"];

    
    [userDefaults removeObjectForKey:@"PropertyPrices"];
    [userDefaults removeObjectForKey:@"OfflineMoveOutStatus"];
    if([self.isRefresh isEqualToString:@"YES"]){
        
        [userDefaults removeObjectForKey:@"OfflineRentUnits"];
        [userDefaults removeObjectForKey:@"RentAmenitiesDesc"];
        [userDefaults removeObjectForKey:@"OfflineRentUniqueAmeniies"];

        
        
  
    }



    
    //[userDefaults removeObjectForKey:@"FormData"];
    //[userDefaults removeObjectForKey:@"ServiceData"];
    //[userDefaults removeObjectForKey:@"FinalFormData"];
    //[userDefaults removeObjectForKey:@"TurnOver"];




    
    
    [userDefaults synchronize];

    
    
}
-(NSArray*)getAllUnits{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:@"PropertyUnits"];
    NSArray *arrayOfImages = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return arrayOfImages;

}
-(NSArray*)getAllTechnicianData{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:@"TechnicianData"];
    NSArray *arrayOfImages = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return arrayOfImages;

}
-(void)SaveManagerData{
    
  //  [self startLoading];
    
    
    [[WebServiceManager sharedInstance]GetManagerListWithSuccess:^(MoveInMoveOutBaseResponse *result) {
        
      //  [self stopLoading];
        GetTechnicianListResponse *response = (GetTechnicianListResponse *)result;
        if (response.result.count) {
            
            self.AllTechnicianData = [[NSArray alloc]initWithArray:response.result];
            
            NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.AllTechnicianData];
            [currentDefaults setObject:data forKey:@"ManagerData"];
            [currentDefaults synchronize];
            //[self SavePriceData];
            
            
            
        }
        else{
            
            [self showToastForText:@"No Property Found"];
            
        }
        
        
        
        
    } failure:^(CustomError *error) {
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
          //  [self stopLoading];
            
            [self showToastForText:@"Cannot fetch Manager  List. Please try again"];
        });
        
        
    }];

    
    
}
-(NSArray*)getAllManagerData{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:@"ManagerData"];
    NSArray *arrayOfImages = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return arrayOfImages;
    
}


-(void)saveAllUnits{
    
    [self startLoading];
    
    
    //    NSString *userID=[[NSUserDefaults standardUserDefaults]valueForKey:@"userID"];;
    
    GetUnitsRequest * request = [[GetUnitsRequest alloc]init];
    request.user_id=[[NSUserDefaults standardUserDefaults]valueForKey:@"userID"];;
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    [[WebServiceManager sharedInstance]GetPropertyUnitListWithRequest:request success:^(MoveInMoveOutBaseResponse *result) {
        
        [self stopLoading];
        
        GetPropertyUnitsListResponse *response = (GetPropertyUnitsListResponse *)result;
        if (response.result.count) {
            self.arrPropertyUnits = [[NSArray alloc]initWithArray:response.result];
            //            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            //            [userDefaults setObject:self.arrPropertyUnits forKey:@"PropertyUnits"];
            
            NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.arrPropertyUnits];
            [currentDefaults setObject:data forKey:@"PropertyUnits"];
            [currentDefaults synchronize];
            
            [self SaveTechnicianData];
            
            
            
        }
        else{
            
            [self showToastForText:@"No Units Found"];
            
        }
        
    } failure:^(CustomError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self stopLoading];
            
            [self showToastForText:@"Cannot fetch Units. Please try again"];

            
        });

        

    }];
    
}
-(void)saveAllUnitsOLD{
    
    [self startLoading];
    
    
    //    NSString *userID=[[NSUserDefaults standardUserDefaults]valueForKey:@"userID"];;

    
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];

    [[WebServiceManager sharedInstance]GetPropertyUnitListWithSuccess:^(MoveInMoveOutBaseResponse *result) {
        
        [self stopLoading];
        
        GetPropertyUnitsListResponse *response = (GetPropertyUnitsListResponse *)result;
        if (response.result.count) {
            self.arrPropertyUnits = [[NSArray alloc]initWithArray:response.result];
//            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//            [userDefaults setObject:self.arrPropertyUnits forKey:@"PropertyUnits"];
            
            NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.arrPropertyUnits];
            [currentDefaults setObject:data forKey:@"PropertyUnits"];
            [currentDefaults synchronize];
            
            [self SaveTechnicianData];

            
            
        }
        else{
            
            [self showToastForText:@"No Property Found"];
            
        }
        
    } failure:^(CustomError *error) {
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self stopLoading];

            [self showToastForText:@"Cannot fetch Property. Please try again"];

        });
        
    }];
    
}
-(void)SaveTechnicianData{
    
    
    
    [self startLoading];
    
    
    [[WebServiceManager sharedInstance]GetTechnicianListWithSuccess:^(MoveInMoveOutBaseResponse *result) {
        
        [self stopLoading];
        GetTechnicianListResponse *response = (GetTechnicianListResponse *)result;
        if (response.result.count) {
            
            self.AllTechnicianData = [[NSArray alloc]initWithArray:response.result];
            
            NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.AllTechnicianData];
            [currentDefaults setObject:data forKey:@"TechnicianData"];
            [currentDefaults synchronize];
            [self SavePriceData];
            [self SaveManagerData];
            
            
            
        }
        else{
            
            [self showToastForText:@"No Property Found"];
            
        }
        
        
        
        
    } failure:^(CustomError *error) {
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self stopLoading];
            
            [self showToastForText:@"Cannot fetch Technician  List. Please try again"];
        });
        
       
    }];
    
    
}
-(void)showToastForText:(NSString *)text{
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];

    
    // [KSToastView ks_showToast:text duration:3];
    
    
    //    NSDictionary *options = @{
    //                              kCRToastTextKey :text,
    //                              kCRToastTextAlignmentKey : @(NSTextAlignmentCenter),
    //                              kCRToastBackgroundColorKey : [UIColor redColor],
    //                              kCRToastAnimationInTypeKey : @(CRToastAnimationTypeGravity),
    //                              kCRToastAnimationOutTypeKey : @(CRToastAnimationTypeGravity),
    //                              kCRToastAnimationInDirectionKey : @(CRToastAnimationDirectionLeft),
    //                              kCRToastAnimationOutDirectionKey : @(CRToastAnimationDirectionRight)
    //                              };
    //    [CRToastManager showNotificationWithOptions:options
    //                                completionBlock:^{
    //                                    NSLog(@"Completed");
    //                                }];
    //
    //
    
    if ([UIAlertController class])
    {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:text preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        // [self presentViewController:alertController animated:YES completion:nil];
        //        [[[UIApplication sharedApplication]keyWindow]presentViewController:alertController animated:YES completion:nil]];
        [app.window.rootViewController presentViewController:alertController animated:YES completion:nil];
        
    }
    else
    {
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"" message:text delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
    }
}

-(void)SaveFormData:(NSMutableArray*)ValueArray{
    
   // ValueArray=[[[ValueArray reverseObjectEnumerator] allObjects] mutableCopy];

    
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:ValueArray];
    [currentDefaults setObject:data forKey:@"FormData"];
    [currentDefaults synchronize];

    
}
-(void)SaveServiceData:(NSMutableArray*)DataArray{
    
   // DataArray=[[[DataArray reverseObjectEnumerator] allObjects] mutableCopy];

    
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:DataArray];
    [currentDefaults setObject:data forKey:@"ServiceData"];
    [currentDefaults synchronize];

}
-(NSMutableArray*)getFormData{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:@"FormData"];
    NSMutableArray *arrayOfImages = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
   /* NSString * strflat = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];
    if([strflat isEqualToString:@"3"]){
        
        strflat=@"Bromley House";
        
        
    }
    else{
        
        strflat=@"Towers at Wyncote";
        
    }

    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"property_name = %@",strflat];
    NSArray *filterArray = [arrayOfImages filteredArrayUsingPredicate:predicate];
    */
    return arrayOfImages;//[filterArray mutableCopy];

    
}
-(NSMutableArray*)getServiceData{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:@"ServiceData"];
    NSMutableArray *arrayOfImages = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    /*
    NSString * strflat = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];
    if([strflat isEqualToString:@"3"]){
        
        strflat=@"Bromley House";
        
        
    }
    else{
        
        strflat=@"Towers at Wyncote";
        
    }

    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"property_name = %@",strflat];
    NSArray *filterArray = [arrayOfImages filteredArrayUsingPredicate:predicate];
    */
    return arrayOfImages;//[filterArray mutableCopy];

}

-(void)SaveServiceAllOKData:(NSMutableArray*)DataArray{
    
   // DataArray=[[[DataArray reverseObjectEnumerator] allObjects] mutableCopy];

    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:DataArray];
    [currentDefaults setObject:data forKey:@"ServiceAllOKData"];
    [currentDefaults synchronize];

    
}
-(NSMutableArray*)getServiceAllOKData{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:@"ServiceAllOKData"];
    NSMutableArray *arrayOfImages = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return arrayOfImages;

}






-(void)SaveFinalFormData:(NSMutableArray*)ValueArray{
    
    
    
    //ValueArray=[[[ValueArray reverseObjectEnumerator] allObjects] mutableCopy];
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:ValueArray];
    [currentDefaults setObject:data forKey:@"FinalFormData"];
    [currentDefaults synchronize];

}
-(NSMutableArray*)getFinalFormData{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:@"FinalFormData"];
    NSMutableArray *arrayOfImages = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return arrayOfImages;

    
}
-(void)SaveRentUnitsFormData:(NSMutableArray*)ValueArray{

    //ValueArray=[[[ValueArray reverseObjectEnumerator] allObjects] mutableCopy];

    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:ValueArray];
    [currentDefaults setObject:data forKey:@"RentUnitsFormData"];
    [currentDefaults synchronize];

}
-(NSMutableArray*)getRentUnitsFormData{
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:@"RentUnitsFormData"];
    NSMutableArray *arrayOfImages = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return arrayOfImages;

}

-(void)SaveRentAmenitiesDescFormData:(NSMutableArray*)ValueArray{
    //ValueArray=[[[ValueArray reverseObjectEnumerator] allObjects] mutableCopy];

    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:ValueArray];
    [currentDefaults setObject:data forKey:@"RentAmenitiesDescFormData"];
    [currentDefaults synchronize];

    
}
-(NSMutableArray*)getRentAmenitiesDescFormData{

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:@"RentAmenitiesDescFormData"];
    NSMutableArray *arrayOfImages = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return arrayOfImages;


}


-(void)SavePriceData{
    
    
    [self startLoading];
    
    
    [[WebServiceManager sharedInstance]GetPriceListWithSuccess:^(MoveInMoveOutBaseResponse *result) {
        
        [self stopLoading];
        
        NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:[result.data mutableCopy]];
        [currentDefaults setObject:data forKey:@"PropertyPrices"];
        [currentDefaults synchronize];
        
        [self SaveOfflineMoveOutStatus];
        
        
        
    } failure:^(CustomError *error) {
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self stopLoading];
            
            [self showToastForText:@"Cannot fetch Price List. Please try again"];
        });
    }];
    
    
}

-(NSMutableDictionary*)getPriceData{
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:@"PropertyPrices"];
    NSMutableDictionary *arrayOfImages = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return arrayOfImages;

}


-(void)SaveOfflineMoveOutStatus{
    
    
    [self startLoading];
    
    
    [[WebServiceManager sharedInstance]GetOfflineMoveOutStatusListWithSuccess:^(MoveInMoveOutBaseResponse *result) {
        dispatch_async(dispatch_get_main_queue(), ^{

        [self stopLoading];
         });
        NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:[result.data mutableCopy]];
        [currentDefaults setObject:data forKey:@"OfflineMoveOutStatus"];
        [currentDefaults synchronize];
        
        NSString * strflat = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];
        if(![strflat isEqualToString:@"3"]){

            if([self.isRefresh isEqualToString:@"YES"]){
                
                [self SaveAllRentUnitsData];
                
            }
            else
            {
                if(![self getAllRentUnitsData]){
                    
                    [self SaveAllRentUnitsData];
                }
            }
            
        }
        
        
        
        
    } failure:^(CustomError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self stopLoading];
            
            [self showToastForText:@"Cannot fetch Offline Move Out Status. Please try again"];
        });
    }];
    
    
}
-(NSMutableDictionary*)getOfflineMoveOutStatus{
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:@"OfflineMoveOutStatus"];
    NSMutableDictionary *arrayOfImages = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return arrayOfImages;
    
}



-(NSMutableArray*)getAllTurnOverData{
 
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:@"TurnOver"];
    NSMutableArray *arrayOfImages = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return arrayOfImages;
    
}

-(void)SaveAllTurnOverData:(NSMutableArray*)ValueArray{
    
 //   ValueArray=[[[ValueArray reverseObjectEnumerator] allObjects] mutableCopy];

    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:ValueArray];
    [currentDefaults setObject:data forKey:@"TurnOver"];
    [currentDefaults synchronize];
}

-(NSMutableArray*)getAllRenovatedUnitsData{
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:@"RenovatedUnits"];
    NSMutableArray *arrayOfImages = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return arrayOfImages;

}

-(void)SaveAllRenovatedUnitsData:(NSMutableArray*)ValueArray{
    
 //   ValueArray=[[[ValueArray reverseObjectEnumerator] allObjects] mutableCopy];

    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:ValueArray];
    [currentDefaults setObject:data forKey:@"RenovatedUnits"];
    [currentDefaults synchronize];
}

-(NSMutableArray*)getAllRentReadyUnitsData{
 
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:@"RentReadyUnits"];
    NSMutableArray *arrayOfImages = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return arrayOfImages;
}

-(void)SaveAllRentReadyUnitsData:(NSMutableArray*)ValueArray{
   // ValueArray=[[[ValueArray reverseObjectEnumerator] allObjects] mutableCopy];

    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:ValueArray];
    [currentDefaults setObject:data forKey:@"RentReadyUnits"];
    [currentDefaults synchronize];
}

-(void)SaveAllRentUnitsData{
    
    
        
        [self startLoading];
        
        
        [[WebServiceManager sharedInstance]GetOfflineRentUnitsListWithSuccess:^(MoveInMoveOutBaseResponse *result) {
            
            [self stopLoading];
            
            NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:[result.data mutableCopy]];
            [currentDefaults setObject:data forKey:@"OfflineRentUnits"];
            [currentDefaults synchronize];
            
            
            [self SaveAllRentAmenitiesDescData];
            
            
        } failure:^(CustomError *error) {
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self stopLoading];
                
                [self showToastForText:@"Cannot fetch Rent Units List. Please try again"];
            });
        }];
        
        
    
    
}
-(NSMutableDictionary*)getAllRentUnitsData{

NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
NSData *data = [userDefaults objectForKey:@"OfflineRentUnits"];
NSMutableDictionary *arrayOfImages = [NSKeyedUnarchiver unarchiveObjectWithData:data];
return arrayOfImages;
}

-(NSMutableArray*)getAllRentUniqueAmeniiesData{
    
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    NSData *data = [userDefaults objectForKey:@"OfflineRentUnits"];
//    NSMutableDictionary *arrayOfImages = [NSKeyedUnarchiver unarchiveObjectWithData:data];
//    return arrayOfImages;

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:@"OfflineRentUniqueAmeniies"];
    NSMutableArray *arrayOfImages = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return arrayOfImages;

}
-(void)SaveAllRentUniqueAmeniiesData{
    
    [self startLoading];
    
    
    [[WebServiceManager sharedInstance]GetOfflineRentUniqueAmeniiesListWithSuccess:^(MoveInMoveOutBaseResponse *result) {
        
        [self stopLoading];
        
        NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:[result.data mutableCopy]];
        [currentDefaults setObject:data forKey:@"OfflineRentUniqueAmeniies"];
        [currentDefaults synchronize];
        
        
        
        
    } failure:^(CustomError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self stopLoading];
            
            [self showToastForText:@"Cannot fetch Rent Unique Ameniies. Please try again"];
        });
    }];
    
}


-(NSMutableDictionary*)getAllRentAmenitiesDescData{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:@"RentAmenitiesDesc"];
    NSMutableDictionary *arrayOfImages = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return arrayOfImages;

    
}
-(void)SaveAllRentAmenitiesDescData{
    
    [self startLoading];
    
    
    [[WebServiceManager sharedInstance]GetOfflineRentAmenitiesDescListWithSuccess:^(MoveInMoveOutBaseResponse *result) {
        
        [self stopLoading];
        
        NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:[result.data mutableCopy]];
        [currentDefaults setObject:data forKey:@"RentAmenitiesDesc"];
        [currentDefaults synchronize];
        [self SaveAllRentUniqueAmeniiesData];
        
        
        
        
    } failure:^(CustomError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self stopLoading];
            
            [self showToastForText:@"Cannot fetch Rent Amenities Description. Please try again"];
        });
    }];

    
}
-(NSMutableArray*)getPreventionFormData{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:@"PreventionFormData"];
    NSMutableArray *arrayOfImages = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return arrayOfImages;//[filterArray mutableCopy];
    
    
}

-(void)savePreventionFormData:(NSMutableArray*)ValueArray{
    
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:ValueArray];
    [currentDefaults setObject:data forKey:@"PreventionFormData"];
    [currentDefaults synchronize];
    
    
}
-(NSMutableArray*)getPreventionServiceData{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:@"PreventionServiceData"];
    NSMutableArray *arrayOfImages = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return arrayOfImages;//[filterArray mutableCopy];
    
}
-(void)savePreventionServiceData:(NSMutableArray*)DataArray{
    
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:DataArray];
    [currentDefaults setObject:data forKey:@"PreventionServiceData"];
    [currentDefaults synchronize];
    
}

-(void)startLoading{
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];

    
    [MBProgressHUD showHUDAddedTo:app.window animated:YES];
}

-(void)stopLoading{
    
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];

    
    [MBProgressHUD hideHUDForView:app.window animated:YES];
}



@end
