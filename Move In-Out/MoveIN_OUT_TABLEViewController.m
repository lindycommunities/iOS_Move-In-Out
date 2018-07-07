//
//  MoveIN_OUT_TABLEViewController.m
//  Move In-Out
//
//  Created by S S D on 06/08/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import "MoveIN_OUT_TABLEViewController.h"
#import "CustomTableViewCell.h"
#import "LessonSectionHeader.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
#import "AddMoveInMoveOutServiceRequest.h"
#import "IQKeyboardManager.h"
#import "MoveINViewController3.h"
#import "OfflineManager.h"
static NSString *parentCategoryTitle1  = @"CLEANLINESS";
static NSString * CLEANLINESSchildCategoryTitle1 =@"Swept / Mopped";
static NSString * CLEANLINESSchildCategoryTitle2= @"Closets cleared";
static NSString * CLEANLINESSchildCategoryTitle3 =@"Frig /Stove clean";
static NSString * CLEANLINESSchildCategoryTitle4 =@"No personal items";
static NSString * CLEANLINESSchildCategoryTitle5 =@"Other";



static NSString *parentCategoryTitle2  = @"LIVING ROOM";
static NSString * LIVINGROOMMchildCategoryTitle1 =@"Walls / Outlets";
static NSString * LIVINGROOMMchildCategoryTitle2 =@"Ceilings / Lights";
static NSString * LIVINGROOMMchildCategoryTitle3 =@"Window";
static NSString * LIVINGROOMMchildCategoryTitle4=@"Door / Closet";
static NSString * LIVINGROOMMchildCategoryTitle5 =@"Window coverings";
static NSString * LIVINGROOMMchildCategoryTitle6 =@"Other";

static NSString *parentCategoryTitle3  = @"DINING ROOM";
static NSString * DININGROOMchildCategoryTitle1 =@"Walls / Outlets";
static NSString * DININGROOMchildCategoryTitle2 =@"Ceilings / Lights";
static NSString * DININGROOMchildCategoryTitle3 =@"Window";
static NSString * DININGROOMchildCategoryTitle4 =@"Window coverings";



static NSString *parentCategoryTitle4  = @"KITCHEN";
static NSString * KITCHENchildCategoryTitle1 =@"Cabinets";
static NSString * KITCHENchildCategoryTitle2 =@"Cabinet Door";
static NSString * KITCHENchildCategoryTitle3 =@"Cabinet Shelf";
static NSString * KITCHENchildCategoryTitle4 =@"Cabinet Handle";
static NSString * KITCHENchildCategoryTitle5 =@"Counter Top";

static NSString * KITCHENchildCategoryTitle6 =@"Refrigerator (Freezer)";

static NSString * KITCHENchildCategoryTitle7 =@"Refrigerator (Shelf and Bars)";

static NSString * KITCHENchildCategoryTitle8 =@"Refrigerator (Drawers)";
static NSString * KITCHENchildCategoryTitle9 =@"Refrigerator Crisper Glass/Plastic";
static NSString * KITCHENchildCategoryTitle10 =@"Cleaning Refrigerator";
static NSString * KITCHENchildCategoryTitle11 =@"Dishwasher Rack";
static NSString * KITCHENchildCategoryTitle12 =@"Dishwasher Silverware Holder";
static NSString * KITCHENchildCategoryTitle13 =@"Dishwasher Knob";
static NSString * KITCHENchildCategoryTitle14 =@"Fire Stops";//Dishwasher Disposal

static NSString * KITCHENchildCategoryTitle15 =@"Formica/Tiles";
static NSString * KITCHENchildCategoryTitle16 =@"Stove Knob";
static NSString * KITCHENchildCategoryTitle17 =@"Microwave";//Countertop
static NSString * KITCHENchildCategoryTitle18 =@"Cleaning of Stove";
static NSString * KITCHENchildCategoryTitle19 =@"Ceiling Lights";
static NSString * KITCHENchildCategoryTitle20 =@"Garbage Disposal";
static NSString * KITCHENchildCategoryTitle21 =@"Rubber Stopper";
static NSString * KITCHENchildCategoryTitle22 =@"Oven Door Handle";//Open Door Handle
static NSString * KITCHENchildCategoryTitle23 =@"Oven Racks";
static NSString * KITCHENchildCategoryTitle24 =@"Kitchen Sink";
static NSString * KITCHENchildCategoryTitle25 =@"Faucet Knobs";
static NSString * KITCHENchildCategoryTitle26 =@"Floors";
static NSString * KITCHENchildCategoryTitle27 =@"Faucet";//Spout
static NSString * KITCHENchildCategoryTitle28 =@"Drip Pan";
static NSString * KITCHENchildCategoryTitle29 =@"Range Hood";
static NSString * KITCHENchildCategoryTitle30 =@"Range Top";
static NSString * KITCHENchildCategoryTitle31 =@"Ceiling Light Fixture";
static NSString * KITCHENchildCategoryTitle32 =@"Backsplash";//Ceiling Light Defuser
static NSString * KITCHENchildCategoryTitle33 =@"Ceiling Fan";
static NSString * KITCHENchildCategoryTitle34 =@"Washer/Dryer";
static NSString * KITCHENchildCategoryTitle35 =@"Wall Outlets";
static NSString * KITCHENchildCategoryTitle36 =@"Window Coverings";
static NSString * KITCHENchildCategoryTitle37 =@"Electric Meter";

static NSString * KITCHENchildCategoryTitle38 =@"Other";


static NSString *parentCategoryTitle12  = @"BEDROOMS";
static NSString * BEDROOMSchildCategoryTitle1 =@"Walls / Outlets";
static NSString * BEDROOMSchildCategoryTitle2 =@"Ceilings / Lights";
static NSString * BEDROOMSchildCategoryTitle3=@"Floors / Carpet";
static NSString * BEDROOMSchildCategoryTitle4 =@"Window";
static NSString * BEDROOMSchildCategoryTitle5 =@"Window coverings";
static NSString * BEDROOMSchildCategoryTitle6 =@"Door / Closet";
static NSString * BEDROOMSchildCategoryTitle7 =@"Other";




static NSString *parentCategoryTitle5  = @"BATHROOM";
static NSString * BATHROOMchildCategoryTitle1 =@"Mirror and Medicine Cabinet";
static NSString * BATHROOMchildCategoryTitle2 =@"Vanity Cabinet";
static NSString * BATHROOMchildCategoryTitle3 =@"Sink";
static NSString * BATHROOMchildCategoryTitle4 =@"Toilet Tank Cover";
static NSString * BATHROOMchildCategoryTitle5 =@"Toilet Tank";
static NSString * BATHROOMchildCategoryTitle6 =@"Toilet Bowl";
static NSString * BATHROOMchildCategoryTitle7 =@"Complete Toilet";
static NSString * BATHROOMchildCategoryTitle8 =@"Toilet Paper Holder";
static NSString * BATHROOMchildCategoryTitle9 =@"Shower Head";
static NSString * BATHROOMchildCategoryTitle10 =@"Tub Knob(s)";
static NSString * BATHROOMchildCategoryTitle11 =@"Shower Curtain Bar";
static NSString * BATHROOMchildCategoryTitle12=@"Towel Bar";
static NSString * BATHROOMchildCategoryTitle13 =@"Tub Reglazing";//Tab Reglazing
static NSString * BATHROOMchildCategoryTitle14 =@"Counter Top";//Toothbrush Holder
static NSString * BATHROOMchildCategoryTitle15 =@"Soap Dish (Sink)";
static NSString * BATHROOMchildCategoryTitle16 =@"Soad Dish (Tub)";
static NSString * BATHROOMchildCategoryTitle17 =@"Remove Mildew on Tiles";
static NSString * BATHROOMchildCategoryTitle18 =@"Cleaning Bathroom";
static NSString * BATHROOMchildCategoryTitle19 =@"Wall Outlets";
static NSString * BATHROOMchildCategoryTitle20 =@"Ceiling Lights";
static NSString * BATHROOMchildCategoryTitle21 =@"Floors";
static NSString * BATHROOMchildCategoryTitle22 =@"Formica /Tiles";
static NSString * BATHROOMchildCategoryTitle23 =@"Cabinets / Mirror";
static NSString * BATHROOMchildCategoryTitle24 =@"Window";
static NSString * BATHROOMchildCategoryTitle25 =@"Other";


static NSString *parentCategoryTitle6  = @"LOCKS";
static NSString * LOCKSchildCategoryTitle1 =@"Door Locks";
static NSString * LOCKSchildCategoryTitle2 =@"Door Knob";
static NSString * LOCKSchildCategoryTitle3 =@"Fix Door when extra lock is removed";
static NSString * LOCKSchildCategoryTitle4 =@"Mail-Box Lock";



static NSString *parentCategoryTitle7  = @"KEYS";
static NSString * KEYSchildCategoryTitle1 =@"Failure To Return Apartment Key";
static NSString * KEYSchildCategoryTitle2 =@"Failure To Return Mailbox Key";





static NSString *parentCategoryTitle8  = @"DOORS";
static NSString * DOORSchildCategoryTitle1 =@"Apartment Door";
static NSString * DOORSchildCategoryTitle2 =@"Solid Core & Steel";
static NSString * DOORSchildCategoryTitle3 =@"Frame";
static NSString * DOORSchildCategoryTitle4 =@"Hollow";

static NSString *parentCategoryTitle9  = @"PAINTING";
static NSString * PAINTINGchildCategoryTitle1 =@"Open Dark Colors (Per Room)";
static NSString * PAINTINGchildCategoryTitle2 =@"Holes in Walls (Each Hole)";
static NSString * PAINTINGchildCategoryTitle3=@"Wallpaper Removal (Per Room)";
static NSString * PAINTINGchildCategoryTitle4 =@"Border Removal (Per Room)";


static NSString *parentCategoryTitle10  = @"CARPET";
static NSString * CARPETchildCategoryTitle1 =@"Shampoo 1 Bedroom";
static NSString * CARPETchildCategoryTitle2 =@"Shampoo 2 Bedroom";
static NSString * CARPETchildCategoryTitle3 =@"Stain Removal";
static NSString * CARPETchildCategoryTitle4 =@"Burns";
static NSString * CARPETchildCategoryTitle5 =@"Deodorize";
static NSString * CARPETchildCategoryTitle6 =@"Pet Treatment (Odor)";
static NSString * CARPETchildCategoryTitle7 =@"Replace Carpet 1 Bedroom";
static NSString * CARPETchildCategoryTitle8 =@"Replace Carpet 2 Bedroom";


static NSString *parentCategoryTitle11  = @"MISCELLANEOUS";
static NSString * MISCELLANEOUSchildCategoryTitle1 =@"Remove Debris (Per Bag)";
static NSString * MISCELLANEOUSchildCategoryTitle2 =@"Removal Of Bulk Items";
static NSString * MISCELLANEOUSchildCategoryTitle3 =@"Clear Storage Locker";
static NSString * MISCELLANEOUSchildCategoryTitle4 =@"Closet Shelves";
static NSString * MISCELLANEOUSchildCategoryTitle5 =@"Window Sills";
static NSString * MISCELLANEOUSchildCategoryTitle6 =@"Window Screen(s) each";
static NSString * MISCELLANEOUSchildCategoryTitle7 =@"Broken Window Glass (Per Pane)";
static NSString * MISCELLANEOUSchildCategoryTitle8 =@"Mini Blind(s) each";
static NSString * MISCELLANEOUSchildCategoryTitle9 =@"Vertical Blinds";
static NSString * MISCELLANEOUSchildCategoryTitle10 =@"Sliding Mirror/Glass Door";
static NSString * MISCELLANEOUSchildCategoryTitle11 =@"Carbon Monoxide Detector";
static NSString * MISCELLANEOUSchildCategoryTitle12 =@"Smoke Detector Alarm";
static NSString * MISCELLANEOUSchildCategoryTitle13 =@"Fire extinguisher";
static NSString * MISCELLANEOUSchildCategoryTitle14 =@"Cabinet Equipment";
static NSString * MISCELLANEOUSchildCategoryTitle15 =@"Vinly Tile Kitchen";
static NSString * MISCELLANEOUSchildCategoryTitle16 =@"Vinly Tile Bathroom";
static NSString * MISCELLANEOUSchildCategoryTitle17 =@"Exhaust Fan";
static NSString * MISCELLANEOUSchildCategoryTitle18 =@"Phone Jack";
static NSString * MISCELLANEOUSchildCategoryTitle19 =@"Fan Blades";
static NSString * MISCELLANEOUSchildCategoryTitle20 =@"Light Globes";
static NSString * MISCELLANEOUSchildCategoryTitle21 =@"Door Intercom System";
static NSString * MISCELLANEOUSchildCategoryTitle22 =@"Switch Plate Covers";
static NSString * MISCELLANEOUSchildCategoryTitle23 =@"Rallings";
static NSString * MISCELLANEOUSchildCategoryTitle24 =@"Outside Lights";
static NSString * MISCELLANEOUSchildCategoryTitle25 =@"Stoppage by foreign object in any drain";
static NSString * MISCELLANEOUSchildCategoryTitle26 =@"Thermostat Cover";
static NSString * MISCELLANEOUSchildCategoryTitle27 =@"Cleaning of Apartment";
static NSString * MISCELLANEOUSchildCategoryTitle28 =@"Common Area damaged during moveout";



















































static NSString * Ok= @"Ok";
static NSString * NotOk =@"Not Ok";
static NSString * BlankData= @"";
static NSString * CommentPlaceholder= @"Please add Comment";






@interface MoveIN_OUT_TABLEViewController ()
{
    NSMutableArray *arrParentCategory;
    NSMutableArray *arrChildCategory;

    NSMutableArray *arrChildCategory1;
    NSMutableArray *arrChildCategory2;
    NSMutableArray *selectedCellPaths;
    
}

@property(nonatomic,retain) NSMutableArray *arrParentCategory;
@property(nonatomic,retain) NSMutableArray *arrChildCategory,*arrChildCategory1,*arrChildCategory2;

@property(nonatomic,weak)IBOutlet UITableView *TblMainData;
@property (strong, nonatomic) UIButton *LastActiveButton;

@property(nonatomic,assign)BOOL isExpand;
@property(nonatomic,assign)int activeSection;
@property(nonatomic,assign)int activeRow;

@end

@implementation MoveIN_OUT_TABLEViewController
@synthesize arrParentCategory;
@synthesize arrChildCategory,arrChildCategory1,arrChildCategory2;
@synthesize AllPriceData;
- (void)viewDidLoad {
    [super viewDidLoad];
     //[[IQKeyboardManager sharedManager]setEnableAutoToolbar:NO];
    self.isExpand=NO;
   // self.moveInOutType=@"move-out";
    
   
    selectedCellPaths = [[NSMutableArray alloc] init];
    int total= 11;
    if([self.moveInOutType isEqualToString:@"move-out"]){
        
        total=12;
    }

    
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
    [self.arrParentCategory addObject:parentCategoryTitle12];
    [self.arrParentCategory addObject:parentCategoryTitle5];
    [self.arrParentCategory addObject:parentCategoryTitle6];
    [self.arrParentCategory addObject:parentCategoryTitle7];
    [self.arrParentCategory addObject:parentCategoryTitle8];
    if([self.moveInOutType isEqualToString:@"move-out"]){

    [self.arrParentCategory addObject:parentCategoryTitle9];
    }
    [self.arrParentCategory addObject:parentCategoryTitle10];
    [self.arrParentCategory addObject:parentCategoryTitle11];

    
    
    
    
    
    
    self.arrChildCategory= [[NSMutableArray alloc]init];

    
    self.arrChildCategory1= [[NSMutableArray alloc]init];
    [self.arrChildCategory1 addObject:CLEANLINESSchildCategoryTitle1];
    [self.arrChildCategory1 addObject:CLEANLINESSchildCategoryTitle2];
    [self.arrChildCategory1 addObject:CLEANLINESSchildCategoryTitle3];
    [self.arrChildCategory1 addObject:CLEANLINESSchildCategoryTitle4];
    [self.arrChildCategory1 addObject:CLEANLINESSchildCategoryTitle5];
    
    self.arrChildCategory2= [[NSMutableArray alloc]init];

    [self.arrChildCategory2 addObject:@"12"];
    [self.arrChildCategory2 addObject:@"13"];
    [self.arrChildCategory2 addObject:@"14"];
    [self.arrChildCategory2 addObject:@"15"];
    [self.arrChildCategory2 addObject:@"16"];

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
    
    [self.arrChildCategory2 addObject:@"17"];
    [self.arrChildCategory2 addObject:@"18"];
    [self.arrChildCategory2 addObject:@"19"];
    [self.arrChildCategory2 addObject:@"20"];
    [self.arrChildCategory2 addObject:@"21"];
    [self.arrChildCategory2 addObject:@"22"];

    
    
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
    
    [self.arrChildCategory2 addObject:@"23"];
    [self.arrChildCategory2 addObject:@"24"];
    [self.arrChildCategory2 addObject:@"25"];
    [self.arrChildCategory2 addObject:@"26"];

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
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle12];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle13];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle14];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle15];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle16];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle17];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle18];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle19];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle20];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle21];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle22];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle23];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle24];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle25];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle26];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle27];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle28];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle29];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle30];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle31];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle32];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle33];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle34];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle35];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle36];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle37];
    [self.arrChildCategory1 addObject:KITCHENchildCategoryTitle38];


    
    [self.arrChildCategory2 addObject:@"27"];
    [self.arrChildCategory2 addObject:@"28"];
    [self.arrChildCategory2 addObject:@"29"];
    [self.arrChildCategory2 addObject:@"30"];
    [self.arrChildCategory2 addObject:@"31"];
    [self.arrChildCategory2 addObject:@"32"];
    [self.arrChildCategory2 addObject:@"33"];
    [self.arrChildCategory2 addObject:@"34"];
    [self.arrChildCategory2 addObject:@"35"];
    [self.arrChildCategory2 addObject:@"36"];
    [self.arrChildCategory2 addObject:@"37"];
    [self.arrChildCategory2 addObject:@"38"];
    [self.arrChildCategory2 addObject:@"39"];
    [self.arrChildCategory2 addObject:@"40"];
    [self.arrChildCategory2 addObject:@"41"];
    [self.arrChildCategory2 addObject:@"42"];
    [self.arrChildCategory2 addObject:@"43"];
    [self.arrChildCategory2 addObject:@"44"];
    [self.arrChildCategory2 addObject:@"45"];
    [self.arrChildCategory2 addObject:@"46"];
    [self.arrChildCategory2 addObject:@"47"];
    [self.arrChildCategory2 addObject:@"48"];
    [self.arrChildCategory2 addObject:@"49"];
    [self.arrChildCategory2 addObject:@"50"];
    [self.arrChildCategory2 addObject:@"51"];
    [self.arrChildCategory2 addObject:@"52"];
    [self.arrChildCategory2 addObject:@"53"];
    [self.arrChildCategory2 addObject:@"54"];
    [self.arrChildCategory2 addObject:@"55"];
    [self.arrChildCategory2 addObject:@"56"];
    [self.arrChildCategory2 addObject:@"57"];
    [self.arrChildCategory2 addObject:@"58"];
    [self.arrChildCategory2 addObject:@"59"];
    [self.arrChildCategory2 addObject:@"60"];
    [self.arrChildCategory2 addObject:@"61"];
    [self.arrChildCategory2 addObject:@"62"];
    [self.arrChildCategory2 addObject:@"147"];
    [self.arrChildCategory2 addObject:@"63"];

    
    
    importantCapitals = [NSDictionary dictionaryWithObjectsAndKeys:
                         [self.arrChildCategory1 copy],@"ChildCategory",[self.arrChildCategory2 copy],@"ChildCategoryId",
                         nil];
    
    [self.arrChildCategory addObject:[importantCapitals copy]];
    [self.arrChildCategory1 removeAllObjects];
    [self.arrChildCategory2 removeAllObjects];
    
    
    [self.arrChildCategory1 addObject:BEDROOMSchildCategoryTitle1];
    [self.arrChildCategory1 addObject:BEDROOMSchildCategoryTitle2];
    [self.arrChildCategory1 addObject:BEDROOMSchildCategoryTitle3];
    [self.arrChildCategory1 addObject:BEDROOMSchildCategoryTitle4];
    [self.arrChildCategory1 addObject:BEDROOMSchildCategoryTitle5];
    [self.arrChildCategory1 addObject:BEDROOMSchildCategoryTitle6];
    [self.arrChildCategory1 addObject:BEDROOMSchildCategoryTitle7];

    [self.arrChildCategory2 addObject:@"140"];
    [self.arrChildCategory2 addObject:@"141"];
    [self.arrChildCategory2 addObject:@"142"];
    [self.arrChildCategory2 addObject:@"143"];
    [self.arrChildCategory2 addObject:@"144"];
    [self.arrChildCategory2 addObject:@"145"];
    [self.arrChildCategory2 addObject:@"146"];

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
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle6];
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle7];
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle8];
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle9];
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle10];
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle11];
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle12];
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle13];
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle14];
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle15];
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle16];
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle17];
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle18];
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle19];
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle20];
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle21];
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle22];
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle23];
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle24];
    [self.arrChildCategory1 addObject:BATHROOMchildCategoryTitle25];

    
    [self.arrChildCategory2 addObject:@"64"];
    [self.arrChildCategory2 addObject:@"65"];
    [self.arrChildCategory2 addObject:@"66"];
    [self.arrChildCategory2 addObject:@"67"];
    [self.arrChildCategory2 addObject:@"68"];
    [self.arrChildCategory2 addObject:@"69"];
    [self.arrChildCategory2 addObject:@"70"];
    [self.arrChildCategory2 addObject:@"71"];
    [self.arrChildCategory2 addObject:@"72"];
    [self.arrChildCategory2 addObject:@"73"];
    [self.arrChildCategory2 addObject:@"74"];
    [self.arrChildCategory2 addObject:@"75"];
    [self.arrChildCategory2 addObject:@"76"];
    [self.arrChildCategory2 addObject:@"77"];
    [self.arrChildCategory2 addObject:@"78"];
    [self.arrChildCategory2 addObject:@"79"];
    [self.arrChildCategory2 addObject:@"80"];
    [self.arrChildCategory2 addObject:@"81"];
    [self.arrChildCategory2 addObject:@"82"];
    [self.arrChildCategory2 addObject:@"83"];
    [self.arrChildCategory2 addObject:@"84"];
    [self.arrChildCategory2 addObject:@"85"];
    [self.arrChildCategory2 addObject:@"86"];
    [self.arrChildCategory2 addObject:@"87"];
    [self.arrChildCategory2 addObject:@"88"];

    importantCapitals = [NSDictionary dictionaryWithObjectsAndKeys:
                         [self.arrChildCategory1 copy],@"ChildCategory",[self.arrChildCategory2 copy],@"ChildCategoryId",
                         nil];
    
    [self.arrChildCategory addObject:[importantCapitals copy]];
    [self.arrChildCategory1 removeAllObjects];
    [self.arrChildCategory2 removeAllObjects];
    
    
    [self.arrChildCategory1 addObject:LOCKSchildCategoryTitle1];
    [self.arrChildCategory1 addObject:LOCKSchildCategoryTitle2];
    [self.arrChildCategory1 addObject:LOCKSchildCategoryTitle3];
    [self.arrChildCategory1 addObject:LOCKSchildCategoryTitle4];

    [self.arrChildCategory2 addObject:@"89"];
    [self.arrChildCategory2 addObject:@"90"];
    [self.arrChildCategory2 addObject:@"91"];
    [self.arrChildCategory2 addObject:@"92"];
    
    importantCapitals = [NSDictionary dictionaryWithObjectsAndKeys:
                         [self.arrChildCategory1 copy],@"ChildCategory",[self.arrChildCategory2 copy],@"ChildCategoryId",
                         nil];
    
    [self.arrChildCategory addObject:[importantCapitals copy]];
    [self.arrChildCategory1 removeAllObjects];
    [self.arrChildCategory2 removeAllObjects];

    
    [self.arrChildCategory1 addObject:KEYSchildCategoryTitle1];
    [self.arrChildCategory1 addObject:KEYSchildCategoryTitle2];
    
    [self.arrChildCategory2 addObject:@"93"];
    [self.arrChildCategory2 addObject:@"94"];
    
    importantCapitals = [NSDictionary dictionaryWithObjectsAndKeys:
                         [self.arrChildCategory1 copy],@"ChildCategory",[self.arrChildCategory2 copy],@"ChildCategoryId",
                         nil];
    
    [self.arrChildCategory addObject:[importantCapitals copy]];
    [self.arrChildCategory1 removeAllObjects];
    [self.arrChildCategory2 removeAllObjects];
    
    [self.arrChildCategory1 addObject:DOORSchildCategoryTitle1];
    [self.arrChildCategory1 addObject:DOORSchildCategoryTitle2];
    [self.arrChildCategory1 addObject:DOORSchildCategoryTitle3];
    [self.arrChildCategory1 addObject:DOORSchildCategoryTitle4];

    
    [self.arrChildCategory2 addObject:@"95"];
    [self.arrChildCategory2 addObject:@"96"];
    [self.arrChildCategory2 addObject:@"97"];
    [self.arrChildCategory2 addObject:@"98"];

    importantCapitals = [NSDictionary dictionaryWithObjectsAndKeys:
                         [self.arrChildCategory1 copy],@"ChildCategory",[self.arrChildCategory2 copy],@"ChildCategoryId",
                         nil];
    
    [self.arrChildCategory addObject:[importantCapitals copy]];
    [self.arrChildCategory1 removeAllObjects];
    [self.arrChildCategory2 removeAllObjects];

    if([self.moveInOutType isEqualToString:@"move-out"]){
        [self.arrChildCategory1 addObject:PAINTINGchildCategoryTitle1];
        [self.arrChildCategory1 addObject:PAINTINGchildCategoryTitle2];
        [self.arrChildCategory1 addObject:PAINTINGchildCategoryTitle3];
        [self.arrChildCategory1 addObject:PAINTINGchildCategoryTitle4];

        [self.arrChildCategory2 addObject:@"99"];
        [self.arrChildCategory2 addObject:@"100"];
        [self.arrChildCategory2 addObject:@"101"];
        [self.arrChildCategory2 addObject:@"102"];
        
        importantCapitals = [NSDictionary dictionaryWithObjectsAndKeys:
                             [self.arrChildCategory1 copy],@"ChildCategory",[self.arrChildCategory2 copy],@"ChildCategoryId",
                             nil];
        
        [self.arrChildCategory addObject:[importantCapitals copy]];
        [self.arrChildCategory1 removeAllObjects];
        [self.arrChildCategory2 removeAllObjects];


        
    }
    [self.arrChildCategory1 addObject:CARPETchildCategoryTitle1];
    [self.arrChildCategory1 addObject:CARPETchildCategoryTitle2];
    [self.arrChildCategory1 addObject:CARPETchildCategoryTitle3];
    [self.arrChildCategory1 addObject:CARPETchildCategoryTitle4];
    [self.arrChildCategory1 addObject:CARPETchildCategoryTitle5];
    [self.arrChildCategory1 addObject:CARPETchildCategoryTitle6];
    [self.arrChildCategory1 addObject:CARPETchildCategoryTitle7];
    [self.arrChildCategory1 addObject:CARPETchildCategoryTitle8];
    
    [self.arrChildCategory2 addObject:@"103"];
    [self.arrChildCategory2 addObject:@"104"];
    [self.arrChildCategory2 addObject:@"105"];
    [self.arrChildCategory2 addObject:@"106"];
    [self.arrChildCategory2 addObject:@"107"];
    [self.arrChildCategory2 addObject:@"108"];
    [self.arrChildCategory2 addObject:@"109"];
    [self.arrChildCategory2 addObject:@"110"];

    importantCapitals = [NSDictionary dictionaryWithObjectsAndKeys:
                         [self.arrChildCategory1 copy],@"ChildCategory",[self.arrChildCategory2 copy],@"ChildCategoryId",
                         nil];
    
    [self.arrChildCategory addObject:[importantCapitals copy]];
    [self.arrChildCategory1 removeAllObjects];
    [self.arrChildCategory2 removeAllObjects];
    
    
    
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle1];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle2];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle3];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle4];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle5];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle6];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle7];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle8];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle9];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle10];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle11];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle12];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle13];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle14];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle15];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle16];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle17];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle18];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle19];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle20];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle21];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle22];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle23];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle24];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle25];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle26];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle27];
    [self.arrChildCategory1 addObject:MISCELLANEOUSchildCategoryTitle28];

    
    [self.arrChildCategory2 addObject:@"111"];
    [self.arrChildCategory2 addObject:@"112"];
    [self.arrChildCategory2 addObject:@"113"];
    [self.arrChildCategory2 addObject:@"114"];
    [self.arrChildCategory2 addObject:@"115"];
    [self.arrChildCategory2 addObject:@"116"];
    [self.arrChildCategory2 addObject:@"117"];
    [self.arrChildCategory2 addObject:@"118"];
    [self.arrChildCategory2 addObject:@"119"];
    [self.arrChildCategory2 addObject:@"120"];
    [self.arrChildCategory2 addObject:@"121"];
    [self.arrChildCategory2 addObject:@"122"];
    [self.arrChildCategory2 addObject:@"123"];
    [self.arrChildCategory2 addObject:@"124"];
    [self.arrChildCategory2 addObject:@"125"];
    [self.arrChildCategory2 addObject:@"126"];
    [self.arrChildCategory2 addObject:@"127"];
    [self.arrChildCategory2 addObject:@"128"];
    [self.arrChildCategory2 addObject:@"129"];
    [self.arrChildCategory2 addObject:@"130"];
    [self.arrChildCategory2 addObject:@"131"];
    [self.arrChildCategory2 addObject:@"132"];
    [self.arrChildCategory2 addObject:@"133"];
    [self.arrChildCategory2 addObject:@"134"];
    [self.arrChildCategory2 addObject:@"135"];
    [self.arrChildCategory2 addObject:@"136"];
    [self.arrChildCategory2 addObject:@"137"];
    [self.arrChildCategory2 addObject:@"138"];


    importantCapitals = [NSDictionary dictionaryWithObjectsAndKeys:
                         [self.arrChildCategory1 copy],@"ChildCategory",[self.arrChildCategory2 copy],@"ChildCategoryId",
                         nil];
    
    [self.arrChildCategory addObject:[importantCapitals copy]];
    [self.arrChildCategory1 removeAllObjects];
    [self.arrChildCategory2 removeAllObjects];
    
//    self.arrChildCategory1= [[NSMutableArray alloc]init];
//    self.arrChildCategory2= [[NSMutableArray alloc]init];
    [self SetData];
    
    if([self.moveInOutType isEqualToString:@"move-out"]){
        
       // dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            
            [self LoadPriceData];
        //});
        
    }
    else
    {
        [self LoadTechnicianData];

    }
  
}
-(void)LoadTechnicianData{
    
//    self.AllTechnicianData = [[OfflineManager sharedInstance]getAllTechnicianData];
    self.AllTechnicianData = [[OfflineManager sharedInstance]getAllManagerData];


}
-(void)LoadPriceData{
    
    
    
    self.AllPriceData = [[OfflineManager sharedInstance]getPriceData];

    
    
//    [self startLoading];
//    
//    
//    [[WebServiceManager sharedInstance]GetPriceListWithSuccess:^(MoveInMoveOutBaseResponse *result) {
//        
//        [self stopLoading];
//        
//        
//        self.AllPriceData= [result.data mutableCopy];
//        
//        
//    } failure:^(CustomError *error) {
//        [self stopLoading];
//        
//        [self showToastForText:@"Cannot fetch Price List. Please try again"];
//    }];

    
}
-(void)SetData{
    
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [app.arrAllData removeAllObjects];
    [app.arrAllDataDict removeAllObjects];
    
    
    int count=0;
    for(NSString *_keyname in self.arrParentCategory){
        
        
        NSMutableArray *arrtemp = [[NSMutableArray alloc]init];

        
        NSDictionary *dic_data=[self.arrChildCategory objectAtIndex:count];
        NSArray *arr =[dic_data valueForKey:@"ChildCategory"];
        for(NSString *_key_name in arr){
            
            
            AddMoveInMoveOutServiceRequest *service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
            service_request.move_in_out_id=@"";
            service_request.type=self.moveInOutType;
            service_request.parent_category=_keyname;
            service_request.child_category=_key_name;
            service_request.is_ok=BlankData;
            service_request.comment=CommentPlaceholder;
            service_request.image1=BlankData;
            service_request.image2=BlankData;
            service_request.charges=BlankData;
            service_request.charges_type=BlankData;
            service_request.tech_id=BlankData;
            service_request.Technician_Name=BlankData;

          //  [app.arrAllData addObject:service_request];
            
            [arrtemp addObject:service_request];

            
            
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
        
        headerView.BtnAllOk.hidden=NO;
        headerView.ImgAllOk.hidden=NO;
        headerView.LblAllOk.hidden=NO;

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
    AddMoveInMoveOutServiceRequest *service_request= [app.arrAllData objectAtIndex:index];
    service_request.is_ok=Status;
    [app.arrAllData replaceObjectAtIndex:index withObject:service_request];
    
    
}
-(void)SetOKNOTOKData:(int)index :(AddMoveInMoveOutServiceRequest *)Status{
    
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
    AddMoveInMoveOutServiceRequest *service_request;
    NSString *_keyname = [self.arrParentCategory objectAtIndex:sender.tag];
    NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
    NSMutableArray *arrtemp = [[NSMutableArray alloc]init];

    if([[selectedCellPaths objectAtIndex:sender.tag]isEqualToString:@"YES"]){
        
        for(AddMoveInMoveOutServiceRequest *service_request  in arr){
            
            service_request.is_ok=BlankData;
            service_request.image1=BlankData;
            service_request.image2=BlankData;
            service_request.tech_id=BlankData;
            service_request.Technician_Name=BlankData;
            [arrtemp addObject:service_request];
            
        }
        [selectedCellPaths replaceObjectAtIndex:sender.tag withObject:@"NO"];

    }
    else
    {
        for(AddMoveInMoveOutServiceRequest *service_request  in arr){
            
            service_request.is_ok=Ok;
            service_request.image1=BlankData;
            service_request.image2=BlankData;
            service_request.tech_id=BlankData;
            service_request.Technician_Name=BlankData;
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

        
        for(AddMoveInMoveOutServiceRequest *service_request  in app.arrAllData){
            
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
//        AddMoveInMoveOutServiceRequest *service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
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

    
    AddMoveInMoveOutServiceRequest *service_request= [arr objectAtIndex:indexPath.row];
    
    
    if([service_request.is_ok isEqualToString:BlankData]||[service_request.is_ok isEqualToString:Ok]){
        
        return 75;

    }
    else
    {
        if([self.moveInOutType isEqualToString:@"move-out"]){
            
            return 285;
        }
        else{
            
            
            if(([[[NSUserDefaults standardUserDefaults]valueForKey:@"roleAID"]isEqualToString:@"6"])||[[[NSUserDefaults standardUserDefaults]valueForKey:@"roleAID"]isEqualToString:@"7"]){

            
            return 375;//345;
            }
            else{
                
                return 285;
 
            }

        }


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

    
    AddMoveInMoveOutServiceRequest *service_request= [arr objectAtIndex:indexPath.row];
    
    
        static NSString* cellIdentifierVideo = @"CustomTableViewCell";
        CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierVideo];
        if (cell == nil) {
            
            
            
            cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifierVideo];
        }
        
    if([self.moveInOutType isEqualToString:@"move-out"]){
        
        cell.View_charges.hidden=NO;
        cell.BtnCharges.tag = (indexPath.section * 26000) + indexPath.row;
        [cell.BtnCharges addTarget:self action:@selector(ShowPrice:) forControlEvents:UIControlEventTouchUpInside];
        
        cell.TxtPrice.tag = (indexPath.section * 27000) + indexPath.row;
        cell.TxtPrice.delegate=self;
        if(service_request.charges.length){
        cell.Lbl_Price_Title.hidden=NO;
        cell.TxtPrice.hidden=NO;
        cell.TxtPrice.keyboardType = UIKeyboardTypeNumberPad;
        if([service_request.charges floatValue]<=0){
            
            cell.TxtPrice.enabled=YES;
            cell.TxtPrice.text=@"";
            
            
           // cell.TxtPrice.keyboardType = UIKeyboardTypeNumberPad;
            //[cell.TxtPrice becomeFirstResponder];
            

            
        }
        else
        {
            cell.TxtPrice.enabled=NO;
            cell.TxtPrice.text=service_request.charges;


        }
        }
        else
        {
            cell.Lbl_Price_Title.hidden=YES;
            cell.TxtPrice.hidden=YES;

        }
        
        cell.Lbl_Price_Title.text=service_request.charges_type;

    }
    else{
        cell.View_charges.hidden=YES;
        cell.BtnAssignToTech.tag = (indexPath.section * 30000) + indexPath.row;
        [cell.BtnAssignToTech addTarget:self action:@selector(ShowTech:) forControlEvents:UIControlEventTouchUpInside];
        
        if([[[NSUserDefaults standardUserDefaults]valueForKey:@"roleAID"]isEqualToString:@"7"]){
            
//            [cell.BtnAssignToTech setTitle:@"Assign to Myself" forState:UIControlStateNormal];
            [cell.BtnAssignToTech setTitle:@"Assign " forState:UIControlStateNormal];

        }

        
        
        if(service_request.Technician_Name.length){
            
            cell.Lbl_TechnitianName.text=service_request.Technician_Name;
            
        }
        else{
         
            cell.Lbl_TechnitianName.text=@"";

        }

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
    if(service_request.is_ok.length){
        
        if([service_request.is_ok isEqualToString:Ok]){
            
            [cell.BtnOk setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
            [cell.BtnNotOk setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
            
            
            
        }
        else
        {
            [cell.BtnOk setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
            [cell.BtnNotOk setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];

        }
        
        
    }
    else
    {
        [cell.BtnOk setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
        [cell.BtnNotOk setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];

    }
    cell.BtnOk.tag = (indexPath.section * 20000) + indexPath.row;
    [cell.BtnOk addTarget:self action:@selector(Ok_me:) forControlEvents:UIControlEventTouchUpInside];
    //cell.BtnNotOk.tag=indexPath.row;
    cell.BtnNotOk.tag = (indexPath.section * 21000) + indexPath.row;

    
    
    [cell.BtnNotOk addTarget:self action:@selector(NotOk_me:) forControlEvents:UIControlEventTouchUpInside];

    cell.Image1.tag=(indexPath.section * 22000) + indexPath.row;;
    [cell.Image1 addTarget:self action:@selector(AttachPhoto:) forControlEvents:UIControlEventTouchUpInside];
    cell.Image2.tag=(indexPath.section * 23000) + (5000+indexPath.row);
    [cell.Image2 addTarget:self action:@selector(AttachPhoto1:) forControlEvents:UIControlEventTouchUpInside];
    
    
    if(service_request.image1.length){
        
//        UIImageView *imageView = [[UIImageView alloc] init];
//        [imageView setFrame:cell.Image1.bounds];
//        [imageView setImage:[self decodeBase64StringtoImage:service_request.image1]];
//        imageView.userInteractionEnabled=YES;
//        [cell.Image1 addSubview:imageView];

        cell.View_Image1.hidden=NO;

        [cell.Image_Image1 setImage:[self decodeBase64StringtoImage:service_request.image1]];
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
    if(service_request.image2.length){
        
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
        
        [cell.Image_Image2 setImage:[self decodeBase64StringtoImage:service_request.image2]];
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
    AddMoveInMoveOutServiceRequest *service_request= [arr objectAtIndex:row];
    service_request.is_ok=Ok;
    service_request.image1=BlankData;
    service_request.image2=BlankData;
    service_request.tech_id=BlankData;
    service_request.Technician_Name=BlankData;
    [arr replaceObjectAtIndex:row withObject:service_request];
    [app.arrAllDataDict setObject:arr forKey:_keyname];
    [self CheckAllOk:section];
    [self.TblMainData reloadData];
}
-(void)CheckAllOk:(int)tag{
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    AddMoveInMoveOutServiceRequest *service_request;
    NSString *_keyname = [self.arrParentCategory objectAtIndex:tag];
    NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
    NSMutableArray *arrtemp = [[NSMutableArray alloc]init];
    BOOL Go=NO;
    
        for(AddMoveInMoveOutServiceRequest *service_request  in arr){
            
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
    
        
    
    int section = sender.tag / 21000;
    int row = sender.tag % 21000;
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSString *_keyname = [self.arrParentCategory objectAtIndex:section];
    NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
    AddMoveInMoveOutServiceRequest *service_request= [arr objectAtIndex:row];
    service_request.is_ok=NotOk;
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
    AddMoveInMoveOutServiceRequest *service_request= [arr objectAtIndex:row];
    service_request.charges=textField.text;
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
    AddMoveInMoveOutServiceRequest *service_request= [arr objectAtIndex:row];
    service_request.comment=textView.text;
    [arr replaceObjectAtIndex:row withObject:service_request];
    [app.arrAllDataDict setObject:arr forKey:_keyname];
    //[self.TblMainData reloadData];

    
    
    /*
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    AddMoveInMoveOutServiceRequest *service_request= [app.arrAllData objectAtIndex:textView.tag];
    service_request.comment=textView.text;
    [app.arrAllData replaceObjectAtIndex:textView.tag withObject:service_request];*/


}
- (void)textViewDidEndEditing:(UITextView *)textView;
{
    /*AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    AddMoveInMoveOutServiceRequest *service_request= [app.arrAllData objectAtIndex:textView.tag];
    service_request.comment=textView.text;
    [app.arrAllData replaceObjectAtIndex:textView.tag withObject:service_request];*/
    
    int section = textView.tag / 24000;
    int row = textView.tag % 24000;
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSString *_keyname = [self.arrParentCategory objectAtIndex:section];
    NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
    AddMoveInMoveOutServiceRequest *service_request= [arr objectAtIndex:row];
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
    AddMoveInMoveOutServiceRequest *service_request;
    NSString *_keyname = [self.arrParentCategory objectAtIndex:section];
    NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
        service_request= [arr objectAtIndex:row];
        service_request.image1=BlankData;
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
    AddMoveInMoveOutServiceRequest *service_request;
    NSString *_keyname = [self.arrParentCategory objectAtIndex:section];
    NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
    service_request= [arr objectAtIndex:row];
    service_request.image2=BlankData;
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
    AddMoveInMoveOutServiceRequest *service_request;
    NSString *_keyname = [self.arrParentCategory objectAtIndex:section];
    NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];

    
    
    
    if(row>=5000){
        
        service_request= [arr objectAtIndex:(row-5000)];
        service_request.image2=[self encodeToBase64String:Image];
       // [app.arrAllData replaceObjectAtIndex:(row-5000) withObject:service_request];

        [arr replaceObjectAtIndex:(row-5000) withObject:service_request];

    }
    else
    {
        service_request= [arr objectAtIndex:row];
        service_request.image1=[self encodeToBase64String:Image];
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
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [app.arrAllData removeAllObjects];
        MoveINViewController3 *three = segue.destinationViewController;
    three.moveInOutType=self.moveInOutType;

    
    three.arrAllokProperty= [[NSMutableArray alloc]init];
    int count = 0;
    NSMutableArray * temp = [[NSMutableArray alloc]init];
    for(NSString *_keyname in selectedCellPaths){
        
        if([_keyname isEqualToString:@"YES"]){
            
            [three.arrAllokProperty addObject:[self.arrParentCategory objectAtIndex:count]];
            [temp addObject:[self.arrParentCategory objectAtIndex:count]];
           // [self.arrParentCategory removeObjectAtIndex:count];
            
        }
        count++;
    }
    for(NSString *_keyname in temp){
        
        [self.arrParentCategory removeObject:_keyname];
    }

    
    for(NSString *_keyname in self.arrParentCategory){
        
        

        
        NSArray *arr =[app.arrAllDataDict valueForKey:_keyname];
//        for(NSString *_key_name in arr){
//            
//            NSArray *arr2 =[app.arrAllDataDict valueForKey:_keyname];
        
            for(AddMoveInMoveOutServiceRequest *service_request in arr){
                
                if(service_request.is_ok.length){

                
                if([service_request.comment isEqualToString:CommentPlaceholder]){
                    
                    service_request.comment=BlankData;
                }
                
                [app.arrAllData addObject:service_request];
                }

            }

            
            

            
            
            
            
            
            
            
        
        
        
    }
    
    
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
    
//    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Assign to Myself" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//        
//
//        AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
//        NSString *_keyname = [self.arrParentCategory objectAtIndex:self.activeSection];
//        NSMutableArray *arr =[app.arrAllDataDict valueForKey:_keyname];
//        AddMoveInMoveOutServiceRequest *service_request= [arr objectAtIndex:self.activeRow];
//        NSString * userID = [[NSUserDefaults standardUserDefaults]valueForKey:@"userID"];
//        service_request.tech_id=userID;
//        service_request.Technician_Name= [[NSUserDefaults standardUserDefaults]valueForKey:@"displayName"];
//        [arr replaceObjectAtIndex:self.activeRow withObject:service_request];
//        [app.arrAllDataDict setObject:arr forKey:_keyname];
//        [self.TblMainData reloadData];
//
//        
//    }]];
    
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
        AddMoveInMoveOutServiceRequest *service_request= [arr objectAtIndex:self.activeRow];
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
    AddMoveInMoveOutServiceRequest *service_request= [arr objectAtIndex:self.activeRow];
    NSString * Price =[selectedItem valueForKey:@"Price"];
    Price=[Price stringByReplacingOccurrencesOfString:@"$" withString:@""];
    service_request.charges=Price;
    service_request.charges_type=[selectedItem valueForKey:@"Choices"];
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
        AddMoveInMoveOutServiceRequest *service_request= [arr objectAtIndex:self.activeRow];
        NSString * userID =[selectedItem valueForKey:@"userID"];
        service_request.tech_id=userID;
        service_request.Technician_Name=[selectedItem valueForKey:@"displayName"];
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
    AddMoveInMoveOutServiceRequest *service_request= [arr objectAtIndex:self.activeRow];
    //NSString * userID =[selectedItem valueForKey:@"userID"];
    service_request.tech_id=userID;
    service_request.Technician_Name=strItemList;
    [arr replaceObjectAtIndex:self.activeRow withObject:service_request];
    [app.arrAllDataDict setObject:arr forKey:_keyname];
    [self.TblMainData reloadData];
    
    
}



@end
