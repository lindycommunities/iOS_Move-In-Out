//
//  BaseViewController.m
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 12/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "BaseViewController.h"
//#import "KSToastView.h"
#import "MBProgressHud.h"
#import  <CRToast/CRToast.h>
#define ROOTVIEW [[[UIApplication sharedApplication] keyWindow] rootViewController]
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self setupMenuBarButtonItems];
//    
//    UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Navlogo.png"]];
//    self.navigationItem.titleView = img;
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    if(!self.navigationItem.titleView){
//        self.navigationItem.titleView = ({
//            UILabel *titleView = [UILabel new];
//            titleView.numberOfLines = 0;
//            titleView.textAlignment = NSTextAlignmentCenter;
//            titleView.attributedText = [[NSAttributedString alloc] initWithString:@"SPORTS\nAcademy" attributes:
//                                        self.navigationController.navigationBar.titleTextAttributes
//                                        ];
//            
//            [titleView sizeToFit];
//            // You'll need to set your frame otherwise if your line breaks aren't explcit.
//            
//            titleView;
//        });
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)startLoading{
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

-(void)stopLoading{
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

-(void)showToastForText:(NSString *)text{

   // [KSToastView ks_showToast:text duration:3];
    
    
//    NSDictionary *options = @{
//                              kCRToastTextKey :text,
//                              kCRToastTextAlignmentKey : @(NSTextAlignmentCenter),
//                              kCRToastBackgroundColorKey : [UIColor redColor],
//                              kCRToastAnimationInTypeKey : @(CRToastAnimationTypeGravity),
//                              kCRToastAnimationOutTypeKey : @(CRToastAnimationTypeGravity),
//                              kCRToastAnimationInDirectionKey : @(CRToastAnimationDirectionLeft),
//                              kCRToastAnimationOutDirectionKey : @(CRToastAnimationDirectionRight)
//                              };
//    [CRToastManager showNotificationWithOptions:options
//                                completionBlock:^{
//                                    NSLog(@"Completed");
//                                }];
//    
//
    
    if ([UIAlertController class])
    {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:text preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
       // [self presentViewController:alertController animated:YES completion:nil];
//        [[[UIApplication sharedApplication]keyWindow]presentViewController:alertController animated:YES completion:nil]];
        [ROOTVIEW presentViewController:alertController animated:YES completion:nil];
        
    }
    else
    {
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"" message:text delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
    }
}
-(void)showToastForTextToast:(NSString *)text{
    
    // [KSToastView ks_showToast:text duration:3];
    
    
        NSDictionary *options = @{
                                  kCRToastTextKey :text,
                                  kCRToastTextAlignmentKey : @(NSTextAlignmentCenter),
                                  kCRToastBackgroundColorKey : [UIColor redColor],
                                  kCRToastAnimationInTypeKey : @(CRToastAnimationTypeGravity),
                                  kCRToastAnimationOutTypeKey : @(CRToastAnimationTypeGravity),
                                  kCRToastAnimationInDirectionKey : @(CRToastAnimationDirectionLeft),
                                  kCRToastAnimationOutDirectionKey : @(CRToastAnimationDirectionRight)
                                  };
        [CRToastManager showNotificationWithOptions:options
                                    completionBlock:^{
                                        NSLog(@"Completed");
                                    }];
        
    
}


- (void)setupMenuBarButtonItems {
    
    self.navigationItem.rightBarButtonItem = [self rightMenuBarButtonItem];
    self.navigationItem.leftBarButtonItem = [self leftMenuBarButtonItem];
}

- (UIBarButtonItem *)leftMenuBarButtonItem {
    
    return [[UIBarButtonItem alloc]
            initWithImage:[UIImage imageNamed:@"menu-bt"] style:UIBarButtonItemStylePlain
            target:self
            action:@selector(leftSideMenuButtonPressed:)];
}

- (UIBarButtonItem *)rightMenuBarButtonItem {
    return [[UIBarButtonItem alloc]
            initWithImage:[UIImage imageNamed:@"logout-bt"] style:UIBarButtonItemStylePlain
            target:self
            action:@selector(rightSideMenuButtonPressed:)];
}

- (void)leftSideMenuButtonPressed:(id)sender {
//    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{
//        //        [self setupMenuBarButtonItems];
//    }];
}

- (void)rightSideMenuButtonPressed:(id)sender {

    // do logout
        
    UINavigationController *loginNavCOntroller = [self.storyboard instantiateViewControllerWithIdentifier:@"loginNavigationController"];

    [self.view.window setRootViewController:loginNavCOntroller];
}

- (IBAction)backBtnPressed:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}



@end
