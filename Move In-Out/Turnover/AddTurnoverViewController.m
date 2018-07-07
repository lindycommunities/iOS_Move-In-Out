//
//  ViewController.m
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import "AddTurnoverViewController.h"
#import "AddTurnOverRequest.h"
#import "IQKeyboardManager.h"
#import "OfflineManager.h"
@interface AddTurnoverViewController ()

@property(nonatomic,retain)NSMutableArray *arrChoices;
@property(nonatomic,retain)NSMutableArray *arrType;
@property(nonatomic,retain)NSMutableArray *arrSize;
@property(nonatomic,retain)NSMutableArray *arrLocks;
@property(nonatomic,retain)NSMutableArray *arrPlumbing;
@property(nonatomic,retain)NSMutableArray *arrTub;
@property(nonatomic,retain)NSMutableArray *arrPatio;

@property(nonatomic,retain)NSString *DATEYYMMDD1,*DATEYYMMDD2,*DATEYYMMDD3;

@end

@implementation AddTurnoverViewController
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
                                @"Lindy",@"Choices", nil]];
    
    
    [self.arrType addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                @"Tril",@"Choices", nil]];
    
    [self.arrType addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                @"Redev",@"Choices", nil]];
    
    
    
    self.arrPlumbing= [[NSMutableArray alloc]init];
    
    
    [self.arrPlumbing addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"1",@"Choices", nil]];
    
    
    [self.arrPlumbing addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"2",@"Choices", nil]];
    
    [self.arrPlumbing addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"3",@"Choices", nil]];
    
    
    self.arrTub= [[NSMutableArray alloc]init];
    
    
    [self.arrTub addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                 @"1 tub",@"Choices", nil]];
    
    
    [self.arrTub addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                 @"2 tub",@"Choices", nil]];
    
    [self.arrTub addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                 @"3 tub",@"Choices", nil]];

    
    [self.arrTub addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                            @"1 tub / stall",@"Choices", nil]];
    
    
    [self.arrTub addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                            @"2 tub / stall",@"Choices", nil]];
    
    [self.arrTub addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                            @"3 tub / stall",@"Choices", nil]];

    
    
    self.arrPatio= [[NSMutableArray alloc]init];
    
    
    [self.arrPatio addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                            @"Patch",@"Choices", nil]];
    
    
    [self.arrPatio addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                            @"Paint",@"Choices", nil]];
    
    [self.arrPatio addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                            @"Patch/Paint",@"Choices", nil]];
    
    
    

    


    
    self.arrSize = [[NSMutableArray alloc]init];
    
    
/*    [self.arrSize addObject:[NSDictionary dictionaryWithObjectsAndKeys:
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
    
    self.arrLocks = [[NSMutableArray alloc]init];
    
    
    /*[self.arrLocks addObject:[NSDictionary dictionaryWithObjectsAndKeys:
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
    
    
//    [self.arrLocks addObject:[NSDictionary dictionaryWithObjectsAndKeys:
//     @"s",@"Choices", nil]];
//     
//     
//     [self.arrLocks addObject:[NSDictionary dictionaryWithObjectsAndKeys:
//     @"m",@"Choices", nil]];
//    [self.arrLocks addObject:[NSDictionary dictionaryWithObjectsAndKeys:
//                              @"k",@"Choices", nil]];

    
    
    [self performSelector:@selector(setScrollViewSize) withObject:nil afterDelay:1.0];

    [self performSelector:@selector(ManageUI) withObject:nil afterDelay:1.0];

    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    self.DATEYYMMDD1 = [dateFormatter stringFromDate:[NSDate date]];
    self.DATEYYMMDD2 = [dateFormatter stringFromDate:[NSDate date]];
    self.DATEYYMMDD3 = [dateFormatter stringFromDate:[NSDate date]];
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    self.TxtMoveIn.text = [dateFormatter stringFromDate:[NSDate date]];
    self.TxtWalk.text = [dateFormatter stringFromDate:[NSDate date]];
    self.TxtAvailability.text = [dateFormatter stringFromDate:[NSDate date]];

    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
//-(void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//     [[IQKeyboardManager sharedManager] setEnable:NO];
//}
//-(void)viewDidDisappear:(BOOL)animated:(BOOL)animated{
//    [super viewDidDisappear:animated];
//    [[IQKeyboardManager sharedManager] setEnable:YES];
//}
-(void)ManageUI{
    
    if([self.TxtPaint.text isEqualToString:@"Comment"]){
        self.ViewPaintHeight.active=YES;
        self.ViewPaintHeight.constant=170.00;

    }
    else
    {
        self.ViewPaintHeight.active=YES;
        self.ViewPaintHeight.constant=65.00;

    }
    if([self.TxtPlumbing.text isEqualToString:@"Comment"]){
        self.ViewPlumbingHeight.active=YES;
        self.ViewPlumbingHeight.constant=170.00;
        
    }
    else
    {
        self.ViewPlumbingHeight.active=YES;
        self.ViewPlumbingHeight.constant=65.00;
        
    }
    
    if([self.TxtTub.text isEqualToString:@"Comment"]){
        self.ViewTubHeight.active=YES;
        self.ViewTubHeight.constant=170.00;
        
    }
    else
    {
        self.ViewTubHeight.active=YES;
        self.ViewTubHeight.constant=65.00;
        
    }
    
    if([self.TxtPatio.text isEqualToString:@"Comment"]){
        self.ViewPatioHeight.active=YES;
        self.ViewPatioHeight.constant=170.00;
        
    }
    else
    {
        self.ViewPatioHeight.active=YES;
        self.ViewPatioHeight.constant=65.00;
        
    }
    
    if([self.TxtCarpet.text isEqualToString:@"Comment"]){
        self.ViewCarpetHeight.active=YES;
        self.ViewCarpetHeight.constant=170.00;
        
    }
    else
    {
        self.ViewCarpetHeight.active=YES;
        self.ViewCarpetHeight.constant=65.00;
        
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
    
    if([self.TxtShampoo.text isEqualToString:@"Comment"]){
        self.ViewShampooHeight.active=YES;
        self.ViewShampooHeight.constant=170.00;
        
    }
    else
    {
        self.ViewShampooHeight.active=YES;
        self.ViewShampooHeight.constant=65.00;
        
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
    
    if([textField isEqual:self.TxtType]){
        
        
        [self showSelectionVCForOpponents:self.arrType];
        return NO;
    }
    else if([textField isEqual:self.TxtSize]){
        
        
        [self showSelectionVCForOpponents:self.arrSize];
        return NO;
    }
    else if([textField isEqual:self.TxtLocks]){
        
        
        [self showSelectionVCForOpponents:self.arrLocks];
        return NO;
    }
    
    else if([textField isEqual:self.TxtPaint]){
        
        
        [self showSelectionVCForOpponents:self.arrChoices];
        return NO;
    }
    else if([textField isEqual:self.TxtPlumbing]){
        
        
        [self showSelectionVCForOpponents:self.arrPlumbing];
        return NO;
    }
      else if([textField isEqual:self.TxtTub]){
        
        
          [self showSelectionVCForOpponents:self.arrTub];
        return NO;
    }else if([textField isEqual:self.TxtPatio]){
        
        
        [self showSelectionVCForOpponents:self.arrPatio];
        return NO;
    }else if([textField isEqual:self.TxtCarpet]){
        
        
        [self showSelectionVCForOpponents:self.arrChoices];
        return NO;
    }else if([textField isEqual:self.TxtMaintenance]){
        
        
        [self showSelectionVCForOpponents:self.arrChoices];
        return NO;
    }else if([textField isEqual:self.TxtClean]){
        
        
        [self showSelectionVCForOpponents:self.arrChoices];
        return NO;
    }else if([textField isEqual:self.TxtShampoo]){
        
        
        [self showSelectionVCForOpponents:self.arrChoices];
        return NO;
    }
    else if([textField isEqual:self.TxtWalk]){
        
        
        [self ShowDatePicker];
        return NO;
    }else if([textField isEqual:self.TxtMoveIn]){
        
        
        [self ShowDatePicker];
        return NO;
    }
    else if([textField isEqual:self.TxtAvailability]){
        
        
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
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldDidBeginEditing");
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
    else if([self.ActiveTextField isEqual:self.TxtLocks]){
        
        self.TxtLocks.text=[selectedItem valueForKey:@"Choices"];

    }
    
    else if([self.ActiveTextField isEqual:self.TxtPaint]){
        
        
        self.TxtPaint.text=[selectedItem valueForKey:@"Choices"];
    }
    else if([self.ActiveTextField isEqual:self.TxtPlumbing]){
        
        
        self.TxtPlumbing.text=[selectedItem valueForKey:@"Choices"];
    }
    else if([self.ActiveTextField isEqual:self.TxtTub]){
        self.TxtTub.text=[selectedItem valueForKey:@"Choices"];

        
    }else if([self.ActiveTextField isEqual:self.TxtPatio]){
        
        self.TxtPatio.text=[selectedItem valueForKey:@"Choices"];

        
    }else if([self.ActiveTextField isEqual:self.TxtCarpet]){
        
        self.TxtCarpet.text=[selectedItem valueForKey:@"Choices"];

        
        
    }else if([self.ActiveTextField isEqual:self.TxtMaintenance]){
        
        self.TxtMaintenance.text=[selectedItem valueForKey:@"Choices"];

        
        
   }else if([self.ActiveTextField isEqual:self.TxtClean]){
       
       self.TxtClean.text=[selectedItem valueForKey:@"Choices"];

       
        
    }else if([self.ActiveTextField isEqual:self.TxtShampoo]){
        
        self.TxtShampoo.text=[selectedItem valueForKey:@"Choices"];

        
    }
    
    
   
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
    else if([self.ActiveTextField isEqual:self.TxtWalk]){
        
        self.TxtWalk.text = [dateofbirthformat stringFromDate:[controller.datePicker date]];
        NSDateFormatter *dateofbirthformat1 = [[NSDateFormatter alloc] init];
        [dateofbirthformat1 setTimeStyle:NSDateFormatterNoStyle];
        [dateofbirthformat1 setDateFormat:@"yyyy-MM-dd"];
        self.DATEYYMMDD2 = [dateofbirthformat1 stringFromDate:[controller.datePicker date]];
        
        
    }
    else if([self.ActiveTextField isEqual:self.TxtAvailability]){
        
        self.TxtAvailability.text = [dateofbirthformat stringFromDate:[controller.datePicker date]];
        NSDateFormatter *dateofbirthformat1 = [[NSDateFormatter alloc] init];
        [dateofbirthformat1 setTimeStyle:NSDateFormatterNoStyle];
        [dateofbirthformat1 setDateFormat:@"yyyy-MM-dd"];
        self.DATEYYMMDD3 = [dateofbirthformat1 stringFromDate:[controller.datePicker date]];
        
        
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


- (IBAction)GoBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)SubmitData:(id)sender {
   // [self startLoading];

    AddTurnOverRequest *AddTurnOverformtoAdd;
    AddTurnOverformtoAdd= [[AddTurnOverRequest alloc]init];
    
    AddTurnOverformtoAdd.apt=self.TxtApartment.text;
    AddTurnOverformtoAdd.type=self.TxtType.text;
    AddTurnOverformtoAdd.size=self.TxtSize.text;
    
    AddTurnOverformtoAdd.walk=self.DATEYYMMDD2;
    AddTurnOverformtoAdd.move_in=self.DATEYYMMDD1;
    AddTurnOverformtoAdd.availability=self.DATEYYMMDD3;
    
    
    if([self.TxtPaint.text isEqualToString:@"Comment"]){
        
        AddTurnOverformtoAdd.paint=[self ValidateComment:self.TxtPaintComments.text];

    }
    else
    {
        AddTurnOverformtoAdd.paint=self.TxtPaint.text;

    }
    
    if([self.TxtPlumbing.text isEqualToString:@"Comment"]){
        
        AddTurnOverformtoAdd.plumbing=[self ValidateComment:self.TxtPlumbingComments.text];
        
    }
    else
    {
        AddTurnOverformtoAdd.plumbing=self.TxtPlumbing.text;
        
    }
    
    if([self.TxtPatio.text isEqualToString:@"Comment"]){
        
        AddTurnOverformtoAdd.patio=[self ValidateComment:self.TxtPatioComments.text];
        
    }
    else
    {
        AddTurnOverformtoAdd.patio=self.TxtPatio.text;
        
    }
    
    if([self.TxtTub.text isEqualToString:@"Comment"]){
        
        AddTurnOverformtoAdd.tub=[self ValidateComment:self.TxtTubComments.text];
        
    }
    else
    {
        AddTurnOverformtoAdd.tub=self.TxtTub.text;
        
    }


    if([self.TxtCarpet.text isEqualToString:@"Comment"]){
        
        AddTurnOverformtoAdd.carpet=[self ValidateComment:self.TxtCarpetComments.text];
        
    }
    else
    {
        AddTurnOverformtoAdd.carpet=self.TxtCarpet.text;
        
    }
    
    if([self.TxtMaintenance.text isEqualToString:@"Comment"]){
        
        AddTurnOverformtoAdd.maintenance=[self ValidateComment:self.TxtMaintenanceComments.text];
        
    }
    else
    {
        AddTurnOverformtoAdd.maintenance=self.TxtMaintenance.text;
        
    }

    if([self.TxtClean.text isEqualToString:@"Comment"]){
        
        AddTurnOverformtoAdd.clean=[self ValidateComment:self.TxtCleanComments.text];
        
    }
    else
    {
        AddTurnOverformtoAdd.clean=self.TxtClean.text;
        
    }
    
    if([self.TxtShampoo.text isEqualToString:@"Comment"]){
        
        AddTurnOverformtoAdd.shampoo=[self ValidateComment:self.TxtShampooComments.text];
        
    }
    else
    {
        AddTurnOverformtoAdd.shampoo=self.TxtShampoo.text;
        
    }




    

    
    
    AddTurnOverformtoAdd.locks=self.TxtLocks.text;
    AddTurnOverformtoAdd.comments=[self ValidateComment:self.TxtComments.text];
    
    
    NSMutableArray * arrFormData = [[NSMutableArray alloc]init];
    if([[OfflineManager sharedInstance]getAllTurnOverData]){
        
        arrFormData = [[OfflineManager sharedInstance]getAllTurnOverData];
        
    }
    
//    [arrFormData addObject:[AddTurnOverformtoAdd copy]];
    [arrFormData insertObject:[AddTurnOverformtoAdd copy] atIndex:0];

    [[OfflineManager sharedInstance]SaveAllTurnOverData:arrFormData];
    [self.navigationController popToRootViewControllerAnimated:YES];

    
    /*
    [self startLoading];
    [[WebServiceManager sharedInstance]AddTurnOverFormForRequest:AddTurnOverformtoAdd success:^(MoveInMoveOutBaseResponse *result) {
          [self stopLoading];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
        
        
        
        
        
        
        
    } failure:^(CustomError *error) {
        
                   [self showToastForText:@"Oops Error Occured !"];
        [self stopLoading];

        
       
    }];
     */


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
- (void)textViewDidEndEditing:(UITextView *)textView{
 
    self.ActiveTextView=nil;
}

@end
