//
//  ViewController.m
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import "WorkOrderListViewController.h"
#import "WorkOrderTableViewCell.h"
#import "SLSelectionViewController.h"
#import "MyJobsDetailsViewController.h"
@interface WorkOrderListViewController ()<SLSelectionDelegate>

{
    NSArray *arrJobsList;

}

@end

@implementation WorkOrderListViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.TxtTechName.text=@"";
    self.User_Id=@"";
    [self LoadAllListData];

    // Do any additional setup after loading the view, typically from a nib.
}
-(void)LoadAllListData{
    
    [self startLoading];

    WorkOrderListRequest *request = [[WorkOrderListRequest alloc]init];
    request.user_id=self.User_Id;
    request.status=self.status;
    
    
    [[WebServiceManager sharedInstance]GetWorkOrderRequest:request success:^(MoveInMoveOutBaseResponse *result) {
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
        dest.Str_flag=self.status;


        
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
    
    return arrJobsList.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if([self.status isEqualToString:@"pending"]){
        
        return 200;

        
    }
    else{
        
        return 235;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellIdentifier = @"WorkOrderCell";
    WorkOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        
        
        
        cell = [[WorkOrderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    MyJobs *item = [arrJobsList objectAtIndex:indexPath.row];
    // cell.textLabel.text = [item valueForKey:@"levelName"];
    cell.LblParentCat.text =[NSString stringWithFormat:@"%@",item.parentCategoryTitle];
    cell.LblSubCat.text =[NSString stringWithFormat:@"%@",item.childCategoryTitle];
    cell.Lblproperty.text =[NSString stringWithFormat:@"%@",item.property];
    cell.Lblunit.text =[NSString stringWithFormat:@"%@",item.units];
    cell.LblDate.text =[NSString stringWithFormat:@"Date Added: %@",item.moveInInspectionDate];
    
    cell.LblTechName.text =[NSString stringWithFormat:@"%@",item.techinicans];
    cell.LblCompletedby.text =[NSString stringWithFormat:@"Completed By: %@",item.taskCompletedBy];

    

    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MyJobs *item = [arrJobsList objectAtIndex:indexPath.row];
        [self performSegueWithIdentifier:@"Details" sender:item.moveInOutDtlID];
        
    }

-(void)LoadTechnicianData{
    
    
    
    [self startLoading];
    
    
    [[WebServiceManager sharedInstance]GetTechnicianListWithSuccess:^(MoveInMoveOutBaseResponse *result) {
        
        [self stopLoading];
        GetTechnicianListResponse *response = (GetTechnicianListResponse *)result;
        if (response.result.count) {
            
            self.AllTechnicianData = [[NSArray alloc]initWithArray:response.result];
            [self showSelectionVCForOpponents:[self.AllTechnicianData mutableCopy]];

        }
        else{
            
            [self showToastForText:@"No Property Found"];
            
        }
        
        
        
        
    } failure:^(CustomError *error) {
        [self stopLoading];
        
        [self showToastForText:@"Cannot fetch Technician  List. Please try again"];
    }];
    
    
}
-(void)showSelectionVCForOpponents:(NSMutableArray*)arrvalue{

SLSelectionViewController *aWSelectionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SLSelectionViewController"];

    aWSelectionViewController.itemList =arrvalue;//arrLevels; //list to display
    aWSelectionViewController.displayItemKey = @"displayName"; //key of value to display
    aWSelectionViewController.subtitleDisplayItemKey =@"";// @"coachID"; //key of value to display
    aWSelectionViewController.delegate  = self;
    aWSelectionViewController.titleForSelection = @"Select Technician";
    


[self presentViewController:aWSelectionViewController animated:YES completion:nil];



}
- (IBAction)ShowTechnician:(id)sender{
    
    
    if(self.AllTechnicianData){
        
        [self showSelectionVCForOpponents:[self.AllTechnicianData mutableCopy]];
    }
    else
    {
        [self LoadTechnicianData];

    }
    
}
- (IBAction)ClearTechnician:(id)sender{
    
    self.TxtTechName.text=@"";
    self.User_Id=@"";
    [self LoadAllListData];

    
}
-(void)didSelectItem:(MoveInMoveOutBaseModel *)selectedItem{
    
  NSString * userID =[selectedItem valueForKey:@"userID"];

    self.TxtTechName.text=[selectedItem valueForKey:@"displayName"];
    self.User_Id=userID;
    [self LoadAllListData];
//            NSString *_keyname = [self.arrParentCategory objectAtIndex:self.activeSection];
//        NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
//        AddMoveInMoveOutServiceRequest *service_request= [arr objectAtIndex:self.activeRow];
//        NSString * userID =[selectedItem valueForKey:@"userID"];
//        service_request.tech_id=userID;
//        service_request.Technician_Name=[selectedItem valueForKey:@"displayName"];
//        [arr replaceObjectAtIndex:self.activeRow withObject:service_request];
//        [app.arrAllDataDict setObject:arr forKey:_keyname];
//        [self.TblMainData reloadData];
//        
//    }
    
    
    // matchNoteToAdd.opponent = opponent.displayName;
}

@end
