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
@synthesize DATEYYMMDD1,DATEYYMMDD2,DATEYYMMDD3,moveInOutType;
@synthesize resident_not_avl_for_sign,resident_refused_sign;
@synthesize form_id;

-(void)Calculate{
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];

    float total=00.00;
    for (AddMoveInMoveOutServiceRequest *request in app.arrAllData){
        
        if(request.charges.length){
            
            total= total+[request.charges floatValue];
        }
    }
    self.LblPrice.text=[NSString stringWithFormat:@"$ %.2f",total];
    
    }
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    moveinmoveoutformtoAdd=[[SubmitMoveInMoveOutRequest alloc]init];
    counterData=0;
    AttemptCount=0;
    ResidentNotAvailable=NO;
    ResidentRefused=NO;
    self.resident_not_avl_for_sign=@"No";
    self.resident_refused_sign=@"No";
    
    if([self.moveInOutType isEqualToString:@"move-in"]){
        
        self.ViewMoveOutDate.hidden=YES;
        self.ViewCharges.hidden=YES;

    }
    else
    {
        self.ViewMoveOutDate.hidden=YES;
        self.ViewCharges.hidden=NO;
        [self Calculate];
    }

    
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
    if([textField isEqual:self.TxtMoveOutDate]){
        
        
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
    else if([self.ActiveTextField isEqual:self.TxtMoveOutDate]){
        
        self.TxtMoveOutDate.text = [dateofbirthformat stringFromDate:[controller.datePicker date]];
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
    
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(app.resultData){
        
        self.form_id=[NSString stringWithFormat:@"%@",[app.resultData.data valueForKey:@"moveInOutID"]];
        [NSTimer scheduledTimerWithTimeInterval:0.10 target:self selector:@selector(SubmitServiceData) userInfo:nil repeats:NO];

        
    }
    else
    {

        if([self.moveInOutType isEqualToString:@"move-out"]){
            
            AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
            app.addRequest.inspection_date=@"";//self.DATEYYMMDD3;

            
        }
//        else
//        {
    [NSTimer scheduledTimerWithTimeInterval:0.10 target:self selector:@selector(GO) userInfo:nil repeats:NO];
       // }
    }

    
    
    
    
    
    
    
    
    
    
    
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
        AttemptCount=0;
        [self SubmitServiceData];
        
        
        
        
        
        
        
    } failure:^(CustomError *error) {
        
        if(AttemptCount>5){
        
        [self stopLoading];
        
       // [self showToastForText:@"Could not save data at the moment"];
            [self showToastForText:@"Oops Error Occured !"];

        }
        else
        {
            AttemptCount= AttemptCount+1;
            [NSTimer scheduledTimerWithTimeInterval:0.10 target:self selector:@selector(GO) userInfo:nil repeats:NO];

        }
    }];

}
- (NSString *)encodeToBase64String:(UIImage *)image {
    
    
//    image = [UIImage compressImage:image
//                     compressRatio:0.9f];
//    
//    return [UIImageJPEGRepresentation(image,1) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];

    
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
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(app.resultData){

        moveinmoveoutformtoAdd.type=self.moveInOutType;//@"move-out";
                            NSDateFormatter *dateofbirthformat1 = [[NSDateFormatter alloc] init];
                            [dateofbirthformat1 setTimeStyle:NSDateFormatterNoStyle];
                            [dateofbirthformat1 setDateFormat:@"yyyy-MM-dd"];
//                            moveinmoveoutformtoAdd.inspection_date=[dateofbirthformat1 stringFromDate:[NSDate date]];

    }
    else
    {
        moveinmoveoutformtoAdd.type=self.moveInOutType;//@"move-in";
        

    }
    if([self.moveInOutType isEqualToString:@"move-in"]){
        
        moveinmoveoutformtoAdd.inspection_date=@"";
        
    }
    else
    {
        //moveinmoveoutformtoAdd.inspection_date=self.DATEYYMMDD3;
        NSDateFormatter *dateofbirthformat1 = [[NSDateFormatter alloc] init];
        [dateofbirthformat1 setTimeStyle:NSDateFormatterNoStyle];
        [dateofbirthformat1 setDateFormat:@"yyyy-MM-dd"];
        moveinmoveoutformtoAdd.inspection_date=[dateofbirthformat1 stringFromDate:[NSDate date]];

    }
    
    
    moveinmoveoutformtoAdd.resident_name=self.TxtResident.text;
    moveinmoveoutformtoAdd.resident_inspection_date=self.DATEYYMMDD1;
    moveinmoveoutformtoAdd.resident_signature=[self encodeToBase64String:img1];
    
    moveinmoveoutformtoAdd.leasing_agent=self.TxtLeasingAgent.text;
    moveinmoveoutformtoAdd.agent_inspection_date=self.DATEYYMMDD2;
    moveinmoveoutformtoAdd.agent_signature=[self encodeToBase64String:img2];
    
//    moveinmoveoutformtoAdd.manager_name=self.TxtResident.text;
//    moveinmoveoutformtoAdd.manager_inspection_date=self.DATEYYMMDD1;
//    moveinmoveoutformtoAdd.manager_signature=[self encodeToBase64String:img1];
    
    moveinmoveoutformtoAdd.resident_not_avl_for_sign=self.resident_not_avl_for_sign;
    moveinmoveoutformtoAdd.resident_refused_sign=self.resident_refused_sign;

    
    
    
    
    [[WebServiceManager sharedInstance]SubmitMoveInMoveOutForRequest:moveinmoveoutformtoAdd success:^(MoveInMoveOutBaseResponse *result) {
        [self stopLoading];
        if([[result valueForKey:@"success"]boolValue]){
            
            
            if([self.moveInOutType isEqualToString:@"move-in"]){
                
                [self.navigationController popToRootViewControllerAnimated:YES];

            }
            else
            {
                [self performSegueWithIdentifier:@"ShowOptions" sender:nil];
            }

            
            
            [self showToastForText:@"Saved Successfully"];
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
-(void)patchSelector{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)ResidentnotAvailable_Click:(id)sender {
    
    if(ResidentNotAvailable){
        
        self.ImgResidentNotAvailable.image=[UIImage imageNamed:@"check-box-disable.png"];
        ResidentNotAvailable=NO;
        self.resident_not_avl_for_sign=@"No";

        
        
    }
    else
    {
        self.ImgResidentNotAvailable.image=[UIImage imageNamed:@"check-box-active.png"];
        ResidentNotAvailable=YES;
        self.resident_not_avl_for_sign=@"Yes";

        
        
        
        
    }
}

- (IBAction)ResidentRefused_Click:(id)sender {
    
    if(ResidentRefused){
        
        self.ImgResidentRefused.image=[UIImage imageNamed:@"check-box-disable.png"];
        ResidentRefused=NO;
        self.resident_refused_sign=@"No";

        
        
    }
    else
    {
        self.ImgResidentRefused.image=[UIImage imageNamed:@"check-box-active.png"];
        ResidentRefused=YES;
        self.resident_refused_sign=@"Yes";

        
        
        
    }
}
- (IBAction)Clear1:(id)sender{
    
    [self.Signature1 erase];
    
}
- (IBAction)Clear2:(id)sender{
    [self.Signature2 erase];

}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}
@end
