//
//  ViewController.m
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import "MoveINViewController1.h"
#import "MoveINViewController2.h"
#import "MoveIN_OUT_TABLEViewController.h"
#import "OfflineManager.h"

@interface MoveINViewController1 ()
@property (strong, nonatomic) IBOutlet UITextField *TxtProperty;
@property (strong, nonatomic) IBOutlet UIButton *BtnNext;

@property (strong, nonatomic) IBOutlet UITextField *TxtDate;
@property (strong, nonatomic) IBOutlet UITextField *TxtUnitNumber;

@end

@implementation MoveINViewController1
@synthesize DATEYYMMDD,moveInOutType;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    app = (AppDelegate*)[[UIApplication sharedApplication]delegate];

    app.addRequest = [[AddMoveInMoveOutRequest alloc]init];
    
    NSString * strflat = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];
    if([strflat isEqualToString:@"3"]){
        
        self.TxtProperty.text=@"Bromley House";

        
    }
    else{
        
        self.TxtProperty.text=@"Towers at Wyncote";
        
    }

    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    self.DATEYYMMDD = [dateFormatter stringFromDate:[NSDate date]];
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    self.TxtDate.text = [dateFormatter stringFromDate:[NSDate date]];
    
    
    
    
    if([[[NSUserDefaults standardUserDefaults]valueForKey:@"roleAID"]isEqualToString:@"6"]){
        self.arrPropertyUnits = [[OfflineManager sharedInstance]getAllUnits];

        
    }
    else{
        
        NSArray *arr = [[OfflineManager sharedInstance]getAllUnits];
        NSMutableArray * arr1 = [[NSMutableArray alloc]init];
        for(Units *myunit in arr){
            
            if([myunit.access_for isEqualToString:@"both"]){
                
                [arr1 addObject:myunit];
            }
            
            
        }
        self.arrPropertyUnits=[arr1 copy];
        
        
    }
    
    
    self.AllOfflineData=[[OfflineManager sharedInstance]getOfflineMoveOutStatus];

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
        
        
        //if(self.arrPropertyUnits.count){
            
            [self showSelectionVCForOpponents];
            
//        }
//        else
//        {
//            [self getAllUnits];
//            
//        }
        
        return NO;
    }
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
    BOOL goahead=NO;
    
    
    
    if(self.TxtProperty.text.length){
        
        if(self.TxtUnitNumber.text.length){
            
            if(self.TxtDate.text.length){
                
                NSDictionary * dict =[self.AllOfflineData objectForKey:self.TxtUnitNumber.text];
                
                NSDictionary * dict2 =[dict objectForKey:@"data"];
                
                
                NSString *priceClean = [NSString stringWithFormat:@"%@",[dict2 valueForKey:@"moveInOutID"]];
                
                
                if([priceClean isEqualToString:@"(null)"]){
                    
                    goahead=YES;


                }
                else
                {
                    [self showToastForText:@"Move out is pending"];

                }

                
            }
            else
            {
                [self showToastForText:@"Please Select Date"];
                
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
    
    
    
    return goahead;
}
- (BOOL)shouldPerformSegueWithIdentifierOLD:(NSString *)identifier sender:(id)sender {
    
    
//#if TARGET_IPHONE_SIMULATOR
//    
//    // Simulator specific code
//    return YES;
//    
//    
//#else // TARGET_IPHONE_SIMULATOR
//    
//    // Device specific code
    
    
    
    
    if([identifier isEqualToString:@"GoToNextView"]){
        
        if(self.TxtProperty.text.length){
            
            if(self.TxtUnitNumber.text.length){
                
                if(self.TxtDate.text.length){
                
//return YES;

                    __block BOOL blockStatus = NO;
                    [self startLoading];

                    validateRequest = [[ValidateMoveInMoveOutRequest alloc]init];
                    validateRequest.property_name=self.TxtProperty.text;
                    validateRequest.units=self.TxtUnitNumber.text;

                    [[WebServiceManager sharedInstance]ValidateMoveInMoveOutFormForRequest:validateRequest success:^(MoveInMoveOutBaseResponse *result) {
                        [self stopLoading];

                        if([[result valueForKey:@"success"]boolValue]){
                            blockStatus =YES;
                            [self performSegueWithIdentifier:@"GoToNextView" sender:self];

                        }
                        else
                        {
                            
                            [self showToastForText:@"Move out is pending"];
                            blockStatus =NO;
                            

                        }
                        
                        //return blockStatus;
                    
                    }
                    failure:^(CustomError *error) {
                    [self stopLoading];
                                                                                       
                    [self showToastForText:@"Move out is pending"];
                        
                       // return blockStatus;

                        
                                                                                   }];
                    
                    
 
                    
                    return blockStatus;

                }
                else
                {
                    [self showToastForText:@"Please Select Date"];

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
    else
    {
        return NO;
    }
    
    
//}
    //else
    //{
      //  return YES;

    //}
//#endif // TARGET_IPHONE_SIMULATOR

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"GoToNextView"]){
        
     /*   MoveINViewController2 *ddata=segue.destinationViewController;*/
        
        MoveIN_OUT_TABLEViewController *ddata=segue.destinationViewController;
        app.addRequest.property_name=self.TxtProperty.text;
        app.addRequest.units=self.TxtUnitNumber.text;
        app.addRequest.inspection_date=self.DATEYYMMDD;
        ddata.moveInOutType=self.moveInOutType;//@"move-in";
        app.addRequest.type=self.moveInOutType;
        
        
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
