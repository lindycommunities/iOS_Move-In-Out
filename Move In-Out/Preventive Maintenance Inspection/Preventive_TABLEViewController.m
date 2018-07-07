//
//  MoveIN_OUT_TABLEViewController.m
//  Move In-Out
//
//  Created by S S D on 06/08/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import "Preventive_TABLEViewController.h"
#import "CustomTableViewCell.h"
#import "LessonSectionHeader.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
#import "AddPreventionServiceRequestRequest.h"
#import "IQKeyboardManager.h"
#import "MoveINViewController3.h"
#import "OfflineManager.h"

static NSString *parentCategoryTitle1  = @"Toilet Fixtures";
static NSString * CLEANLINESSchildCategoryTitle1 =@"Replace Fixtures 3.5 gallons or greater";
static NSString * CLEANLINESSchildCategoryTitle2= @"Use dye or check leak, adjust or change flapper, Fluid Master";
static NSString * CLEANLINESSchildCategoryTitle3 =@"Supply Lines/ Replace Plastic Lines";



static NSString *parentCategoryTitle2  = @"Sink Faucets - Check for";
static NSString * LIVINGROOMMchildCategoryTitle1 =@"Leaks";
static NSString * LIVINGROOMMchildCategoryTitle2 =@"Change washers";
static NSString * LIVINGROOMMchildCategoryTitle3 =@"Seats";
static NSString * LIVINGROOMMchildCategoryTitle4=@"Faucet";
static NSString * LIVINGROOMMchildCategoryTitle5 =@"Include clean/replace aerator";
static NSString * LIVINGROOMMchildCategoryTitle6 =@"Kitchen faucet also check: \nPop up mechanism";

static NSString *parentCategoryTitle3  = @"Tub and Shower";
static NSString * DININGROOMchildCategoryTitle1 =@"Leaks";
static NSString * DININGROOMchildCategoryTitle2 =@"Change Washer";
static NSString * DININGROOMchildCategoryTitle3 =@"Seats";
static NSString * DININGROOMchildCategoryTitle4 =@"Faucet";
static NSString * DININGROOMchildCategoryTitle5 =@"Refill container with water in dryer lint trap";
static NSString * DININGROOMchildCategoryTitle6 =@"New/Old Shower Diverters";



static NSString *parentCategoryTitle4  = @"Inspection";
static NSString * KITCHENchildCategoryTitle1 =@"Electrical Panel";
static NSString * KITCHENchildCategoryTitle2 =@"Clean dryer vents/check water";
static NSString * KITCHENchildCategoryTitle3 =@"Check for gaps in windows - closing securely";
static NSString * KITCHENchildCategoryTitle4 =@"Check thermostat control";
static NSString * KITCHENchildCategoryTitle5 =@"Install pan under hot water heater";

static NSString * KITCHENchildCategoryTitle6 =@"Change air conditioning filters/Kithchen/Bath Vents";

static NSString * KITCHENchildCategoryTitle7 =@"Check self closing door";

static NSString * KITCHENchildCategoryTitle8 =@"Check water filled in dryer vent";
static NSString * KITCHENchildCategoryTitle9 =@"Check grease on auto out/Installed";
static NSString * KITCHENchildCategoryTitle10 =@"Water Amarm-Hot Water Heater/AC Closet";
static NSString * KITCHENchildCategoryTitle11 =@"GFI On porches";







static NSString *parentCategoryTitle5  = @"Appliances";
static NSString * BATHROOMchildCategoryTitle1 =@"Washer/Dryer";
static NSString * BATHROOMchildCategoryTitle2 =@"Dishwasher";
static NSString * BATHROOMchildCategoryTitle3 =@"Microwave";
static NSString * BATHROOMchildCategoryTitle4 =@"Range";
static NSString * BATHROOMchildCategoryTitle5 =@"Refrigerator";









static NSString * Ok= @"Ok";
static NSString * NotOk =@"Not Ok";
static NSString * BlankData= @"";
static NSString * CommentPlaceholder= @"Please add Comment";






@interface Preventive_TABLEViewController ()
{
    NSMutableArray *arrParentCategory,*arrParentCategoryid;
    NSMutableArray *arrChildCategory;

    NSMutableArray *arrChildCategory1;
    NSMutableArray *arrChildCategory2;
    NSMutableArray *selectedCellPaths;
    
}

@property(nonatomic,retain) NSMutableArray *arrParentCategory,*arrParentCategoryid;
@property(nonatomic,retain) NSMutableArray *arrChildCategory,*arrChildCategory1,*arrChildCategory2;

@property(nonatomic,weak)IBOutlet UITableView *TblMainData;
@property (strong, nonatomic) UIButton *LastActiveButton;

@property(nonatomic,assign)BOOL isExpand;
@property(nonatomic,assign)int activeSection;
@property(nonatomic,assign)int activeRow;

@end

@implementation Preventive_TABLEViewController
@synthesize arrParentCategory,arrParentCategoryid;
@synthesize arrChildCategory,arrChildCategory1,arrChildCategory2;
@synthesize AllPriceData;
- (void)viewDidLoad {
    [super viewDidLoad];
     //[[IQKeyboardManager sharedManager]setEnableAutoToolbar:NO];
    self.isExpand=NO;
   // self.moveInOutType=@"move-out";
    
   
    selectedCellPaths = [[NSMutableArray alloc] init];
    int total= 5;
    
    for(int i = 0;i<total;i++){
        
        [selectedCellPaths addObject:@"NO"];
        
    }
    
    
    
    UINib *sectionNib = [UINib nibWithNibName:@"LessonSectionHeader" bundle:nil];
    [self.TblMainData registerNib:sectionNib forHeaderFooterViewReuseIdentifier:@"LessonSectionHeader"];

    // Do any additional setup after loading the view.

    self.arrParentCategory= [[NSMutableArray alloc]init];
    [self.arrParentCategory addObject:parentCategoryTitle1];
    [self.arrParentCategory addObject:parentCategoryTitle2];
    [self.arrParentCategory addObject:parentCategoryTitle3];
    [self.arrParentCategory addObject:parentCategoryTitle4];
    [self.arrParentCategory addObject:parentCategoryTitle5];
    
    self.arrParentCategoryid= [[NSMutableArray alloc]init];
    [self.arrParentCategoryid addObject:@"1"];
    [self.arrParentCategoryid addObject:@"2"];
    [self.arrParentCategoryid addObject:@"3"];
    [self.arrParentCategoryid addObject:@"4"];
    [self.arrParentCategoryid addObject:@"5"];

    
    
    
    
    self.arrChildCategory= [[NSMutableArray alloc]init];

    
    self.arrChildCategory1= [[NSMutableArray alloc]init];
    [self.arrChildCategory1 addObject:CLEANLINESSchildCategoryTitle1];
    [self.arrChildCategory1 addObject:CLEANLINESSchildCategoryTitle2];
    [self.arrChildCategory1 addObject:CLEANLINESSchildCategoryTitle3];
    
    self.arrChildCategory2= [[NSMutableArray alloc]init];

    [self.arrChildCategory2 addObject:@"6"];
    [self.arrChildCategory2 addObject:@"7"];
    [self.arrChildCategory2 addObject:@"8"];

    NSDictionary *importantCapitals = [NSDictionary dictionaryWithObjectsAndKeys:
                                       [self.arrChildCategory1 copy],@"ChildCategory",[self.arrChildCategory2 copy],@"ChildCategoryId",
                                       nil];
    
    
    [self.arrChildCategory addObject:[importantCapitals copy]];
    [self.arrChildCategory1 removeAllObjects];
    [self.arrChildCategory2 removeAllObjects];
//    self.arrChildCategory1= [[NSMutableArray alloc]init];
//    self.arrChildCategory2= [[NSMutableArray alloc]init];


    [self.arrChildCategory1 addObject:LIVINGROOMMchildCategoryTitle1];
    [self.arrChildCategory1 addObject:LIVINGROOMMchildCategoryTitle2];
    [self.arrChildCategory1 addObject:LIVINGROOMMchildCategoryTitle3];
    [self.arrChildCategory1 addObject:LIVINGROOMMchildCategoryTitle4];
    [self.arrChildCategory1 addObject:LIVINGROOMMchildCategoryTitle5];
    [self.arrChildCategory1 addObject:LIVINGROOMMchildCategoryTitle6];
    
    [self.arrChildCategory2 addObject:@"09"];
    [self.arrChildCategory2 addObject:@"10"];
    [self.arrChildCategory2 addObject:@"11"];
    [self.arrChildCategory2 addObject:@"12"];
    [self.arrChildCategory2 addObject:@"13"];
    [self.arrChildCategory2 addObject:@"14"];

    
    
//    importantCapitals = [NSDictionary dictionaryWithObjectsAndKeys:
//                          arrChildCategory2,@"ChildCategory",
//                         nil];
    
    importantCapitals = [NSDictionary dictionaryWithObjectsAndKeys:
                         [self.arrChildCategory1 copy],@"ChildCategory",[self.arrChildCategory2 copy],@"ChildCategoryId",
                         nil];

    [self.arrChildCategory addObject:[importantCapitals copy]];
    [self.arrChildCategory1 removeAllObjects];
    [self.arrChildCategory2 removeAllObjects];
    
    
    [self.arrChildCategory1 addObject:DININGROOMchildCategoryTitle1];
    [self.arrChildCategory1 addObject:DININGROOMchildCategoryTitle2];
    [self.arrChildCategory1 addObject:DININGROOMchildCategoryTitle3];
    [self.arrChildCategory1 addObject:DININGROOMchildCategoryTitle4];
    [self.arrChildCategory1 addObject:DININGROOMchildCategoryTitle5];
    [self.arrChildCategory1 addObject:DININGROOMchildCategoryTitle6];

    [self.arrChildCategory2 addObject:@"15"];
    [self.arrChildCategory2 addObject:@"16"];
    [self.arrChildCategory2 addObject:@"17"];
    [self.arrChildCategory2 addObject:@"18"];
    [self.arrChildCategory2 addObject:@"19"];
    [self.arrChildCategory2 addObject:@"20"];

    importantCapitals = [NSDictionary dictionaryWithObjectsAndKeys:
                         [self.arrChildCategory1 copy],@"ChildCategory",[self.arrChildCategory2 copy],@"ChildCategoryId",
                         nil];
    
    [self.arrChildCategory addObject:[importantCapitals copy]];
    [self.arrChildCategory1 removeAllObjects];
    [self.arrChildCategory2 removeAllObjects];
    
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle1];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle2];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle3];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle4];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle5];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle6];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle7];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle8];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle9];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle10];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle11];
    
    [self.arrChildCategory2 addObject:@"21"];
    [self.arrChildCategory2 addObject:@"22"];
    [self.arrChildCategory2 addObject:@"23"];
    [self.arrChildCategory2 addObject:@"24"];
    [self.arrChildCategory2 addObject:@"25"];
    [self.arrChildCategory2 addObject:@"26"];
    [self.arrChildCategory2 addObject:@"27"];
    [self.arrChildCategory2 addObject:@"28"];
    [self.arrChildCategory2 addObject:@"29"];
    [self.arrChildCategory2 addObject:@"30"];
    [self.arrChildCategory2 addObject:@"31"];

    
    
    importantCapitals = [NSDictionary dictionaryWithObjectsAndKeys:
                         [self.arrChildCategory1 copy],@"ChildCategory",[self.arrChildCategory2 copy],@"ChildCategoryId",
                         nil];
    
    [self.arrChildCategory addObject:[importantCapitals copy]];
    [self.arrChildCategory1 removeAllObjects];
    [self.arrChildCategory2 removeAllObjects];
    
    
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle1];
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle2];
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle3];
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle4];
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle5];
    
    [self.arrChildCategory2 addObject:@"32"];
    [self.arrChildCategory2 addObject:@"33"];
    [self.arrChildCategory2 addObject:@"34"];
    [self.arrChildCategory2 addObject:@"35"];
    [self.arrChildCategory2 addObject:@"36"];
    
    
    
    importantCapitals = [NSDictionary dictionaryWithObjectsAndKeys:
                         [self.arrChildCategory1 copy],@"ChildCategory",[self.arrChildCategory2 copy],@"ChildCategoryId",
                         nil];
    
    [self.arrChildCategory addObject:[importantCapitals copy]];
    [self.arrChildCategory1 removeAllObjects];
    [self.arrChildCategory2 removeAllObjects];

    
    
    
    [self SetData];
    
    
}
-(void)SetData{
    
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [app.arrAllData removeAllObjects];
    [app.arrAllDataDict removeAllObjects];
    
    
    int count=0;
    for(NSString *_keyname in self.arrParentCategory){
        
        
        NSMutableArray *arrtemp = [[NSMutableArray alloc]init];
        NSString *_keynameId = [ self.arrParentCategoryid objectAtIndex:count];
        
        NSDictionary *dic_data=[self.arrChildCategory objectAtIndex:count];
        NSArray *arr =[dic_data valueForKey:@"ChildCategory"];
        NSArray *arr1 =[dic_data valueForKey:@"ChildCategoryId"];

        int cnt = 0;
        for(NSString *_key_name in arr){
            
            NSString *_key_nameid = [arr1 objectAtIndex:cnt];

            AddPreventionServiceRequestRequest *service_request=[[AddPreventionServiceRequestRequest alloc]init];
            service_request.parent_category_id=_keynameId;
            service_request.child_category_id=_key_nameid;
            service_request.parent_category=_keyname;
            service_request.child_category=_key_name;
            service_request.comment=CommentPlaceholder;
            service_request.imageName1=BlankData;
            service_request.imageName2=BlankData;
            service_request.is_ok=BlankData;
            
            service_request.isFinal=@"0";
            if((count == ([self.arrParentCategory count]-1)) && (cnt == ([arr1 count]-1)))
               {
                   service_request.isFinal=@"1";

               }
            
            

          //  [app.arrAllData addObject:service_request];
            
            [arrtemp addObject:service_request];

            cnt++;
            
        }
        [app.arrAllDataDict setObject:arrtemp forKey:_keyname];
        count++;

        
    }
    
    
    //    for(int i = 1;i<6; i++){
    
    [self.TblMainData reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    NSLog(@"%d",self.arrParentCategory.count);
    return self.arrParentCategory.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(self.isExpand){
        
        if(self.activeSection==section){
        NSDictionary *dic_data=[self.arrChildCategory objectAtIndex:section];
        return [[dic_data valueForKey:@"ChildCategory"]count];
        }
        else
        {
            return 0;
        }
        
//         if (section==1){
//            
//            return self.arrChildCategory1.count;
//
//        }
//
//        else if (section==2){
//            
//            return self.arrChildCategory2.count;
//
//        }
//        else if (section==3){
//            return self.arrChildCategory1.count;
//
//            
//        }
//        else if (section==4){
//            
//            return self.arrChildCategory1.count;
//
//        }
//        else {
//            
//            return 0;
//        }

    }
    else
    {
        return 0;

    }
    
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    static NSString *identifier = @"LessonSectionHeader";
    LessonSectionHeader *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    
    if (headerView == nil){
//        [NSException raise:@"headerView == nil.." format:@"No Header with matching Identifier loaded from your NIB"];
//        
//        NSArray *viewArray =  [[NSBundle mainBundle] loadNibNamed:@"LessonSectionHeader" owner:self options:nil];
//        headerView = [viewArray objectAtIndex:0];
        
        

        
    }
    
    
    headerView.LblHeaderTitle.text =[self.arrParentCategory objectAtIndex:section];
    headerView.LblHeaderTitle.delegate=self;
    headerView.LblHeaderTitle.tag=section;
    headerView.BtnAllOk.tag=section;
    [headerView.BtnAllOk addTarget:self action:@selector(Edit_me:) forControlEvents:UIControlEventTouchUpInside];
    
    headerView.BtnOpenAll.tag=section;
    [headerView.BtnOpenAll addTarget:self action:@selector(Open_me:) forControlEvents:UIControlEventTouchUpInside];
    if([[selectedCellPaths objectAtIndex:section]isEqualToString:@"YES"]){
        
        headerView.ImgAllOk.image=[UIImage imageNamed:@"check-box-active.png"];
        
    }
    else
    {
        headerView.ImgAllOk.image=[UIImage imageNamed:@"check-box-disable.png"];
        
    }
    
    if(self.activeSection==section){
        
        if(self.isExpand){
            headerView.ImgPlusMinus.image=[UIImage imageNamed:@"sub-bt"];

        }
        else{
            
            headerView.ImgPlusMinus.image=[UIImage imageNamed:@"addbt"];

        }

    }
    else{
        
        headerView.ImgPlusMinus.image=[UIImage imageNamed:@"addbt"];

    }
    
    if([[[NSUserDefaults standardUserDefaults]valueForKey:@"roleAID"]isEqualToString:@"6"]){
        
        headerView.BtnAllOk.hidden=YES;
        headerView.ImgAllOk.hidden=YES;
        headerView.LblAllOk.hidden=YES;

    }
    else
    {
        headerView.BtnAllOk.hidden=YES;
        headerView.ImgAllOk.hidden=YES;
        headerView.LblAllOk.hidden=YES;

    }

    
    
    
    
  //  headerView.transform = CGAffineTransformMakeRotation(M_PI);
    
    return headerView;
    
}
-(void)SetOKNOTOKData99:(int)index :(NSString*)Status{
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    AddPreventionServiceRequestRequest *service_request= [app.arrAllData objectAtIndex:index];
    service_request.is_ok=Status;
    [app.arrAllData replaceObjectAtIndex:index withObject:service_request];
    
    
}
-(void)SetOKNOTOKData:(int)index :(AddPreventionServiceRequestRequest *)Status{
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [app.arrAllData replaceObjectAtIndex:index withObject:Status];
    
    
}

-(void)Edit_me:(UIButton*)sender{
    
    /*if(self.activeSection==sender.tag){
        
        if(self.isExpand){
            
            self.isExpand=NO;
        }
        else
        {
            self.isExpand=YES;
        }
        
        
    }
    else{
        
        self.isExpand=NO;
      //  [self.TblMainData reloadData];
        self.isExpand=YES;
        
        
        
        
    }*/
    self.isExpand=YES;
    self.activeSection=sender.tag;
    //[self.TblMainData reloadData];
//    if(self.isExpand){
//        
//        self.isExpand=NO;
//    }
//    else
//    {
//        self.isExpand=YES;
//    }
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    AddPreventionServiceRequestRequest *service_request;
    NSString *_keyname = [self.arrParentCategory objectAtIndex:sender.tag];
    NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
    NSMutableArray *arrtemp = [[NSMutableArray alloc]init];

    if([[selectedCellPaths objectAtIndex:sender.tag]isEqualToString:@"YES"]){
        
        for(AddPreventionServiceRequestRequest *service_request  in arr){
            
            service_request.is_ok=BlankData;
            service_request.imageName1=BlankData;
            service_request.imageName2=BlankData;
            [arrtemp addObject:service_request];
            
        }
        [selectedCellPaths replaceObjectAtIndex:sender.tag withObject:@"NO"];

    }
    else
    {
        for(AddPreventionServiceRequestRequest *service_request  in arr){
            
            service_request.is_ok=Ok;
            service_request.imageName1=BlankData;
            service_request.imageName2=BlankData;
            [arrtemp addObject:service_request];
            
        }
        [selectedCellPaths replaceObjectAtIndex:sender.tag withObject:@"YES"];

  
    }
    [app.arrAllDataDict setObject:arrtemp forKey:_keyname];
    [self.TblMainData reloadData];
    //[self performSelector:@selector(reloadSections:) withObject:sender.tag afterDelay:.2];
   // [self reloadSections:sender.tag];

}


-(void)Edit_meold:(UIButton*)sender{
    int count=0;
    if(sender.selected){

        sender.selected=NO;
    }
    else{
        
        sender.selected=YES;
    }
    NSMutableArray *arrcount = [[NSMutableArray alloc]init];
    NSMutableArray *arrData = [[NSMutableArray alloc]init];
    NSString *_keyname = [self.arrParentCategory objectAtIndex:sender.tag];
   // for(NSString *_keyname in self.arrParentCategory){
        
        
        AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];

        
        for(AddPreventionServiceRequestRequest *service_request  in app.arrAllData){
            
            if([service_request.parent_category isEqualToString:_keyname]){
                
                service_request.is_ok=Ok;
                //[self SetOKNOTOKData:count:service_request];
                [arrcount addObject:[NSNumber numberWithInt:count]];
                [arrData addObject:service_request];


            }
            count++;
            
        }
        
   // }
    for(int i = 0;i<arrcount.count;i++){
        
        [self SetOKNOTOKData:[[arrcount objectAtIndex:i]intValue]:[arrData objectAtIndex:i]];
    }

    [self.TblMainData reloadData];
    
    
//    NSDictionary *dic_data=[self.arrChildCategory objectAtIndex:sender.tag];
//    NSArray *arr =[dic_data valueForKey:@"ChildCategory"];
//    for(NSString *_key_name in arr){
//        
//        
//        AddPreventionServiceRequestRequest *service_request=[[AddPreventionServiceRequestRequest alloc]init];
//        service_request.is_ok=Ok;
//        
//        
//        
//    }
}
-(void)Open_me:(UIButton*)sender{
    
    if(self.activeSection==sender.tag){
        
        if(self.isExpand){
            
            self.isExpand=NO;
        }
        else
        {
            self.isExpand=YES;
        }

        
    }
    else{
        
        self.isExpand=NO;
        [self.TblMainData reloadData];
        self.isExpand=YES;




    }
    self.activeSection=sender.tag;
    [self.TblMainData reloadData];

}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSString *_keyname = [self.arrParentCategory objectAtIndex:indexPath.section];
    
    NSArray *arr =[app.arrAllDataDict valueForKey:_keyname];

    
    AddPreventionServiceRequestRequest *service_request= [arr objectAtIndex:indexPath.row];
    
    
    if([service_request.is_ok isEqualToString:BlankData]||[service_request.is_ok isEqualToString:Ok]){
        
        return 75;

    }
    else
    {
        
                return 285;
 

    }
    
    
    
    
}
- (void)reloadSections:(int)_index {
    [self.TblMainData reloadSections:[NSIndexSet indexSetWithIndex:_index]
                  withRowAnimation:UITableViewRowAnimationNone];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
    
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSString *_keyname = [self.arrParentCategory objectAtIndex:indexPath.section];

    NSArray *arr =[app.arrAllDataDict valueForKey:_keyname];

    
    AddPreventionServiceRequestRequest *service_request= [arr objectAtIndex:indexPath.row];
    
    
        static NSString* cellIdentifierVideo = @"CustomTableViewCell";
        CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierVideo];
        if (cell == nil) {
            
            
            
            cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifierVideo];
        }
        
    
    if(service_request.is_ok.length){
        
        cell.ImgCheckBox.image=[UIImage imageNamed:@"check-box-active"];
        
    }
    else
    {
        cell.ImgCheckBox.image=[UIImage imageNamed:@"check-box-disable1"];


    }
    
    cell.TxtComments.layer.borderWidth = 0.5f;
    cell.TxtComments.layer.borderColor = [[UIColor blueColor] CGColor];
    cell.TxtComments.delegate=self;
    cell.TxtComments.tag=(indexPath.section * 24000) + indexPath.row;//indexPath.row;
    cell.Lbl_Title.text=service_request.child_category;
    if([service_request.comment isEqualToString:CommentPlaceholder]){
        
        
        cell.TxtComments.textColor = [UIColor lightGrayColor];
        cell.TxtComments.text = CommentPlaceholder;//@"Please add Comment";


    }
    else{
    cell.TxtComments.text=service_request.comment;
    cell.TxtComments.textColor = [UIColor blackColor];

    }
    cell.BtnNotOk.tag = (indexPath.section * 21000) + indexPath.row;
    [cell.BtnNotOk addTarget:self action:@selector(NotOk_me:) forControlEvents:UIControlEventTouchUpInside];

    cell.Image1.tag=(indexPath.section * 22000) + indexPath.row;;
    [cell.Image1 addTarget:self action:@selector(AttachPhoto:) forControlEvents:UIControlEventTouchUpInside];
    cell.Image2.tag=(indexPath.section * 23000) + (5000+indexPath.row);
    [cell.Image2 addTarget:self action:@selector(AttachPhoto1:) forControlEvents:UIControlEventTouchUpInside];
    
    
    if(service_request.imageName1.length){
        
//        UIImageView *imageView = [[UIImageView alloc] init];
//        [imageView setFrame:cell.Image1.bounds];
//        [imageView setImage:[self decodeBase64StringtoImage:service_request.image1]];
//        imageView.userInteractionEnabled=YES;
//        [cell.Image1 addSubview:imageView];

        cell.View_Image1.hidden=NO;

        [cell.Image_Image1 setImage:[self decodeBase64StringtoImage:service_request.imageName1]];
        [cell.BtnDelImage1 addTarget:self action:@selector(DeleteImage:) forControlEvents:UIControlEventTouchUpInside];
        //[cell.Image_Image1 setFrame:cell.Image1.frame];
        cell.BtnDelImage1.tag=(indexPath.section * 28000) + indexPath.row;
        
//        UIButton *mySmallButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [mySmallButton setBackgroundColor:[UIColor redColor]];
//        [mySmallButton setTitle:@"X" forState:UIControlStateNormal];
//        mySmallButton.frame=CGRectMake(cell.Image1.frame.size.width-15, 0, 15,15);
//        [[mySmallButton titleLabel] setTextAlignment:NSTextAlignmentCenter];
//        [[mySmallButton titleLabel] setFont:[UIFont boldSystemFontOfSize:25]];
//        [mySmallButton addTarget:self action:@selector(DeleteImage:) forControlEvents:UIControlEventTouchUpInside];
//        mySmallButton.layer.cornerRadius = 0.5 * mySmallButton.bounds.size.width;
//        [cell.Image1 addSubview:mySmallButton];

        
    }
    else
    {
        cell.View_Image1.hidden=YES;

    }
    if(service_request.imageName2.length){
        
        /*UIImageView *imageView = [[UIImageView alloc] init];
        [imageView setFrame:cell.Image2.bounds];
        [imageView setImage:[self decodeBase64StringtoImage:service_request.image2]];
        imageView.userInteractionEnabled=YES;
        [cell.Image2 addSubview:imageView];
        
        
        UIButton *mySmallButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [mySmallButton setBackgroundColor:[UIColor redColor]];
        [mySmallButton setTitle:@"X" forState:UIControlStateNormal];
        mySmallButton.frame=CGRectMake(cell.Image2.frame.size.width-15, 0, 15,15);
        [[mySmallButton titleLabel] setTextAlignment:NSTextAlignmentCenter];
        [[mySmallButton titleLabel] setFont:[UIFont boldSystemFontOfSize:25]];
        [mySmallButton addTarget:self action:@selector(DeleteImage:) forControlEvents:UIControlEventTouchUpInside];
        mySmallButton.layer.cornerRadius = 0.5 * mySmallButton.bounds.size.width;
        [cell.Image2 addSubview:mySmallButton];
        */
        
        cell.View_Image2.hidden=NO;
        
        [cell.Image_Image2 setImage:[self decodeBase64StringtoImage:service_request.imageName2]];
        //[cell.Image_Image2 setFrame:cell.Image2.frame];
        [cell.BtnDelImage2 addTarget:self action:@selector(DeleteImage1:) forControlEvents:UIControlEventTouchUpInside];
        cell.BtnDelImage2.tag=(indexPath.section * 29000) + indexPath.row;

        
    }
    else
    {
        cell.View_Image2.hidden=YES;
        
    }
    
    
    //cell.TxtComments.borderStyle = UITextBorderStyleNone;
    

    
    return cell;
}
-(void)Ok_me:(UIButton*)sender{
    
    
    int section = sender.tag / 20000;
    int row = sender.tag % 20000;
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSString *_keyname = [self.arrParentCategory objectAtIndex:section];
    NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
    AddPreventionServiceRequestRequest *service_request= [arr objectAtIndex:row];
    service_request.is_ok=Ok;
    service_request.imageName1=BlankData;
    service_request.imageName2=BlankData;
    [arr replaceObjectAtIndex:row withObject:service_request];
    [app.arrAllDataDict setObject:arr forKey:_keyname];
    [self CheckAllOk:section];
    [self.TblMainData reloadData];
}
-(void)CheckAllOk:(int)tag{
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    AddPreventionServiceRequestRequest *service_request;
    NSString *_keyname = [self.arrParentCategory objectAtIndex:tag];
    NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
    NSMutableArray *arrtemp = [[NSMutableArray alloc]init];
    BOOL Go=NO;
    
        for(AddPreventionServiceRequestRequest *service_request  in arr){
            
            if(![service_request.is_ok isEqualToString:Ok]){
                
                Go=YES;
                break;
            }
            
        }
    if(Go){
        [selectedCellPaths replaceObjectAtIndex:tag withObject:@"NO"];

    }
    else
    {
        [selectedCellPaths replaceObjectAtIndex:tag withObject:@"YES"];

    }
    
        
    

    
}
-(void)NotOk_me:(UIButton*)sender{
    
    /*AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    AddPreventionServiceRequestRequest *service_request= [app.arrAllData objectAtIndex:sender.tag];
    service_request.is_ok=NotOk;
    [app.arrAllData replaceObjectAtIndex:sender.tag withObject:service_request];
    [self.TblMainData reloadData];*/
    /*
    int section = sender.tag / 21000;
    int row = sender.tag % 21000;
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSString *_keyname = [self.arrParentCategory objectAtIndex:section];
    NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
    AddPreventionServiceRequestRequest *service_request= [arr objectAtIndex:row];
    service_request.is_ok=NotOk;
    [arr replaceObjectAtIndex:row withObject:service_request];
    [app.arrAllDataDict setObject:arr forKey:_keyname];
    [self CheckAllOk:section];
    [self.TblMainData reloadData];*/
    
    int section = sender.tag / 21000;
    int row = sender.tag % 21000;
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSString *_keyname = [self.arrParentCategory objectAtIndex:section];
    NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
    AddPreventionServiceRequestRequest *service_request= [arr objectAtIndex:row];
    if(service_request.is_ok.length){
        service_request.is_ok=BlankData;
    }
    else
    {
        service_request.is_ok=NotOk;
        
    }
    [arr replaceObjectAtIndex:row withObject:service_request];
    [app.arrAllDataDict setObject:arr forKey:_keyname];
    [self CheckAllOk:section];
    [self.TblMainData reloadData];


}

/*- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldBeginEditing");
    
    if(textField.isFirstResponder){
    if(self.isExpand){
        
        self.isExpand=NO;
    }
    else
    {
        self.isExpand=YES;
    }
    self.activeSection=textField.tag;
    //[self tableView:self.TblMainData numberOfRowsInSection:textField.tag];
    [self.TblMainData reloadData];
    return NO;
    }
    else
    {
        return YES;
    }
}*/

- (void)textFieldDidEndEditing:(UITextField *)textField{             // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    NSLog(@"textFieldDidEndEditing");
    
    int section = textField.tag / 27000;
    int row = textField.tag % 27000;
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSString *_keyname = [self.arrParentCategory objectAtIndex:section];
    NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
    AddPreventionServiceRequestRequest *service_request= [arr objectAtIndex:row];
    [arr replaceObjectAtIndex:row withObject:service_request];
    [app.arrAllDataDict setObject:arr forKey:_keyname];

    
}
- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    if(textView.isFirstResponder){
        
        if([textView.text isEqualToString:CommentPlaceholder]){
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
        }
        
    }    return YES;

}

-(void) textViewDidChange:(UITextView *)textView
{
    
    if(textView.text.length == 0){
        textView.textColor = [UIColor lightGrayColor];
        textView.text = CommentPlaceholder;//@"Please add Comment";
        [textView resignFirstResponder];
    }
    
    int section = textView.tag / 24000;
    int row = textView.tag % 24000;
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSString *_keyname = [self.arrParentCategory objectAtIndex:section];
    NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
    AddPreventionServiceRequestRequest *service_request= [arr objectAtIndex:row];
    service_request.comment=textView.text;
    [arr replaceObjectAtIndex:row withObject:service_request];
    [app.arrAllDataDict setObject:arr forKey:_keyname];
    //[self.TblMainData reloadData];

    
    
    /*
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    AddPreventionServiceRequestRequest *service_request= [app.arrAllData objectAtIndex:textView.tag];
    service_request.comment=textView.text;
    [app.arrAllData replaceObjectAtIndex:textView.tag withObject:service_request];*/


}
- (void)textViewDidEndEditing:(UITextView *)textView;
{
    /*AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    AddPreventionServiceRequestRequest *service_request= [app.arrAllData objectAtIndex:textView.tag];
    service_request.comment=textView.text;
    [app.arrAllData replaceObjectAtIndex:textView.tag withObject:service_request];*/
    
    int section = textView.tag / 24000;
    int row = textView.tag % 24000;
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSString *_keyname = [self.arrParentCategory objectAtIndex:section];
    NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
    AddPreventionServiceRequestRequest *service_request= [arr objectAtIndex:row];
    service_request.comment=textView.text;
    [arr replaceObjectAtIndex:row withObject:service_request];
    [app.arrAllDataDict setObject:arr forKey:_keyname];
    
    if(textView.text.length == 0){
        textView.textColor = [UIColor lightGrayColor];
        textView.text = CommentPlaceholder;//@"Please add Comment";
        [textView resignFirstResponder];
    }


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
    
    
    actionSheet.popoverPresentationController.sourceView = self.view;
    actionSheet.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0);
    
    [actionSheet showViewController:self sender:actionSheet];
    
    [self presentViewController:actionSheet animated:YES completion:^{
        
    }];
    

}
- (IBAction)DeleteImage:(UIButton*)activebutton {
    
    
        int a =  activebutton.tag;
        int section=0;
        int row=0;
        section = activebutton.tag / 28000;
        row = activebutton.tag % 28000;
    
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    AddPreventionServiceRequestRequest *service_request;
    NSString *_keyname = [self.arrParentCategory objectAtIndex:section];
    NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
        service_request= [arr objectAtIndex:row];
        service_request.imageName1=BlankData;
        [arr replaceObjectAtIndex:row withObject:service_request];
 
    [app.arrAllDataDict setObject:arr forKey:_keyname];
    
    [self.TblMainData reloadData];

    
}
- (IBAction)DeleteImage1:(UIButton*)activebutton {
    
    
    int a =  activebutton.tag;
    int section=0;
    int row=0;
    section = activebutton.tag / 29000;
    row = activebutton.tag % 29000;
    
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    AddPreventionServiceRequestRequest *service_request;
    NSString *_keyname = [self.arrParentCategory objectAtIndex:section];
    NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
    service_request= [arr objectAtIndex:row];
    service_request.imageName2=BlankData;
    [arr replaceObjectAtIndex:row withObject:service_request];
    
    [app.arrAllDataDict setObject:arr forKey:_keyname];
    
    [self.TblMainData reloadData];
    
    
}
- (IBAction)AttachPhoto:(id)sender {
    
    
    self.LastActiveButton =(UIButton*)sender;
    self.Image_flag=@"Image1";
    [self ShowOptions];
    //    self.LastActiveButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    //    self.LastActiveButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    //    self.LastActiveButton.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
    
    
    
    
   }
- (IBAction)AttachPhoto1:(id)sender {
    
    
    self.LastActiveButton =(UIButton*)sender;
    self.Image_flag=@"Image2";
    [self ShowOptions];
    //    self.LastActiveButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    //    self.LastActiveButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    //    self.LastActiveButton.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
    
    
    
    
}
-(void)takeVideo{
    
    
    
    
    UIImagePickerController *libraryPicker = [[UIImagePickerController alloc] init];
    [libraryPicker setDelegate:self];
    [libraryPicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    
    
    
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
        [self.parentViewController presentViewController:libraryPicker animated:YES completion:^{
            
        }];
    }];
    
    
    
    
    
    
    
}

-(void)choosePhoto{
    
    
    
    UIImagePickerController *libraryPicker = [[UIImagePickerController alloc] init];
    [libraryPicker setDelegate:self];
    [libraryPicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
        [self presentViewController:libraryPicker animated:YES completion:^{
            
        }];    }];
    
    
    
    
    
    
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    NSLog(@"self.LastActiveButton %d",self.LastActiveButton.tag);
    
    
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
    
    
    //  [self.LastActiveButton setImage:nil forState:UIControlStateNormal];
    
    
   /* UIImageView *imageView = [[UIImageView alloc] init];
    [imageView setFrame:self.LastActiveButton.bounds];
    [imageView setImage:img];
    imageView.userInteractionEnabled=YES;
    [self.LastActiveButton addSubview:imageView];
    
    
    UIButton *mySmallButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [mySmallButton setBackgroundColor:[UIColor redColor]];
    [mySmallButton setTitle:@"X" forState:UIControlStateNormal];
    mySmallButton.frame=CGRectMake(self.LastActiveButton.frame.size.width-15, 0, 15,15);
    [[mySmallButton titleLabel] setTextAlignment:NSTextAlignmentCenter];
    [[mySmallButton titleLabel] setFont:[UIFont boldSystemFontOfSize:25]];
    [mySmallButton addTarget:self action:@selector(DeleteImage:) forControlEvents:UIControlEventTouchUpInside];
    mySmallButton.layer.cornerRadius = 0.5 * mySmallButton.bounds.size.width;
    [self.LastActiveButton addSubview:mySmallButton];*/
    
    [self SetImageData:self.LastActiveButton :img];
    
    
    
    
    
    //    [[self.LastActiveButton titleLabel] setTextAlignment:NSTextAlignmentCenter];
    //    [[self.LastActiveButton titleLabel] setFont:[UIFont systemFontOfSize:24]];
    
    
    
    //    [self.arrImages addObject:[self encodeToBase64String:img]];
    //
    //    [self SetImages];
    [self dismissViewControllerAnimated:picker completion:^{
        
    }];
    
    
    //    [[picker presentingViewController] dismissModalViewControllerAnimated:YES];
}
-(void)SetImageData:(UIButton *)activebutton :(UIImage*)Image{
    
    int a =  activebutton.tag;
    int section=0;
    int row=0;
//    if(a>=23000){
    if([self.Image_flag isEqualToString:@"Image2"])
    {
        section = activebutton.tag / 23000;
        row = activebutton.tag % 23000;
    }
    else
    {
        section = activebutton.tag / 22000;
        row = activebutton.tag % 22000;

    }

    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    AddPreventionServiceRequestRequest *service_request;
    NSString *_keyname = [self.arrParentCategory objectAtIndex:section];
    NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];

    
    
    
    if(row>=5000){
        
        service_request= [arr objectAtIndex:(row-5000)];
        service_request.imageName2=[self encodeToBase64String:Image];
       // [app.arrAllData replaceObjectAtIndex:(row-5000) withObject:service_request];

        [arr replaceObjectAtIndex:(row-5000) withObject:service_request];

    }
    else
    {
        service_request= [arr objectAtIndex:row];
        service_request.imageName1=[self encodeToBase64String:Image];
       // [app.arrAllData replaceObjectAtIndex:row withObject:service_request];
        [arr replaceObjectAtIndex:row withObject:service_request];



    }
    [app.arrAllDataDict setObject:arr forKey:_keyname];

    [self.TblMainData reloadData];
    

}
- (NSString *)encodeToBase64String:(UIImage *)image {
    
    
    image = [UIImage compressImage:image
                     compressRatio:0.9f];
    
    return [UIImageJPEGRepresentation(image,1) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}
- (UIImage *)decodeBase64StringtoImage:(NSString *)base64String {

//NSURL *url = [NSURL URLWithString:base64String];
//NSData *imageData = [NSData dataWithContentsOfURL:url];
//UIImage *ret = [UIImage imageWithData:imageData];
    NSData *data = [[NSData alloc]initWithBase64EncodedString:base64String options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
//return ret;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
}

- (IBAction)GoBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)ShowPrice:(UIButton*)sender{
    
    int section = sender.tag / 26000;
    int row = sender.tag % 26000;
    self.activeRow= row;
    self.activeSection=section;
    NSDictionary *dic_data=[self.arrChildCategory objectAtIndex:section];
    NSArray *arr =[dic_data valueForKey:@"ChildCategoryId"];

    NSString *Cat_id =[arr objectAtIndex:row];
    
    
    NSString *priceClean = [NSString stringWithFormat:@"$ %@",[[self.AllPriceData objectForKey:Cat_id]valueForKey:@"priceClean"]];
    NSString *priceRepair = [NSString stringWithFormat:@"$ %@",[[self.AllPriceData objectForKey:Cat_id]valueForKey:@"priceRepair"]];

    NSString *priceReplace = [NSString stringWithFormat:@"$ %@",[[self.AllPriceData objectForKey:Cat_id]valueForKey:@"priceReplace"]];

    
    
    NSMutableArray *arrChoices = [[NSMutableArray alloc]init];
    
    [arrChoices addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                @"Clean",@"Choices",priceClean,@"Price", nil]];
    [arrChoices addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                @"Repair",@"Choices",priceRepair,@"Price", nil]];
    [arrChoices addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                @"Replace",@"Choices",priceReplace,@"Price", nil]];
    
    [self showSelectionVCForOpponents:arrChoices];


}

- (IBAction)ShowTech:(UIButton*)sender{
    
    int section = sender.tag / 30000;
    int row = sender.tag % 30000;
    self.activeRow= row;
    self.activeSection=section;
    
    
    
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        // Cancel button tappped do nothing.
        [actionSheet dismissViewControllerAnimated:YES completion:^{
            
        }];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Assign to Myself" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        

        AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        NSString *_keyname = [self.arrParentCategory objectAtIndex:self.activeSection];
        NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
        AddPreventionServiceRequestRequest *service_request= [arr objectAtIndex:self.activeRow];
        NSString * userID = [[NSUserDefaults standardUserDefaults]valueForKey:@"userID"];
        [arr replaceObjectAtIndex:self.activeRow withObject:service_request];
        [app.arrAllDataDict setObject:arr forKey:_keyname];
        [self.TblMainData reloadData];

        
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Assign to Manager" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        // choose photo button tapped.
        [self showSelectionVCForOpponents:[self.AllTechnicianData mutableCopy]];
        
    }]];
    
    
    actionSheet.popoverPresentationController.sourceView = self.view;
    actionSheet.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0);
    
    [actionSheet showViewController:self sender:actionSheet];
    
    [self presentViewController:actionSheet animated:YES completion:^{
        
    }];

    
    
    
    
    
    
    
    
    /*if([[[NSUserDefaults standardUserDefaults]valueForKey:@"roleAID"]isEqualToString:@"7"]){
        
        
        AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        NSString *_keyname = [self.arrParentCategory objectAtIndex:self.activeSection];
        NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
        AddPreventionServiceRequestRequest *service_request= [arr objectAtIndex:self.activeRow];
        NSString * userID = [[NSUserDefaults standardUserDefaults]valueForKey:@"userID"];
        service_request.tech_id=userID;
        service_request.Technician_Name= [[NSUserDefaults standardUserDefaults]valueForKey:@"displayName"];
        [arr replaceObjectAtIndex:self.activeRow withObject:service_request];
        [app.arrAllDataDict setObject:arr forKey:_keyname];
        [self.TblMainData reloadData];

        
        
    }
    else{
        
        [self showSelectionVCForOpponents:[self.AllTechnicianData mutableCopy]];

    }*/
    

    
    
}
-(void)showSelectionVCForOpponents:(NSMutableArray*)arrvalue{
    
    SLSelectionViewController *aWSelectionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SLSelectionViewController"];

    if([self.moveInOutType isEqualToString:@"move-out"]){

    
    
    aWSelectionViewController.itemList =arrvalue;//arrLevels; //list to display
    aWSelectionViewController.displayItemKey = @"Choices"; //key of value to display
    aWSelectionViewController.subtitleDisplayItemKey =@"Price";// @"coachID"; //key of value to display
    aWSelectionViewController.delegate  = self;
    aWSelectionViewController.titleForSelection = @"Select";
    
    }
    else
    {
        aWSelectionViewController.itemList =arrvalue;//arrLevels; //list to display
        aWSelectionViewController.displayItemKey = @"displayName"; //key of value to display
        aWSelectionViewController.subtitleDisplayItemKey =@"";// @"coachID"; //key of value to display
        aWSelectionViewController.delegate  = self;
        aWSelectionViewController.titleForSelection = @"Select Technician";
        aWSelectionViewController.isMutliSelect=YES;

    }
    
    [self presentViewController:aWSelectionViewController animated:YES completion:nil];

    
    
}

-(void)didSelectItem:(MoveInMoveOutBaseModel *)selectedItem{
    
    if([self.moveInOutType isEqualToString:@"move-out"]){

    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSString *_keyname = [self.arrParentCategory objectAtIndex:self.activeSection];
    NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
    AddPreventionServiceRequestRequest *service_request= [arr objectAtIndex:self.activeRow];
    NSString * Price =[selectedItem valueForKey:@"Price"];
    Price=[Price stringByReplacingOccurrencesOfString:@"$" withString:@""];
    [arr replaceObjectAtIndex:self.activeRow withObject:service_request];
    [app.arrAllDataDict setObject:arr forKey:_keyname];
    [self.TblMainData reloadData];
    NSIndexPath *myIP = [NSIndexPath indexPathForRow:self.activeRow inSection:self.activeSection];
    CustomTableViewCell *cell = [self.TblMainData cellForRowAtIndexPath:myIP];
   // [cell.TxtPrice becomeFirstResponder];
    cell.TxtPrice.keyboardType = UIKeyboardTypeNumberPad;
    [cell.TxtPrice performSelector:@selector(becomeFirstResponder) withObject:nil afterDelay:0.1f];
    }
    else
    {
        AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        NSString *_keyname = [self.arrParentCategory objectAtIndex:self.activeSection];
        NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
        AddPreventionServiceRequestRequest *service_request= [arr objectAtIndex:self.activeRow];
        NSString * userID =[selectedItem valueForKey:@"userID"];
       [arr replaceObjectAtIndex:self.activeRow withObject:service_request];
        [app.arrAllDataDict setObject:arr forKey:_keyname];
        [self.TblMainData reloadData];

    }
    
    
    // matchNoteToAdd.opponent = opponent.displayName;
}


- (void)didSelectMultipleItem:(NSMutableArray *)selectedItems andIndexes:(NSMutableDictionary *)selectedIndexesDictionary{
    
    NSString * comma = @"";
    NSMutableString *strItemList=[[NSMutableString alloc]init];
    NSMutableString *userID=[[NSMutableString alloc]init];

    for(int i = 0; i < [selectedItems count]; i++ ){
        
        Technician *selectedItem =(Technician*)[selectedItems objectAtIndex:i];
        
        
        
        [strItemList appendString:[NSString stringWithFormat:@"%@%@", comma, selectedItem.displayName]];
        
        [userID appendString:[NSString stringWithFormat:@"%@%@", comma, selectedItem.userID]];

        
        comma = @",";
    }
    
       
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSString *_keyname = [self.arrParentCategory objectAtIndex:self.activeSection];
    NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
    AddPreventionServiceRequestRequest *service_request= [arr objectAtIndex:self.activeRow];
    //NSString * userID =[selectedItem valueForKey:@"userID"];
    [arr replaceObjectAtIndex:self.activeRow withObject:service_request];
    [app.arrAllDataDict setObject:arr forKey:_keyname];
    [self.TblMainData reloadData];
    
    
}



- (IBAction)SubmitData:(id)sender {
    
    [self startLoading];
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [app.arrAllData removeAllObjects];
    for(NSString *_keyname in self.arrParentCategory){
        NSArray *arr =[app.arrAllDataDict valueForKey:_keyname];
        for(AddPreventionServiceRequestRequest *service_request in arr){
           // if(service_request.is_ok.length){
                if([service_request.comment isEqualToString:CommentPlaceholder]){
                    
                    service_request.comment=BlankData;
                }
                
                [app.arrAllData addObject:service_request];
            //}
            
        }
    }

        NSMutableArray * arrFormData = [[NSMutableArray alloc]init];
        if([[OfflineManager sharedInstance]getPreventionFormData]){
            
            arrFormData = [[OfflineManager sharedInstance]getPreventionFormData];
            
        }
        
        [arrFormData addObject:[app.addPreventionRequest copy]];
        [[OfflineManager sharedInstance]savePreventionFormData:arrFormData];
        
        
        NSMutableArray * arrServiceData = [[NSMutableArray alloc]init];
        if([[OfflineManager sharedInstance]getPreventionServiceData]){
            
            arrServiceData = [[OfflineManager sharedInstance]getPreventionServiceData];
            
        }
        [arrServiceData addObject:[app.arrAllData copy]];
        [[OfflineManager sharedInstance]savePreventionServiceData:arrServiceData];
        [self stopLoading];

        [self.navigationController popToRootViewControllerAnimated:YES];
        
        [self showToastForText:@"Saved Successfully"];
        
    
    

}
@end
