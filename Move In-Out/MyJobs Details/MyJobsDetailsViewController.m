//
//  ViewController.m
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import "MyJobsDetailsViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "ImagePreviewViewController.h"
 #import <QuartzCore/QuartzCore.h>
#import "MoveINPDFViewController.h"

@interface MyJobsDetailsViewController ()

{

}

@end

@implementation MyJobsDetailsViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.GoAhead=NO;
    [[self.Txt_Comment layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[self.Txt_Comment layer] setBorderWidth:2.3];
    [[self.Txt_Comment layer] setCornerRadius:15];
    
    if([self.Str_flag isEqualToString:@"Job"]){
        
        self.Btn_AdditionalComment.hidden=YES;
        
    }
    else
    {
        if([self.Str_flag isEqualToString:@"pending"]){
            
            self.Btn_AdditionalComment.hidden=YES;
            self.Btn_TaskComplete.hidden=YES;

            
        }
        else
        {
            self.Btn_TaskComplete.hidden=YES;
        }
    }
    
    
    
    [self LoadAllListData];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)LoadAllListData{
    
    [self startLoading];

    MyJobsDetailsRequest *request = [[MyJobsDetailsRequest alloc]init];
    request.detail_id=self.taskid;
    
    
    [[WebServiceManager sharedInstance]GetMyJobsDetailsRequest:request success:^(MoveInMoveOutBaseResponse *result) {
        [self stopLoading];
        
        
        
        response = (MyJobDetail*)result;
        
        self.LblParentCat.text=response.parentCategoryTitle;
        self.LblSubCat.text=response.childCategoryTitle;
        self.Lblproperty.text=response.property;
        self.Lblunit.text=response.units;
        self.LblDate.text=response.moveInInspectionDate;
        self.TxtComments.text=response.comment;
        
        [self.Image_Image1 setImageWithURL:[NSURL URLWithString:response.imageName1] placeholderImage:[UIImage imageNamed:@""]];
        [self.Image_Image2 setImageWithURL:[NSURL URLWithString:response.imageName2] placeholderImage:[UIImage imageNamed:@""]];
        self.Image_Image1.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapGesture:)];
        tapGesture1.numberOfTapsRequired = 1;
        [tapGesture1 setDelegate:self];
        [self.Image_Image1 addGestureRecognizer:tapGesture1];
        
        self.Image_Image2.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapGesture2:)];
        tapGesture2.numberOfTapsRequired = 1;
        [tapGesture2 setDelegate:self];
        [self.Image_Image2 addGestureRecognizer:tapGesture2];
        
        
        
        
//        self.LblParentCat.text=response.parentCategoryTitle;
//        self.LblParentCat.text=response.parentCategoryTitle;

        
        
        
        
    } failure:^(CustomError *error) {
        [self stopLoading];
        
        //        [self showToastForText:@"Could not save data at the moment"];
        [self showToastForText:@"Oops Error Occured !"];
        
    }];
    

    
    
}
- (void) tapGesture: (id)sender
{
    //handle Tap...
    
    ImagePreviewViewController *imageVc = [self.storyboard instantiateViewControllerWithIdentifier:@"ImagePreviewViewController"];
    
    imageVc.ImgURL = response.imageName1;
    
    [self presentViewController:imageVc animated:YES completion:^{
        
    }];

}
- (void) tapGesture2: (id)sender
{
    //handle Tap...
    ImagePreviewViewController *imageVc = [self.storyboard instantiateViewControllerWithIdentifier:@"ImagePreviewViewController"];
    
    imageVc.ImgURL = response.imageName2;
    
    [self presentViewController:imageVc animated:YES completion:^{
        
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
}
- (IBAction)GoBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    

    MoveINPDFViewController * dest = segue.destinationViewController;
    dest.SourcePath=@"JobDetail";
    dest.PDFURL=response.pdfPath;
    
    
}

-(void)gettakDone{
    
        // Background work
    [self startLoading];
        MyJobsCompleteRequest  * req =[[MyJobsCompleteRequest alloc ]init];
    req.detail_id=self.taskid;
    req.tech_id=[[NSUserDefaults standardUserDefaults]valueForKey:@"userID"];

    req.task_comment=self.Txt_Comment.text;

    
        [[WebServiceManager sharedInstance]GetMyJobsComleteRequest:req success:^(NSDictionary *result) {
            
            [self stopLoading];

            
                if([[result valueForKey:@"success"]boolValue]){
                    [self.navigationController popViewControllerAnimated:YES];
                }
                else
                {
                    [self showToastForText:@"Oops Error Occured !"];

                }
                
                
            
            
            
            
        } failure:^(CustomError *error) {
            
            [self stopLoading];

            [self showToastForText:@"Oops Error Occured !"];

            
        }];
        
        
        
        
    
    
}


-(void)AskQuestion{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"Are you sure?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        
        [self gettakDone];
        
    }];
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        
        
        
    }];
    [alert addAction:okAction];
    [alert addAction:otherAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}


- (IBAction)TaskCompleted_Click:(id)sender {
   // [self AskQuestion];
    
    self.Comment_View.hidden=NO;
   
}
- (IBAction)Logout_Click:(id)sender{
    
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"userID"];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"roleAID"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    window.rootViewController = [storyboard instantiateInitialViewController];

}

- (IBAction)Check_Click:(id)sender{
    
    if(self.GoAhead){
        
        self.GoAhead=NO;
        self.Check_box.image=[UIImage imageNamed:@"check-box-disable.png"];
    }
    else{
        
        self.Check_box.image=[UIImage imageNamed:@"check-box-active.png"];

        self.GoAhead=YES;

    }
    
    
}
- (IBAction)Submit_Click:(id)sender{
    
    if(self.GoAhead){
        
        if(self.Txt_Comment.text.length){
            
            [self gettakDone];

            
        }
        else
        {
            [self ShowAlleert:@"Please add additional comment"];

        }
        
    }
    else
    {
        [self ShowAlleert:@"Please check The Work-Order has been completed"];
    }
    
    
}
- (IBAction)Close_Click:(id)sender{
    
    self.Comment_View.hidden=YES;

}
-(void)ShowAlleert:(NSString*)message{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        
        
        
    }];
    [alert addAction:otherAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}
- (IBAction)ViewPDF_Click:(id)sender{
 
    [self performSegueWithIdentifier:@"ShowPDF" sender:nil];
}
- (IBAction)ViewComment_Click:(id)sender{
    
    
    
    [self ShowAlleert:response.taskCompletedComment];

}


@end
