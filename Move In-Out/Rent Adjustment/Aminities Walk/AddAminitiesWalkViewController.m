//
//  ViewController.m
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import "AddAminitiesWalkViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "RentAdjustmentTableViewCell.h"
#import "OfflineManager.h"

@interface AddAminitiesWalkViewController ()
{
    //NSArray *arrRentAdjustmentList;
    
    NSMutableArray *arrRentAdjustmentList;

    UpdateRentAdjustmenRequest *request;

}
@property(nonatomic,retain)NSMutableArray *arrChoices;
@property(nonatomic,retain)NSMutableArray *arrAmminities;
@property(nonatomic,retain)NSMutableArray *arrUniqueAmminities;
@property(nonatomic,retain)NSMutableArray *arrPropertyUnits;





@end

@implementation AddAminitiesWalkViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.TblMissingRentAdjustmentHeight.constant=00;
    request = [[UpdateRentAdjustmenRequest alloc]init];

    self.AllOfflineData=[[OfflineManager sharedInstance]getAllRentUnitsData];
    self.AllOfflineAmenitiesData =[[OfflineManager sharedInstance]getAllRentAmenitiesDescData];
    self.arrUniqueAmminities = [[NSMutableArray alloc]init];

    self.arrUniqueAmminities = [[OfflineManager sharedInstance]getAllRentUniqueAmeniiesData];
    self.arrPropertyUnits = [[OfflineManager sharedInstance]getAllUnits];



    
    self.arrChoices = [[NSMutableArray alloc]init];
    
    int j =5;
    for(int i = 0 ; i < 100; i++){
        
            [self.arrChoices addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [NSString stringWithFormat:@"-$%d",j],@"Choices", nil]];
        [self.arrChoices addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [NSString stringWithFormat:@"+$ %d",j],@"Choices", nil]];
        j = j + 5;

        
    }

//    [self.arrChoices addObject:[NSDictionary dictionaryWithObjectsAndKeys:
//                                @"-5",@"Choices", nil]];
//    [self.arrChoices addObject:[NSDictionary dictionaryWithObjectsAndKeys:
//                                @"+5",@"Choices", nil]];
//
//    [self.arrChoices addObject:[NSDictionary dictionaryWithObjectsAndKeys:
//                                @"-10",@"Choices", nil]];
//
//    [self.arrChoices addObject:[NSDictionary dictionaryWithObjectsAndKeys:
//                                @"+10",@"Choices", nil]];
//
//    [self.arrChoices addObject:[NSDictionary dictionaryWithObjectsAndKeys:
//                                @"+-10",@"Choices", nil]];

    


    
    
    
    
    
    
    
   


    
    [self performSelector:@selector(setScrollViewSize) withObject:nil afterDelay:1.0];

    
   
}
-(void)CreteAminititesData1{
    
    
    for(int i = 0 ; i < [self.arrAmminities count]; i++){
        
        UpdateRentAdjustmenAminitiesRequest *aminities = [self.arrAmminities objectAtIndex:i];
        aminities.isFinal= @"0";
        if(i == ([self.arrAmminities count]-1)){
            
            aminities.isFinal= @"1";
            
        }
       // [self.arrAmminities addObject:aminities];
        [self.arrAmminities replaceObjectAtIndex:i withObject:aminities];

    }
    [self.TblMissingRentAdjustment reloadData];

    
}
-(void)CreteAminititesData{
    
    
    self.arrAmminities = [[NSMutableArray alloc]init];
    for(int i = 0 ; i < [arrRentAdjustmentList count]; i++){

        UpdateRentAdjustmenAminitiesRequest *aminities = [[UpdateRentAdjustmenAminitiesRequest alloc]init];
      //  RentAdjustment *item = [arrRentAdjustmentList objectAtIndex:i];
        
        RentAdjustment *item = [[RentAdjustment alloc]initWithDictionary:[arrRentAdjustmentList objectAtIndex:i] error:nil];

        if(!item.amenityType.length){
            
            aminities.amenityType=@"old";
        }
        else
        {
            aminities.amenityType=item.amenityType;

        }
        
        
        aminities.amenityName = item.amenityName;
        //aminities.amenityRate = item.unitRent;
        aminities.amenityRate = item.amenityRate;

        aminities.isFinal= @"0";
        if(i == ([arrRentAdjustmentList count]-1)){
            
            aminities.isFinal= @"1";

        }
        
        
        [self.arrAmminities addObject:aminities];
        
    }
    [self.TblRentAdjustment reloadData];

}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self performSelector:@selector(setScrollViewSize) withObject:nil afterDelay:0.01];

}
-(void)LoadAllRentAdjustmentData{
    
    
    
    arrRentAdjustmentList = [[[NSArray alloc]initWithArray:[self.AllOfflineData objectForKey:self.UnitNumber]]mutableCopy];
    
    //arrRentAdjustmentList = [[NSArray alloc]initWithArray:response.data];
    
    
    if(arrRentAdjustmentList.count){
    
    RentAdjustment *item = [[RentAdjustment alloc]initWithDictionary:[arrRentAdjustmentList objectAtIndex:0] error:nil];
    //[arrRentAdjustmentList objectAtIndex:0];
    self.TxtBaseRent.text =[NSString stringWithFormat:@"$%@",item.unitRent];
    self.TxtBaseRent.userInteractionEnabled=NO;
    }
    else
    {
        [self showToastForText:@"No Rent Amenities List Found"];

    }
    [self performSelector:@selector(CreteAminititesData) withObject:nil afterDelay:0.1];
    [self performSelector:@selector(setScrollViewSize) withObject:nil afterDelay:1.0];

    
    
}
-(void)LoadAllRentAdjustmentDataONLINE{
    
    [self startLoading];
    
    

    
    RentAdjustmentListRequest *request = [[RentAdjustmentListRequest alloc]init];
    request.unit_code=self.UnitNumber;
    
    
    [[WebServiceManager sharedInstance]GetRentAdjustmentForRequest:request success:^(MoveInMoveOutBaseResponse *result) {
        [self stopLoading];
        
        
        
        RentAdjustmentListResponse *response = (RentAdjustmentListResponse*)result;
        
        if (response.data.count) {
            arrRentAdjustmentList = [[NSArray alloc]initWithArray:response.data];
            [self.TblRentAdjustment reloadData];
            
            RentAdjustment *item = [arrRentAdjustmentList objectAtIndex:0];
            self.TxtBaseRent.text =[NSString stringWithFormat:@"$%@",item.unitRent];
            self.TxtBaseRent.userInteractionEnabled=NO;
            [self performSelector:@selector(setScrollViewSize) withObject:nil afterDelay:1.0];
            [self performSelector:@selector(CreteAminititesData) withObject:nil afterDelay:0.1];


        }
        //levelID
        else{
            
            [self showToastForText:@"No Rent Adjustment List Found"];
            
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
    
     if([textField isEqual:self.TxtAdjustBaseRent]){
        
        
        [self showSelectionVCForOpponents:self.arrChoices];
        return NO;
    }
     else if([textField isEqual:self.TxtUnitNumber]){
         
         
         [self showSelectionVCForOpponents:self.arrPropertyUnits];
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
    if([self.ActiveTextField isEqual:self.TxtAdjustBaseRent]){

    
    aWSelectionViewController.itemList =arrvalue;//arrLevels; //list to display
    aWSelectionViewController.displayItemKey = @"Choices"; //key of value to display
    //   aWSelectionViewController.subtitleDisplayItemKey =@"";// @"coachID"; //key of value to display
    aWSelectionViewController.delegate  = self;
    aWSelectionViewController.titleForSelection = @"Select";
    }
    else if([self.ActiveTextField isEqual:self.TxtUnitNumber])

    {
        SLSelectionViewController *aWSelectionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SLSelectionViewController"];
        
        
        aWSelectionViewController.itemList = self.arrPropertyUnits;//arrLevels; //list to display
        aWSelectionViewController.displayItemKey = @"unit"; //key of value to display
        //   aWSelectionViewController.subtitleDisplayItemKey =@"";// @"coachID"; //key of value to display
        aWSelectionViewController.delegate  = self;
        aWSelectionViewController.titleForSelection = @"Select Units";
        [self presentViewController:aWSelectionViewController animated:YES completion:nil];
    }
        
    else
    {
        aWSelectionViewController.itemList =self.arrUniqueAmminities;//arrLevels; //list to display
        aWSelectionViewController.displayItemKey = @"amenityName"; //key of value to display
        aWSelectionViewController.subtitleDisplayItemKey =@"amenityRate";// @"coachID"; //key of value to display
        aWSelectionViewController.delegate  = self;
        aWSelectionViewController.titleForSelection = @"Select Aminity";
        aWSelectionViewController.isMutliSelect=YES;

    }
    [self presentViewController:aWSelectionViewController animated:YES completion:nil];
    
    
    
    
    
    
}
-(void)setScrollViewSize
{
    
    if(![self.ActiveTableView isEqual:self.TblMissingRentAdjustment]){
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"amenityType != %@",@"new"];
        
        NSArray *filterArray = [arrRentAdjustmentList filteredArrayUsingPredicate:predicate];
        
        
    if(self.isExpand){
        
        
        
        float values = ([filterArray count]-1)*44.00;
        values = values + 325.00;
        self.TblRentAdjustmentHeight.constant =values; //self.TblRentAdjustment.contentSize.height;

        
    }
    else
    {
        self.TblRentAdjustmentHeight.constant = [filterArray count]*44.00;

    }
    }
    else
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"amenityType = %@",@"new"];
        
        NSArray *filterArray = [arrRentAdjustmentList filteredArrayUsingPredicate:predicate];

        if(self.isExpand){
            
            float values = ([filterArray count]-1)*44.00;
            values = values + 325.00;
            self.TblMissingRentAdjustmentHeight.constant =values; //self.TblRentAdjustment.contentSize.height;
            
            
        }
        else
        {
            self.TblMissingRentAdjustmentHeight.constant = [filterArray count]*44.00;
            
        }
    }
    
    [self.ViewMainContainer layoutIfNeeded];

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
    self.ViewMainContainerHeight.constant =contentRect.size.height;

}
-(void)didSelectItem:(MoveInMoveOutBaseModel *)selectedItem{
    
    
    if([self.ActiveTextField isEqual:self.TxtAdjustBaseRent]){
        
        self.TxtAdjustBaseRent.text=[selectedItem valueForKey:@"Choices"];

    }
    else if([self.ActiveTextField isEqual:self.TxtUnitNumber]){
        
        Units *opponent = (Units *)selectedItem;
        
        self.TxtUnitNumber.text = opponent.unit;
        self.UnitNumber=opponent.unit;
        [self performSelector:@selector(LoadAllRentAdjustmentData) withObject:nil afterDelay:0.1];

    }
    
    
    
    // matchNoteToAdd.opponent = opponent.displayName;

    
    [self.ActiveTextField resignFirstResponder];
    self.ActiveTextField=nil;


    
    
    
    
    
    // matchNoteToAdd.opponent = opponent.displayName;
}


- (IBAction)SubmitData:(id)sender {
    BOOL go = YES;
    for (UpdateRentAdjustmenAminitiesRequest *service_request in self.arrAmminities){
        
        if([service_request.amenityType isEqualToString:@"old"]){
        if(!service_request.exist){

            go=NO;
            break;

            
        }
        }
    }
    
    if(!go){
        
        [self showToastForText:@"Please select 'exist' or 'does not exist' for each aminity"];
        return;

    }
    
    request.userID= [[NSUserDefaults standardUserDefaults]valueForKey:@"userID"];
    request.unitCode= self.UnitNumber;
    request.isFinal=@"0";
    if(self.TxtAdjustBaseRent.text.length){
        
        request.adjustprice=self.TxtAdjustBaseRent.text;
        request.suggestedBaserent= [self.TxtBaseRent.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
        NSString *mainString =[self.TxtAdjustBaseRent.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
        
        if([mainString hasPrefix:@"-"]){
            
            float cost = [[mainString stringByReplacingOccurrencesOfString:@"-" withString:@""]floatValue];
            
            request.suggestedBaserent = [NSString stringWithFormat:@"$%.2f",[request.suggestedBaserent floatValue] - cost];
            
            
        }
        else
        {
            float cost = [[mainString stringByReplacingOccurrencesOfString:@"+" withString:@""]floatValue];
            
            request.suggestedBaserent = [NSString stringWithFormat:@"$%.2f",[request.suggestedBaserent floatValue] + cost];
            
            
        }
        
        
        
        
    }
    else
    {
        request.adjustprice=@"$ 00.00";
        request.suggestedBaserent= [self.TxtBaseRent.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
        request.suggestedBaserent = [NSString stringWithFormat:@"$%.2f",[request.suggestedBaserent floatValue] + 00.00];


    }
    if(![self.TxtComment.text isEqualToString:@"Please add Comment"])
        request.comment= self.TxtComment.text;

    
    
    NSMutableArray * arrFinalFormData = [[NSMutableArray alloc]init];
    if([[OfflineManager sharedInstance]getRentUnitsFormData]){
        
        arrFinalFormData = [[OfflineManager sharedInstance]getRentUnitsFormData];
        
    }
//    [arrFinalFormData addObject:[request copy]];
    
    [arrFinalFormData insertObject:[request copy] atIndex:0];

    [[OfflineManager sharedInstance]SaveRentUnitsFormData:arrFinalFormData];

    
    NSMutableArray * arrRentAmenitiesDescFormData = [[NSMutableArray alloc]init];
    if([[OfflineManager sharedInstance]getRentAmenitiesDescFormData]){
        
        arrFinalFormData = [[OfflineManager sharedInstance]getRentAmenitiesDescFormData];
        
    }
    //[arrRentAmenitiesDescFormData addObject:[self.arrAmminities copy]];
    [arrRentAmenitiesDescFormData insertObject:[self.arrAmminities copy] atIndex:0];

    [[OfflineManager sharedInstance]SaveRentAmenitiesDescFormData:arrRentAmenitiesDescFormData];
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self showToastForText:@"Saved Successfully"];

    
    
    
}
- (IBAction)SubmitDataONLINE:(id)sender {

    [self startLoading];
    
    
    request.userID= [[NSUserDefaults standardUserDefaults]valueForKey:@"userID"];
    request.unitCode= self.UnitNumber;
    request.isFinal=@"0";
    if(self.TxtAdjustBaseRent.text.length){
        
        request.adjustprice=self.TxtAdjustBaseRent.text;
        request.suggestedBaserent= [self.TxtBaseRent.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
        NSString *mainString =[self.TxtAdjustBaseRent.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
        
        if([mainString hasPrefix:@"-"]){
            
            float cost = [[mainString stringByReplacingOccurrencesOfString:@"-" withString:@""]floatValue];

            request.suggestedBaserent = [NSString stringWithFormat:@"$%.2f",[request.suggestedBaserent floatValue] - cost];

            
        }
        else
        {
            float cost = [[mainString stringByReplacingOccurrencesOfString:@"+" withString:@""]floatValue];
            
            request.suggestedBaserent = [NSString stringWithFormat:@"$%.2f",[request.suggestedBaserent floatValue] + cost];

            
        }
        
        
        
        
    }
    request.comment= self.TxtComment.text;

    [[WebServiceManager sharedInstance]UpdateRentAdjustmenForRequest:request success:^(MoveInMoveOutBaseResponse *result) {
        [self stopLoading];
        if([[result valueForKey:@"success"]boolValue]){
            
                RentAdjustmenID *response = (RentAdjustmenID*)result;
               self.rent_update_id = response.rent_update_id;
            
            [self performSelector:@selector(SubmitAminititesData) withObject:nil afterDelay:0.1];

            
            // [self performSelector:@selector(patchSelector) withObject:nil afterDelay:0.3];
            
            
        }
        else
        {
            [self showToastForText:@"Could not save data at the moment"];
            
        }
        
        
        
    } failure:^(CustomError *error) {
        [self stopLoading];
        
        //        [self showToastForText:@"Could not save data at the moment"];
        [self showToastForText:error.errorDescription];
        
    }];


    
}
- (IBAction)SubmitAminititesData {
    if(self.arrAmminities.count > 0){
        
        UpdateRentAdjustmenAminitiesRequest *item = [self.arrAmminities objectAtIndex:0];

        [self performSelector:@selector(PushAminititesData:) withObject:item afterDelay:0.1];

        
    }
    else
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
        
        
        [self showToastForText:@"Saved Successfully"];

    }
    
    
}
- (IBAction)PushAminititesData:(UpdateRentAdjustmenAminitiesRequest*)requestitem {
    
    [self startLoading];

    requestitem.rentUpdateID = self.rent_update_id;
    [[WebServiceManager sharedInstance]UpdateRentAdjustmenAminitiesForRequest:requestitem success:^(MoveInMoveOutBaseResponse *result) {
        [self stopLoading];
        if([[result valueForKey:@"success"]boolValue]){
            
            
            [self.arrAmminities removeObjectAtIndex:0];
            [self performSelector:@selector(SubmitAminititesData) withObject:nil afterDelay:0.1];
            
            
            
        }
        else
        {
            [self showToastForText:@"Could not save data at the moment"];
            
        }
        
        
        
    } failure:^(CustomError *error) {
        [self stopLoading];
        
        //        [self showToastForText:@"Could not save data at the moment"];
        [self showToastForText:error.errorDescription];
        
    }];

    
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
        if([textView.text isEqualToString:@"Please add Comment"]){

        textView.text = @"";
        }
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
    if(textView
       .tag!=5000){
    int row = textView.tag % 28000;
        
        
        if([self.ActiveTableView isEqual:self.TblRentAdjustment]){
            

            UpdateRentAdjustmenAminitiesRequest *service_request= [self.arrAmminities objectAtIndex:row];
            service_request.note=textView.text;
            [self.arrAmminities replaceObjectAtIndex:row withObject:service_request];

            
;
            
        }
        else{
            
            
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"amenityType != %@",@"new"];
            
            NSArray *filterArray = [arrRentAdjustmentList filteredArrayUsingPredicate:predicate];
            
            UpdateRentAdjustmenAminitiesRequest *service_request= [self.arrAmminities objectAtIndex:(filterArray.count + row)];
            service_request.note=textView.text;
            [self.arrAmminities replaceObjectAtIndex:(filterArray.count + row) withObject:service_request];

            
        }

        
        

    }
    
    
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    if(textView
       .tag!=5000){
    int row = textView.tag % 28000;
        
        if([self.ActiveTableView isEqual:self.TblRentAdjustment]){
            
            
            UpdateRentAdjustmenAminitiesRequest *service_request= [self.arrAmminities objectAtIndex:row];
            service_request.note=textView.text;
            [self.arrAmminities replaceObjectAtIndex:row withObject:service_request];
            
            
            ;
            
        }
        else{
            
            
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"amenityType != %@",@"new"];
            
            NSArray *filterArray = [arrRentAdjustmentList filteredArrayUsingPredicate:predicate];
            
            UpdateRentAdjustmenAminitiesRequest *service_request= [self.arrAmminities objectAtIndex:(filterArray.count + row)];
            service_request.note=textView.text;
            [self.arrAmminities replaceObjectAtIndex:(filterArray.count + row) withObject:service_request];
            
            
        }
        
        
        
//    UpdateRentAdjustmenAminitiesRequest *service_request= [self.arrAmminities objectAtIndex:row];
//    service_request.note=textView.text;
//    [self.arrAmminities replaceObjectAtIndex:row withObject:service_request];
    }
    self.ActiveTextView=nil;
    
}
-(void)ShowOptions{
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        // Cancel button tappped do nothing.
        [actionSheet dismissViewControllerAnimated:YES completion:^{
            
        }];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Take Photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        // take photo button tapped.
        [self takeVideo];
        
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Choose Photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        // choose photo button tapped.
        [self choosePhoto];
        
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Remove" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        [self RemoveImages];
        
    }]];
    
    
    actionSheet.popoverPresentationController.sourceView = self.view;
    actionSheet.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0);
    
    [actionSheet showViewController:self sender:actionSheet];
    
    [self presentViewController:actionSheet animated:YES completion:^{
        
    }];
    
    
}
-(void)RemoveImages{
    
    if([self.ControlFlag isEqualToString:@"SelectImage1"]){
        
        
        if([self.ActiveTableView isEqual:self.TblRentAdjustment]){
            
            
            UpdateRentAdjustmenAminitiesRequest *service_request= [self.arrAmminities objectAtIndex:self.CurrentIndexPathRow];
            service_request.imageName1=@"";
            [self.arrAmminities replaceObjectAtIndex:self.CurrentIndexPathRow withObject:service_request];

            
        }
        else{
            
            
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"amenityType != %@",@"new"];
            
            NSArray *filterArray = [arrRentAdjustmentList filteredArrayUsingPredicate:predicate];
            
            UpdateRentAdjustmenAminitiesRequest *service_request= [self.arrAmminities objectAtIndex:(filterArray.count + self.CurrentIndexPathRow)];
            service_request.imageName1=@"";
            [self.arrAmminities replaceObjectAtIndex:(filterArray.count + self.CurrentIndexPathRow) withObject:service_request];

            
            
//            UpdateRentAdjustmenAminitiesRequest *service_request= [self.arrAmminities objectAtIndex:(filterArray.count + row)];
//            service_request.note=textView.text;
//            [self.arrAmminities replaceObjectAtIndex:row withObject:service_request];
            
            
        }

        
        

        

        [self.Btnimage1 setImage:[UIImage imageNamed:@"add-img"] forState:UIControlStateNormal];
        
    }
    else if([self.ControlFlag isEqualToString:@"SelectImage2"]){
        
//        request.imageName2= @"";

        
        
        if([self.ActiveTableView isEqual:self.TblRentAdjustment]){
            
            
            UpdateRentAdjustmenAminitiesRequest *service_request= [self.arrAmminities objectAtIndex:self.CurrentIndexPathRow];
            service_request.imageName2=@"";
            [self.arrAmminities replaceObjectAtIndex:self.CurrentIndexPathRow withObject:service_request];
            
            
        }
        else{
            
            
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"amenityType != %@",@"new"];
            
            NSArray *filterArray = [arrRentAdjustmentList filteredArrayUsingPredicate:predicate];
            
            
            
            
            UpdateRentAdjustmenAminitiesRequest *service_request= [self.arrAmminities objectAtIndex:(filterArray.count + self.CurrentIndexPathRow)];
            service_request.imageName2=@"";
            [self.arrAmminities replaceObjectAtIndex:(filterArray.count + self.CurrentIndexPathRow) withObject:service_request];
            
            
            
            //            UpdateRentAdjustmenAminitiesRequest *service_request= [self.arrAmminities objectAtIndex:(filterArray.count + row)];
            //            service_request.note=textView.text;
            //            [self.arrAmminities replaceObjectAtIndex:row withObject:service_request];
            
            
        }

        

        
        [self.Btnimage2 setImage:[UIImage imageNamed:@"add-img"] forState:UIControlStateNormal];
        
        
    }
    else if([self.ControlFlag isEqualToString:@"SelectImage3"]){
        
       // request.imageName3= @"";
        //[self.Btnimage3 setImage:[UIImage imageNamed:@"add-img"] forState:UIControlStateNormal];
        
        
    }
    [self.ActiveTableView reloadData];

}
-(void)takeVideo{
    
    
    if([self.ControlFlag isEqualToString:@"SelectVideo"]){
        
        
        
    }
    else{
        
        UIImagePickerController *libraryPicker = [[UIImagePickerController alloc] init];
        [libraryPicker setDelegate:self];
        [libraryPicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        
        
        
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            [self.parentViewController presentViewController:libraryPicker animated:YES completion:^{
                
            }];
        }];
        
    }
    
    
    
    
    
    
    
    
    
}

-(void)choosePhoto{
    
    
    if([self.ControlFlag isEqualToString:@"SelectVideo"]){
        
            }
    else{
        UIImagePickerController *libraryPicker = [[UIImagePickerController alloc] init];
        [libraryPicker setDelegate:self];
        [libraryPicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            [self presentViewController:libraryPicker animated:YES completion:^{
                
            }];    }];
        
        
    }
    
    
    
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    
    
    UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];
    if(!img) img = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    
    
    if(!(img.imageOrientation == UIImageOrientationUp ||
         img.imageOrientation == UIImageOrientationUpMirrored))
    {
        CGSize imgsize = img.size;
        UIGraphicsBeginImageContext(imgsize);
        [img drawInRect:CGRectMake(0.0, 0.0, imgsize.width, imgsize.height)];
        img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    
    if([self.ControlFlag isEqualToString:@"SelectImage1"]){
        
       // request.imageName1= [self encodeToBase64String:img];
        //[self.Btnimage1 setImage:img forState:UIControlStateNormal];
        
        
        
        if([self.ActiveTableView isEqual:self.TblRentAdjustment]){
            
            
            UpdateRentAdjustmenAminitiesRequest *service_request= [self.arrAmminities objectAtIndex:self.CurrentIndexPathRow];
            service_request.imageName1=[self encodeToBase64String:img];
            [self.arrAmminities replaceObjectAtIndex:self.CurrentIndexPathRow withObject:service_request];

            
            
        }
        else{
            
            
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"amenityType != %@",@"new"];
            
            NSArray *filterArray = [arrRentAdjustmentList filteredArrayUsingPredicate:predicate];
            
            
            
            
            UpdateRentAdjustmenAminitiesRequest *service_request= [self.arrAmminities objectAtIndex:(filterArray.count + self.CurrentIndexPathRow)];
            service_request.imageName1=[self encodeToBase64String:img];
            [self.arrAmminities replaceObjectAtIndex:(filterArray.count + self.CurrentIndexPathRow) withObject:service_request];

            
            
            
            //            UpdateRentAdjustmenAminitiesRequest *service_request= [self.arrAmminities objectAtIndex:(filterArray.count + row)];
            //            service_request.note=textView.text;
            //            [self.arrAmminities replaceObjectAtIndex:row withObject:service_request];
            
            
        }
        

        
        
        
        [self dismissViewControllerAnimated:picker completion:^{
            
        }];
        
    }
    else if([self.ControlFlag isEqualToString:@"SelectImage2"]){
        //request.imageName2= [self encodeToBase64String:img];

        //[self.Btnimage2 setImage:img forState:UIControlStateNormal];
//        UpdateRentAdjustmenAminitiesRequest *service_request= [self.arrAmminities objectAtIndex:self.CurrentIndexPathRow];
//        service_request.imageName2=[self encodeToBase64String:img];
//        [self.arrAmminities replaceObjectAtIndex:self.CurrentIndexPathRow withObject:service_request];

        
        if([self.ActiveTableView isEqual:self.TblRentAdjustment]){
            
            
            UpdateRentAdjustmenAminitiesRequest *service_request= [self.arrAmminities objectAtIndex:self.CurrentIndexPathRow];
            service_request.imageName2=[self encodeToBase64String:img];
            [self.arrAmminities replaceObjectAtIndex:self.CurrentIndexPathRow withObject:service_request];
            
            
            
        }
        else{
            
            
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"amenityType != %@",@"new"];
            
            NSArray *filterArray = [arrRentAdjustmentList filteredArrayUsingPredicate:predicate];
            
            
            
            
            UpdateRentAdjustmenAminitiesRequest *service_request= [self.arrAmminities objectAtIndex:(filterArray.count + self.CurrentIndexPathRow)];
            service_request.imageName2=[self encodeToBase64String:img];
            [self.arrAmminities replaceObjectAtIndex:(filterArray.count + self.CurrentIndexPathRow) withObject:service_request];
            
            
            
            
            //            UpdateRentAdjustmenAminitiesRequest *service_request= [self.arrAmminities objectAtIndex:(filterArray.count + row)];
            //            service_request.note=textView.text;
            //            [self.arrAmminities replaceObjectAtIndex:row withObject:service_request];
            
            
        }
        
        
        [self dismissViewControllerAnimated:picker completion:^{
            
        }];
        
        
    }
    else if([self.ControlFlag isEqualToString:@"SelectImage3"]){
        
//        request.imageName3= [self encodeToBase64String:img];
//        [self.Btnimage3 setImage:img forState:UIControlStateNormal];
        [self dismissViewControllerAnimated:picker completion:^{
            
        }];
        
        
    }
    else {
        
               
    }
    if([self.ActiveTableView isEqual:self.TblMissingRentAdjustment]){
        
        [self.TblMissingRentAdjustment reloadData];

        
    }
    else{
    [self.TblRentAdjustment reloadData];
    }
    
    
    
    
    //    [[picker presentingViewController] dismissModalViewControllerAnimated:YES];
}
//- (NSString *)encodeToBase64String:(UIImage *)image {
//    
////    
////    image = [UIImage compressImage:image
////                     compressRatio:0.9f];
//    
//    return [UIImageJPEGRepresentation(image,1) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//}
- (IBAction)SelectImage1:(id)sender{
    
    UIButton * btn = (UIButton*)sender;
    int row = btn.tag % 26000;
    self.CurrentIndexPathRow = row;
    self.ControlFlag=@"SelectImage1";
    //    [self ShowOptions];
    [self performSelector:@selector(ShowOptions) withObject:nil afterDelay:0.001];
    
}
- (IBAction)SelectImage2:(id)sender{
    
    UIButton * btn = (UIButton*)sender;
    int row = btn.tag % 27000;
    self.CurrentIndexPathRow = row;

    
    self.ControlFlag=@"SelectImage2";
    
    // [self ShowOptions];
    [self performSelector:@selector(ShowOptions) withObject:nil afterDelay:0.001];
    
    
}
- (IBAction)SelectImage3:(id)sender{
    
    
    self.ControlFlag=@"SelectImage3";
    
    //[self ShowOptions];
    [self performSelector:@selector(ShowOptions) withObject:nil afterDelay:0.001];
    
    
}
#pragma mark - TableView DataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if(self.isExpand && (self.CurrentIndexPath == indexPath)){
        
        return 385.00;
    }
    else
    {
        return 44;

    }
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    tableView.contentInset = UIEdgeInsetsZero;
    
    
    if([tableView isEqual:self.TblRentAdjustment]){
     
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"amenityType != %@",@"new"];

        NSArray *filterArray = [arrRentAdjustmentList filteredArrayUsingPredicate:predicate];
        return filterArray.count;
        
    }
    else{
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"amenityType = %@",@"new"];
        NSArray *filterArray = [arrRentAdjustmentList filteredArrayUsingPredicate:predicate];
        return filterArray.count;
        
    }
    
    //return arrRentAdjustmentList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellIdentifier = @"selectionCell";
    RentAdjustmentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        
        
        
        cell = [[RentAdjustmentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    RentAdjustment *item = [[RentAdjustment alloc]initWithDictionary:[arrRentAdjustmentList objectAtIndex:indexPath.row] error:nil];

    //RentAdjustment *item = [arrRentAdjustmentList objectAtIndex:indexPath.row];
    
    if([tableView isEqual:self.TblRentAdjustment]){
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"amenityType != %@",@"new"];
        
        NSArray *filterArray = [arrRentAdjustmentList filteredArrayUsingPredicate:predicate];
        item = [[RentAdjustment alloc]initWithDictionary:[filterArray objectAtIndex:indexPath.row] error:nil];
    }
    else{
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"amenityType = %@",@"new"];
        NSArray *filterArray = [arrRentAdjustmentList filteredArrayUsingPredicate:predicate];
        item = [[RentAdjustment alloc]initWithDictionary:[filterArray objectAtIndex:indexPath.row] error:nil];
        
    }
    
    
    
    
    
    //RentAdjustment *item1 = [[RentAdjustment alloc]initWithDictionary:[arrRentAdjustmentList objectAtIndex:i] error:nil];


    
    // cell.textLabel.text = [item valueForKey:@"levelName"];
    cell.LblamenityName.text =[NSString stringWithFormat:@"%@",item.amenityName];
    cell.LblamenityRate.text =[NSString stringWithFormat:@"$%@",item.amenityRate];
    
    
//    arrRentAmenitiesDescList = [[NSArray alloc]initWithArray:[self.AllOfflineAmenitiesData objectForKey:item.amenityName]];
    
    NSDictionary * dict = [self.AllOfflineAmenitiesData objectForKey:item.amenityName];

    if(dict){
    
    
//    if(item.amenityDesc.length){
    cell.BtnInfo.hidden=NO;
    cell.BtnInfo.tag = indexPath.row;
    [cell.BtnInfo addTarget:self action:@selector(changeState:) forControlEvents:UIControlEventTouchUpInside];
//    }
//    else
//    {
//        cell.BtnInfo.hidden=YES;
//    }
    }
    else
    {
        cell.BtnInfo.hidden=YES;

    }
    if(self.isExpand && (self.CurrentIndexPath == indexPath)){
     
        cell.ImgPlusMinus.image=[UIImage imageNamed:@"sub-bt"];

    }
    else
    {
        cell.ImgPlusMinus.image=[UIImage imageNamed:@"addbt"];
    }
    

    cell.Image1.tag = (indexPath.section * 26000) + indexPath.row;
    [cell.Image1 addTarget:self action:@selector(SelectImage1:) forControlEvents:UIControlEventTouchUpInside];
    
    
    cell.Image2.tag = (indexPath.section * 27000) + indexPath.row;
    [cell.Image2 addTarget:self action:@selector(SelectImage2:) forControlEvents:UIControlEventTouchUpInside];

    
    cell.TxtComment.tag = (indexPath.section * 28000) + indexPath.row;
    cell.TxtComment.delegate=self;
    
    UpdateRentAdjustmenAminitiesRequest *service_request= [self.arrAmminities objectAtIndex:indexPath.row];
    
    
    cell.BtnExist.tag = (indexPath.section * 29000) + indexPath.row;
    [cell.BtnExist addTarget:self action:@selector(SelectBtnExist:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.BtnDoesNotExist.tag = (indexPath.section * 30000) + indexPath.row;
    [cell.BtnDoesNotExist addTarget:self action:@selector(SelectBtnDoesNotExist:) forControlEvents:UIControlEventTouchUpInside];


    

    if([tableView isEqual:self.TblRentAdjustment]){
        
        
        service_request= [self.arrAmminities objectAtIndex:indexPath.row];
        
        
    }
    else{
        
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"amenityType != %@",@"new"];
        
        NSArray *filterArray = [arrRentAdjustmentList filteredArrayUsingPredicate:predicate];
        
        service_request= [self.arrAmminities objectAtIndex:(filterArray.count + indexPath.row)];

        
//        UpdateRentAdjustmenAminitiesRequest *service_request= [self.arrAmminities objectAtIndex:(filterArray.count + self.CurrentIndexPathRow)];
//        service_request.imageName1=@"";
//        [self.arrAmminities replaceObjectAtIndex:self.CurrentIndexPathRow withObject:service_request];
        
        
        
        //            UpdateRentAdjustmenAminitiesRequest *service_request= [self.arrAmminities objectAtIndex:(filterArray.count + row)];
        //            service_request.note=textView.text;
        //            [self.arrAmminities replaceObjectAtIndex:row withObject:service_request];
        
        
    }

    
    
    
    
    if((service_request.note.length) && (![service_request.note isEqualToString:@"Please add Comment"])){
        
        cell.TxtComment.text = service_request.note;
    }
    else
    {
        cell.TxtComment.text = @"Please add Comment";

    }
    if(service_request.imageName1.length){
        
        UIImage *img = [self decodeBase64StringtoImage:service_request.imageName1];
        [cell.Image1 setImage:img forState:UIControlStateNormal];
    }
    else
    {
        UIImage *img = [UIImage imageNamed:@"add-img"];

        [cell.Image1 setImage:img forState:UIControlStateNormal];

    }

    
    if(service_request.imageName2.length){
        
        UIImage *img = [self decodeBase64StringtoImage:service_request.imageName2];
        [cell.Image2 setImage:img forState:UIControlStateNormal];
    }
    else
    {
        UIImage *img = [UIImage imageNamed:@"add-img"];
        [cell.Image2 setImage:img forState:UIControlStateNormal];
        
    }

    if([service_request.exist isEqualToString:@"1"]){
        
        cell.ImgExist.image=[UIImage imageNamed:@"radio-bt-active"];
        cell.ImgDoesNotExist.image=[UIImage imageNamed:@"radio-bt-deactive"];

        
    }
    else if([service_request.exist isEqualToString:@"0"]){
        
        cell.ImgDoesNotExist.image=[UIImage imageNamed:@"radio-bt-active"];
        cell.ImgExist.image=[UIImage imageNamed:@"radio-bt-deactive"];

        
    }
    else
    {
        cell.ImgExist.image=[UIImage imageNamed:@"radio-bt-deactive"];
        cell.ImgDoesNotExist.image=[UIImage imageNamed:@"radio-bt-deactive"];

    }
    




    

    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.ActiveTableView =tableView;

    if([self.TblRentAdjustment isEqual:tableView]){
    if(self.isExpand && (self.CurrentIndexPath == indexPath)){
        
        self.isExpand=NO;
        self.CurrentIndexPath=nil;
        
        
    }
    else
    {
        self.isExpand=YES;
        self.CurrentIndexPath=indexPath;

    }
    [self.TblRentAdjustment reloadData];
    }
    else
    {
        if(self.isExpand && (self.CurrentIndexPath == indexPath)){
            
            self.isExpand=NO;
            self.CurrentIndexPath=nil;
            
            
        }
        else
        {
            self.isExpand=YES;
            self.CurrentIndexPath=indexPath;
            
        }
        [self.TblMissingRentAdjustment reloadData];
    }
    
    [self performSelector:@selector(setScrollViewSize) withObject:nil afterDelay:0.1];

    
}
- (NSString *)encodeToBase64String:(UIImage *)image {
    
    
    image = [UIImage compressImage:image
                     compressRatio:0.9f];
    
    return [UIImageJPEGRepresentation(image,1) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}
- (UIImage *)decodeBase64StringtoImage:(NSString *)base64String {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:base64String options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}

- (void)changeState:(UIButton *)sender
{
   // RentAdjustment *item = [arrRentAdjustmentList objectAtIndex:sender.tag];
    RentAdjustment *item = [[RentAdjustment alloc]initWithDictionary:[arrRentAdjustmentList objectAtIndex:sender.tag] error:nil];

    
    
    NSDictionary * dict = [self.AllOfflineAmenitiesData objectForKey:item.amenityName];

    
    if(dict){
        
        
        RentAdjustment *item1 = [[RentAdjustment alloc]initWithDictionary:dict error:nil];

        
    
    
    
    NSString *synopsis =item1.amenityDesc;

    
    if ([UIAlertController class])
    {
        
        if(synopsis.length){
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleAlert];
            
            NSMutableAttributedString *hogan = [[NSMutableAttributedString alloc] initWithString:synopsis];
            [hogan addAttribute:NSFontAttributeName
                          value:[UIFont boldSystemFontOfSize:18.00]
                          range:NSMakeRange(0,synopsis.length)];
            
            NSMutableParagraphStyle *ps = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
            ps.alignment = NSTextAlignmentLeft;
            [hogan addAttribute:NSParagraphStyleAttributeName value:ps range:NSMakeRange(0,synopsis.length)];
            
            
            [alertController setValue:hogan forKey:@"attributedTitle"];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
        else
        {
        }
        
    }
    else
    {
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Notes" message:synopsis delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
    }
    
    
    }
    
    
    
    
}
- (IBAction)AddMissingAmenities:(id)sender{
    
    self.ActiveTextField=nil;
    [self showSelectionVCForOpponents:self.arrUniqueAmminities];

    
}




- (void)didSelectMultipleItem:(NSMutableArray *)selectedItems andIndexes:(NSMutableDictionary *)selectedIndexesDictionary{
    
    if([selectedItems count]){
        
        self.LblMissingAmitnities.hidden=NO;
        self.TblMissingRentAdjustment.hidden=NO;
        self.ActiveTableView = self.TblMissingRentAdjustment;
    }
    
    for(int i = 0; i < [selectedItems count]; i++ ){
        
//        MoveInMoveOutBaseModel *selectedItem =(MoveInMoveOutBaseModel*)[selectedItems objectAtIndex:i];
//        
//        RentAdjustment *aminities = [[RentAdjustment alloc]init];
//        
//        
//        aminities.amenityName = [selectedItem valueForKey:@"amenityName"];
//        aminities.amenityRate = [selectedItem valueForKey:@"amenityRate"];;
        
        
        RentAdjustment *item = [[RentAdjustment alloc]initWithDictionary:[selectedItems objectAtIndex:i] error:nil];
            item.amenityType=@"new";
        [arrRentAdjustmentList addObject:item.toDictionary];
        UpdateRentAdjustmenAminitiesRequest *aminities = [[UpdateRentAdjustmenAminitiesRequest alloc]init];
        if(!item.amenityType.length){
            
            aminities.amenityType=@"new";
        }
        else
        {
            aminities.amenityType=item.amenityType;
            
        }
        
        
        aminities.amenityName = item.amenityName;
        //aminities.amenityRate = item.unitRent;
        aminities.amenityRate = item.amenityRate;
        
        
        [self.arrAmminities addObject:aminities];
        

    }
    
    
    [self performSelector:@selector(CreteAminititesData1) withObject:nil afterDelay:0.1];
    [self performSelector:@selector(setScrollViewSize) withObject:nil afterDelay:1.0];

    
    
}
- (IBAction)SelectBtnExist:(id)sender{
    
    UIButton * btn = (UIButton*)sender;
    int row = btn.tag % 29000;
    self.CurrentIndexPathRow = row;

    UpdateRentAdjustmenAminitiesRequest *service_request= [self.arrAmminities objectAtIndex:self.CurrentIndexPathRow];
    service_request.exist=@"1";
    [self.arrAmminities replaceObjectAtIndex:self.CurrentIndexPathRow withObject:service_request];
    [self.TblRentAdjustment reloadData];
    
    
    
    
    
    
    


    
    
}
- (IBAction)SelectBtnDoesNotExist:(id)sender{
    
    UIButton * btn = (UIButton*)sender;
    int row = btn.tag % 30000;
    self.CurrentIndexPathRow = row;
    UpdateRentAdjustmenAminitiesRequest *service_request= [self.arrAmminities objectAtIndex:self.CurrentIndexPathRow];
    service_request.exist=@"0";
    [self.arrAmminities replaceObjectAtIndex:self.CurrentIndexPathRow withObject:service_request];

    [self.TblRentAdjustment reloadData];

    
}

@end
