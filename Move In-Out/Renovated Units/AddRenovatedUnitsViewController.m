//
//  ViewController.m
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import "AddRenovatedUnitsViewController.h"
#import "AddRenovatedUnitsRequest.h"
#import "OfflineManager.h"
@interface AddRenovatedUnitsViewController ()

@property(nonatomic,retain)NSMutableArray *arrChoices;
@property(nonatomic,retain)NSMutableArray *arrSize;
@property(nonatomic,retain)NSMutableArray *arrLocks;
@property(nonatomic,retain)NSString *DATEYYMMDD1,*DATEYYMMDD2;

@end

@implementation AddRenovatedUnitsViewController
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

    


    
    
    
    
    
    
    
    self.arrSize = [[NSMutableArray alloc]init];
    
    
   /* [self.arrSize addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"2 bed",@"Choices", nil]];
    
    
    [self.arrSize addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"1 bed",@"Choices", nil]];
    
    [self.arrSize addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"3 bed",@"Choices", nil]];

    [self.arrSize addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"Efficiency",@"Choices", nil]];
    */
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
    else{

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
    
    self.arrLocks = [[NSMutableArray alloc]init];
    
    
  /*  [self.arrLocks addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"Small",@"Choices", nil]];
    
    
    [self.arrLocks addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"Medium",@"Choices", nil]];*/
    
    
    if([strflat isEqualToString:@"3"]){
        
        [self.arrLocks addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                  @"Standard Kwikset",@"Choices", nil]];
        
        
        [self.arrLocks addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                  @"Schlage",@"Choices", nil]];
        [self.arrLocks addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                  @"No Key System",@"Choices", nil]];
        
    }
    else
    {
    
    [self.arrLocks addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                              @"s",@"Choices", nil]];
    
    
    [self.arrLocks addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                              @"m",@"Choices", nil]];
    [self.arrLocks addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                              @"k",@"Choices", nil]];
    }


    
    [self performSelector:@selector(setScrollViewSize) withObject:nil afterDelay:1.0];

    [self performSelector:@selector(ManageUI) withObject:nil afterDelay:1.0];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    self.DATEYYMMDD1 = [dateFormatter stringFromDate:[NSDate date]];
    self.DATEYYMMDD2 = [dateFormatter stringFromDate:[NSDate date]];
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    self.TxtMoveIn.text = [dateFormatter stringFromDate:[NSDate date]];
    self.TxtMoveOut.text = [dateFormatter stringFromDate:[NSDate date]];
    
    

    // Do any additional setup after loading the view, typically from a nib.
}
-(void)ManageUI{

    if([self.TxtDemo.text isEqualToString:@"Comment"]){
        self.ViewDemoHeight.active=YES;
        self.ViewDemoHeight.constant=170.00;

    }
    else
    {
        self.ViewDemoHeight.active=YES;
        self.ViewDemoHeight.constant=65.00;

    }
    if([self.TxtCabinets.text isEqualToString:@"Comment"]){
        self.ViewCabinetsHeight.active=YES;
        self.ViewCabinetsHeight.constant=170.00;
        
    }
    else
    {
        self.ViewCabinetsHeight.active=YES;
        self.ViewCabinetsHeight.constant=65.00;
        
    }
    if([self.TxtTops.text isEqualToString:@"Comment"]){
        self.ViewTopsHeight.active=YES;
        self.ViewTopsHeight.constant=170.00;
        
    }
    else
    {
        self.ViewTopsHeight.active=YES;
        self.ViewTopsHeight.constant=65.00;
        
    }
    
    if([self.TxtPlank.text isEqualToString:@"Comment"]){
        self.ViewPlankHeight.active=YES;
        self.ViewPlankHeight.constant=170.00;
        
    }
    else
    {
        self.ViewPlankHeight.active=YES;
        self.ViewPlankHeight.constant=65.00;
        
    }
    
    

    
    if([self.TxtMaintenance.text isEqualToString:@"Comment"]){
        self.ViewMaintenanceHeight.active=YES;
        self.ViewMaintenanceHeight.constant=170.00;
        
    }
    else
    {
        self.ViewMaintenanceHeight.active=YES;
        self.ViewMaintenanceHeight.constant=65.00;
        
    }
    
    if([self.TxtClean.text isEqualToString:@"Comment"]){
        self.ViewCleanHeight.active=YES;
        self.ViewCleanHeight.constant=170.00;
        
    }
    else
    {
        self.ViewCleanHeight.active=YES;
        self.ViewCleanHeight.constant=65.00;
        
    }
    
    

    
    

    
    
    [self performSelector:@selector(setScrollViewSize) withObject:nil afterDelay:1.0];
    
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
    if(!self.ActiveTextView){

    self.ActiveTextField=textField;
    
     if([textField isEqual:self.TxtSize]){
        
        
        [self showSelectionVCForOpponents:self.arrSize];
        return NO;
    }
    else if([textField isEqual:self.TxtLocks]){
        
        
        [self showSelectionVCForOpponents:self.arrLocks];
        return NO;
    }
    
    else if([textField isEqual:self.TxtDemo]){
        
        
        [self showSelectionVCForOpponents:self.arrChoices];
        return NO;
    }
    else if([textField isEqual:self.TxtCabinets]){
        
        
        [self showSelectionVCForOpponents:self.arrChoices];
        return NO;
    }
    else if([textField isEqual:self.TxtTops]){
        
        
        [self showSelectionVCForOpponents:self.arrChoices];
        return NO;
    }
      else if([textField isEqual:self.TxtPlank]){
        
        
          [self showSelectionVCForOpponents:self.arrChoices];
        return NO;
    }else if([textField isEqual:self.TxtMaintenance]){
        
        
        [self showSelectionVCForOpponents:self.arrChoices];
        return NO;
    }else if([textField isEqual:self.TxtClean]){
        
        
        [self showSelectionVCForOpponents:self.arrChoices];
        return NO;
    }
    else if([textField isEqual:self.TxtMoveOut]){
        
        
        [self ShowDatePicker];
        return NO;
    }else if([textField isEqual:self.TxtMoveIn]){
        
        
        [self ShowDatePicker];
        return NO;
    }
    
    else {
        
        return YES;
    }
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
    
    
    if([self.ActiveTextField isEqual:self.TxtSize]){
        
        self.TxtSize.text=[selectedItem valueForKey:@"Choices"];

    }
    else if([self.ActiveTextField isEqual:self.TxtLocks]){
        
        self.TxtLocks.text=[selectedItem valueForKey:@"Choices"];

    }
    
    else if([self.ActiveTextField isEqual:self.TxtDemo]){
        
        
        self.TxtDemo.text=[selectedItem valueForKey:@"Choices"];
    }
    else if([self.ActiveTextField isEqual:self.TxtCabinets]){
        
        self.TxtCabinets.text=[selectedItem valueForKey:@"Choices"];

    }
    else if([self.ActiveTextField isEqual:self.TxtTops]){
        
        
        self.TxtTops.text=[selectedItem valueForKey:@"Choices"];
    }
    else if([self.ActiveTextField isEqual:self.TxtPlank]){
        self.TxtPlank.text=[selectedItem valueForKey:@"Choices"];

        
    }else if([self.ActiveTextField isEqual:self.TxtMaintenance]){
        
        self.TxtMaintenance.text=[selectedItem valueForKey:@"Choices"];

        
        
   }else if([self.ActiveTextField isEqual:self.TxtClean]){
       
       self.TxtClean.text=[selectedItem valueForKey:@"Choices"];

       
        
    }
    
    [self.ActiveTextField resignFirstResponder];
    self.ActiveTextField=nil;

    [self ManageUI];

    
    
    
    
    
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
    if([self.ActiveTextField isEqual:self.TxtMoveIn]){
        
        self.TxtMoveIn.text = [dateofbirthformat stringFromDate:[controller.datePicker date]];
        NSDateFormatter *dateofbirthformat1 = [[NSDateFormatter alloc] init];
        [dateofbirthformat1 setTimeStyle:NSDateFormatterNoStyle];
        [dateofbirthformat1 setDateFormat:@"yyyy-MM-dd"];
        self.DATEYYMMDD1 = [dateofbirthformat1 stringFromDate:[controller.datePicker date]];
        
        
    }
    else if([self.ActiveTextField isEqual:self.TxtMoveOut]){
        
        self.TxtMoveOut.text = [dateofbirthformat stringFromDate:[controller.datePicker date]];
        NSDateFormatter *dateofbirthformat1 = [[NSDateFormatter alloc] init];
        [dateofbirthformat1 setTimeStyle:NSDateFormatterNoStyle];
        [dateofbirthformat1 setDateFormat:@"yyyy-MM-dd"];
        self.DATEYYMMDD2 = [dateofbirthformat1 stringFromDate:[controller.datePicker date]];
        
        
    }
   
    [self.ActiveTextField resignFirstResponder];
    self.ActiveTextField=nil;

    [self dismissViewControllerAnimated:YES completion:nil];
    
}
#pragma mark will handel dismmiss of datepicker if user press cancel btn
- (void)DatePickerViewControllerDidCancel:(DatePickerViewController *)controller
{
    //do nothing just dissmiss datepicker modelview
    [self.ActiveTextField resignFirstResponder];
    self.ActiveTextField=nil;

    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)SubmitData:(id)sender {
    [self startLoading];

    AddRenovatedUnitsRequest *AddRenovatedUnitsformtoAdd;
    AddRenovatedUnitsformtoAdd= [[AddRenovatedUnitsRequest alloc]init];
    
    AddRenovatedUnitsformtoAdd.apt=self.TxtApartment.text;
    AddRenovatedUnitsformtoAdd.size=self.TxtSize.text;
    
    AddRenovatedUnitsformtoAdd.move_out=self.DATEYYMMDD2;
    AddRenovatedUnitsformtoAdd.move_in=self.DATEYYMMDD1;
    
    

    if([self.TxtDemo.text isEqualToString:@"Comment"]){
        
        AddRenovatedUnitsformtoAdd.demo=[self ValidateComment:self.TxtDemoComments.text];
        
    }
    else
    {
        AddRenovatedUnitsformtoAdd.demo=self.TxtDemo.text;
        
    }

    
    if([self.TxtCabinets.text isEqualToString:@"Comment"]){
        
        AddRenovatedUnitsformtoAdd.cabinets=[self ValidateComment:self.TxtCabinetsComments.text];
        
    }
    else
    {
        AddRenovatedUnitsformtoAdd.cabinets=self.TxtCabinets.text;
        
    }
    
    if([self.TxtTops.text isEqualToString:@"Comment"]){
        
        AddRenovatedUnitsformtoAdd.tops=[self ValidateComment:self.TxtTopsComments.text];
        
    }
    else
    {
        AddRenovatedUnitsformtoAdd.tops=self.TxtTops.text;
        
    }

    if([self.TxtPlank.text isEqualToString:@"Comment"]){
        
        AddRenovatedUnitsformtoAdd.plank=[self ValidateComment:self.TxtPlankComments.text];
        
    }
    else
    {
        AddRenovatedUnitsformtoAdd.plank=self.TxtPlank.text;
        
    }
    
    if([self.TxtMaintenance.text isEqualToString:@"Comment"]){
        
        AddRenovatedUnitsformtoAdd.maint=[self ValidateComment:self.TxtMaintenanceComments.text];
        
    }
    else
    {
        AddRenovatedUnitsformtoAdd.maint=self.TxtMaintenance.text;
        
    }
    
    if([self.TxtClean.text isEqualToString:@"Comment"]){
        
        AddRenovatedUnitsformtoAdd.clean=[self ValidateComment:self.TxtCleanComments.text];
        
    }
    else
    {
        AddRenovatedUnitsformtoAdd.clean=self.TxtClean.text;
        
    }

    
    



    
    

    
    AddRenovatedUnitsformtoAdd.locks=self.TxtLocks.text;
    AddRenovatedUnitsformtoAdd.comments=[self ValidateComment:self.TxtComments.text];
    
    
    NSMutableArray * arrFormData = [[NSMutableArray alloc]init];
    if([[OfflineManager sharedInstance]getAllRenovatedUnitsData]){
        
        arrFormData = [[OfflineManager sharedInstance]getAllRenovatedUnitsData];
        
    }
    
//    [arrFormData addObject:[AddRenovatedUnitsformtoAdd copy]];
    [arrFormData insertObject:[AddRenovatedUnitsformtoAdd copy] atIndex:0];

    [[OfflineManager sharedInstance]SaveAllRenovatedUnitsData:arrFormData];
    [self.navigationController popToRootViewControllerAnimated:YES];

    
    
    
    /*[self startLoading];
    [[WebServiceManager sharedInstance]AddRenovatedUnitsFormForRequest:AddRenovatedUnitsformtoAdd success:^(MoveInMoveOutBaseResponse *result) {
          [self stopLoading];
        
    [self.navigationController popToRootViewControllerAnimated:YES];
 // [self.navigationController popViewControllerAnimated:YES];
        
        
        
        
        
        
        
        
    } failure:^(CustomError *error) {
        
                   [self showToastForText:@"Oops Error Occured !"];
        [self stopLoading];

        
       
    }];
     */


}
- (IBAction)GoBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
    self.ActiveTextView=textView;
    if(textView.isFirstResponder){
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
        
    }    return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
    
    if(textView.text.length == 0){
        textView.textColor = [UIColor lightGrayColor];
        textView.text = @"Please add Comment";
        [textView resignFirstResponder];
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    
    self.ActiveTextView=nil;
}
@end
