//
//  ViewController.m
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import "RentAdjusementHomeViewController.h"
#import "AddRentAdjustmentViewController.h"
@interface RentAdjusementHomeViewController ()

@end

@implementation RentAdjusementHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)GoBack:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
}
- (IBAction)StartRentAdjusement:(id)sender{
    
   // if([[WebServiceManager sharedInstance]isInternetWorkingFine]){
        
        AddRentAdjustmentViewController *loginController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"AddRentAdjustmentViewController"]; //or the homeController
        loginController.UnitNumber=self.UnitNumber;
        [self.navigationController pushViewController:loginController animated:YES];

        
//    }
//    else{
//    
//        [self showToastForText:@"Please make sure you are connected to interntet"];
//    }
    
    //isInternetWorkingFine
    

}


@end
