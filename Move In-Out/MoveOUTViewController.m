//
//  ViewController.m
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import "MoveOUTViewController.h"
#import "MoveINViewController2.h"
#import "OfflineManager.h"
@interface MoveOUTViewController ()
@property (strong, nonatomic) IBOutlet UITextField *TxtProperty;
@property (strong, nonatomic) IBOutlet UIButton *BtnNext;

@property (strong, nonatomic) IBOutlet UITextField *TxtDate;
@property (strong, nonatomic) IBOutlet UITextField *TxtUnitNumber;

@end

@implementation MoveOUTViewController
@synthesize DATEYYMMDD,moveInOutType;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    app = (AppDelegate*)[[UIApplication sharedApplication]delegate];

    app.addRequest = [[AddMoveInMoveOutRequest alloc]init];
    self.AllOfflineData=[[OfflineManager sharedInstance]getOfflineMoveOutStatus];
    
    NSString * strflat = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];
    if([strflat isEqualToString:@"3"]){
        
        self.TxtProperty.text=@"Bromley House";
        
        
    }
    else{
        
        self.TxtProperty.text=@"Towers at Wyncote";
        
    }


    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)GoBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{// return NO to disallow editing.
    self.ActiveTextField=textField;
    if([textField isEqual:self.TxtProperty]){
        
        
        if(self.arrProperty.count){
            
            [self showSelectionVCForOpponents];
            
        }
        else
        {
            [self getAllProperty];
            
        }
        
        return NO;
    }
    else if([textField isEqual:self.TxtUnitNumber]){
        
        
        if(self.arrPropertyUnits.count){
            
            [self showSelectionVCForOpponents];
            
        }
        else
        {
            [self getAllUnits];
            
        }
        
        return NO;
    }
//    if([textField isEqual:self.TxtProperty]){
//        
//        
//        if(self.arrProperty.count){
//            
//            [self showSelectionVCForOpponents];
//            
//        }
//        else
//        {
//            [self getAllProperty];
//            
//        }
//        
//        return NO;
//    }
    else if([textField isEqual:self.TxtDate]){
        
        
        [self ShowDatePicker];
        return NO;
    }
    else {
        
        return YES;
    }
}
-(void)getAllProperty{
    
    [self startLoading];
    
    
    [[WebServiceManager sharedInstance]GetPropertyListWithSuccess:^(MoveInMoveOutBaseResponse *result) {
        
        [self stopLoading];
        
        GetPropertyListResponse *response = (GetPropertyListResponse *)result;
        if (response.result.count) {
            self.arrProperty = [[NSArray alloc]initWithArray:response.result];
            [self showSelectionVCForOpponents];
        }
        else{
            
            [self showToastForText:@"No Property Found"];
            
        }
        
    } failure:^(CustomError *error) {
        [self stopLoading];
        
        [self showToastForText:@"Cannot fetch Property. Please try again"];
    }];
    
}
-(void)getAllUnits{
    
    
    self.arrPropertyUnits = [[OfflineManager sharedInstance]getAllUnits];

    
    
//    [self startLoading];
//    
//    
//    [[WebServiceManager sharedInstance]GetPropertyUnitListWithSuccess:^(MoveInMoveOutBaseResponse *result) {
//        
//        [self stopLoading];
//        
//        GetPropertyUnitsListResponse *response = (GetPropertyUnitsListResponse *)result;
//        if (response.result.count) {
//            self.arrPropertyUnits = [[NSArray alloc]initWithArray:response.result];
//            [self showSelectionVCForOpponents];
//        }
//        else{
//            
//            [self showToastForText:@"No Property Found"];
//            
//        }
//        
//    } failure:^(CustomError *error) {
//        [self stopLoading];
//        
//        [self showToastForText:@"Cannot fetch Property. Please try again"];
//    }];
    
}
-(void)showSelectionVCForOpponents{
    if([self.ActiveTextField isEqual:self.TxtProperty]){

    
    SLSelectionViewController *aWSelectionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SLSelectionViewController"];
    
    
    aWSelectionViewController.itemList = self.arrProperty;//arrLevels; //list to display
    aWSelectionViewController.displayItemKey = @"building"; //key of value to display
    //   aWSelectionViewController.subtitleDisplayItemKey =@"";// @"coachID"; //key of value to display
    aWSelectionViewController.delegate  = self;
    aWSelectionViewController.titleForSelection = @"Select Property";
    [self presentViewController:aWSelectionViewController animated:YES completion:nil];
    
    }
    else
    {
        SLSelectionViewController *aWSelectionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SLSelectionViewController"];
        
        
        aWSelectionViewController.itemList = self.arrPropertyUnits;//arrLevels; //list to display
        aWSelectionViewController.displayItemKey = @"unit"; //key of value to display
        //   aWSelectionViewController.subtitleDisplayItemKey =@"";// @"coachID"; //key of value to display
        aWSelectionViewController.delegate  = self;
        aWSelectionViewController.titleForSelection = @"Select Units";
        [self presentViewController:aWSelectionViewController animated:YES completion:nil];
    }
    
    
    
}
-(void)ShowDatePicker
{
    DatePickerViewController *dpvc = [[DatePickerViewController alloc] init];
    [dpvc setDelegate:self];
    [dpvc setTitle:@"Select Date"];
    UINavigationController *navDpvc = [[UINavigationController alloc] initWithRootViewController:dpvc];
    [navDpvc.navigationBar setTintColor:[UIColor blackColor]];
    [navDpvc setModalPresentationStyle:UIModalPresentationFormSheet];
    [navDpvc setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:navDpvc animated:YES completion:nil];
    
}
#pragma mark will handle dismissal for datepicker

- (void)DatePickerViewControllerDidFinish:(DatePickerViewController *)controller
{
    //fetch datepicker value from controller object
    NSDateFormatter  *dateofbirthformat = [[NSDateFormatter alloc] init];
    [dateofbirthformat setTimeStyle:NSDateFormatterNoStyle];
    [dateofbirthformat setDateFormat:@"MM-dd-yyyy"];
    self.TxtDate.text = [dateofbirthformat stringFromDate:[controller.datePicker date]];
    
    
    NSDateFormatter *dateofbirthformat1 = [[NSDateFormatter alloc] init];
    [dateofbirthformat1 setTimeStyle:NSDateFormatterNoStyle];
    [dateofbirthformat1 setDateFormat:@"yyyy-MM-dd"];
    self.DATEYYMMDD = [dateofbirthformat1 stringFromDate:[controller.datePicker date]];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
#pragma mark will handel dismmiss of datepicker if user press cancel btn
- (void)DatePickerViewControllerDidCancel:(DatePickerViewController *)controller
{
    //do nothing just dissmiss datepicker modelview
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)didSelectItem:(MoveInMoveOutBaseModel *)selectedItem{
    
    
    if([self.ActiveTextField isEqual:self.TxtProperty]){
        
        Property *opponent = (Property *)selectedItem;
        
        self.TxtProperty.text = opponent.building;
    }
    else
    {
        Units *opponent = (Units *)selectedItem;
        
        self.TxtUnitNumber.text = opponent.unit;
        
    }
    
    
    
    // matchNoteToAdd.opponent = opponent.displayName;
}
#pragma mark - Navigation
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {

    
    
    if(self.TxtProperty.text.length){
        
        if(self.TxtUnitNumber.text.length){
    
            
            NSDictionary * dict =[self.AllOfflineData objectForKey:self.TxtUnitNumber.text];

            if(dict){
                app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
                MoveInMoveOutBaseResponse *response = [[MoveInMoveOutBaseResponse alloc]initWithDictionary:dict error:nil];

                app.resultData=response;
                return YES;

            }
            else
            {
               // [self showToastForText:@"Move in is Pending"];
                [self AskQuestion];
                return NO;

            }

    }
    else
    {
        [self showToastForText:@"Please Enter Unit Number"];
        
        
        
        return NO;
        
    }
}
else
{
    [self showToastForText:@"Please Select Property"];
    
    
    return NO;
}
}


- (BOOL)shouldPerformSegueWithIdentifierOLD:(NSString *)identifier sender:(id)sender {
    
    
//#if TARGET_IPHONE_SIMULATOR
    
    // Simulator specific code
   // return YES;
    if(self.TxtProperty.text.length){
        
        if(self.TxtUnitNumber.text.length){
            
            
            //return YES;
            
            __block BOOL blockStatus = NO;
            [self startLoading];
            
            validateRequest = [[ValidateMoveInMoveOutRequest alloc]init];
            validateRequest.property_name=self.TxtProperty.text;
            validateRequest.units=self.TxtUnitNumber.text;
            
            [[WebServiceManager sharedInstance]GetMoveInFormForRequest:validateRequest success:^(MoveInMoveOutBaseResponse *result) {
                [self stopLoading];
                
                if([[result valueForKey:@"success"]boolValue]){
                    blockStatus =YES;
                    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
                    app.resultData=result;
                    
//                    app.addRequest.property_name=self.TxtProperty.text;
//                    app.addRequest.units=self.TxtUnitNumber.text;
//                    
//                    NSDateFormatter *dateofbirthformat1 = [[NSDateFormatter alloc] init];
//                    [dateofbirthformat1 setTimeStyle:NSDateFormatterNoStyle];
//                    [dateofbirthformat1 setDateFormat:@"yyyy-MM-dd"];
//                    self.DATEYYMMDD = [dateofbirthformat1 stringFromDate:[NSDate date]];
//                    app.addRequest.inspection_date=self.DATEYYMMDD;

                    
                    [self performSegueWithIdentifier:@"GoToNextView" sender:self];
                    
                }
                else
                {
                    
                    [self showToastForText:@"No Record Found"];
                    blockStatus =NO;
                    
                    
                }
                
                //return blockStatus;
                
            }
                                                               failure:^(CustomError *error) {
                                                                   [self stopLoading];
                                                                  // blockStatus=NO;
                                                                   [self AskQuestion];
                                                                   
                                                                  // [self performSegueWithIdentifier:@"StartMoveOut" sender:self];
  
                                                                   

                                                                  //  return blockStatus;


//                                                                   [self showToastForText:@"Move in is pending"];
                                                                   
                                                                   
                                                                   
                                                                   // return blockStatus;
                                                                   
                                                                   
                                                               }];
            
            
            
            
            return blockStatus;
            
            
        }
        else
        {
            [self showToastForText:@"Please Enter Unit Number"];
            
            
            
            return NO;
            
        }
    }
    else
    {
        [self showToastForText:@"Please Select Property"];
        
        
        return NO;
    }

    
    
/*#else // TARGET_IPHONE_SIMULATOR
    
    // Device specific code
    
    
    
    
    if([identifier isEqualToString:@"GoToNextView"]){
        
        if(self.TxtProperty.text.length){
            
            if(self.TxtUnitNumber.text.length){
                
                
//return YES;

                    __block BOOL blockStatus = NO;
                    [self startLoading];

                    validateRequest = [[ValidateMoveInMoveOutRequest alloc]init];
                    validateRequest.property_name=self.TxtProperty.text;
                    validateRequest.units=self.TxtUnitNumber.text;

                    [[WebServiceManager sharedInstance]GetMoveInFormForRequest:validateRequest success:^(MoveInMoveOutBaseResponse *result) {
                        [self stopLoading];

                        if([[result valueForKey:@"success"]boolValue]){
                            blockStatus =YES;
                            AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
                            app.resultData=result;
                            [self performSegueWithIdentifier:@"GoToNextView" sender:self];

                        }
                        else
                        {
                            
                            [self showToastForText:@"No Record Found"];
                            blockStatus =NO;
                            

                        }
                        
                        //return blockStatus;
                    
                    }
                    failure:^(CustomError *error) {
                    [self stopLoading];
                                                                                       
                    //[self showToastForText:@"Move in is pending"];
                        //blockStatus=NO;
                        [self AskQuestion];

                        return blockStatus;

                        

                        
                    }];
                
                
                    
 
                    
                   // return blockStatus;

                
            }
            else
            {
                [self showToastForText:@"Please Enter Unit Number"];


                
                return NO;
                
            }
        }
        else
        {
            [self showToastForText:@"Please Select Property"];

            
            return NO;
        }
    }
    else
    {
        return NO;
    }
    
    
//}
//    else
//    {
//        return YES;
//
//    }
#endif // TARGET_IPHONE_SIMULATOR
 */

}
-(void)AskQuestion{
    
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Move IN OUT" message:@"There is currently no Move-In data for this particular unit. Would you like to proceed?" preferredStyle:UIAlertControllerStyleAlert];
    
    NSString *str = @"There is currently no Move-In data for this particular unit. Would you like to proceed?";
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    NSMutableAttributedString *hogan = [[NSMutableAttributedString alloc] initWithString:str];
    [hogan addAttribute:NSFontAttributeName
                  value:[UIFont boldSystemFontOfSize:18.00]
                  range:NSMakeRange(0,str.length)];
    [alert setValue:hogan forKey:@"attributedTitle"];

    
    
    
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        
      //  self.moveInOutType=@"move-out";
       // [self performSegueWithIdentifier:@"MoveIN" sender:nil];
        [self performSegueWithIdentifier:@"StartMoveOut" sender:self];

        // Ok action example
    }];
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        
        //[self performSegueWithIdentifier:@"MoveOUT" sender:nil];
        [self.navigationController popToRootViewControllerAnimated:YES];
        
        
        
        // Other action
    }];
    [otherAction setValue:[UIColor redColor] forKey:@"titleTextColor"];
    [alert addAction:otherAction];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"GoToNextView"]){
        
    //    MoveINViewController2 *ddata=segue.destinationViewController;
      //  ddata.moveInOutType=@"move-out";

        
        
        app.addRequest.property_name=self.TxtProperty.text;
        app.addRequest.units=self.TxtUnitNumber.text;
        app.addRequest.inspection_date=self.DATEYYMMDD;
        
        
    }
    else if([segue.identifier isEqualToString:@"StartMoveOut"]){
        
        //    MoveINViewController2 *ddata=segue.destinationViewController;
        //  ddata.moveInOutType=@"move-out";
        
        
        
        app.addRequest.property_name=self.TxtProperty.text;
        app.addRequest.units=self.TxtUnitNumber.text;
        app.addRequest.inspection_date=self.DATEYYMMDD;
        MoveINViewController2 *ddata=segue.destinationViewController;
        ddata.moveInOutType=@"move-out";

        
        
    }
    
        
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
