//
//  ViewController.m
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "MoveINViewController1.h"
#import "OfflineManager.h"
#import "Units.h"
#import "CompletedMoveoutListViewController.h"
#import "UIView+Visibility.h"

@interface ViewController ()

@property(nonatomic,weak)IBOutlet UIButton *btnMoveIN;
@property(nonatomic,weak)IBOutlet UIButton *btnMoveOUT;
@property(nonatomic,weak)IBOutlet UIButton *btnMyJobs;
@property(nonatomic,weak)IBOutlet UIButton *btnAssignToTech;
@property(nonatomic,weak)IBOutlet UIButton *btnWorkOrderStatus;
@property(nonatomic,weak)IBOutlet UIButton *btnMoveInCompleted;
@property(nonatomic,weak)IBOutlet UIButton *btnAssignTaskToTech;

@property(nonatomic,weak)IBOutlet UILabel *lblMessage;

@end

@implementation ViewController
@synthesize moveInOutType;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   // [[OfflineManager sharedInstance]ClearOfflineStorage];
    
   /* NSArray *arrPropertyUnits = [[OfflineManager sharedInstance]getAllUnits];
    
    if(arrPropertyUnits.count<=0){
        
        [[OfflineManager sharedInstance]saveAllUnits];
        
    }*/
    self.processcount=0;
    
    counterData=0;


    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    app.resultData=nil;
    [app.arrAllData removeAllObjects];
    app.addRequest.property_name=nil;
    app.addRequest.units=nil;
    app.addRequest.inspection_date=nil;
    self.moveInOutType=@"move-in";
    NSString *token = [[NSUserDefaults standardUserDefaults]valueForKey:@"DeviceToken"];
    if(token){
        
        [self UpdateToken];
    }
    
    
    if([[[NSUserDefaults standardUserDefaults]valueForKey:@"roleAID"]isEqualToString:@"6"]){
        
        self.btnMyJobs.hidden=YES;
        self.btnWorkOrderStatus.hidden=NO;
        
        self.btnAssignToTech.hidden=NO;
        self.btnMoveInCompleted.hidden=NO;
        
        self.btnAssignTaskToTech.hidden=NO;
        
        [self.btnWorkOrderStatus setVisibility:UIViewVisibilityGone];
        [self.btnAssignToTech setVisibility:UIViewVisibilityGone];
        [self.btnMoveInCompleted setVisibility:UIViewVisibilityGone];
        [self.btnAssignTaskToTech setVisibility:UIViewVisibilityGone];

        
        [self viewDidLayoutSubviews];

    }
    else{
       // self.btnMoveIN.hidden=YES;
//        self.btnWorkOrderStatus.hidden=YES;
  //      self.btnAssignToTech.hidden=YES;
    //    self.btnMoveInCompleted.hidden=YES;
        //self.btnAssignTaskToTech.hidden=YES;
        
        
        [self.btnWorkOrderStatus setVisibility:UIViewVisibilityGone];
        [self.btnAssignToTech setVisibility:UIViewVisibilityGone];
        [self.btnMoveInCompleted setVisibility:UIViewVisibilityGone];
        [self.btnAssignTaskToTech setVisibility:UIViewVisibilityGone];
        [self viewDidLayoutSubviews];


       // dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
           
            [self getAllCount];
        //});

    }
    [self RefreshData_Click];
    [self UpdateLable];
}
-(void)UpdateLable{
    NSMutableArray * arrFormData = [[OfflineManager sharedInstance]getFormData];
    NSMutableArray * AllTurnOver = [[OfflineManager sharedInstance]getAllTurnOverData];
    NSMutableArray * RenovatedUnits = [[OfflineManager sharedInstance]getAllRenovatedUnitsData];
    NSMutableArray * RentReadyUnits = [[OfflineManager sharedInstance]getAllRentReadyUnitsData];
    
    NSMutableArray * RentUnits = [[OfflineManager sharedInstance]getRentUnitsFormData];

    NSMutableArray * PreventionData = [[OfflineManager sharedInstance]getPreventionFormData];

    
    int mycount = [arrFormData count] + [AllTurnOver count] + [RenovatedUnits count] + [RentReadyUnits count]+ [RentUnits count] + [PreventionData count];
    
    if(mycount>0){
        
        self.lblMessage.text=[NSString stringWithFormat:@"%lu Records Pending",(unsigned long)mycount];
    }
    else
    {
        self.lblMessage.text=[NSString stringWithFormat:@"No Records Pending"];
        
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if([[[NSUserDefaults standardUserDefaults]valueForKey:@"roleAID"]isEqualToString:@"6"]){
        
        if([segue.identifier isEqualToString:@"MoveIN"]){
            MoveINViewController1 *ddata=segue.destinationViewController;
            ddata.moveInOutType=self.moveInOutType;
        }

        
    }
    else{
        
        NSArray *arr = [[OfflineManager sharedInstance]getAllUnits];
        int count=0;
        for(Units *myunit in arr){
            
            if([myunit.access_for isEqualToString:@"both"]){
                
                count++;
                break;
            }
            
            
        }
        if(count>0){
            
            if([segue.identifier isEqualToString:@"MoveIN"]){
                MoveINViewController1 *ddata=segue.destinationViewController;
                ddata.moveInOutType=self.moveInOutType;
            }

        }
        else
        {
            if([segue.identifier isEqualToString:@"MoveIN"]){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Move IN OUT" message:@"You dont have any UNIT assign, Please refresh the data and try again" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                
                // Ok action example
            }];
            [alert addAction:okAction];
            [self presentViewController:alert animated:YES completion:nil];
            }
        }

    }

    
    

    
    

    
}

-(void)getAllCount{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Background work
        
        MyJobsCountRequest  * req =[[MyJobsCountRequest alloc ]init];
        req.tech_id=[[NSUserDefaults standardUserDefaults]valueForKey:@"userID"];
        [[WebServiceManager sharedInstance]GetMyJobsCountRequest:req success:^(NSDictionary *result) {
            
            
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    if([[result valueForKey:@"success"]boolValue]){
                        if(self.badge6)
                        {
                            [self.badge6 removeFromSuperview];
                        }
                        self.badge6 = [CustomBadge customBadgeWithString:[result valueForKey:@"result"] withStyle:[BadgeStyle oldStyle]];
                        self.badge6.frame= CGRectMake((self.btnMyJobs.frame.origin.x+self.btnMyJobs.frame.size.width)-70,-5,35,35);
                        [self.btnMyJobs addSubview:self.badge6];
                    }
                    else
                    {
                        if(self.badge6)
                        {
                            [self.badge6 removeFromSuperview];
                        }
                    }
                    
                    
                });
            
         
            
        } failure:^(CustomError *error) {
            
            dispatch_async(dispatch_get_main_queue(), ^{

            if(self.badge6)
            {
                [self.badge6 removeFromSuperview];
            }
                 });
            
        }];
        
        
        
        
    });
    
}

-(void)UpdateToken{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Background work
        
        
        
        
        UpdateToken  * req =[[UpdateToken alloc ]init];
        req.user_id=[[NSUserDefaults standardUserDefaults]valueForKey:@"userID"];
        req.device_token=[[NSUserDefaults standardUserDefaults]valueForKey:@"DeviceToken"];

        [[WebServiceManager sharedInstance]UpdateMyDeviceTokenRequest:req success:^(NSDictionary *result) {
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
               
                
            });
            
            
            
        } failure:^(CustomError *error) {
            
            
        }];
        
        
        
        
    });
    
}


-(void)AskQuestion{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Move IN OUT" message:@"Move in was done manually?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        
        self.moveInOutType=@"move-out";
        [self performSegueWithIdentifier:@"MoveIN" sender:nil];
        // Ok action example
    }];
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        
        [self performSegueWithIdentifier:@"MoveOUT" sender:nil];

        
        
        // Other action
    }];
    [alert addAction:okAction];
    [alert addAction:otherAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}



- (IBAction)MoveOUT_Click:(id)sender {
    
    //[self AskQuestion];
   // [self performSegueWithIdentifier:@"MoveOUT" sender:nil];
    
   


}
- (IBAction)MoveINCompleted_Click:(id)sender {
    
    CompletedMoveoutListViewController * dest = [self.storyboard instantiateViewControllerWithIdentifier:@"CompletedMoveoutListViewController"];
    dest.SourcePath=@"MoveInCompleted";
    [self.navigationController pushViewController:dest animated:YES];

    
    
}
- (IBAction)Logout_Click:(id)sender{
    
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"userID"];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"roleAID"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    window.rootViewController = [storyboard instantiateInitialViewController];

}
- (IBAction)RefreshData_Click{
    
    if([[WebServiceManager sharedInstance]isInternetWorkingFine]){
        
        [[OfflineManager sharedInstance]ClearOfflineStorage];
        [OfflineManager sharedInstance].isRefresh=@"NO";
        [[OfflineManager sharedInstance]saveAllUnits];
        
        
    }
    else{
        
        // [self showToastForText:@"Please make sure you are connected to interntet"];
    }
    
    
    
    
}

- (IBAction)RefreshData_Click:(id)sender{
    
    if([[WebServiceManager sharedInstance]isInternetWorkingFine]){
        
        [[OfflineManager sharedInstance]ClearOfflineStorage];
        [OfflineManager sharedInstance].isRefresh=@"YES";
        [[OfflineManager sharedInstance]saveAllUnits];
        
        
    }
    else{
        
       // [self showToastForText:@"Please make sure you are connected to interntet"];
    }

    
    
    
}
- (IBAction)UploadData_Click:(id)sender{
    
    
    if([self.lblMessage.text isEqualToString:@"No Records Pending"]){
        
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Move IN OUT" message:@"No Records Pending" preferredStyle:UIAlertControllerStyleAlert];
            // Ok action example
      
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
            
            
            
            
            // Other action
        }];
        [alert addAction:otherAction];
        [self presentViewController:alert animated:YES completion:nil];

        
    }
    else{
  //  [self startLoading];
    //[self StartUpload];
        
        [self performSegueWithIdentifier:@"ShowPending" sender:nil];
        
        
    }
    
    
}
-(void)StartUpload{
    
    NSMutableArray * arrFormData = [[OfflineManager sharedInstance]getFormData];
    if([arrFormData count]>0){
        
        AddMoveInMoveOutRequest *addRequest = [arrFormData objectAtIndex:0];
        
        
        if(addRequest.move_in_out_id.length){
            
            self.form_id=addRequest.move_in_out_id;
            self.moveInOutType=addRequest.type;
            [self ProcessSubmitServiceData];
            
        }
        else
        {
        [self GO:addRequest];
        }
        
    }
    else
    {
        
        
        NSMutableArray * AllTurnOver = [[OfflineManager sharedInstance]getAllTurnOverData];
        NSMutableArray * RenovatedUnits = [[OfflineManager sharedInstance]getAllRenovatedUnitsData];
        NSMutableArray * RentReadyUnits = [[OfflineManager sharedInstance]getAllRentReadyUnitsData];

        if([AllTurnOver count]>0){
            
            [self UploadTurnOver];

            
        }
        else if([RenovatedUnits count]>0){
            
            [self UploadRenovatedUnits];
        }
        else if([RentReadyUnits count]>0){
            
            [self UploadRentReadyUnits];

        }
        else
        {
            [self stopLoading];
            [self UpdateLable];
            [self showToastForText:@"Saved Successfully"];

            
        }
        

        
        
        
        
        
        

    }

}



-(void)GO:(AddMoveInMoveOutRequest*)addRequest{
    
    
    [[WebServiceManager sharedInstance]AddMoveInMoveOutFormForRequest:addRequest success:^(MoveInMoveOutBaseResponse *result) {
        //  [self stopLoading];
        
        GetMoveInMoveOutResponse *resp = (GetMoveInMoveOutResponse*)result;
        self.form_id=resp.form_id;
        NSLog(@"FORM %@ %@",self.form_id,resp.form_id);
        // [self startLoading];
        AttemptCount=0;
        [self ProcessSubmitServiceData];
        
        
        
        
        
        
        
    } failure:^(CustomError *error) {
        
        if(AttemptCount>5){
            
            [self stopLoading];
            
            // [self showToastForText:@"Could not save data at the moment"];
            [self showToastForText:@"Oops Error Occured !"];
            
        }
        else
        {
            AttemptCount= AttemptCount+1;
            [self GO:addRequest];

        }
    }];
    
}
-(void)ProcessSubmitServiceData
{
    counterData=0;
    NSMutableArray * arrServiceData = [[OfflineManager sharedInstance]getServiceData];
    if([arrServiceData count]>0){
        
        self.arrAllData = [[NSMutableArray alloc]init];
        self.arrAllData=[arrServiceData objectAtIndex:0];
        [self SubmitServiceData];


    }
    
}
-(void)SubmitServiceData
    
    
    {
        
       
            if(counterData<[self.arrAllData count]){

                AddMoveInMoveOutServiceRequest *request=[self.arrAllData objectAtIndex:counterData];

            
        

        
        
        
            
            
            if(request.is_ok.length){
                request.move_in_out_id=self.form_id;
                request.type=self.moveInOutType;
                [[WebServiceManager sharedInstance]AddMoveInMoveOutServiceForRequest:request success:^(MoveInMoveOutBaseResponse *result) {
                    // [self stopLoading];
                    if([[result valueForKey:@"success"]boolValue]){
                        
                        counterData=counterData+1;
                        AttemptCount=0;
                        [self SubmitServiceData];
                        
                    }
                    else
                    {
                        [self stopLoading];
                        
                        [self showToastForText:@"Could not save data at the moment"];
                        //[self SubmitServiceData];
                        
                    }
                    
                    
                    
                } failure:^(CustomError *error) {
                    //[self stopLoading];
                    
                    //[self showToastForText:@"Could not save data at the moment"];
                    //[self SubmitServiceData];
                    
                    if(AttemptCount>5){
                        
                        [self stopLoading];
                        
                        // [self showToastForText:@"Could not save data at the moment"];
                        [self showToastForText:@"Oops Error Occured !"];
                        
                    }
                    else
                    {
                        AttemptCount= AttemptCount+1;
                        [NSTimer scheduledTimerWithTimeInterval:0.10 target:self selector:@selector(SubmitServiceData) userInfo:nil repeats:NO];
                        
                    }
                    
                    
                }];
                
            }
            else {
                
                counterData=counterData+1;
                [self SubmitServiceData];
                
            }
        }
        else
        {
            // [self stopLoading];
            
            [self SubmitFinalData];
        }
    }
    

-(void)SubmitFinalData
{
    
    NSMutableArray * arrFormData = [[OfflineManager sharedInstance]getFinalFormData];
    if([arrFormData count]>0){
        
        SubmitMoveInMoveOutRequest *moveinmoveoutformtoAdd = [arrFormData objectAtIndex:0];

    
    moveinmoveoutformtoAdd.move_in_out_id=self.form_id;
    [[WebServiceManager sharedInstance]SubmitMoveInMoveOutForRequest:moveinmoveoutformtoAdd success:^(MoveInMoveOutBaseResponse *result) {
        //[self stopLoading];
        if([[result valueForKey:@"success"]boolValue]){
            
            
            
            [self RemoveFirstObject];
            
//            if([self.moveInOutType isEqualToString:@"move-in"]){
//                
//                [self.navigationController popToRootViewControllerAnimated:YES];
//                
//            }
//            else
//            {
//                [self performSegueWithIdentifier:@"ShowOptions" sender:nil];
//            }
            
            
            
            // [self performSelector:@selector(patchSelector) withObject:nil afterDelay:0.3];
            
            
        }
        else
        {
            [self showToastForText:@"Could not save data at the moment"];
            
        }
        
        
        
    } failure:^(CustomError *error) {
        [self stopLoading];
        
        //        [self showToastForText:@"Could not save data at the moment"];
        [self showToastForText:@"Oops Error Occured !"];
        
    }];
    }

}
-(void)RemoveFirstObject{
    
    NSMutableArray * arrFormData = [[OfflineManager sharedInstance]getFormData];
    if([arrFormData count]>0){
        
        [arrFormData removeObjectAtIndex:0];
    }
    
    [[OfflineManager sharedInstance]SaveFormData:arrFormData];
    
    NSMutableArray * arrServiceData = [[OfflineManager sharedInstance]getServiceData];
    if([arrServiceData count]>0){
        
        [arrServiceData removeObjectAtIndex:0];
    }
    
    [[OfflineManager sharedInstance]SaveServiceData:arrServiceData];
    
    NSMutableArray * arrFinalFormData = [[OfflineManager sharedInstance]getFinalFormData];
    if([arrFinalFormData count]>0){
        
        [arrFinalFormData removeObjectAtIndex:0];
    }
    
    [[OfflineManager sharedInstance]SaveFinalFormData:arrFinalFormData];

    [self UpdateLable];
    [self StartUpload];
    
}
-(void)UploadTurnOver{
    
    [self UpdateLable];

    NSMutableArray * AllTurnOver = [[OfflineManager sharedInstance]getAllTurnOverData];

    if([AllTurnOver count]>0){
        
        AddTurnOverRequest *AddTurnOverformtoAdd=[AllTurnOver objectAtIndex:0];
        
        
        // [self startLoading];
        [[WebServiceManager sharedInstance]AddTurnOverFormForRequest:AddTurnOverformtoAdd success:^(MoveInMoveOutBaseResponse *result) {
            // [self stopLoading];
            
            // [self.navigationController popToRootViewControllerAnimated:YES];
            
            
            
                NSMutableArray * arrFormData = [[OfflineManager sharedInstance]getAllTurnOverData];
                if([arrFormData count]>0){
                    
                    [arrFormData removeObjectAtIndex:0];
                }
                
                [[OfflineManager sharedInstance]SaveAllTurnOverData:arrFormData];
            [self UploadTurnOver];
            
            
            
            
            
        } failure:^(CustomError *error) {
            
            [self showToastForText:@"Oops Error Occured !"];
            [self stopLoading];
            
            
            
        }];
        

        
        
    }
    else
    {
        [self UploadRenovatedUnits];
    }
    
    
}
-(void)UploadRenovatedUnits{
    [self UpdateLable];

    NSMutableArray * AllTurnOver = [[OfflineManager sharedInstance]getAllRenovatedUnitsData];
    
    if([AllTurnOver count]>0){

    
    AddRenovatedUnitsRequest *AddRenovatedUnitsformtoAdd=[AllTurnOver objectAtIndex:0];

    
    
    [[WebServiceManager sharedInstance]AddRenovatedUnitsFormForRequest:AddRenovatedUnitsformtoAdd success:^(MoveInMoveOutBaseResponse *result) {
       // [self stopLoading];
        
        
        NSMutableArray * arrFormData = [[OfflineManager sharedInstance]getAllRenovatedUnitsData];
        if([arrFormData count]>0){
            
            [arrFormData removeObjectAtIndex:0];
        }
        
        [[OfflineManager sharedInstance]SaveAllRenovatedUnitsData:arrFormData];
        [self UploadRenovatedUnits];

        
        
       // [self.navigationController popToRootViewControllerAnimated:YES];
        // [self.navigationController popViewControllerAnimated:YES];
        
        
        
        
        
        
        
        
    } failure:^(CustomError *error) {
        
        [self showToastForText:@"Oops Error Occured !"];
        [self stopLoading];
        
        
        
    }];
    }
    else{
        
        [self UploadRentReadyUnits];
        
    }

    
    
}
-(void)UploadRentReadyUnits{
    
    [self UpdateLable];

    NSMutableArray * AllTurnOver = [[OfflineManager sharedInstance]getAllRentReadyUnitsData];
    
    if([AllTurnOver count]>0){

        AddRentReadyUnitsRequest *AddTurnOverformtoAdd=[AllTurnOver objectAtIndex:0];
        

    
    
    [[WebServiceManager sharedInstance]AddRentReadyUnitsFormForRequest:AddTurnOverformtoAdd success:^(MoveInMoveOutBaseResponse *result) {
        
        
        
        
        NSMutableArray * arrFormData = [[OfflineManager sharedInstance]getAllRentReadyUnitsData];
        if([arrFormData count]>0){
            
            [arrFormData removeObjectAtIndex:0];
        }
        
        [[OfflineManager sharedInstance]SaveAllRentReadyUnitsData:arrFormData];
        [self UploadRentReadyUnits];

        
        
        
        
        
    } failure:^(CustomError *error) {
        
        [self showToastForText:@"Oops Error Occured !"];
        [self stopLoading];
        
        
        
    }];
    }
    else
    {
        [self StartUpload];
    }

}
@end
