//
//  WorkOrderOptionViewController.m
//  Move In-Out
//
//  Created by S S D on 08/10/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import "WorkOrderOptionViewController.h"
#import "WorkOrderListViewController.h"

@interface WorkOrderOptionViewController ()

@end

@implementation WorkOrderOptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    WorkOrderListViewController *go = segue.destinationViewController;
    go.status=self.status;
}

- (IBAction)GoBack:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(IBAction)GoCompleted:(id)sender{
    self.status=@"completed";
    [self performSegueWithIdentifier:@"Show" sender:nil];
    
}
-(IBAction)GoPending:(id)sender{
    
    self.status=@"pending";

    [self performSegueWithIdentifier:@"Show" sender:nil];

}


@end
