//
//  ImagePreviewViewController.m
//  MySports Pro
//
//  Created by Bonnie Jaiswal on 19/12/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "ImagePreviewViewController.h"
#import "UIImageView+AFNetworking.h"

@interface ImagePreviewViewController ()

@property (nonatomic,weak) IBOutlet UIImageView *imageView;

@end

@implementation ImagePreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self.imageView setImageWithURL:[NSURL URLWithString:self.ImgURL] placeholderImage:[UIImage imageNamed:@""]];
    
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

-(IBAction)dismissImagePreview:(id)sender{
    
    [self dismissViewControllerAnimated:self completion:nil];
}


@end
