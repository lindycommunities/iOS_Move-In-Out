//
//  ViewController.m
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import "ViewControllerMoveoutDetail.h"
#import "MoveINViewController2.h"
#import "MoveIN_OUT_TABLEViewController.h"

@interface ViewControllerMoveoutDetail ()

@end

@implementation ViewControllerMoveoutDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)GoBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"GoToNextView"]){
        
        
        MoveIN_OUT_TABLEViewController *ddata=segue.destinationViewController;
        ddata.moveInOutType=@"move-out";

        
        
        
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
