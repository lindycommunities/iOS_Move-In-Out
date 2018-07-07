//
//  ViewController.m
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import "CompletedMoveoutListViewController.h"
#import "CompletedMoveoutListTableViewCell.h"
#import "MyJobsDetailsViewController.h"
#import "OfflineManager.h"
#import "MoveINPDFViewController.h"
#import "SLSelectionViewController.h"
@interface CompletedMoveoutListViewController ()<SLSelectionDelegate>

{
    NSArray *arrJobsList;

}

@end

@implementation CompletedMoveoutListViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if([self.SourcePath isEqualToString:@"MoveInCompleted"]){
        
        self.LblMessage.text=@"Completed Move In Inspection";

        [self GetAllTechnicianMoveInUnits];
        
    }
    else
    {
        self.LblMessage.text=@"Completed Move Out Inspection";

        [self LoadTechnicianData];
        [self GetAllCompletedUnits];
        

    }

    // Do any additional setup after loading the view, typically from a nib.
}
-(void)GetAllCompletedUnits{
    
    [self startLoading];

    
    
    [[WebServiceManager sharedInstance]GetAllCompletedUnitsWithSuccess:^(MoveInMoveOutBaseResponse *result) {
        [self stopLoading];
        
        
        
        CompleteUnitListResponse *response = (CompleteUnitListResponse*)result;
        
        if (response.data.count) {
            arrJobsList = [[NSArray alloc]initWithArray:response.data];
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
-(void)GetAllTechnicianMoveInUnits{
    
    [self startLoading];
    
    
    
    [[WebServiceManager sharedInstance]GetAllTechnicianMoveInUnitsWithSuccess:^(MoveInMoveOutBaseResponse *result) {
        [self stopLoading];
        
        
        
        CompleteUnitListResponse *response = (CompleteUnitListResponse*)result;
        
        if (response.data.count) {
            arrJobsList = [[NSArray alloc]initWithArray:response.data];
            [self.TblALLData reloadData];
        }
        //levelID
        else{
            
            [self showToastForText:@"No Records Found"];
            
        }
        
        
        
        
    } failure:^(CustomError *error) {
        [self stopLoading];
        
        //        [self showToastForText:@"Could not save data at the moment"];
        [self showToastForText:@"No Records Found"];
        
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    tableView.contentInset = UIEdgeInsetsZero;
    
    
    
    return [arrJobsList count];

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellIdentifier = @"selectionCell";
    CompletedMoveoutListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        
        
        
        cell = [[CompletedMoveoutListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    
    
    
    
    
    CompleteUnit *item = [arrJobsList objectAtIndex:indexPath.row];
    // cell.textLabel.text = [item valueForKey:@"levelName"];
    cell.LblUnit_Property.text =[NSString stringWithFormat:@"Unit %@ (%@)",item.units,item.property];
    cell.LblReportedBy.text =[NSString stringWithFormat:@"Reported By : %@",item.displayName];
    cell.LblDate.text =[NSString stringWithFormat:@"Date : %@",item.moveOutInspectionDate];
    cell.LblOk.text =[NSString stringWithFormat:@"Ok -> %@",item.ok];
    cell.LblNotOk.text =[NSString stringWithFormat:@"Not Ok -> %@",item.not_ok];
    
    
    cell.Btn_ViewRepost.tag=indexPath.row;
    [cell.Btn_ViewRepost addTarget:self action:@selector(OpenPDF:) forControlEvents:UIControlEventTouchUpInside];
    
    
    if(![self.SourcePath isEqualToString:@"MoveInCompleted"]){

    cell.Btn_AssigntoTech.tag=indexPath.row;
    [cell.Btn_AssigntoTech addTarget:self action:@selector(ShowTech:) forControlEvents:UIControlEventTouchUpInside];
    }
    else{
        
        cell.Btn_AssigntoTech.hidden=YES;
    }

    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    }
-(void)OpenPDF:(UIButton*)Sender{
    
    CompleteUnit *item = [arrJobsList objectAtIndex:Sender.tag];

    MoveINPDFViewController * dest = [self.storyboard instantiateViewControllerWithIdentifier:@"MoveINPDFViewController"];
    dest.SourcePath=@"JobDetail";
    dest.PDFURL=item.pdfPath;
    [self.navigationController pushViewController:dest animated:YES];

    
    
}
-(void)LoadTechnicianData{
    
    self.AllTechnicianData = [[OfflineManager sharedInstance]getAllTechnicianData];
    
}
- (IBAction)ShowTech:(UIButton*)sender{
    
    
   
   
        self.item =[arrJobsList objectAtIndex:sender.tag];
        [self showSelectionVCForOpponents:[self.AllTechnicianData mutableCopy]];
 
    

    
    
    
    
}
-(void)showSelectionVCForOpponents:(NSMutableArray*)arrvalue{
    
    SLSelectionViewController *aWSelectionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SLSelectionViewController"];
    
            aWSelectionViewController.itemList =arrvalue;//arrLevels; //list to display
        aWSelectionViewController.displayItemKey = @"displayName"; //key of value to display
        aWSelectionViewController.subtitleDisplayItemKey =@"";// @"coachID"; //key of value to display
        aWSelectionViewController.delegate  = self;
        aWSelectionViewController.titleForSelection = @"Select Technician";
        aWSelectionViewController.isMutliSelect=NO;
        
    
    [self presentViewController:aWSelectionViewController animated:YES completion:nil];
    
    
    
}

-(void)didSelectItem:(MoveInMoveOutBaseModel *)selectedItem{
    
   
    NSString * userID =[selectedItem valueForKey:@"userID"];
    NSString * Technician_Name=[selectedItem valueForKey:@"displayName"];

    
    NSString *str = [NSString stringWithFormat:@"Are you sure, you want to assign %@(%@) to %@?",self.item.units,self.item.property,Technician_Name];
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    NSMutableAttributedString *hogan = [[NSMutableAttributedString alloc] initWithString:str];
    [hogan addAttribute:NSFontAttributeName
                  value:[UIFont boldSystemFontOfSize:18.00]
                  range:NSMakeRange(0,str.length)];
    [alert setValue:hogan forKey:@"attributedTitle"];
    
    
    
    
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        
        AssignUnitToTechnicianRequest *request = [[AssignUnitToTechnicianRequest alloc]init];
        request.user_id=userID;
        request.assigned_by=[[NSUserDefaults standardUserDefaults]valueForKey:@"userID"];;
        request.units=self.item.units;

        [[WebServiceManager sharedInstance]AssignUnitToTechnicianForRequest:request success:^(MoveInMoveOutBaseResponse *result) {
            [self stopLoading];
            [self showToastForText:@"Property assigned succesfully"];

            
        } failure:^(CustomError *error) {
            [self stopLoading];
            
            //        [self showToastForText:@"Could not save data at the moment"];
            [self showToastForText:@"Oops Error Occured !"];
            
        }];
        

        
        
        
        // Ok action example
    }];
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        
        
        
        
        // Other action
    }];
    [otherAction setValue:[UIColor redColor] forKey:@"titleTextColor"];
    [alert addAction:otherAction];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    
    
    
//        AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
//        NSString *_keyname = [self.arrParentCategory objectAtIndex:self.activeSection];
//        NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
//        AddMoveInMoveOutServiceRequest *service_request= [arr objectAtIndex:self.activeRow];
//        NSString * userID =[selectedItem valueForKey:@"userID"];
//        service_request.tech_id=userID;
//        service_request.Technician_Name=[selectedItem valueForKey:@"displayName"];
//        [arr replaceObjectAtIndex:self.activeRow withObject:service_request];
//        [app.arrAllDataDict setObject:arr forKey:_keyname];
//        [self.TblMainData reloadData];
    
   
    
    
    // matchNoteToAdd.opponent = opponent.displayName;
}

@end
