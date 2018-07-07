//
//  ViewController.m
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import "MyPendingSurveListViewController.h"
#import "MyPendingSurveyTableViewCell.h"
#import "MyJobsDetailsViewController.h"
#import "OfflineManager.h"
#import "AddPreventionRequest.h"

@interface MyPendingSurveListViewController ()

{
    NSArray *arrJobsList;

}

@end

@implementation MyPendingSurveListViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)LoadAllListData{
    
    [self startLoading];

    MyJobsListRequest *request = [[MyJobsListRequest alloc]init];
    request.technician_id=[[NSUserDefaults standardUserDefaults]valueForKey:@"userID"];
    
    
    [[WebServiceManager sharedInstance]GetMyJobsRequest:request success:^(MoveInMoveOutBaseResponse *result) {
        [self stopLoading];
        
        
        
        MyJobsListResponse *response = (MyJobsListResponse*)result;
        
        if (response.result.count) {
            arrJobsList = [[NSArray alloc]initWithArray:response.result];
            [self.TblALLData reloadData];
        }
            //levelID
        else{
            
            [self showToastForText:@"No Jobs Found"];
            
        }

        
        
        
    } failure:^(CustomError *error) {
        [self stopLoading];
        
        //        [self showToastForText:@"Could not save data at the moment"];
        [self showToastForText:@"Oops Error Occured !"];
        
    }];
    

    
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
   // [self LoadAllListData];

    
}
- (IBAction)GoBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"Details"]){
        
        MyJobsDetailsViewController *dest = segue.destinationViewController;
        dest.taskid=sender;
        dest.Str_flag=@"Job";
    }

    
}






- (IBAction)MoveOUT_Click:(id)sender {
    
    //[self AskQuestion];
   // [self performSegueWithIdentifier:@"MoveOUT" sender:nil];

}
- (IBAction)Logout_Click:(id)sender{
    
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"userID"];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"roleAID"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    window.rootViewController = [storyboard instantiateInitialViewController];

}
#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    tableView.contentInset = UIEdgeInsetsZero;
    
    if(section==0){
        
        NSMutableArray * arrFormData = [[OfflineManager sharedInstance]getFormData];
        return [arrFormData count];
    }
    else if(section==1){
        
        NSMutableArray * AllTurnOver = [[OfflineManager sharedInstance]getAllTurnOverData];
       return  [AllTurnOver count];
    }
    else if(section==2){
        
        NSMutableArray * RenovatedUnits = [[OfflineManager sharedInstance]getAllRenovatedUnitsData];
        return  [RenovatedUnits count];
    }
    else if(section==3){
        
        NSMutableArray * RentReadyUnits = [[OfflineManager sharedInstance]getAllRentReadyUnitsData];
       return  [RentReadyUnits count];
    }
    else if(section==4){
        
        NSMutableArray * RentReadyUnits = [[OfflineManager sharedInstance]getRentUnitsFormData];
        return  [RentReadyUnits count];
    }
    else if(section==5){
        
        NSMutableArray * RentReadyUnits = [[OfflineManager sharedInstance]getPreventionFormData];
        return  [RentReadyUnits count];
    }
    
    
    return 0;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellIdentifier = @"selectionCell";
    MyPendingSurveyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        
        
        
        cell = [[MyPendingSurveyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    
    if(indexPath.section==0){
        
        NSMutableArray * arrFormData = [[OfflineManager sharedInstance]getFormData];
        AddMoveInMoveOutRequest *addRequest = [arrFormData objectAtIndex:indexPath.row];

        
            cell.LblParentCat.text =[NSString stringWithFormat:@"%@",addRequest.property_name];
            cell.LblSubCat.text =[NSString stringWithFormat:@"Unit - %@",addRequest.units];
        if([addRequest.type isEqualToString:@"move-in"])
        {
            cell.Lblproperty.text =[NSString stringWithFormat:@"%@",@"Move-In Inspection"];
            
        }
        else
        {
            cell.Lblproperty.text =[NSString stringWithFormat:@"%@",@"Move-Out Inspection"];
            
        }
            //cell.Lblproperty.text =[NSString stringWithFormat:@"%@",addRequest.type];
        if(addRequest.inspection_date.length){
            
            NSArray *items = [addRequest.inspection_date componentsSeparatedByString:@"-"];   //take the one array for split the string
            
            NSString *str1=[items objectAtIndex:0];   //shows Description
            NSString *str2=[items objectAtIndex:1];   //Shows Data
            NSString *str3=[items objectAtIndex:2];   // shows IMG
            
          //  Finally NSLog(@"your  3 stirs ==%@   %@  %@", str1, str2, str3);
            
            
            cell.Lblunit.text =[NSString stringWithFormat:@"%@-%@-%@",str2,str3,str1];
            
        }
        else{
            
            cell.Lblunit.text =@"";
        }
        
            //cell.Lblunit.text =[NSString stringWithFormat:@"%@",addRequest.inspection_date];
            cell.LblDate.text =@"";//[NSString stringWithFormat:@"Date Added: %@",item.moveInInspectionDate];

        
        
        
    }
    else if(indexPath.section==1){
        
        NSMutableArray * AllTurnOver = [[OfflineManager sharedInstance]getAllTurnOverData];
        AddTurnOverRequest *addRequest=[AllTurnOver objectAtIndex:indexPath.row];
        
        
        cell.LblParentCat.text =[NSString stringWithFormat:@"%@",addRequest.apt];
        cell.LblSubCat.text =[NSString stringWithFormat:@"%@",addRequest.type];
        cell.Lblproperty.text =[NSString stringWithFormat:@"%@",addRequest.size];
        cell.Lblunit.text =[NSString stringWithFormat:@"%@",addRequest.move_in];
        cell.LblDate.text =@"Turn Over";//[NSString stringWithFormat:@"Date Added: %@",item.moveInInspectionDate];
        
        

        
        
        
        
    }
    else if(indexPath.section==2){
        
        NSMutableArray * RenovatedUnits = [[OfflineManager sharedInstance]getAllRenovatedUnitsData];
        
        
        AddRenovatedUnitsRequest *addRequest=[RenovatedUnits objectAtIndex:indexPath.row];
        
        
        cell.LblParentCat.text =[NSString stringWithFormat:@"%@",addRequest.apt];
        cell.LblSubCat.text =[NSString stringWithFormat:@"%@",addRequest.move_out];
        cell.Lblproperty.text =[NSString stringWithFormat:@"%@",addRequest.size];
        cell.Lblunit.text =[NSString stringWithFormat:@"%@",addRequest.move_in];
        cell.LblDate.text =@"Renovated Units";//[NSString stringWithFormat:@"Date Added: %@",item.moveInInspectionDate];
        


        
        
    }
    else if(indexPath.section==3){
        
        NSMutableArray * RentReadyUnits = [[OfflineManager sharedInstance]getAllRentReadyUnitsData];
        
        AddRentReadyUnitsRequest *addRequest=[RentReadyUnits objectAtIndex:indexPath.row];
        
        
        cell.LblParentCat.text =[NSString stringWithFormat:@"%@",addRequest.apt];
        cell.LblSubCat.text =[NSString stringWithFormat:@"%@",addRequest.type];
        cell.Lblproperty.text =[NSString stringWithFormat:@"%@",addRequest.size];
        cell.Lblunit.text =[NSString stringWithFormat:@"%@",addRequest.finish_date];
        cell.LblDate.text =@"Rent Ready Units";//[NSString stringWithFormat:@"Date Added:
        
        
        

        
    }
    else if(indexPath.section==4){
        
        NSMutableArray * RentReadyUnits = [[OfflineManager sharedInstance]getRentUnitsFormData];

        UpdateRentAdjustmenRequest *addRequest=[RentReadyUnits objectAtIndex:indexPath.row];
        
        
        cell.LblParentCat.text =[NSString stringWithFormat:@"Unit %@",addRequest.unitCode];
        cell.LblSubCat.text =[NSString stringWithFormat:@"Market Rate %@",addRequest.suggestedBaserent];
        cell.Lblproperty.text =[NSString stringWithFormat:@"Adjust Base Rate %@",addRequest.adjustprice];
        cell.Lblunit.text =[NSString stringWithFormat:@"%@",@""];
        cell.LblDate.text =@"Rent Adjustment";//[NSString stringWithFormat:@"Date Added:
        
        
        
        
        
    }
    else if(indexPath.section==5){
        
        NSMutableArray * RentReadyUnits = [[OfflineManager sharedInstance]getPreventionFormData];
        
        AddPreventionRequest *addRequest=[RentReadyUnits objectAtIndex:indexPath.row];
        
        
        cell.LblParentCat.text =[NSString stringWithFormat:@"Unit %@",addRequest.units];
        cell.LblSubCat.text =[NSString stringWithFormat:@"Property %@",addRequest.property];
        cell.Lblproperty.text =[NSString stringWithFormat:@"Date %@",addRequest.inspection_date];
        cell.Lblunit.text =[NSString stringWithFormat:@"%@",@""];
        cell.LblDate.text =@"Prevention Maintenance";//[NSString stringWithFormat:@"Date Added:
        
        
        
        
        
    }
    
    
    
    
//    MyJobs *item = [arrJobsList objectAtIndex:indexPath.row];
//    // cell.textLabel.text = [item valueForKey:@"levelName"];
//    cell.LblParentCat.text =[NSString stringWithFormat:@"%@",item.parentCategoryTitle];
//    cell.LblSubCat.text =[NSString stringWithFormat:@"%@",item.childCategoryTitle];
//    cell.Lblproperty.text =[NSString stringWithFormat:@"%@",item.property];
//    cell.Lblunit.text =[NSString stringWithFormat:@"%@",item.units];
//    cell.LblDate.text =[NSString stringWithFormat:@"Date Added: %@",item.moveInInspectionDate];

    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.currentIndex=indexPath.row;
    
    if(indexPath.section==0){
        
        
        
        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"" message:@"Please Select Action" preferredStyle:UIAlertControllerStyleActionSheet];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
            // Cancel button tappped.
            [self dismissViewControllerAnimated:YES completion:^{
            }];
        }]];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            
            // Distructive button tapped.
            [self dismissViewControllerAnimated:YES completion:^{
                
                }];
                UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"" message:@"Are you sure?" preferredStyle:UIAlertControllerStyleActionSheet];
                
                [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                    
                    // Cancel button tappped.
                    [self dismissViewControllerAnimated:YES completion:^{
                    }];
                }]];
                
                [actionSheet addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
                    
                    // Distructive button tapped.
                    [self RemoveFirstObject];
                    [self dismissViewControllerAnimated:YES completion:^{
                    }];
                }]];
            
            actionSheet.popoverPresentationController.sourceView = self.view;
            actionSheet.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0);
            
            [actionSheet showViewController:self sender:actionSheet];

                
                [self presentViewController:actionSheet animated:YES completion:nil];

                
            
        }]];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Submit" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            NSMutableArray * arrFormData = [[OfflineManager sharedInstance]getFormData];
            AddMoveInMoveOutRequest *addRequest = [arrFormData objectAtIndex:indexPath.row];
            
            self.moveInOutType=addRequest.type;
            if(addRequest.move_in_out_id.length){
                
                self.form_id=addRequest.move_in_out_id;
                
                [self ProcessSubmitServiceData];
                
            }
            else
            {
                [self GO:addRequest];
            }
            
            [self dismissViewControllerAnimated:YES completion:^{
            }];
        }]];
        
        // Present action sheet.
        
        actionSheet.popoverPresentationController.sourceView = self.view;
        actionSheet.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0);
        
        [actionSheet showViewController:self sender:actionSheet];

        [self presentViewController:actionSheet animated:YES completion:nil];
        
        
        
        
       
        
        
    }
    else if(indexPath.section==1){
        
        
        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"" message:@"Please Select Action" preferredStyle:UIAlertControllerStyleActionSheet];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
            // Cancel button tappped.
            [self dismissViewControllerAnimated:YES completion:^{
            }];
        }]];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            
            // Distructive button tapped.
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
            UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"" message:@"Are you sure?" preferredStyle:UIAlertControllerStyleActionSheet];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                
                // Cancel button tappped.
                [self dismissViewControllerAnimated:YES completion:^{
                }];
            }]];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
                
                // Distructive button tapped.
                [self RemoveTurnoverObject];
                [self dismissViewControllerAnimated:YES completion:^{
                }];
            }]];
            actionSheet.popoverPresentationController.sourceView = self.view;
            actionSheet.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0);
            
            [actionSheet showViewController:self sender:actionSheet];

            [self presentViewController:actionSheet animated:YES completion:nil];
            
            
            
        }]];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Submit" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            [self UploadTurnOver];
            
            [self dismissViewControllerAnimated:YES completion:^{
            }];
        }]];
        actionSheet.popoverPresentationController.sourceView = self.view;
        actionSheet.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0);
        
        [actionSheet showViewController:self sender:actionSheet];

        // Present action sheet.
        [self presentViewController:actionSheet animated:YES completion:nil];
        

        
        
        
        
        
    }
    else if(indexPath.section==2){
        
        
        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"" message:@"Please Select Action" preferredStyle:UIAlertControllerStyleActionSheet];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
            // Cancel button tappped.
            [self dismissViewControllerAnimated:YES completion:^{
            }];
        }]];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            
            // Distructive button tapped.
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
            UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"" message:@"Are you sure?" preferredStyle:UIAlertControllerStyleActionSheet];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                
                // Cancel button tappped.
                [self dismissViewControllerAnimated:YES completion:^{
                }];
            }]];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
                
                // Distructive button tapped.
                [self RemoveRenovatedUnitsObject];
                [self dismissViewControllerAnimated:YES completion:^{
                }];
            }]];
            actionSheet.popoverPresentationController.sourceView = self.view;
            actionSheet.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0);
            
            [actionSheet showViewController:self sender:actionSheet];

            [self presentViewController:actionSheet animated:YES completion:nil];
            
            
            
        }]];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Submit" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            [self UploadRenovatedUnits];
            
            [self dismissViewControllerAnimated:YES completion:^{
            }];
        }]];
        actionSheet.popoverPresentationController.sourceView = self.view;
        actionSheet.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0);
        
        [actionSheet showViewController:self sender:actionSheet];

        // Present action sheet.
        [self presentViewController:actionSheet animated:YES completion:nil];
        

        
        
        
    }
    else if(indexPath.section==3){
        
        
        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"" message:@"Please Select Action" preferredStyle:UIAlertControllerStyleActionSheet];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
            // Cancel button tappped.
            [self dismissViewControllerAnimated:YES completion:^{
            }];
        }]];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            
            // Distructive button tapped.
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
            UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"" message:@"Are you sure?" preferredStyle:UIAlertControllerStyleActionSheet];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                
                // Cancel button tappped.
                [self dismissViewControllerAnimated:YES completion:^{
                }];
            }]];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
                
                // Distructive button tapped.
                [self RemoveRentReadyUnitsObject];
                [self dismissViewControllerAnimated:YES completion:^{
                }];
            }]];
            actionSheet.popoverPresentationController.sourceView = self.view;
            actionSheet.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0);
            
            [actionSheet showViewController:self sender:actionSheet];

            [self presentViewController:actionSheet animated:YES completion:nil];
            
            
            
        }]];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Submit" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            [self UploadRentReadyUnits];
            
            [self dismissViewControllerAnimated:YES completion:^{
            }];
        }]];
        actionSheet.popoverPresentationController.sourceView = self.view;
        actionSheet.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0);
        
        [actionSheet showViewController:self sender:actionSheet];

        // Present action sheet.
        [self presentViewController:actionSheet animated:YES completion:nil];
        


    }
    else if(indexPath.section==4){
        
        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"" message:@"Please Select Action" preferredStyle:UIAlertControllerStyleActionSheet];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
            // Cancel button tappped.
            [self dismissViewControllerAnimated:YES completion:^{
            }];
        }]];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            
            // Distructive button tapped.
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
            UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"" message:@"Are you sure?" preferredStyle:UIAlertControllerStyleActionSheet];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                
                // Cancel button tappped.
                [self dismissViewControllerAnimated:YES completion:^{
                }];
            }]];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
                
                // Distructive button tapped.
                [self RemoveRentUnitsObject];
                [self dismissViewControllerAnimated:YES completion:^{
                }];
            }]];
            actionSheet.popoverPresentationController.sourceView = self.view;
            actionSheet.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0);
            
            [actionSheet showViewController:self sender:actionSheet];

            [self presentViewController:actionSheet animated:YES completion:nil];
            
            
            
        }]];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Submit" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            [self SubmitRentUnitsFormData];
            
            [self dismissViewControllerAnimated:YES completion:^{
            }];
        }]];
        actionSheet.popoverPresentationController.sourceView = self.view;
        actionSheet.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0);
        
        [actionSheet showViewController:self sender:actionSheet];

        // Present action sheet.
        [self presentViewController:actionSheet animated:YES completion:nil];
        
    }
    else if(indexPath.section==5){
        
        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"" message:@"Please Select Action" preferredStyle:UIAlertControllerStyleActionSheet];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
            // Cancel button tappped.
            [self dismissViewControllerAnimated:YES completion:^{
            }];
        }]];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            
            // Distructive button tapped.
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
            UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"" message:@"Are you sure?" preferredStyle:UIAlertControllerStyleActionSheet];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                
                // Cancel button tappped.
                [self dismissViewControllerAnimated:YES completion:^{
                }];
            }]];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
                
                // Distructive button tapped.
                [self RemovePreventionInspectionObject];
                [self dismissViewControllerAnimated:YES completion:^{
                }];
            }]];
            actionSheet.popoverPresentationController.sourceView = self.view;
            actionSheet.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0);
            
            [actionSheet showViewController:self sender:actionSheet];

            [self presentViewController:actionSheet animated:YES completion:nil];
            
            
            
        }]];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Submit" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            [self submitPreventionFormData];
            
            [self dismissViewControllerAnimated:YES completion:^{
            }];
        }]];
        
        // Present action sheet.
        
        actionSheet.popoverPresentationController.sourceView = self.view;
        actionSheet.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0);

        [actionSheet showViewController:self sender:actionSheet];
        
       

        
        [self presentViewController:actionSheet animated:YES completion:nil];
        
    }
    
    
    }
-(void)GO:(AddMoveInMoveOutRequest*)addRequest{

    [self startLoading];

[[WebServiceManager sharedInstance]AddMoveInMoveOutFormForRequest:addRequest success:^(MoveInMoveOutBaseResponse *result) {
      [self stopLoading];
    
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
        self.arrAllData=[arrServiceData objectAtIndex:self.currentIndex];
        [self SubmitServiceData];
        
        
    }
    
}
-(void)SubmitServiceData


{
    
    [self startLoading];

    if(counterData<[self.arrAllData count]){
        
        AddMoveInMoveOutServiceRequest *request=[self.arrAllData objectAtIndex:counterData];
        
        
        
        
        
        
        
        
        
        if(request.is_ok.length){
            request.move_in_out_id=self.form_id;
            request.type=self.moveInOutType;
            [[WebServiceManager sharedInstance]AddMoveInMoveOutServiceForRequest:request success:^(MoveInMoveOutBaseResponse *result) {
                 [self stopLoading];
                if([[result valueForKey:@"success"]boolValue]){
                    
                    [self stopLoading];
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
         [self stopLoading];
        
        [self ProcessSubmitServiceAllOKData];
    }
}

-(void)ProcessSubmitServiceAllOKData
//SubmitServiceAllOKData


{
    
    
    NSMutableArray * arrServiceData = [[OfflineManager sharedInstance]getServiceAllOKData];
    if([arrServiceData count]>0){
        
        self.arrOKAllData = [[NSMutableArray alloc]init];
        self.arrOKAllData=[arrServiceData objectAtIndex:self.currentIndex];
        counterData=0;
        [self SubmitServiceAllOKData];
        
        
    }
    else
    {
        [self SubmitFinalData];

    }
    
    
    
}
-(void)SubmitServiceAllOKData{
    
    
    
        if(counterData<[self.arrOKAllData count]){

        [self startLoading];

        NSString *property = [self.arrOKAllData objectAtIndex:counterData];
        AddMoveInMoveOutServiceRequest *request = [[AddMoveInMoveOutServiceRequest alloc]init];
        request.parent_category=property;
        request.move_in_out_id=self.form_id;
        request.type=self.moveInOutType;

        [[WebServiceManager sharedInstance]AddMoveInMoveOutAllOKServiceForRequest:request success:^(MoveInMoveOutBaseResponse *result) {
            // [self stopLoading];
            if([[result valueForKey:@"success"]boolValue]){
                
                AttemptCount=0;
               // [self.arrOKAllData removeObjectAtIndex:0];
                counterData=counterData+1;
                [self SubmitServiceAllOKData];
                
            }
            else
            {
                [self stopLoading];
                [self showToastForText:@"Could not save data at the moment"];
                //[self SubmitServiceData];
                
            }
            
            
            
        } failure:^(CustomError *error) {
            
            if(AttemptCount>5){
                
                [self stopLoading];
                
                // [self showToastForText:@"Could not save data at the moment"];
                [self showToastForText:@"Oops Error Occured !"];
                
            }
            else
            {
                AttemptCount= AttemptCount+1;
                [NSTimer scheduledTimerWithTimeInterval:0.10 target:self selector:@selector(SubmitServiceAllOKData) userInfo:nil repeats:NO];
                
            }
            
            
        }];
        
        
        
    }
    else
    {
        [self stopLoading];

        [self SubmitFinalData];

    }
    
    

}

-(void)SubmitFinalData
{
    [self startLoading];

    NSMutableArray * arrFormData = [[OfflineManager sharedInstance]getFinalFormData];
    if([arrFormData count]>0){
        
        SubmitMoveInMoveOutRequest *moveinmoveoutformtoAdd = [arrFormData objectAtIndex:self.currentIndex];
        
        
        moveinmoveoutformtoAdd.move_in_out_id=self.form_id;
        [[WebServiceManager sharedInstance]SubmitMoveInMoveOutForRequest:moveinmoveoutformtoAdd success:^(MoveInMoveOutBaseResponse *result) {
            //[self stopLoading];
            if([[result valueForKey:@"success"]boolValue]){
                
                
                [self stopLoading];

                [self showToastForText:@"Data Saved Successfully"];

                
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

- (IBAction)SubmitRentUnitsFormData{
    
    [self startLoading];
    
    NSMutableArray * RentReadyUnits = [[OfflineManager sharedInstance]getRentUnitsFormData];
    
    UpdateRentAdjustmenRequest *request=[RentReadyUnits objectAtIndex:self.currentIndex];

    [[WebServiceManager sharedInstance]UpdateRentAdjustmenForRequest:request success:^(MoveInMoveOutBaseResponse *result) {
        [self stopLoading];
        if([[result valueForKey:@"success"]boolValue]){
            
            RentAdjustmenID *response = (RentAdjustmenID*)result;
            self.rent_update_id = response.rent_update_id;
            
            self.arrAmminities = [[NSMutableArray alloc]init];
            
            NSMutableArray * RentReadyUnitsDesc = [[OfflineManager sharedInstance]getRentAmenitiesDescFormData];
  
            self.arrAmminities = [[RentReadyUnitsDesc objectAtIndex:self.currentIndex]mutableCopy];

            [self performSelector:@selector(SubmitAminititesData) withObject:nil afterDelay:0.1];
            
            
        }
        else
        {
            [self showToastForText:@"Could not save data at the moment"];
            
        }
        
        
        
    } failure:^(CustomError *error) {
        [self stopLoading];
        
        //        [self showToastForText:@"Could not save data at the moment"];
        [self showToastForText:error.errorDescription];
        
    }];
    
    
    
}
- (IBAction)SubmitAminititesData {
    if(self.arrAmminities.count > 0){
        
        UpdateRentAdjustmenAminitiesRequest *item = [self.arrAmminities objectAtIndex:0];
        
        [self performSelector:@selector(PushAminititesData:) withObject:item afterDelay:0.1];
        
        
    }
    else
    {
        
        [self RemoveRentUnitsObject];
        [self showToastForText:@"Saved Successfully"];
        
    }
    
    
}
- (IBAction)PushAminititesData:(UpdateRentAdjustmenAminitiesRequest*)requestitem {
    
    [self startLoading];
    
    requestitem.rentUpdateID = self.rent_update_id;
    [[WebServiceManager sharedInstance]UpdateRentAdjustmenAminitiesForRequest:requestitem success:^(MoveInMoveOutBaseResponse *result) {
        [self stopLoading];
        if([[result valueForKey:@"success"]boolValue]){
            
            
            [self.arrAmminities removeObjectAtIndex:0];
            [self performSelector:@selector(SubmitAminititesData) withObject:nil afterDelay:0.1];
            
            
            
        }
        else
        {
            [self showToastForText:@"Could not save data at the moment"];
            
        }
        
        
        
    } failure:^(CustomError *error) {
        [self stopLoading];
        
        //        [self showToastForText:@"Could not save data at the moment"];
        [self showToastForText:error.errorDescription];
        
    }];
    
    
}


-(void)RemoveFirstObject{
    
    NSMutableArray * arrFormData = [[OfflineManager sharedInstance]getFormData];
    if([arrFormData count]>0){
        
        [arrFormData removeObjectAtIndex:self.currentIndex];
    }
    
    [[OfflineManager sharedInstance]SaveFormData:arrFormData];
    
    NSMutableArray * arrServiceData = [[OfflineManager sharedInstance]getServiceData];
    if([arrServiceData count]>0){
        
        [arrServiceData removeObjectAtIndex:self.currentIndex];
    }
    
    [[OfflineManager sharedInstance]SaveServiceData:arrServiceData];
    
    
    NSMutableArray * arrServiceAllOKData = [[OfflineManager sharedInstance]getServiceAllOKData];
    if([arrServiceAllOKData count]>0){
        
        [arrServiceAllOKData removeObjectAtIndex:self.currentIndex];
    }
    
    [[OfflineManager sharedInstance]SaveServiceAllOKData:arrServiceAllOKData];
    
    
    
    
    NSMutableArray * arrFinalFormData = [[OfflineManager sharedInstance]getFinalFormData];
    if([arrFinalFormData count]>0){
        
        [arrFinalFormData removeObjectAtIndex:self.currentIndex];
    }
    
    [[OfflineManager sharedInstance]SaveFinalFormData:arrFinalFormData];
    [self.TblALLData reloadData];

    
}
-(void)UploadTurnOver{
    
    [self startLoading];
    NSMutableArray * AllTurnOver = [[OfflineManager sharedInstance]getAllTurnOverData];
    
    if([AllTurnOver count]>0){
        
        AddTurnOverRequest *AddTurnOverformtoAdd=[AllTurnOver objectAtIndex:self.currentIndex];
        
        
        // [self startLoading];
        [[WebServiceManager sharedInstance]AddTurnOverFormForRequest:AddTurnOverformtoAdd success:^(MoveInMoveOutBaseResponse *result) {
            // [self stopLoading];
            
            // [self.navigationController popToRootViewControllerAnimated:YES];
            
            
            
            [self RemoveTurnoverObject];
            
            [self stopLoading];

            
            
            
        } failure:^(CustomError *error) {
            
            [self showToastForText:@"Oops Error Occured !"];
            [self stopLoading];
            
            
            
        }];
        
        
        
        
    }
    else
    {
        //[self UploadRenovatedUnits];
        [self stopLoading];
    }
    
    
}
-(void)UploadRenovatedUnits{
    
    [self startLoading];
    NSMutableArray * AllTurnOver = [[OfflineManager sharedInstance]getAllRenovatedUnitsData];
    
    if([AllTurnOver count]>0){
        
        
        AddRenovatedUnitsRequest *AddRenovatedUnitsformtoAdd=[AllTurnOver objectAtIndex:self.currentIndex];
        
        
        
        [[WebServiceManager sharedInstance]AddRenovatedUnitsFormForRequest:AddRenovatedUnitsformtoAdd success:^(MoveInMoveOutBaseResponse *result) {
            // [self stopLoading];
            
            
            [self RemoveRenovatedUnitsObject];
            [self stopLoading];

            
            // [self.navigationController popToRootViewControllerAnimated:YES];
            // [self.navigationController popViewControllerAnimated:YES];
            
            
            
            
            
            
            
            
        } failure:^(CustomError *error) {
            
            [self showToastForText:@"Oops Error Occured !"];
            [self stopLoading];
            
            
            
        }];
    }
    else{
        
       // [self UploadRentReadyUnits];
        [self stopLoading];

    }
    
    
    
}
-(void)UploadRentReadyUnits{
    
    [self startLoading];
    NSMutableArray * AllTurnOver = [[OfflineManager sharedInstance]getAllRentReadyUnitsData];
    
    if([AllTurnOver count]>0){
        
        AddRentReadyUnitsRequest *AddTurnOverformtoAdd=[AllTurnOver objectAtIndex:self.currentIndex];
        
        
        
        
        [[WebServiceManager sharedInstance]AddRentReadyUnitsFormForRequest:AddTurnOverformtoAdd success:^(MoveInMoveOutBaseResponse *result) {
            
            
            
            
            [self RemoveRentReadyUnitsObject];
            [self stopLoading];

            
            
            
            
            
        } failure:^(CustomError *error) {
            
            [self showToastForText:@"Oops Error Occured !"];
            [self stopLoading];
            
            
            
        }];
    }
    else
    {
       // [self StartUpload];
        [self stopLoading];

    }
    
}
-(void)RemoveTurnoverObject{
    
    NSMutableArray * arrFormData = [[OfflineManager sharedInstance]getAllTurnOverData];
    if([arrFormData count]>0){
        
        [arrFormData removeObjectAtIndex:self.currentIndex];
    }
    
    [[OfflineManager sharedInstance]SaveAllTurnOverData:arrFormData];
    [self.TblALLData reloadData];
}
-(void)RemoveRenovatedUnitsObject{
    
    NSMutableArray * arrFormData = [[OfflineManager sharedInstance]getAllRenovatedUnitsData];
    if([arrFormData count]>0){
        
        [arrFormData removeObjectAtIndex:self.currentIndex];
    }
    
    [[OfflineManager sharedInstance]SaveAllRenovatedUnitsData:arrFormData];
    [self.TblALLData reloadData];

}
-(void)RemoveRentReadyUnitsObject{
    
    NSMutableArray * arrFormData = [[OfflineManager sharedInstance]getAllRentReadyUnitsData];
    if([arrFormData count]>0){
        
        [arrFormData removeObjectAtIndex:self.currentIndex];
    }
    
    [[OfflineManager sharedInstance]SaveAllRentReadyUnitsData:arrFormData];
    [self.TblALLData reloadData];
    
}
-(void)RemoveRentUnitsObject{
    
    NSMutableArray * arrFormData = [[OfflineManager sharedInstance]getRentUnitsFormData];
    if([arrFormData count]>0){
        
        [arrFormData removeObjectAtIndex:self.currentIndex];
    }
    
    [[OfflineManager sharedInstance]SaveRentUnitsFormData:arrFormData];
    
    
    NSMutableArray * arrFinalFormData = [[OfflineManager sharedInstance]getRentAmenitiesDescFormData];
    if([arrFinalFormData count]>0){
        
        [arrFinalFormData removeObjectAtIndex:self.currentIndex];
    }
    
    [[OfflineManager sharedInstance]SaveRentAmenitiesDescFormData:arrFinalFormData];
    [self.TblALLData reloadData];
    
}
-(void)RemovePreventionInspectionObject{
    
    NSMutableArray * arrFormData = [[OfflineManager sharedInstance]getPreventionFormData];
    if([arrFormData count]>0){
        
        [arrFormData removeObjectAtIndex:self.currentIndex];
    }
    
    [[OfflineManager sharedInstance]savePreventionFormData:arrFormData];
    
    
    NSMutableArray * arrFinalFormData = [[OfflineManager sharedInstance]getPreventionServiceData];
    if([arrFinalFormData count]>0){
        
        [arrFinalFormData removeObjectAtIndex:self.currentIndex];
    }
    
    [[OfflineManager sharedInstance]savePreventionServiceData:arrFinalFormData];
    [self.TblALLData reloadData];
    
}
- (IBAction)submitPreventionFormData{
    
    [self startLoading];
    
    NSMutableArray * RentReadyUnits = [[OfflineManager sharedInstance]getPreventionFormData];
    
    AddPreventionRequest *request=[RentReadyUnits objectAtIndex:self.currentIndex];
    
    [[WebServiceManager sharedInstance]submitPreventionFormDataForRequest:request success:^(MoveInMoveOutBaseResponse *result) {
        [self stopLoading];
        if([[result valueForKey:@"success"]boolValue]){
            
            PreventionMaintenaneID *response = (PreventionMaintenaneID*)result;
            self.preventmain_id = response.form_id;
            
            self.arrAmminities = [[NSMutableArray alloc]init];
            
            NSMutableArray * RentReadyUnitsDesc = [[OfflineManager sharedInstance]getPreventionServiceData];
            
            self.arrAmminities = [[RentReadyUnitsDesc objectAtIndex:self.currentIndex]mutableCopy];
            
            [self performSelector:@selector(SubmitPreventionServiceData) withObject:nil afterDelay:0.1];
            
            
        }
        else
        {
            [self showToastForText:@"Could not save data at the moment"];
            
        }
        
        
        
    } failure:^(CustomError *error) {
        [self stopLoading];
        
        //        [self showToastForText:@"Could not save data at the moment"];
        [self showToastForText:error.errorDescription];
        
    }];
    
    
    
}
- (IBAction)SubmitPreventionServiceData {
    if(self.arrAmminities.count > 0){
        
        AddPreventionServiceRequestRequest *item = [self.arrAmminities objectAtIndex:0];
        
        [self performSelector:@selector(PushPreventionServiceData:) withObject:item afterDelay:0.1];
        
        
    }
    else
    {
        
        [self RemovePreventionInspectionObject];
        [self showToastForText:@"Saved Successfully"];
        
    }
    
    
}
- (IBAction)PushPreventionServiceData:(AddPreventionServiceRequestRequest*)requestitem {
    
    [self startLoading];
    
    requestitem.preventmain_id = self.preventmain_id;
    [[WebServiceManager sharedInstance]submitPreventionServiceDataForRequest:requestitem success:^(MoveInMoveOutBaseResponse *result) {
        [self stopLoading];
        if([[result valueForKey:@"success"]boolValue]){
            
            [self.arrAmminities removeObjectAtIndex:0];
            [self performSelector:@selector(SubmitPreventionServiceData) withObject:nil afterDelay:0.1];
            
            
            
        }
        else
        {
            [self showToastForText:@"Could not save data at the moment"];
            
        }
        
        
        
    } failure:^(CustomError *error) {
        [self stopLoading];
        
        //        [self showToastForText:@"Could not save data at the moment"];
        [self showToastForText:error.errorDescription];
        
    }];
    
    
}


@end
