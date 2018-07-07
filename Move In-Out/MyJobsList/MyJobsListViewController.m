//
//  ViewController.m
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import "MyJobsListViewController.h"
#import "MyJobsTableViewCell.h"
#import "MyJobsDetailsViewController.h"
@interface MyJobsListViewController ()

{
    NSArray *arrJobsList;

}

@end

@implementation MyJobsListViewController
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
//        [self showToastForText:@"Oops Error Occured !"];
        
        [self showToastForText:error.errorDescription];

        
    }];
    

    
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self LoadAllListData];

    
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
    
    return arrJobsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellIdentifier = @"selectionCell";
    MyJobsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        
        
        
        cell = [[MyJobsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    MyJobs *item = [arrJobsList objectAtIndex:indexPath.row];
    // cell.textLabel.text = [item valueForKey:@"levelName"];
    cell.LblParentCat.text =[NSString stringWithFormat:@"%@",item.parentCategoryTitle];
    cell.LblSubCat.text =[NSString stringWithFormat:@"%@",item.childCategoryTitle];
    cell.Lblproperty.text =[NSString stringWithFormat:@"%@",item.property];
    cell.Lblunit.text =[NSString stringWithFormat:@"%@",item.units];
    cell.LblDate.text =[NSString stringWithFormat:@"Date Added: %@",item.moveInInspectionDate];

    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MyJobs *item = [arrJobsList objectAtIndex:indexPath.row];
        [self performSegueWithIdentifier:@"Details" sender:item.moveInOutDtlID];
        
    }


@end
