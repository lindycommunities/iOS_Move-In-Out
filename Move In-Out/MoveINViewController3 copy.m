//
//  ViewController.m
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import "MoveINViewController3.h"
#import "AddMoveInMoveOutServiceRequest.h"
#import "GetMoveInMoveOutResponse.h"

@interface MoveINViewController3 ()

@property (strong, nonatomic) IBOutlet UITextField *TxtResident;
@property (strong, nonatomic) IBOutlet UITextField *TxtResidentDate;

@property (strong, nonatomic) IBOutlet UITextField *TxtLeasingAgent;
@property (strong, nonatomic) IBOutlet UITextField *TxtLeasingAgentDate;


@property (strong, nonatomic) IBOutlet UITextField *TxtManager;
@property (strong, nonatomic) IBOutlet UITextField *TxtManagerDate;

@property (strong, nonatomic)  UITextField *ActiveTextField;


@property (strong, nonatomic) IBOutlet UIButton *BtnNext;
@property (strong, nonatomic) IBOutlet UIScrollView *Scrollview;


@end

@implementation MoveINViewController3
@synthesize DATEYYMMDD1,DATEYYMMDD2,DATEYYMMDD3;
@synthesize form_id;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    moveinmoveoutformtoAdd=[[SubmitMoveInMoveOutRequest alloc]init];
    counterData=0;
    
}
-(void)viewDidLayoutSubviews
{
    [self setScrollViewSize];
}
-(void)setScrollViewSize{
    
    CGRect contentRect = CGRectZero;
    for (UIView *view in self.Scrollview.subviews) {
        contentRect = CGRectUnion(contentRect, view.frame);
        //        for (UIView *view1 in view.subviews) {
        //            contentRect = CGRectUnion(contentRect, view1.frame);
        //        }
        
    }
    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);

    
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//    contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
//
    
    self.Scrollview.contentSize = contentRect.size;
    
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
    if([textField isEqual:self.TxtResidentDate]){
        
        
        [self ShowDatePicker];
        return NO;
    }
    if([textField isEqual:self.TxtLeasingAgentDate]){
        
        
        [self ShowDatePicker];
        return NO;
    }
    if([textField isEqual:self.TxtManagerDate]){
        
        
        [self ShowDatePicker];
        return NO;
    }
    else {
        
        return YES;
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
    if([self.ActiveTextField isEqual:self.TxtResidentDate]){
        
        self.TxtResidentDate.text = [dateofbirthformat stringFromDate:[controller.datePicker date]];
        NSDateFormatter *dateofbirthformat1 = [[NSDateFormatter alloc] init];
        [dateofbirthformat1 setTimeStyle:NSDateFormatterNoStyle];
        [dateofbirthformat1 setDateFormat:@"yyyy-MM-dd"];
        self.DATEYYMMDD1 = [dateofbirthformat1 stringFromDate:[controller.datePicker date]];

        
    }
    else if([self.ActiveTextField isEqual:self.TxtLeasingAgentDate]){
        
        self.TxtLeasingAgentDate.text = [dateofbirthformat stringFromDate:[controller.datePicker date]];
        NSDateFormatter *dateofbirthformat1 = [[NSDateFormatter alloc] init];
        [dateofbirthformat1 setTimeStyle:NSDateFormatterNoStyle];
        [dateofbirthformat1 setDateFormat:@"yyyy-MM-dd"];
        self.DATEYYMMDD2 = [dateofbirthformat1 stringFromDate:[controller.datePicker date]];
        
        
    }
    else if([self.ActiveTextField isEqual:self.TxtManagerDate]){
        
        self.TxtManagerDate.text = [dateofbirthformat stringFromDate:[controller.datePicker date]];
        NSDateFormatter *dateofbirthformat1 = [[NSDateFormatter alloc] init];
        [dateofbirthformat1 setTimeStyle:NSDateFormatterNoStyle];
        [dateofbirthformat1 setDateFormat:@"yyyy-MM-dd"];
        self.DATEYYMMDD3 = [dateofbirthformat1 stringFromDate:[controller.datePicker date]];
        
        
    }
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
#pragma mark will handel dismmiss of datepicker if user press cancel btn
- (void)DatePickerViewControllerDidCancel:(DatePickerViewController *)controller
{
    //do nothing just dissmiss datepicker modelview
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Navigation
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    
#if TARGET_IPHONE_SIMULATOR
    
    // Simulator specific code
    return YES;
    
    
#else // TARGET_IPHONE_SIMULATOR
    
    // Device specific code
    return YES;

    
    
//    
//    if([identifier isEqualToString:@"GoToNextView"]){
//        
//        if(self.TxtProperty.text.length){
//            
//            if(self.TxtUnitNumber.text.length){
//                
//                if(self.TxtDate.text.length){
//                    
//                    return YES;
//                    
//                }
//                else
//                {
//                    [self showToastForText:@"Please Select Date"];
//
//                    return NO;
//                    
//                    
//                }
//            }
//            else
//            {
//                [self showToastForText:@"Please Enter Unit Number"];
//
//
//                
//                return NO;
//                
//            }
//        }
//        else
//        {
//            [self showToastForText:@"Please Select Property"];
//
//            
//            return NO;
//        }
//    }
//    else
//    {
//        return NO;
//    }
#endif // TARGET_IPHONE_SIMULATOR
    
    
}
- (IBAction)SubmitData:(id)sender {
    [self startLoading];

    //[self showToastForTextToast:@"Button Tapped"];
    
    
    [NSTimer scheduledTimerWithTimeInterval:0.30 target:self selector:@selector(GO) userInfo:nil repeats:NO];

    
    
    
    
    
    
    
    
    
    
    
//    [self.BtnNext setImage:img1 forState:UIControlStateNormal];

    
    
}
-(void)GO{
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    [[WebServiceManager sharedInstance]AddMoveInMoveOutFormForRequest:app.addRequest success:^(MoveInMoveOutBaseResponse *result) {
        //  [self stopLoading];
        
        GetMoveInMoveOutResponse *resp = (GetMoveInMoveOutResponse*)result;
        self.form_id=resp.form_id;
        NSLog(@"FORM %@ %@",self.form_id,resp.form_id);
        // [self startLoading];
        
        [self SubmitServiceData];
        
        
        
        
        
        
        
    } failure:^(CustomError *error) {
        [self stopLoading];
        
        [self showToastForText:@"Could not save data at the moment"];
    }];

}
- (NSString *)encodeToBase64String:(UIImage *)image {
    return [UIImageJPEGRepresentation(image, 0.3) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}
-(void)SubmitServiceData{
    
//    for (AddMoveInMoveOutServiceRequest *request in app.arrAllData){
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(counterData<[app.arrAllData count]){
    AddMoveInMoveOutServiceRequest *request=[app.arrAllData objectAtIndex:counterData];
    
    
        if(request.is_ok.length){
            request.move_in_out_id=self.form_id;
            [[WebServiceManager sharedInstance]AddMoveInMoveOutServiceForRequest:request success:^(MoveInMoveOutBaseResponse *result) {
               // [self stopLoading];
                if([[result valueForKey:@"success"]boolValue]){
                    
                    counterData=counterData+1;
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
                [self SubmitServiceData];

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
   // }
    
    
}
-(void)SubmitFinalData{
    
   // [self startLoading];

    [self.Signature1 captureSignature];
    UIImage *img1 = [self.Signature1 signatureImage:CGPointMake(self.Signature1.frame.origin.x , self.Signature1.frame.size.height) text:@""];
//    UIImageView *image0 =[[UIImageView alloc] initWithFrame:CGRectMake(0,0,300,300)];
//    image0.image=img1;
//    [self.view addSubview:image0];
    
    
    [self.Signature2 captureSignature];
    
    UIImage *img2 = [self.Signature2 signatureImage:CGPointMake(self.Signature2.frame.origin.x , self.Signature2.frame.size.height) text:@""];
    
//    UIImageView *image02 =[[UIImageView alloc] initWithFrame:CGRectMake(0,400,300,300)];
//    image02.image=img2;
//    [self.view addSubview:image02];
    
    [self.Signature3 captureSignature];
    
    UIImage *img3 = [self.Signature3 signatureImage:CGPointMake(self.Signature3.frame.origin.x , self.Signature3.frame.size.height) text:@""];
    
//    UIImageView *image3 =[[UIImageView alloc] initWithFrame:CGRectMake(0,800,300,300)];
//    image3.image=img3;
//    [self.view addSubview:image3];
    
    
    moveinmoveoutformtoAdd.move_in_out_id=self.form_id;
    moveinmoveoutformtoAdd.type=@"move-in";
    
    moveinmoveoutformtoAdd.resident_name=self.TxtResident.text;
    moveinmoveoutformtoAdd.resident_inspection_date=self.DATEYYMMDD1;
    moveinmoveoutformtoAdd.resident_signature=[self encodeToBase64String:img1];
    
    moveinmoveoutformtoAdd.leasing_agent=self.TxtLeasingAgent.text;
    moveinmoveoutformtoAdd.agent_inspection_date=self.DATEYYMMDD2;
    moveinmoveoutformtoAdd.agent_signature=[self encodeToBase64String:img2];
    
    moveinmoveoutformtoAdd.manager_name=self.TxtManager.text;
    moveinmoveoutformtoAdd.manager_inspection_date=self.DATEYYMMDD3;
    moveinmoveoutformtoAdd.manager_signature=[self encodeToBase64String:img3];
    
    [[WebServiceManager sharedInstance]SubmitMoveInMoveOutForRequest:moveinmoveoutformtoAdd success:^(MoveInMoveOutBaseResponse *result) {
        [self stopLoading];
        if([[result valueForKey:@"success"]boolValue]){
            
            [self.navigationController popToRootViewControllerAnimated:YES];
            
            [self showToastForText:@"Saved Successfully"];
           // [self performSelector:@selector(patchSelector) withObject:nil afterDelay:0.3];


        }
        else
        {
            [self showToastForText:@"Could not save data at the moment"];
            
        }
        
        
        
    } failure:^(CustomError *error) {
        [self stopLoading];
        
        [self showToastForText:@"Could not save data at the moment"];
    }];

    
}
-(void)patchSelector{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
