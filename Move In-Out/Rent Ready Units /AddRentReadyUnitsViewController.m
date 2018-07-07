//
//  ViewController.m
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import "AddRentReadyUnitsViewController.h"
#import "AddRentReadyUnitsRequest.h"
#import "OfflineManager.h"
@interface AddRentReadyUnitsViewController ()

@property(nonatomic,retain)NSMutableArray *arrChoices;
@property(nonatomic,retain)NSMutableArray *arrType;
@property(nonatomic,retain)NSMutableArray *arrSize;
@property(nonatomic,retain)NSString *DATEYYMMDD1;

@end

@implementation AddRentReadyUnitsViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString * strflat = [[NSUserDefaults standardUserDefaults]valueForKey:@"communityBuildingID"];

    
    self.arrChoices = [[NSMutableArray alloc]init];

    [self.arrChoices addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                @"x - Done",@"Choices", nil]];
    [self.arrChoices addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                @"--/ - In-Progress",@"Choices", nil]];
    [self.arrChoices addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                @"Called-In",@"Choices", nil]];
    [self.arrChoices addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                @" - Needs",@"Choices", nil]];

    [self.arrChoices addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                @"Comment",@"Choices", nil]];

    


    
    
    
    
    self.arrType = [[NSMutableArray alloc]init];
    
    [self.arrType addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"Redeve",@"Choices", nil]];
    
    [self.arrType addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"Reno",@"Choices", nil]];
    [self.arrType addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"Tril",@"Choices", nil]];


    [self.arrType addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                @"Lindy",@"Choices", nil]];
    
    
    

    
    self.arrSize = [[NSMutableArray alloc]init];
    
    /*
    [self.arrSize addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"2 bed",@"Choices", nil]];
    
    
    [self.arrSize addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"1 bed",@"Choices", nil]];
    
    [self.arrSize addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"3 bed",@"Choices", nil]];

    [self.arrSize addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"Efficiency",@"Choices", nil]];*/
    
    
    if([strflat isEqualToString:@"3"]){
        
        [self.arrSize addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                 @"Studios",@"Choices", nil]];
        
        
        [self.arrSize addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                 @"1 Bedroom",@"Choices", nil]];
        
        [self.arrSize addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                 @"2 Bedroom",@"Choices", nil]];
        
        [self.arrSize addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                 @"Master Bath",@"Choices", nil]];
        
        [self.arrSize addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                 @"Master Hall",@"Choices", nil]];

    }
    else
    {
    
    [self.arrSize addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"1 Bedroom",@"Choices", nil]];
    
    
    [self.arrSize addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"1 Bedroom Den",@"Choices", nil]];
    
    [self.arrSize addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"2 Bedroom",@"Choices", nil]];
    
    [self.arrSize addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"2 Bedroom Den",@"Choices", nil]];
    
    [self.arrSize addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"3 Bedroom",@"Choices", nil]];
    [self.arrSize addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"3 Bedroom Den",@"Choices", nil]];
    
    [self.arrSize addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"Eff",@"Choices", nil]];
    }

    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    self.DATEYYMMDD1 = [dateFormatter stringFromDate:[NSDate date]];
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    self.TxtFinishDate.text = [dateFormatter stringFromDate:[NSDate date]];

    
    
    


    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
   
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{// return NO to disallow editing.
    
    self.ActiveTextField=textField;
    
    if([textField isEqual:self.TxtType]){
        
        
        [self showSelectionVCForOpponents:self.arrType];
        return NO;
    }
    else if([textField isEqual:self.TxtSize]){
        
        
        [self showSelectionVCForOpponents:self.arrSize];
        return NO;
    }
        else if([textField isEqual:self.TxtFinishDate]){
        
        
        [self ShowDatePicker];
        return NO;
    }
    
    else {
        
        return YES;
    }
}

-(void)showSelectionVCForOpponents:(NSMutableArray*)arrvalue{
    
    
    SLSelectionViewController *aWSelectionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SLSelectionViewController"];
    
    
    aWSelectionViewController.itemList =arrvalue;//arrLevels; //list to display
    aWSelectionViewController.displayItemKey = @"Choices"; //key of value to display
    //   aWSelectionViewController.subtitleDisplayItemKey =@"";// @"coachID"; //key of value to display
    aWSelectionViewController.delegate  = self;
    aWSelectionViewController.titleForSelection = @"Select";
    [self presentViewController:aWSelectionViewController animated:YES completion:nil];
    
    
    
    
    
    
}
-(void)setScrollViewSize
{

CGRect contentRect = CGRectZero;
for (UIView *view in self.ViewMainContainer.subviews) {
    contentRect = CGRectUnion(contentRect, view.frame);
    //        for (UIView *view1 in view.subviews) {
    //            contentRect = CGRectUnion(contentRect, view1.frame);
    //        }
    
}
contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
contentRect = CGRectUnion(contentRect, self.BtnNext.frame);
contentRect = CGRectUnion(contentRect, self.BtnNext.frame);


self.Scrollview.contentSize = contentRect.size;

}
-(void)didSelectItem:(MoveInMoveOutBaseModel *)selectedItem{
    
    
    if([self.ActiveTextField isEqual:self.TxtType]){
        
        self.TxtType.text=[selectedItem valueForKey:@"Choices"];
        
    }
    else if([self.ActiveTextField isEqual:self.TxtSize]){
        
        self.TxtSize.text=[selectedItem valueForKey:@"Choices"];

    }
    


    
    
    
    
    
    // matchNoteToAdd.opponent = opponent.displayName;
}
-(void)ShowDatePicker
{
    DatePickerViewController *dpvc = [[DatePickerViewController alloc] init];
    [dpvc setDelegate:self];
    [dpvc setTitle:@"Select Date"];
    UINavigationController *navDpvc = [[UINavigationController alloc] initWithRootViewController:dpvc];
    [navDpvc.navigationBar setTintColor:[UIColor blackColor]];
    [navDpvc setModalPresentationStyle:UIModalPresentationFormSheet];
    [navDpvc setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:navDpvc animated:YES completion:nil];
    
}
#pragma mark will handle dismissal for datepicker

- (void)DatePickerViewControllerDidFinish:(DatePickerViewController *)controller
{
    //fetch datepicker value from controller object
    NSDateFormatter  *dateofbirthformat = [[NSDateFormatter alloc] init];
    [dateofbirthformat setTimeStyle:NSDateFormatterNoStyle];
    [dateofbirthformat setDateFormat:@"MM-dd-yyyy"];
    if([self.ActiveTextField isEqual:self.TxtFinishDate]){
        
        self.TxtFinishDate.text = [dateofbirthformat stringFromDate:[controller.datePicker date]];
        NSDateFormatter *dateofbirthformat1 = [[NSDateFormatter alloc] init];
        [dateofbirthformat1 setTimeStyle:NSDateFormatterNoStyle];
        [dateofbirthformat1 setDateFormat:@"yyyy-MM-dd"];
        self.DATEYYMMDD1 = [dateofbirthformat1 stringFromDate:[controller.datePicker date]];
        
        
    }
    
   
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
#pragma mark will handel dismmiss of datepicker if user press cancel btn
- (void)DatePickerViewControllerDidCancel:(DatePickerViewController *)controller
{
    //do nothing just dissmiss datepicker modelview
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)GoBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (IBAction)SubmitData:(id)sender {
    //[self startLoading];

    AddRentReadyUnitsRequest *AddTurnOverformtoAdd;
    AddTurnOverformtoAdd= [[AddRentReadyUnitsRequest alloc]init];
    
    AddTurnOverformtoAdd.apt=self.TxtApartment.text;
    AddTurnOverformtoAdd.type=self.TxtType.text;
    AddTurnOverformtoAdd.size=self.TxtSize.text;
    
    AddTurnOverformtoAdd.finish_date=self.DATEYYMMDD1;
    AddTurnOverformtoAdd.keys=self.TxtKeys.text;
    
    
    
    NSMutableArray * arrFormData = [[NSMutableArray alloc]init];
    if([[OfflineManager sharedInstance]getAllRentReadyUnitsData]){
        
        arrFormData = [[OfflineManager sharedInstance]getAllRentReadyUnitsData];
        
    }
    
//    [arrFormData addObject:[AddTurnOverformtoAdd copy]];
    [arrFormData insertObject:[AddTurnOverformtoAdd copy] atIndex:0];

    [[OfflineManager sharedInstance]SaveAllRentReadyUnitsData:arrFormData];
    [self.navigationController popToRootViewControllerAnimated:YES];

    
    
    
    /*
    [self startLoading];
    [[WebServiceManager sharedInstance]AddRentReadyUnitsFormForRequest:AddTurnOverformtoAdd success:^(MoveInMoveOutBaseResponse *result) {
          [self stopLoading];
        
       // [self.navigationController popViewControllerAnimated:YES];
        [self.navigationController popToRootViewControllerAnimated:YES];

        
        
        
        
        
        
        
        
    } failure:^(CustomError *error) {
        
                   [self showToastForText:@"Oops Error Occured !"];
        [self stopLoading];

        
       
    }];*/


}
-(NSString*)ValidateComment:(NSString*)_comment
{
    
    if([_comment isEqualToString:@"Please add Comment"]){
        
        _comment=@"";
    }

    
    return _comment;
}
- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    if(textView.isFirstResponder){
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
        
    }
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
    
    if(textView.text.length == 0){
        textView.textColor = [UIColor lightGrayColor];
        textView.text = @"Please add Comment";
        [textView resignFirstResponder];
    }
}
@end
