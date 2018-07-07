

//
//  ViewController.m
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import "MoveINViewController2.h"
#import "AddMoveInMoveOutServiceRequest.h"
#import "MoveINViewController3.h"

//static NSString * moveInOutTypeIn = @"move-in";
//static NSString * moveInOutTypeOut = @"move-out";

static NSString *parentCategoryTitle1  = @"CLEANLINESS";
static NSString * CLEANLINESSchildCategoryTitle1 =@"Swept / Mopped";
static NSString * CLEANLINESSchildCategoryTitle2= @"Closets cleared";
static NSString * CLEANLINESSchildCategoryTitle3 =@"Frig /Stove clean";
static NSString * CLEANLINESSchildCategoryTitle4 =@"No personal items";
static NSString * CLEANLINESSchildCategoryTitle5 =@"Other";



static NSString *parentCategoryTitle2  = @"LIVING ROOM";
static NSString * LIVINGROOMMchildCategoryTitle1 =@"Walls / Outlets";
static NSString * LIVINGROOMMchildCategoryTitle2 =@"Ceilings / Lights";
static NSString * LIVINGROOMMchildCategoryTitle3=@"Floors / Carpet";
static NSString * LIVINGROOMMchildCategoryTitle4 =@"Window";
static NSString * LIVINGROOMMchildCategoryTitle5 =@"Window coverings";
static NSString * LIVINGROOMMchildCategoryTitle6 =@"Door / Closet";
static NSString * LIVINGROOMMchildCategoryTitle7 =@"Other";

static NSString *parentCategoryTitle3  = @"DINING ROOM";
static NSString * DININGROOMchildCategoryTitle1 =@"Walls / Outlets";
static NSString * DININGROOMchildCategoryTitle2 =@"Ceilings / Lights";
static NSString * DININGROOMchildCategoryTitle3 =@"Floors / Carpet";
static NSString * DININGROOMchildCategoryTitle4 =@"Window";
static NSString * DININGROOMchildCategoryTitle5 =@"Window coverings";
static NSString * DININGROOMchildCategoryTitle6 =@"Door / Closet";


static NSString *parentCategoryTitle4  = @"KITCHEN";
static NSString * KITCHENchildCategoryTitle1 =@"Refrigerator";
static NSString * KITCHENchildCategoryTitle2 =@"Microwave";
static NSString * KITCHENchildCategoryTitle3 =@"Washer / dryer";
static NSString * KITCHENchildCategoryTitle4 =@"Range / Venthood";
static NSString * KITCHENchildCategoryTitle5 =@"Dishwasher / Disposal";
static NSString * KITCHENchildCategoryTitle6 =@"Walls / Outlets";
static NSString * KITCHENchildCategoryTitle7 =@"Ceilings / Lights";
static NSString * KITCHENchildCategoryTitle8 =@"Floors";
static NSString * KITCHENchildCategoryTitle9 =@"Window";
static NSString * KITCHENchildCategoryTitle10 =@"Window coverings";
static NSString * KITCHENchildCategoryTitle11 =@"Countertop";
static NSString * KITCHENchildCategoryTitle12 =@"Door / Closet";
static NSString * KITCHENchildCategoryTitle13 =@"Cabinet / Formica / Tiles";
static NSString * KITCHENchildCategoryTitle14 =@"Other";


static NSString *parentCategoryTitle5  = @"HALLS";
static NSString * HALLSchildCategoryTitle1 =@"Walls / Outlets";
static NSString * HALLSchildCategoryTitle2 =@"Ceilings / Lights";
static NSString * HALLSchildCategoryTitle3 =@"Floors / Carpet";


static NSString *parentCategoryTitle6  = @"BEDROOMS";
static NSString * BEDROOMSchildCategoryTitle1 =@"Walls / Outlets";
static NSString * BEDROOMSchildCategoryTitle2 =@"Ceilings / Lights";
static NSString * BEDROOMSchildCategoryTitle3=@"Floors / Carpet";
static NSString * BEDROOMSchildCategoryTitle4 =@"Window";
static NSString * BEDROOMSchildCategoryTitle5 =@"Window coverings";
static NSString * BEDROOMSchildCategoryTitle6 =@"Door / Closet";
static NSString * BEDROOMSchildCategoryTitle7 =@"Other";

static NSString *parentCategoryTitle7  = @"BATHS";
static NSString * BATHSchildCategoryTitle1 =@"Walls / Outlets";
static NSString * BATHSchildCategoryTitle2 =@"Ceilings / Lights";
static NSString * BATHSchildCategoryTitle3=@"Floor";
static NSString * BATHSchildCategoryTitle4=@"Formica / Tile";
static NSString * BATHSchildCategoryTitle5=@"Cabinets / Mirror";
static NSString * BATHSchildCategoryTitle6 =@"Window";
static NSString * BATHSchildCategoryTitle7 =@"Door / Closet";
static NSString * BATHSchildCategoryTitle8 =@"Other";



static NSString *parentCategoryTitle8  = @"MISC";
static NSString * MISCchildCategoryTitle1 =@"Smoke alarm";
static NSString * MISCchildCategoryTitle2 =@"Fire extinguisher";
static NSString * MISCchildCategoryTitle3=@"Screens";
static NSString * MISCchildCategoryTitle4=@"Heating / AC";
static NSString * MISCchildCategoryTitle5=@"Other";






static NSString * Ok= @"Ok";
static NSString * NotOk =@"Not Ok";
static NSString * OkNotOk= @"";




@interface MoveINViewController2 ()
@property(nonatomic,retain)NSMutableArray *arrChoices;
@property (strong, nonatomic) UITextField *ActiveTextField;

@property (strong, nonatomic) IBOutlet UIView *ViewMainContainer;
@property (strong, nonatomic) IBOutlet UIScrollView *ScrollView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewMainContainerHeight;

//Cleanliness
@property (strong, nonatomic) IBOutlet UIView *ViewCleanlinessContainer;
@property (strong, nonatomic) IBOutlet UIImageView *ImgAddCleanliness;
@property (strong, nonatomic) IBOutlet UITextField *TxtCleanliness;

//LivingRoom
@property (strong, nonatomic) IBOutlet UIView *ViewLivingRoomContainer;
@property (strong, nonatomic) IBOutlet UIImageView *ImgAddLivingRoom;
@property (strong, nonatomic) IBOutlet UITextField *TxtLivingRoom;

//DiningRoom
@property (strong, nonatomic) IBOutlet UIView *ViewDiningRoomContainer;
@property (strong, nonatomic) IBOutlet UIImageView *ImgAddDiningRoom;
@property (strong, nonatomic) IBOutlet UITextField *TxtDiningRoom;


//KitchenRoom
@property (strong, nonatomic) IBOutlet UIView *ViewKitchenContainer;
@property (strong, nonatomic) IBOutlet UIImageView *ImgAddKitchen;
@property (strong, nonatomic) IBOutlet UITextField *TxtKitchen;

//HallsRoom
@property (strong, nonatomic) IBOutlet UIView *ViewHallsContainer;
@property (strong, nonatomic) IBOutlet UIImageView *ImgAddHalls;
@property (strong, nonatomic) IBOutlet UITextField *TxtHalls;


//BedroomsRoom
@property (strong, nonatomic) IBOutlet UIView *ViewBedroomsContainer;
@property (strong, nonatomic) IBOutlet UIImageView *ImgAddBedrooms;
@property (strong, nonatomic) IBOutlet UITextField *TxtBedrooms;


//Baths
@property (strong, nonatomic) IBOutlet UIView *ViewBathsContainer;
@property (strong, nonatomic) IBOutlet UIImageView *ImgAddBaths;
@property (strong, nonatomic) IBOutlet UITextField *TxtBaths;

//Baths
@property (strong, nonatomic) IBOutlet UIView *ViewMiscContainer;
@property (strong, nonatomic) IBOutlet UIImageView *ImgAddMisc;
@property (strong, nonatomic) IBOutlet UITextField *TxtMisc;

@property (strong, nonatomic) UITextField *LastActiveTextField;
@property (strong, nonatomic) UIButton *LastActiveButton;

//Uiview Cleanliness
@property (strong, nonatomic) IBOutlet UIView *ViewCleanlinessSwept;
@property (strong, nonatomic) IBOutlet UIView *ViewCleanlinessClosets;
@property (strong, nonatomic) IBOutlet UIView *ViewCleanlinessFrigStove;
@property (strong, nonatomic) IBOutlet UIView *ViewCleanlinessNopersonalitems;
@property (strong, nonatomic) IBOutlet UIView *ViewCleanlinessOther;


//Uiview LivingRoom
@property (strong, nonatomic) IBOutlet UIView *ViewLivingRoomWallsOutlets;
@property (strong, nonatomic) IBOutlet UIView *ViewLivingRoomCeilingsLights;
@property (strong, nonatomic) IBOutlet UIView *ViewLivingRoomFloorsCarpet;
@property (strong, nonatomic) IBOutlet UIView *ViewLivingRoomWindow;
@property (strong, nonatomic) IBOutlet UIView *ViewLivingRoomWindowcoverings;
@property (strong, nonatomic) IBOutlet UIView *ViewLivingRoomDoorCloset;
@property (strong, nonatomic) IBOutlet UIView *ViewLivingRoomOther;

//Uiview DiningRoom
@property (strong, nonatomic) IBOutlet UIView *ViewDiningRoomWallsOutlets;
@property (strong, nonatomic) IBOutlet UIView *ViewDiningRoomCeilingsLights;
@property (strong, nonatomic) IBOutlet UIView *ViewDiningRoomFloorsCarpet;
@property (strong, nonatomic) IBOutlet UIView *ViewDiningRoomWindow;
@property (strong, nonatomic) IBOutlet UIView *ViewDiningRoomWindowcoverings;
@property (strong, nonatomic) IBOutlet UIView *ViewDiningRoomDoorCloset;


//Uiview KitchenRoom
@property (strong, nonatomic) IBOutlet UIView *ViewKitchenRefrigerator;
@property (strong, nonatomic) IBOutlet UIView *ViewKitchenMicrowave;
@property (strong, nonatomic) IBOutlet UIView *ViewKitchenWasherdryer;
@property (strong, nonatomic) IBOutlet UIView *ViewKitchenRangeVenthood;
@property (strong, nonatomic) IBOutlet UIView *ViewKitchenDishwasherDisposal;
@property (strong, nonatomic) IBOutlet UIView *ViewKitchenWallsOutletst;

@property (strong, nonatomic) IBOutlet UIView *ViewKitchenCeilingsLights;
@property (strong, nonatomic) IBOutlet UIView *ViewKitchenFloorsCarpet;
@property (strong, nonatomic) IBOutlet UIView *ViewKitchenWindow;
@property (strong, nonatomic) IBOutlet UIView *ViewKitchenWindowcoverings;
@property (strong, nonatomic) IBOutlet UIView *ViewKitchenCountertop;
@property (strong, nonatomic) IBOutlet UIView *ViewKitchenDoorCloset;
@property (strong, nonatomic) IBOutlet UIView *ViewKitchenCabinetFormicaTiles;
@property (strong, nonatomic) IBOutlet UIView *ViewKitchenOther;


//Uiview HallsRoom
@property (strong, nonatomic) IBOutlet UIView *ViewHallsWallsOutlets;
@property (strong, nonatomic) IBOutlet UIView *ViewHallsCeilingsLights;
@property (strong, nonatomic) IBOutlet UIView *ViewHallsFloorsCarpet;

//Uiview BedroomRoom
@property (strong, nonatomic) IBOutlet UIView *ViewBedroomsWallsOutlets;
@property (strong, nonatomic) IBOutlet UIView *ViewBedroomsCeilingsLights;
@property (strong, nonatomic) IBOutlet UIView *ViewBedroomsFloorsCarpet;
@property (strong, nonatomic) IBOutlet UIView *ViewBedroomsWindow;
@property (strong, nonatomic) IBOutlet UIView *ViewBedroomsWindowcoverings;
@property (strong, nonatomic) IBOutlet UIView *ViewBedroomsDoorCloset;
@property (strong, nonatomic) IBOutlet UIView *ViewBedroomsOther;


//Uiview Baths
@property (strong, nonatomic) IBOutlet UIView *ViewBathsWallsOutlets;
@property (strong, nonatomic) IBOutlet UIView *ViewBathsCeilingsLights;
@property (strong, nonatomic) IBOutlet UIView *ViewBathsFloorsCarpet;

@property (strong, nonatomic) IBOutlet UIView *ViewBathsFormicaTile;
@property (strong, nonatomic) IBOutlet UIView *ViewBathsCabinetsMirror;


@property (strong, nonatomic) IBOutlet UIView *ViewBathsWindow;
@property (strong, nonatomic) IBOutlet UIView *ViewBathsDoorCloset;
@property (strong, nonatomic) IBOutlet UIView *ViewBathsOther;



//Uiview MISC
@property (strong, nonatomic) IBOutlet UIView *ViewMiscSmokealarm;
@property (strong, nonatomic) IBOutlet UIView *ViewMiscFireextinguisher;
@property (strong, nonatomic) IBOutlet UIView *ViewMiscScreens;

@property (strong, nonatomic) IBOutlet UIView *ViewMiscHeatingAC;
@property (strong, nonatomic) IBOutlet UIView *ViewMiscOther;






//UiviewContainer Height
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewCleanlinessContainerHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewLivingRoomContainerHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewDiningRoomContainerHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewKitchenContainerHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewHallsContainerHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewBedroomsContainerHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewBathsContainerHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewMiscContainerHeight;


//Uiview Cleanliness Uiview Height
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewCleanlinessSweptHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewCleanlinessClosetsHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewCleanlinessFrigStoveHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewCleanlinessNopersonalitemsHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewCleanlinessOtherHeight;

//Uiview LivingRoom Uiview Height
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewLivingRoomWallsOutletstHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewLivingRoomCeilingsLightsHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewLivingRoomFloorsCarpetHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewLivingRoomWindowHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewLivingRoomWindowcoveringsHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewLivingRoomDoorClosetHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewLivingRoomOtherHeight;

//Uiview DiningRoom Uiview Height
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewDiningRoomWallsOutletstHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewDiningRoomCeilingsLightsHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewDiningRoomFloorsCarpetHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewDiningRoomWindowHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewDiningRoomWindowcoveringsHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewDiningRoomDoorClosetHeight;


//Uiview KItchenRoom Uiview Height
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewKitchenRefrigeratorHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewKitchenMicrowaveHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewKitchenWasherdryerHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewKitchenRangeVenthoodHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewKitchenDishwasherDisposalHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewKitchenWallsOutletstHeight;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewKitchenCeilingsLightsHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewKitchenFloorsCarpetHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewKitchenWindowHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewKitchenWindowcoveringsHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewKitchenCountertopHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewKitchenDoorClosetHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewKitchenCabinetFormicaTilesHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewKitchenOtherHeight;


//Uiview Halls Uiview Height
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewHallsWallsOutletstHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewHallsCeilingsLightsHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewHallsFloorsCarpetHeight;

//Uiview Bedroom Uiview Height
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewBedroomsWallsOutletstHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewBedroomsCeilingsLightsHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewBedroomsFloorsCarpetHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewBedroomsWindowHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewBedroomsWindowcoveringsHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewBedroomsDoorClosetHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewBedroomsOtherHeight;



//Uiview Baths Uiview Height
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewBathsWallsOutletsHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewBathsCeilingsLightsHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewBathsFloorsCarpetHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewBathsFormicaTileHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewBathsCabinetsMirrorHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewBathsWindowHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewBathsDoorClosetHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewBathsOtherHeight;


//Uiview MISC Uiview Height
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewMiscSmokealarmHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewMiscFireextinguisherHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewMiscScreensHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewMiscHeatingACHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewMiscOtherHeight;








//Uiview Cleanliness Uiview UIBUTTONS Radio Buttons
@property (strong, nonatomic) IBOutlet UIButton *BtnCleanlinessSweptOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnCleanlinessSweptNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnCleanlinessClosestOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnCleanlinessClosestNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnCleanlinessFrigStoveOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnCleanlinessFrigStovetNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnCleanlinessNopersonalitemsOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnCleanlinessNopersonalitemsNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnCleanlinessOtherOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnCleanlinessOtherNotOK;

//Uiview LivingRoom Uiview UIBUTTONS Radio Buttons
@property (strong, nonatomic) IBOutlet UIButton *BtnLivingRoomWallsOutletstOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnLivingRoomWallsOutletstNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnLivingRoomCeilingsLightsOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnLivingRoomCeilingsLightsNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnLivingRoomFloorsCarpetOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnLivingRoomFloorsCarpetNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnLivingRoomWindowOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnLivingRoomWindowNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnLivingRoomWindowcoveringsOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnLivingRoomWindowcoveringsNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnLivingRoomDoorClosetOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnLivingRoomDoorClosetNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnLivingRoomOtherOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnLivingRoomOtherNotOK;

//Uiview DiningRoom Uiview UIBUTTONS Radio Buttons
@property (strong, nonatomic) IBOutlet UIButton *BtnDiningRoomWallsOutletstOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnDiningRoomWallsOutletstNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnDiningRoomCeilingsLightsOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnDiningRoomCeilingsLightsNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnDiningRoomFloorsCarpetOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnDiningRoomFloorsCarpetNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnDiningRoomWindowOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnDiningRoomWindowNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnDiningRoomWindowcoveringsOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnDiningRoomWindowcoveringsNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnDiningRoomDoorClosetOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnDiningRoomDoorClosetNotOK;

//Uiview KitchenRoom Uiview UIBUTTONS Radio Buttons
@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenRefrigeratorOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenRefrigeratorNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenMicrowaveOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenMicrowaveNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenWasherdryerOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenWasherdryerNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenVenthoodOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenVenthoodNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenDishwasherDisposalOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenDishwasherDisposalNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenWallsOutletsOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenWallsOutletsNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenCeilingsLightsOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenCeilingsLightsNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenFloorsCarpetOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenFloorsCarpetNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenWindowOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenWindowNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenWindowcoveringsOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenWindowcoveringsNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenCountertopOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenCountertopNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenDoorClosetOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenDoorClosetNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenCabinetFormicaTilesOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenCabinetFormicaTilesNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenOtherOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnKitchenOtherNotOK;



//Uiview Halls Uiview UIBUTTONS Radio Buttons
@property (strong, nonatomic) IBOutlet UIButton *BtnHallsWallsOutletstOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnHallsWallsOutletstNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnHallsCeilingsLightsOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnHallsCeilingsLightsNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnHallsFloorsCarpetOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnHallsFloorsCarpetNotOK;



//Uiview Bedroom Uiview UIBUTTONS Radio Buttons
@property (strong, nonatomic) IBOutlet UIButton *BtnBedroomsWallsOutletstOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnBedroomsWallsOutletstNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnBedroomsCeilingsLightsOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnBedroomsCeilingsLightsNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnBedroomsFloorsCarpetOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnBedroomsFloorsCarpetNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnBedroomsWindowOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnBedroomsWindowNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnBedroomsWindowcoveringsOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnBedroomsWindowcoveringsNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnBedroomsDoorClosetOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnBedroomsDoorClosetNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnBedroomsOtherOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnBedroomsOtherNotOK;


//Uiview Baths Uiview UIBUTTONS Radio Buttons
@property (strong, nonatomic) IBOutlet UIButton *BtnBathsWallsOutletstOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnBathsWallsOutletstNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnBathsCeilingsLightsOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnBathsCeilingsLightsNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnBathsFloorsCarpetOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnBathsFloorsCarpetNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnBathsFormicaTileOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnBathsFormicaTileNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnBathsCabinetsMirrorOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnBathsCabinetsMirrorNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnBathsWindowOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnBathsWindowNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnBathsDoorClosetOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnBathsDoorClosetNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnBathsOtherOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnBathsOtherNotOK;


//Uiview Misc Uiview UIBUTTONS Radio Buttons
@property (strong, nonatomic) IBOutlet UIButton *BtnMiscSmokealarmOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnMiscSmokealarmNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnMiscFireextinguisherOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnMiscFireextinguisherNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnMiscScreensOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnMiscScreensNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnMiscHeatingACOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnMiscHeatingACNotOK;

@property (strong, nonatomic) IBOutlet UIButton *BtnMiscOtherOK;
@property (strong, nonatomic) IBOutlet UIButton *BtnMiscOtherNotOK;










@property (strong, nonatomic) IBOutlet UITextView *TxtComment1,*TxtComment2,*TxtComment3,*TxtComment4,*TxtComment5,*TxtComment6,*TxtComment7,*TxtComment8,*TxtComment9,*TxtComment10,*TxtComment11,*TxtComment12,*TxtComment13,*TxtComment14,*TxtComment15,*TxtComment16,*TxtComment17,*TxtComment18,*TxtComment19,*TxtComment20,*TxtComment21,*TxtComment22,*TxtComment23,*TxtComment24,*TxtComment25,*TxtComment26,*TxtComment27,*TxtComment28,*TxtComment29,*TxtComment30,*TxtComment31,*TxtComment32,*TxtComment33,*TxtComment34,*TxtComment35,*TxtComment36,*TxtComment37,*TxtComment38,*TxtComment39,*TxtComment40,*TxtComment41,*TxtComment42,*TxtComment43,*TxtComment44,*TxtComment45,*TxtComment46,*TxtComment47,*TxtComment48,*TxtComment49,*TxtComment50,*TxtComment51,*TxtComment52,*TxtComment53,*TxtComment54,*TxtComment55;

@property (strong, nonatomic) IBOutlet UIView *ViewCharges1,*ViewCharges2,*ViewCharges3,*ViewCharges4,*ViewCharges5,*ViewCharges6,*ViewCharges7,*ViewCharges8,*ViewCharges9,*ViewCharges10,*ViewCharges11,*ViewCharges12,*ViewCharges13,*ViewCharges14,*ViewCharges15,*ViewCharges16,*ViewCharges17,*ViewCharges18,*ViewCharges19,*ViewCharges20,*ViewCharges21,*ViewCharges22,*ViewCharges23,*ViewCharges24,*ViewCharges25,*ViewCharges26,*ViewCharges27,*ViewCharges28,*ViewCharges29,*ViewCharges30,*ViewCharges31,*ViewCharges32,*ViewCharges33,*ViewCharges34,*ViewCharges35,*ViewCharges36,*ViewCharges37,*ViewCharges38,*ViewCharges39,*ViewCharges40,*ViewCharges41,*ViewCharges42,*ViewCharges43,*ViewCharges44,*ViewCharges45,*ViewCharges46,*ViewCharges47,*ViewCharges48,*ViewCharges49,*ViewCharges50,*ViewCharges51,*ViewCharges52,*ViewCharges53,*ViewCharges54,*ViewCharges55;


@property (strong, nonatomic) IBOutlet UITextField *TxtCharges1,*TxtCharges2,*TxtCharges3,*TxtCharges4,*TxtCharges5,*TxtCharges6,*TxtCharges7,*TxtCharges8,*TxtCharges9,*TxtCharges10,*TxtCharges11,*TxtCharges12,*TxtCharges13,*TxtCharges14,*TxtCharges15,*TxtCharges16,*TxtCharges17,*TxtCharges18,*TxtCharges19,*TxtCharges20,*TxtCharges21,*TxtCharges22,*TxtCharges23,*TxtCharges24,*TxtCharges25,*TxtCharges26,*TxtCharges27,*TxtCharges28,*TxtCharges29,*TxtCharges30,*TxtCharges31,*TxtCharges32,*TxtCharges33,*TxtCharges34,*TxtCharges35,*TxtCharges36,*TxtCharges37,*TxtCharges38,*TxtCharges39,*TxtCharges40,*TxtCharges41,*TxtCharges42,*TxtCharges43,*TxtCharges44,*TxtCharges45,*TxtCharges46,*TxtCharges47,*TxtCharges48,*TxtCharges49,*TxtCharges50,*TxtCharges51,*TxtCharges52,*TxtCharges53,*TxtCharges54,*TxtCharges55;


@property (strong, nonatomic) IBOutlet UIImageView *ImgCleanilessAllokcheck;
@property (strong, nonatomic) IBOutlet UIImageView *ImgLivingRoomAllokcheck;
@property (strong, nonatomic) IBOutlet UIImageView *ImgDiningRoomAllokcheck;
@property (strong, nonatomic) IBOutlet UIImageView *ImgKitchenAllokcheck;
@property (strong, nonatomic) IBOutlet UIImageView *ImgHallsAllokcheck;
@property (strong, nonatomic) IBOutlet UIImageView *ImgBedroomAllokcheck;
@property (strong, nonatomic) IBOutlet UIImageView *ImgBathsAllokcheck;
@property (strong, nonatomic) IBOutlet UIImageView *ImgMiscAllokcheck;






- (IBAction)CleanlinessSweptOK:(id)sender;
- (IBAction)CleanlinessSweptNotOK:(id)sender;
- (IBAction)CleanlinessClosestOK:(id)sender;
- (IBAction)CleanlinessClosestNotOK:(id)sender;
- (IBAction)CleanlinessFrigStoveOK:(id)sender;
- (IBAction)CleanlinessFrigStoveNotOK:(id)sender;
- (IBAction)CleanlinessNopersonalitemsOK:(id)sender;
- (IBAction)CleanlinessNopersonalitemsNotOK:(id)sender;
- (IBAction)CleanlinessOtherOK:(id)sender;
- (IBAction)CleanlinessOtherNotOK:(id)sender;

- (IBAction)LivingRoomWallsOutletstOK:(id)sender;
- (IBAction)LivingRoomWallsOutletstNotOK:(id)sender;

- (IBAction)LivingRoomCeilingsLightsOK:(id)sender;
- (IBAction)LivingRoomCeilingsLightsNotOK:(id)sender;

- (IBAction)LivingRoomFloorsCarpetOK:(id)sender;
- (IBAction)LivingRoomFloorsCarpetNotOK:(id)sender;

- (IBAction)LivingRoomWindowOK:(id)sender;
- (IBAction)LivingRoomWindowNotOK:(id)sender;

- (IBAction)LivingRoomWindowcoveringsOK:(id)sender;
- (IBAction)LivingRoomWindowcoveringsNotOK:(id)sender;

- (IBAction)LivingRoomDoorClosetOK:(id)sender;
- (IBAction)LivingRoomDoorClosetNotOK:(id)sender;

- (IBAction)LivingRoomOtherOK:(id)sender;
- (IBAction)LivingRoomOtherNotOK:(id)sender;

- (IBAction)DiningRoomWallsOutletstOK:(id)sender;
- (IBAction)DiningRoomWallsOutletstNotOK:(id)sender;

- (IBAction)DiningRoomCeilingsLightsOK:(id)sender;
- (IBAction)DiningRoomCeilingsLightsNotOK:(id)sender;

- (IBAction)DiningRoomFloorsCarpetOK:(id)sender;
- (IBAction)DiningRoomFloorsCarpetNotOK:(id)sender;

- (IBAction)DiningRoomWindowOK:(id)sender;
- (IBAction)DiningRoomWindowNotOK:(id)sender;

- (IBAction)DiningRoomWindowcoveringsOK:(id)sender;
- (IBAction)DiningRoomWindowcoveringsNotOK:(id)sender;

- (IBAction)DiningRoomDoorClosetOK:(id)sender;
- (IBAction)DiningRoomDoorClosetNotOK:(id)sender;

//- (IBAction)DiningRoomOtherOK:(id)sender;
//- (IBAction)DiningRoomOtherNotOK:(id)sender;


- (IBAction)KitchenRefrigeratorOK:(id)sender;
- (IBAction)KitchenRefrigeratorNotOK:(id)sender;

- (IBAction)KitchenMicrowaveOK:(id)sender;
- (IBAction)KitchenMicrowaveNotOK:(id)sender;

- (IBAction)KitchenWasherdryerOK:(id)sender;
- (IBAction)KitchenWasherdryerNotOK:(id)sender;

- (IBAction)KitchenVenthoodOK:(id)sender;
- (IBAction)KitchenVenthoodNotOK:(id)sender;

- (IBAction)KitchenDishwasherDisposalOK:(id)sender;
- (IBAction)KitchenDishwasherDisposalNotOK:(id)sender;

- (IBAction)KitchenWallsOutletsOK:(id)sender;
- (IBAction)KitchenWallsOutletsNotOK:(id)sender;

- (IBAction)KitchenCeilingsLightsOK:(id)sender;
- (IBAction)KitchenCeilingsLightsNotOK:(id)sender;

- (IBAction)KitchenFloorsCarpetOK:(id)sender;
- (IBAction)KitchenFloorsCarpetNotOK:(id)sender;

- (IBAction)KitchenWindowOK:(id)sender;
- (IBAction)KitchenWindowNotOK:(id)sender;

- (IBAction)KitchenWindowcoveringsOK:(id)sender;
- (IBAction)KitchenWindowcoveringsNotOK:(id)sender;

- (IBAction)KitchenCountertopOK:(id)sender;
- (IBAction)KitchenCountertopNotOK:(id)sender;

- (IBAction)KitchenDoorClosetOK:(id)sender;
- (IBAction)KitchenDoorClosetNotOK:(id)sender;

- (IBAction)KitchenCabinetFormicaTilesOK:(id)sender;
- (IBAction)KitchenCabinetFormicaTilesNotOK:(id)sender;

- (IBAction)BtnKitchenOtherOK:(id)sender;
- (IBAction)BtnKitchenOtherNotOK:(id)sender;


- (IBAction)HallsOutletstOK:(id)sender;
- (IBAction)HallsWallsOutletstNotOK:(id)sender;

- (IBAction)HallsCeilingsLightsOK:(id)sender;
- (IBAction)HallsCeilingsLightsNotOK:(id)sender;

- (IBAction)HallsFloorsCarpetOK:(id)sender;
- (IBAction)HallsFloorsCarpetNotOK:(id)sender;


- (IBAction)BedroomsWallsOutletstOK:(id)sender;
- (IBAction)BedroomsWallsOutletstNotOK:(id)sender;

- (IBAction)BedroomsCeilingsLightsOK:(id)sender;
- (IBAction)BedroomsCeilingsLightsNotOK:(id)sender;

- (IBAction)BedroomsFloorsCarpetOK:(id)sender;
- (IBAction)BedroomsFloorsCarpetNotOK:(id)sender;

- (IBAction)BedroomsWindowOK:(id)sender;
- (IBAction)BedroomsWindowNotOK:(id)sender;

- (IBAction)BedroomsWindowcoveringsOK:(id)sender;
- (IBAction)BedroomsWindowcoveringsNotOK:(id)sender;

- (IBAction)BedroomsDoorClosetOK:(id)sender;
- (IBAction)BedroomsDoorClosetNotOK:(id)sender;

- (IBAction)BedroomsOtherOK:(id)sender;
- (IBAction)BedroomsOtherNotOK:(id)sender;


- (IBAction)BathsWallsOutletstOK:(id)sender;
- (IBAction)BathsWallsOutletstNotOK:(id)sender;

- (IBAction)BathsCeilingsLightsOK:(id)sender;
- (IBAction)BathsCeilingsLightsNotOK:(id)sender;

- (IBAction)BathsFloorsCarpetOK:(id)sender;
- (IBAction)BathsFloorsCarpetNotOK:(id)sender;

- (IBAction)BathsFormicaTileOK:(id)sender;
- (IBAction)BathsFormicaTileNotOK:(id)sender;

- (IBAction)BathsCabinetsMirrorOK:(id)sender;
- (IBAction)BathsCabinetsMirrorNotOK:(id)sender;

- (IBAction)BathsWindowOK:(id)sender;
- (IBAction)BathsWindowNotOK:(id)sender;

- (IBAction)BathsDoorClosetOK:(id)sender;
- (IBAction)BathsDoorClosetNotOK:(id)sender;

- (IBAction)BathsOtherOK:(id)sender;
- (IBAction)BathsOtherNotOK:(id)sender;


//Uiview Misc Uiview UIBUTTONS Radio Buttons
- (IBAction)MiscSmokealarmOK:(id)sender;
- (IBAction)MiscSmokealarmNotOK:(id)sender;

- (IBAction)MiscFireextinguisherOK:(id)sender;
- (IBAction)MiscFireextinguisherNotOK:(id)sender;

- (IBAction)MiscScreensOK:(id)sender;
- (IBAction)MiscScreensNotOK:(id)sender;

- (IBAction)MiscHeatingACOK:(id)sender;
- (IBAction)MiscHeatingACNotOK:(id)sender;

- (IBAction)MiscOtherOK:(id)sender;
- (IBAction)MiscOtherNotOK:(id)sender;





@end

@implementation MoveINViewController2
@synthesize moveInOutType;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    CleanLinessAllOk=NO;
    LivingRoomAllOk=NO;
    DiningRoomAllOk=NO;
    KitchenAllOk=NO;
    HallsAllOk=NO;
    BedroomAllOk=NO;
    BathsAllOk=NO;
    MiscAllOk=NO;

    
    
    
    
//    for(UIView * subView in [self.view allsub] ) // here write Name of you TextView
//    {
//        // Here You can Get all subViews of your TextView.
//        // But For Check subview is UILabel or not ? write following code also.
//        
//        if([subView isKindOfClass:[UITextView class]]) // Check is SubView Class Is UILabel class
//        {
//            // You can write code here for your UILabel;
//            ((UITextView*)subView).textColor = [UIColor lightGrayColor];
//            ((UITextView*)subView).text = @"Please add Comment";
//            ((UITextView*)subView).delegate=self;
//
//        }
//    }
    
//    NSDictionary *options = @{
//                              @"moveInOutType" : moveInOutTypeIn,
//                              @"parentCategoryTitle" : parentCategoryTitle1,
//                              @"childCategoryTitle" :CLEANLINESSchildCategoryTitle1,
//                              @"isOk" : OkNotOk,
//                              @"comment" : @"",
//                              @"imageName1" :@"",
//                              @"imageName2" :""
//                              };
    
    
    [self SetAllValue];
    [self ResetAll];
    [self Close];
    [self CreateALLData];
    
    if([self.moveInOutType isEqualToString:@"move-in"]){
        
        [self HideAllCharges];

    }
    
    else{
        [self ShowAllCharges];
    }
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"self.moveInOutType = %@",self.moveInOutType);
    
    
}
-(void)CreateALLData{
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [app.arrAllData removeAllObjects];
//    for(int i = 1;i<6; i++){
    
        AddMoveInMoveOutServiceRequest *service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
        service_request.move_in_out_id=@"";
        service_request.type=self.moveInOutType;
        service_request.parent_category=parentCategoryTitle1;
        service_request.child_category=CLEANLINESSchildCategoryTitle1;
        service_request.is_ok=OkNotOk;
        service_request.comment=OkNotOk;
        service_request.image1=OkNotOk;
        service_request.image2=OkNotOk;
        service_request.charges=OkNotOk;

        [app.arrAllData addObject:service_request];

        service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
        service_request.move_in_out_id=@"";
        service_request.type=self.moveInOutType;
        service_request.parent_category=parentCategoryTitle1;
        service_request.child_category=CLEANLINESSchildCategoryTitle2;
        service_request.is_ok=OkNotOk;
        service_request.comment=OkNotOk;
        service_request.image1=OkNotOk;
        service_request.image2=OkNotOk;
        service_request.charges=OkNotOk;
    
        [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle1;
    service_request.child_category=CLEANLINESSchildCategoryTitle3;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle1;
    service_request.child_category=CLEANLINESSchildCategoryTitle4;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle1;
    service_request.child_category=CLEANLINESSchildCategoryTitle5;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle2;
    service_request.child_category=LIVINGROOMMchildCategoryTitle1;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle2;
    service_request.child_category=LIVINGROOMMchildCategoryTitle2;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];

    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle2;
    service_request.child_category=LIVINGROOMMchildCategoryTitle3;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle2;
    service_request.child_category=LIVINGROOMMchildCategoryTitle4;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle2;
    service_request.child_category=LIVINGROOMMchildCategoryTitle5;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle2;
    service_request.child_category=LIVINGROOMMchildCategoryTitle6;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle2;
    service_request.child_category=LIVINGROOMMchildCategoryTitle7;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle3;
    service_request.child_category=DININGROOMchildCategoryTitle1;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle3;
    service_request.child_category=DININGROOMchildCategoryTitle2;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle3;
    service_request.child_category=DININGROOMchildCategoryTitle3;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle3;
    service_request.child_category=DININGROOMchildCategoryTitle4;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle3;
    service_request.child_category=DININGROOMchildCategoryTitle5;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle3;
    service_request.child_category=DININGROOMchildCategoryTitle6;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];

    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle4;
    service_request.child_category=KITCHENchildCategoryTitle1;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle4;
    service_request.child_category=KITCHENchildCategoryTitle2;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle4;
    service_request.child_category=KITCHENchildCategoryTitle3;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle4;
    service_request.child_category=KITCHENchildCategoryTitle4;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle4;
    service_request.child_category=KITCHENchildCategoryTitle5;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle4;
    service_request.child_category=KITCHENchildCategoryTitle6;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];

    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle4;
    service_request.child_category=KITCHENchildCategoryTitle7;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle4;
    service_request.child_category=KITCHENchildCategoryTitle8;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle4;
    service_request.child_category=KITCHENchildCategoryTitle9;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle4;
    service_request.child_category=KITCHENchildCategoryTitle10;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle4;
    service_request.child_category=KITCHENchildCategoryTitle11;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle4;
    service_request.child_category=KITCHENchildCategoryTitle12;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle4;
    service_request.child_category=KITCHENchildCategoryTitle13;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle4;
    service_request.child_category=KITCHENchildCategoryTitle14;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle5;
    service_request.child_category=HALLSchildCategoryTitle1;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle5;
    service_request.child_category=HALLSchildCategoryTitle2;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle5;
    service_request.child_category=HALLSchildCategoryTitle3;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle6;
    service_request.child_category=BEDROOMSchildCategoryTitle1;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle6;
    service_request.child_category=BEDROOMSchildCategoryTitle2;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle6;
    service_request.child_category=BEDROOMSchildCategoryTitle3;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle6;
    service_request.child_category=BEDROOMSchildCategoryTitle4;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle6;
    service_request.child_category=BEDROOMSchildCategoryTitle5;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle6;
    service_request.child_category=BEDROOMSchildCategoryTitle6;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle6;
    service_request.child_category=BEDROOMSchildCategoryTitle7;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle7;
    service_request.child_category=BATHSchildCategoryTitle1;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle7;
    service_request.child_category=BATHSchildCategoryTitle2;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle7;
    service_request.child_category=BATHSchildCategoryTitle3;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle7;
    service_request.child_category=BATHSchildCategoryTitle4;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle7;
    service_request.child_category=BATHSchildCategoryTitle5;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle7;
    service_request.child_category=BATHSchildCategoryTitle6;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle7;
    service_request.child_category=BATHSchildCategoryTitle7;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle7;
    service_request.child_category=BATHSchildCategoryTitle8;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];


    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle8;
    service_request.child_category=MISCchildCategoryTitle1;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];

    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle8;
    service_request.child_category=MISCchildCategoryTitle2;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];


    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle8;
    service_request.child_category=MISCchildCategoryTitle3;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle8;
    service_request.child_category=MISCchildCategoryTitle4;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];
    
    service_request=[[AddMoveInMoveOutServiceRequest alloc]init];
    service_request.move_in_out_id=@"";
    service_request.type=self.moveInOutType;
    service_request.parent_category=parentCategoryTitle8;
    service_request.child_category=MISCchildCategoryTitle5;
    service_request.is_ok=OkNotOk;
    service_request.comment=OkNotOk;
    service_request.image1=OkNotOk;
    service_request.image2=OkNotOk;
    service_request.charges=OkNotOk;
    
    [app.arrAllData addObject:service_request];

    
//    [dic setValue:self.moveInOutType forKey:@"moveInOutType"];
//    [dic setValue:parentCategoryTitle1 forKey:@"parentCategoryTitle1"];
//    [dic setValue:CLEANLINESSchildCategoryTitle1 forKey:[NSString stringWithFormat:@"CLEANLINESSchildCategoryTitle%d",i]];
//    [dic setValue:OkNotOk forKey:@"isOk"];
//    [dic setValue:@"" forKey:@"comment"];
//    [dic setValue:@"" forKey:@"imageName1"];
//    [dic setValue:@"" forKey:@"imageName2"];
//    }
    NSLog(@"%d",[app.arrAllData count]);

}
- (void)SetAllValue{

    [self SetAllCleanlinessValue];
    [self SetAllLeavingRoomValue];
    [self SetAllDiningRoomValue];
    [self SetAllKitchen];
    [self SetAllHallsValue];
    [self SetAllBedroomsValue];
    [self SetAllBathsValue];
    [self SetAllMiscValue];


}
- (void)SetAllCleanlinessValue{
    
    ViewCleanlinessContainerHeightValue=70.00;
    ViewCleanlinessClosetsHeightValue=70.00;
    ViewCleanlinessFrigStoveHeightValue=70.00;
    ViewCleanlinessNopersonalitemsHeightValue=70.00;
    ViewCleanlinessOtherHeightValue=70.00;
    
    
    
        
    
    
}
- (void)SetAllLeavingRoomValue{
     ViewLivingRoomWallsOutletstHeightValue=70.00;
    ViewLivingRoomCeilingMoveInMoveOutightsHeightValue=70.00;
     ViewLivingRoomFloorsCarpetHeightValue=70.00;
    ViewLivingRoomWindowHeightValue=70.00;
     ViewLivingRoomWindowcoveringsHeightValue=70.00;
    ViewLivingRoomDoorClosetHeightValue=70.00;
     ViewLivingRoomOtherHeightValue=70.00;

}
- (void)SetAllDiningRoomValue{
    ViewDiningRoomWallsOutletstHeightValue=70.00;
    ViewDiningRoomCeilingMoveInMoveOutightsHeightValue=70.00;
    ViewDiningRoomFloorsCarpetHeightValue=70.00;
    ViewDiningRoomWindowHeightValue=70.00;
    ViewDiningRoomWindowcoveringsHeightValue=70.00;
    ViewDiningRoomDoorClosetHeightValue=70.00;
    ViewDiningRoomOtherHeightValue=70.00;
    
}
- (void)SetAllKitchen{
    ViewKitchenRefrigeratorHeightValue=70.00;
    ViewKitchenMicrowaveHeightValue=70.00;
    ViewKitchenWasherdryerHeightValue=70.00;
    ViewKitchenRangeVenthoodHeightValue=70.00;
    ViewKitchenDishwasherDisposalHeightValue=70.00;
    ViewKitchenWallsOutletstHeightValue=70.00;
    ViewKitchenCeilingsLightsHeightValue=70.00;
    
    ViewKitchenFloorsCarpetHeightValue=70.00;
    ViewKitchenWindowHeightValue=70.00;
    ViewKitchenWindowcoveringsHeightValue=70.00;
    ViewKitchenCountertopHeightValue=70.00;
    ViewKitchenDoorClosetHeightValue=70.00;
    ViewKitchenCabinetFormicaTilesHeightValue=70.00;
    ViewKitchenOtherHeightValue=70.00;

    
    


    
}
- (void)SetAllHallsValue{
    ViewHallsWallsOutletstHeightValue=70.00;
    ViewHallsCeilingsLightsHeightValue=70.00;
    ViewHallsFloorsCarpetHeightValue=70.00;
    
}
- (void)SetAllBedroomsValue{
    ViewBedRoomWallsOutletstHeightValue=70.00;
    ViewBedRoomCeilingsLightsHeightValue=70.00;
    ViewBedRoomFloorsCarpetHeightValue=70.00;
    ViewBedRoomWindowHeightValue=70.00;
    ViewBedRoomWindowcoveringsHeightValue=70.00;
    ViewBedRoomDoorClosetHeightValue=70.00;
    ViewBedRoomOtherHeightValue=70.00;
    
}
- (void)SetAllBathsValue{
    ViewBathsWallsOutletstHeightValue=70.00;
    ViewBathsCeilingsLightsHeightValue=70.00;
    ViewBathsFloorsCarpetHeightValue=70.00;
    ViewBathsFormicaTileHeightValue=70.00;
    ViewBathsCabinetsMirrorHeightValue=70.00;
    ViewBathsWindowHeightValue=70.00;
    ViewBathsDoorClosetHeightValue=70.00;
    ViewBathsOtherHeightValue=70.00;

    


    
}
- (void)SetAllMiscValue{
    
    ViewMiscSmokealarmHeightValue=70.00;
    ViewMiscFireextinguisherHeightValue=70.00;
    ViewMiscScreensHeightValue=70.00;
    ViewMiscHeatingACHeightValue=70.00;
    ViewMiscOtherHeightValue=70.00;

    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)Close{
    
    [self CloseCleaniless];
    [self CloseLivingRoom];
    [self CloseDiningRoom];
    [self CloseKitchen];
    [self CloseHalls];
    [self CloseBedrooms];
    [self CloseBaths];
    [self CloseMisc];

    //if(self.LastActiveTextField==nil)
      [self SetContainer];
    
    
}

- (void)CloseCleaniless {
    
    self.ViewCleanlinessContainerHeight.active = YES;
    self.ViewCleanlinessContainerHeight.constant=40.0f;
    
    self.ViewCleanlinessSweptHeight.active = YES;
    self.ViewCleanlinessSweptHeight.constant=00.0f;
    
    self.ViewCleanlinessClosetsHeight.active = YES;
    self.ViewCleanlinessClosetsHeight.constant=00.0f;
    
    
    self.ViewCleanlinessFrigStoveHeight.active = YES;
    self.ViewCleanlinessFrigStoveHeight.constant=00.0f;

    self.ViewCleanlinessNopersonalitemsHeight.active = YES;
    self.ViewCleanlinessNopersonalitemsHeight.constant=00.0f;
    
    
    self.ViewCleanlinessOtherHeight.active = YES;
    self.ViewCleanlinessOtherHeight.constant=00.0f;

    

    
    self.ImgAddCleanliness.image=[UIImage imageNamed:@"addbt"];

//    [self CleanlinessSweptOK:@""];
//    [self CleanlinessClosestOK:@""];
//    [self CleanlinessFrigStoveOK:@""];

   // [self ResetAllCleanliness];
    [self.view layoutIfNeeded];

    
}
- (void)CloseLivingRoom {
    
    

    
    self.ViewLivingRoomContainerHeight.active = YES;
    self.ViewLivingRoomContainerHeight.constant=40.0f;
    
    self.ViewLivingRoomWallsOutletstHeight.active = YES;
    self.ViewLivingRoomWallsOutletstHeight.constant=00.0f;
    
    self.ViewLivingRoomCeilingsLightsHeight.active = YES;
    self.ViewLivingRoomCeilingsLightsHeight.constant=00.0f;
    
    
    self.ViewLivingRoomFloorsCarpetHeight.active = YES;
    self.ViewLivingRoomFloorsCarpetHeight.constant=00.0f;
    
    self.ViewLivingRoomWindowHeight.active = YES;
    self.ViewLivingRoomWindowHeight.constant=00.0f;
    
    
    self.ViewLivingRoomWindowcoveringsHeight.active = YES;
    self.ViewLivingRoomWindowcoveringsHeight.constant=00.0f;
    
    self.ViewLivingRoomDoorClosetHeight.active = YES;
    self.ViewLivingRoomDoorClosetHeight.constant=00.0f;

    self.ViewLivingRoomOtherHeight.active = YES;
    self.ViewLivingRoomOtherHeight.constant=00.0f;

    
    
    self.ImgAddLivingRoom.image=[UIImage imageNamed:@"addbt"];
    
    //    [self CleanlinessSweptOK:@""];
    //    [self CleanlinessClosestOK:@""];
    //    [self CleanlinessFrigStoveOK:@""];
    
   // [self ResetAllLivingRoom];
    [self.view layoutIfNeeded];
    
    
}
- (void)CloseDiningRoom {
    
    
    
    
    self.ViewDiningRoomContainerHeight.active = YES;
    self.ViewDiningRoomContainerHeight.constant=40.0f;
    
    self.ViewDiningRoomWallsOutletstHeight.active = YES;
    self.ViewDiningRoomWallsOutletstHeight.constant=00.0f;
    
    self.ViewDiningRoomCeilingsLightsHeight.active = YES;
    self.ViewDiningRoomCeilingsLightsHeight.constant=00.0f;
    
    
    self.ViewDiningRoomFloorsCarpetHeight.active = YES;
    self.ViewDiningRoomFloorsCarpetHeight.constant=00.0f;
    
    self.ViewDiningRoomWindowHeight.active = YES;
    self.ViewDiningRoomWindowHeight.constant=00.0f;
    
    
    self.ViewDiningRoomWindowcoveringsHeight.active = YES;
    self.ViewDiningRoomWindowcoveringsHeight.constant=00.0f;
    
    self.ViewDiningRoomDoorClosetHeight.active = YES;
    self.ViewDiningRoomDoorClosetHeight.constant=00.0f;
    
    
    
    
    self.ImgAddDiningRoom.image=[UIImage imageNamed:@"addbt"];
    [self.view layoutIfNeeded];
    
    
}
- (void)CloseKitchen{
    
    
    
    
    self.ViewKitchenContainerHeight.active = YES;
    self.ViewKitchenContainerHeight.constant=40.0f;
    
    self.ViewKitchenRefrigeratorHeight.active = YES;
    self.ViewKitchenRefrigeratorHeight.constant=00.0f;
    
    
    
    self.ViewKitchenMicrowaveHeight.active = YES;
    self.ViewKitchenMicrowaveHeight.constant=00.0f;

    
    self.ViewKitchenWasherdryerHeight.active = YES;
    self.ViewKitchenWasherdryerHeight.constant=00.0f;

    
    self.ViewKitchenRangeVenthoodHeight.active = YES;
    self.ViewKitchenRangeVenthoodHeight.constant=00.0f;

    
    self.ViewKitchenDishwasherDisposalHeight.active = YES;
    self.ViewKitchenDishwasherDisposalHeight.constant=00.0f;

    
    self.ViewKitchenWallsOutletstHeight.active = YES;
    self.ViewKitchenWallsOutletstHeight.constant=00.0f;

    
    
    self.ViewKitchenCeilingsLightsHeight.active = YES;
    self.ViewKitchenCeilingsLightsHeight.constant=00.0f;

    
    self.ViewKitchenFloorsCarpetHeight.active = YES;
    self.ViewKitchenFloorsCarpetHeight.constant=00.0f;

    
    self.ViewKitchenWindowHeight.active = YES;
    self.ViewKitchenWindowHeight.constant=00.0f;

    
    self.ViewKitchenWindowcoveringsHeight.active = YES;
    self.ViewKitchenWindowcoveringsHeight.constant=00.0f;

    self.ViewKitchenCountertopHeight.active = YES;
    self.ViewKitchenCountertopHeight.constant=00.0f;

    
    
    self.ViewKitchenDoorClosetHeight.active = YES;
    self.ViewKitchenDoorClosetHeight.constant=00.0f;

    
    
    self.ViewKitchenCabinetFormicaTilesHeight.active = YES;
    self.ViewKitchenCabinetFormicaTilesHeight.constant=00.0f;

    
    self.ViewKitchenOtherHeight.active = YES;
    self.ViewKitchenOtherHeight.constant=00.0f;


    
    
    
    
    
    self.ImgAddKitchen.image=[UIImage imageNamed:@"addbt"];
    [self.view layoutIfNeeded];
    
    
}
- (void)CloseHalls {
    
    
    
    
    self.ViewHallsContainerHeight.active = YES;
    self.ViewHallsContainerHeight.constant=40.0f;
    
    self.ViewHallsWallsOutletstHeight.active = YES;
    self.ViewHallsWallsOutletstHeight.constant=00.0f;
    
    self.ViewHallsCeilingsLightsHeight.active = YES;
    self.ViewHallsCeilingsLightsHeight.constant=00.0f;
    
    
    self.ViewHallsFloorsCarpetHeight.active = YES;
    self.ViewHallsFloorsCarpetHeight.constant=00.0f;
    
    
    
    
    
    self.ImgAddHalls.image=[UIImage imageNamed:@"addbt"];
    [self.view layoutIfNeeded];
    
    
}
- (void)CloseBedrooms {
    
    
    
    
    self.ViewBedroomsContainerHeight.active = YES;
    self.ViewBedroomsContainerHeight.constant=40.0f;
    
    self.ViewBedroomsWallsOutletstHeight.active = YES;
    self.ViewBedroomsWallsOutletstHeight.constant=00.0f;
    
    self.ViewBedroomsCeilingsLightsHeight.active = YES;
    self.ViewBedroomsCeilingsLightsHeight.constant=00.0f;
    
    
    self.ViewBedroomsFloorsCarpetHeight.active = YES;
    self.ViewBedroomsFloorsCarpetHeight.constant=00.0f;
    
    self.ViewBedroomsWindowHeight.active = YES;
    self.ViewBedroomsWindowHeight.constant=00.0f;
    
    
    self.ViewBedroomsWindowcoveringsHeight.active = YES;
    self.ViewBedroomsWindowcoveringsHeight.constant=00.0f;
    
    self.ViewBedroomsDoorClosetHeight.active = YES;
    self.ViewBedroomsDoorClosetHeight.constant=00.0f;
    
    self.ViewBedroomsOtherHeight.active = YES;
    self.ViewBedroomsOtherHeight.constant=00.0f;
    
    
    
    self.ImgAddBedrooms.image=[UIImage imageNamed:@"addbt"];
    
    //    [self CleanlinessSweptOK:@""];
    //    [self CleanlinessClosestOK:@""];
    //    [self CleanlinessFrigStoveOK:@""];
    
    // [self ResetAllLivingRoom];
    [self.view layoutIfNeeded];
    
    
}
- (void)CloseBaths {
    
    
    
    
    
    
    self.ViewBathsContainerHeight.active = YES;
    self.ViewBathsContainerHeight.constant=40.0f;
    
    self.ViewBathsWallsOutletsHeight.active = YES;
    self.ViewBathsWallsOutletsHeight.constant=00.0f;
    
    self.ViewBathsCeilingsLightsHeight.active = YES;
    self.ViewBathsCeilingsLightsHeight.constant=00.0f;
    
    
    self.ViewBathsFloorsCarpetHeight.active = YES;
    self.ViewBathsFloorsCarpetHeight.constant=00.0f;
    
    self.ViewBathsFormicaTileHeight.active = YES;
    self.ViewBathsFormicaTileHeight.constant=00.0f;
    
    
    self.ViewBathsCabinetsMirrorHeight.active = YES;
    self.ViewBathsCabinetsMirrorHeight.constant=00.0f;
    
    self.ViewBathsWindowHeight.active = YES;
    self.ViewBathsWindowHeight.constant=00.0f;
    
    self.ViewBathsDoorClosetHeight.active = YES;
    self.ViewBathsDoorClosetHeight.constant=00.0f;
    self.ViewBathsOtherHeight.active = YES;
    self.ViewBathsOtherHeight.constant=00.0f;
    
    
    
    self.ImgAddBaths.image=[UIImage imageNamed:@"addbt"];
    
    //    [self CleanlinessSweptOK:@""];
    //    [self CleanlinessClosestOK:@""];
    //    [self CleanlinessFrigStoveOK:@""];
    
    // [self ResetAllLivingRoom];
    [self.view layoutIfNeeded];
    
    
}
- (void)CloseMisc {
    
    
    

    
    
    self.ViewMiscContainerHeight.active = YES;
    self.ViewMiscContainerHeight.constant=40.0f;
    
    self.ViewMiscSmokealarmHeight.active = YES;
    self.ViewMiscSmokealarmHeight.constant=00.0f;
    
    self.ViewMiscFireextinguisherHeight.active = YES;
    self.ViewMiscFireextinguisherHeight.constant=00.0f;
    
    
    self.ViewMiscScreensHeight.active = YES;
    self.ViewMiscScreensHeight.constant=00.0f;
    
    self.ViewMiscHeatingACHeight.active = YES;
    self.ViewMiscHeatingACHeight.constant=00.0f;
    
    
    self.ViewMiscOtherHeight.active = YES;
    self.ViewMiscOtherHeight.constant=00.0f;
    
    
    
    
    self.ImgAddMisc.image=[UIImage imageNamed:@"addbt"];
    
    //    [self CleanlinessSweptOK:@""];
    //    [self CleanlinessClosestOK:@""];
    //    [self CleanlinessFrigStoveOK:@""];
    
    // [self ResetAllLivingRoom];
    [self.view layoutIfNeeded];
    
    
}
-(void)SetContainer{

    self.ViewCleanlinessContainerHeight.active = YES;
//    self.ViewCleanlinessContainerHeight.constant=(self.ViewCleanlinessContainerHeight.constant+self.ViewCleanlinessSweptHeight.constant+self.ViewCleanlinessClosetsHeight.constant+self.ViewCleanlinessFrigStoveHeight.constant+self.ViewCleanlinessNopersonalitemsHeight.constant+self.ViewCleanlinessOtherHeight.constant);
    
    if([self.LastActiveTextField isEqual:self.TxtCleanliness]){
    
    self.ViewCleanlinessContainerHeight.constant=(80+self.ViewCleanlinessSweptHeight.constant+self.ViewCleanlinessClosetsHeight.constant+self.ViewCleanlinessFrigStoveHeight.constant+self.ViewCleanlinessNopersonalitemsHeight.constant+self.ViewCleanlinessOtherHeight.constant);
    }
    else
    {
        self.ViewCleanlinessContainerHeight.constant=(40+self.ViewCleanlinessSweptHeight.constant+self.ViewCleanlinessClosetsHeight.constant+self.ViewCleanlinessFrigStoveHeight.constant+self.ViewCleanlinessNopersonalitemsHeight.constant+self.ViewCleanlinessOtherHeight.constant);

    }
    
    self.ViewLivingRoomContainerHeight.active = YES;

    if([self.LastActiveTextField isEqual:self.TxtLivingRoom]){
        
        self.ViewLivingRoomContainerHeight.constant=(80+self.ViewLivingRoomWallsOutletstHeight.constant+self.ViewLivingRoomCeilingsLightsHeight.constant+self.ViewLivingRoomFloorsCarpetHeight.constant+self.ViewLivingRoomWindowHeight.constant+self.ViewLivingRoomWindowcoveringsHeight.constant+self.ViewLivingRoomDoorClosetHeight.constant+self.ViewLivingRoomOtherHeight.constant);
    }
    else
    {
        self.ViewLivingRoomContainerHeight.constant=(40+self.ViewLivingRoomWallsOutletstHeight.constant+self.ViewLivingRoomCeilingsLightsHeight.constant+self.ViewLivingRoomFloorsCarpetHeight.constant+self.ViewLivingRoomWindowHeight.constant+self.ViewLivingRoomWindowcoveringsHeight.constant+self.ViewLivingRoomDoorClosetHeight.constant+self.ViewLivingRoomOtherHeight.constant);
        
    }
    self.ViewDiningRoomContainerHeight.active=YES;
    if([self.LastActiveTextField isEqual:self.TxtDiningRoom]){
        
        self.ViewDiningRoomContainerHeight.constant=(80+self.ViewDiningRoomWallsOutletstHeight.constant+self.ViewDiningRoomCeilingsLightsHeight.constant+self.ViewDiningRoomFloorsCarpetHeight.constant+self.ViewDiningRoomWindowHeight.constant+self.ViewDiningRoomWindowcoveringsHeight.constant+self.ViewDiningRoomDoorClosetHeight.constant);
    }
    else
    {
        self.ViewDiningRoomContainerHeight.constant=(40+self.ViewDiningRoomWallsOutletstHeight.constant+self.ViewDiningRoomCeilingsLightsHeight.constant+self.ViewDiningRoomFloorsCarpetHeight.constant+self.ViewDiningRoomWindowHeight.constant+self.ViewDiningRoomWindowcoveringsHeight.constant+self.ViewDiningRoomDoorClosetHeight.constant);
        
    }
    self.ViewKitchenContainerHeight.active=YES;

    if([self.LastActiveTextField isEqual:self.TxtKitchen]){
        
        self.ViewKitchenContainerHeight.constant=(130+self.ViewKitchenRefrigeratorHeight.constant+self.ViewKitchenMicrowaveHeight.constant+self.ViewKitchenWasherdryerHeight.constant+self.ViewKitchenRangeVenthoodHeight.constant+self.ViewKitchenDishwasherDisposalHeight.constant+self.ViewKitchenWallsOutletstHeight.constant+self.ViewKitchenCeilingsLightsHeight.constant+self.ViewKitchenFloorsCarpetHeight.constant+self.ViewKitchenWindowHeight.constant+self.ViewKitchenWindowcoveringsHeight.constant+self.ViewKitchenCountertopHeight.constant+self.ViewKitchenDoorClosetHeight.constant+self.ViewKitchenCabinetFormicaTilesHeight.constant+self.ViewKitchenOtherHeight.constant);
        
        //130
        

        
        
    }
    else
    {
        self.ViewKitchenContainerHeight.constant=(40+self.ViewKitchenRefrigeratorHeight.constant+self.ViewKitchenMicrowaveHeight.constant+self.ViewKitchenWasherdryerHeight.constant+self.ViewKitchenRangeVenthoodHeight.constant+self.ViewKitchenDishwasherDisposalHeight.constant+self.ViewKitchenWallsOutletstHeight.constant+self.ViewKitchenCeilingsLightsHeight.constant+self.ViewKitchenFloorsCarpetHeight.constant+self.ViewKitchenWindowHeight.constant+self.ViewKitchenWindowcoveringsHeight.constant+self.ViewKitchenCountertopHeight.constant+self.ViewKitchenDoorClosetHeight.constant+self.ViewKitchenCabinetFormicaTilesHeight.constant+self.ViewKitchenOtherHeight.constant);
        
        //40
        
    }

    self.ViewHallsContainerHeight.active=YES;
    if([self.LastActiveTextField isEqual:self.TxtHalls]){
        
        self.ViewHallsContainerHeight.constant=(80+self.ViewHallsWallsOutletstHeight.constant+self.ViewHallsCeilingsLightsHeight.constant+self.ViewHallsFloorsCarpetHeight.constant);
    }
    else
    {
        self.ViewHallsContainerHeight.constant=(40+self.ViewHallsWallsOutletstHeight.constant+self.ViewHallsCeilingsLightsHeight.constant+self.ViewHallsFloorsCarpetHeight.constant);
        
    }
    
    self.ViewBedroomsContainerHeight.active = YES;
    
    if([self.LastActiveTextField isEqual:self.TxtBedrooms]){
        
        self.ViewBedroomsContainerHeight.constant=(80+self.ViewBedroomsWallsOutletstHeight.constant+self.ViewBedroomsCeilingsLightsHeight.constant+self.ViewBedroomsFloorsCarpetHeight.constant+self.ViewBedroomsWindowHeight.constant+self.ViewBedroomsWindowcoveringsHeight.constant+self.ViewBedroomsDoorClosetHeight.constant+self.ViewBedroomsOtherHeight.constant);
    }
    else
    {
        self.ViewBedroomsContainerHeight.constant=(40+self.ViewBedroomsWallsOutletstHeight.constant+self.ViewBedroomsCeilingsLightsHeight.constant+self.ViewBedroomsFloorsCarpetHeight.constant+self.ViewBedroomsWindowHeight.constant+self.ViewBedroomsWindowcoveringsHeight.constant+self.ViewBedroomsDoorClosetHeight.constant+self.ViewBedroomsOtherHeight.constant);
        
    }
    
    
    self.ViewBathsContainerHeight.active = YES;
    
    if([self.LastActiveTextField isEqual:self.TxtBaths]){
        
              self.ViewBathsContainerHeight.constant=(80+self.ViewBathsWallsOutletsHeight.constant+self.ViewBathsCeilingsLightsHeight.constant+self.ViewBathsFloorsCarpetHeight.constant+self.ViewBathsFormicaTileHeight.constant+self.ViewBathsCabinetsMirrorHeight.constant+self.ViewBathsWindowHeight.constant+self.ViewBathsDoorClosetHeight.constant+self.ViewBathsOtherHeight.constant);
    }
    else
    {
        self.ViewBathsContainerHeight.constant=(40+self.ViewBathsWallsOutletsHeight.constant+self.ViewBathsCeilingsLightsHeight.constant+self.ViewBathsFloorsCarpetHeight.constant+self.ViewBathsFormicaTileHeight.constant+self.ViewBathsCabinetsMirrorHeight.constant+self.ViewBathsWindowHeight.constant+self.ViewBathsDoorClosetHeight.constant+self.ViewBathsOtherHeight.constant);

        
    }
    self.ViewMiscContainerHeight.active = YES;
    
    if([self.LastActiveTextField isEqual:self.TxtMisc]){
        
        
        
        
        self.ViewMiscContainerHeight.constant=(80+self.ViewMiscSmokealarmHeight.constant+self.ViewMiscFireextinguisherHeight.constant+self.ViewMiscScreensHeight.constant+self.ViewMiscHeatingACHeight.constant+self.ViewMiscOtherHeight.constant);
    }
    else
    {
        self.ViewMiscContainerHeight.constant=(40+self.ViewMiscSmokealarmHeight.constant+self.ViewMiscFireextinguisherHeight.constant+self.ViewMiscScreensHeight.constant+self.ViewMiscHeatingACHeight.constant+self.ViewMiscOtherHeight.constant);
        
        
    }

    
    

    
//    self.ViewLivingRoomContainerHeight.constant=(self.ViewLivingRoomContainerHeight.constant+self.ViewLivingRoomWallsOutletstHeight.constant+self.ViewLivingRoomCeilingsLightsHeight.constant+self.ViewLivingRoomFloorsCarpetHeight.constant+self.ViewLivingRoomWindowHeight.constant+self.ViewLivingRoomDoorClosetHeight.constant+self.ViewLivingRoomOtherHeight.constant);
    


    
//    self.view.frame=CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width,self.ViewLivingRoomContainerHeight.constant+self.ViewCleanlinessContainerHeight.constant);
    self.ViewMainContainerHeight.active = YES;

    
        self.ViewMainContainerHeight.constant=(self.ViewLivingRoomContainerHeight.constant+self.ViewCleanlinessContainerHeight.constant+self.ViewDiningRoomContainerHeight.constant+self.ViewKitchenContainerHeight.constant+self.ViewHallsContainerHeight.constant+self.ViewBedroomsContainerHeight.constant+self.ViewBathsContainerHeight.constant+self.ViewMiscContainerHeight.constant+250);

    //}
    [self.view layoutIfNeeded];
    [self setScrollViewSize];

    
}
-(void)setScrollViewSize{
    
    

    
    
    CGRect contentRect = CGRectZero;
    for (UIView *view in self.ScrollView.subviews) {
        contentRect = CGRectUnion(contentRect, view.frame);
//        for (UIView *view1 in view.subviews) {
//            contentRect = CGRectUnion(contentRect, view1.frame);
//        }

    }
    contentRect = CGRectUnion(contentRect, self.TxtCleanliness.frame);
    contentRect = CGRectUnion(contentRect, self.TxtCleanliness.frame);
    contentRect = CGRectUnion(contentRect, self.TxtCleanliness.frame);
    contentRect = CGRectUnion(contentRect, self.TxtCleanliness.frame);
    contentRect = CGRectUnion(contentRect, self.TxtCleanliness.frame);
    contentRect = CGRectUnion(contentRect, self.TxtCleanliness.frame);

    self.ScrollView.contentSize = contentRect.size;
    
}
-(void)ResetAll{
    
    [self ResetAllCleanliness];
    [self ResetAllLivingRoom];
    [self ResetAllDiningRoom];
    [self ResetAllKitchen];
    [self ResetAllHalls];
    [self ResetAllBedrooms];
    [self ResetAllBaths];
    [self ResetAllMisc];

}
-(void)ResetAllCleanliness

{
//    UIImage *ok = [UIImage imageNamed:@"ok-active"];
//    UIImage *notok = [UIImage imageNamed:@"not-ok-active"];
//    
//    if ([[self.BtnCleanlinessSweptOK currentImage] isEqual:ok]) {
//        
//        [self CleanlinessSweptOK:@""];
//        NSLog(@"IF SOUND IMAGE");
//    } else if([[self.BtnCleanlinessSweptNotOK currentImage] isEqual:notok]) {
//        NSLog(@"IF NO SOUND IMAGE");
//        
//        [self CleanlinessSweptNotOK:@""];
//
//        //your code
//    }
    
    
    [self.BtnCleanlinessSweptOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnCleanlinessSweptNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnCleanlinessClosestOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnCleanlinessClosestNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnCleanlinessFrigStoveOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnCleanlinessFrigStovetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnCleanlinessNopersonalitemsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnCleanlinessNopersonalitemsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    
    
    [self.BtnCleanlinessOtherOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnCleanlinessOtherNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    
    
    
}
-(void)SetAllOkCleanliness

{
    [self.BtnCleanlinessSweptOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    
    [self.BtnCleanlinessClosestOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    
    [self.BtnCleanlinessFrigStoveOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    
    [self.BtnCleanlinessNopersonalitemsOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    
    [self.BtnCleanlinessOtherOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    
    
    
    
}
-(void)ResetAllLivingRoom

{
    
    
    [self.BtnLivingRoomWallsOutletstOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnLivingRoomWallsOutletstNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnLivingRoomCeilingsLightsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnLivingRoomCeilingsLightsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnLivingRoomFloorsCarpetOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnLivingRoomFloorsCarpetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnLivingRoomWindowOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnLivingRoomWindowNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    
    
    [self.BtnLivingRoomWindowcoveringsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnLivingRoomWindowcoveringsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];

    [self.BtnLivingRoomDoorClosetOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnLivingRoomDoorClosetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];

    [self.BtnLivingRoomOtherOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnLivingRoomOtherNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];

    
    
    
}
-(void)ResetAllDiningRoom

{
    
    
    [self.BtnDiningRoomWallsOutletstOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnDiningRoomWallsOutletstNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnDiningRoomCeilingsLightsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnDiningRoomCeilingsLightsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnDiningRoomFloorsCarpetOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnDiningRoomFloorsCarpetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnDiningRoomWindowOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnDiningRoomWindowNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    
    
    [self.BtnDiningRoomWindowcoveringsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnDiningRoomWindowcoveringsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnDiningRoomDoorClosetOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnDiningRoomDoorClosetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    
    
    
    
}
-(void)ResetAllKitchen{
    
    [self.BtnKitchenRefrigeratorOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenRefrigeratorNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];

    
    
    [self.BtnKitchenMicrowaveOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenMicrowaveNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];

    
    
    [self.BtnKitchenWasherdryerOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenWasherdryerNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];

    
    
    [self.BtnKitchenVenthoodOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenVenthoodNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];

    
    
    [self.BtnKitchenDishwasherDisposalOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenDishwasherDisposalNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];

    
    
    [self.BtnKitchenWallsOutletsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenWallsOutletsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];

    
    
    [self.BtnKitchenCeilingsLightsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenCeilingsLightsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];

    
    
    [self.BtnKitchenFloorsCarpetOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenFloorsCarpetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];

    
    
    [self.BtnKitchenWindowOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenWindowNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];

    
    
    [self.BtnKitchenWindowcoveringsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenWindowcoveringsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];

    
    
    [self.BtnKitchenCountertopOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenCountertopNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];

    
   
    [self.BtnKitchenDoorClosetOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenDoorClosetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];

    
    
    [self.BtnKitchenCabinetFormicaTilesOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenCabinetFormicaTilesNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];

    
    
    [self.BtnKitchenOtherOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenOtherNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];

    
}

-(void)ResetAllHalls

{
    
    
    [self.BtnHallsWallsOutletstOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnHallsWallsOutletstNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnHallsCeilingsLightsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnHallsCeilingsLightsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnHallsFloorsCarpetOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnHallsFloorsCarpetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    
    
    
    
    
}
-(void)ResetAllBedrooms

{
    
    
    [self.BtnBedroomsWallsOutletstOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBedroomsWallsOutletstNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnBedroomsCeilingsLightsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBedroomsCeilingsLightsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnBedroomsFloorsCarpetOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBedroomsFloorsCarpetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnBedroomsWindowOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBedroomsWindowNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    
    
    [self.BtnBedroomsWindowcoveringsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBedroomsWindowcoveringsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnBedroomsDoorClosetOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBedroomsDoorClosetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnBedroomsOtherOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBedroomsOtherNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    
    
    
}
-(void)ResetAllBaths

{
    //Uiview Baths Uiview UIBUTTONS Radio Buttons
    
    [self.BtnBathsWallsOutletstOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBathsWallsOutletstNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnBathsCeilingsLightsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBathsCeilingsLightsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnBathsFloorsCarpetOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBathsFloorsCarpetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnBathsFormicaTileOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBathsFormicaTileNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    
    
    [self.BtnBathsCabinetsMirrorOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBathsCabinetsMirrorNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];

    
    [self.BtnBathsWindowOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBathsWindowNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];


    
    
    [self.BtnBathsDoorClosetOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBathsDoorClosetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnBathsOtherOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBathsOtherNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    
    
    
}
-(void)ResetAllMisc

{
    //Uiview Baths Uiview UIBUTTONS Radio Buttons
    
    
    
    
    [self.BtnMiscSmokealarmOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnMiscSmokealarmNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnMiscFireextinguisherOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnMiscFireextinguisherNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnMiscScreensOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnMiscScreensNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    [self.BtnMiscHeatingACOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnMiscHeatingACNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    
    
    [self.BtnMiscOtherOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnMiscOtherNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    
    
    
    
}


- (void)Open {
    
    
}
- (void)OpenCleaniless
{
//    self.ViewCleanlinessContainerHeight.active = YES;
//    self.ViewCleanlinessContainerHeight.constant=((75 * 5)+240);
    
    self.ViewCleanlinessSweptHeight.active = YES;
    self.ViewCleanlinessSweptHeight.constant=ViewCleanlinessContainerHeightValue;
    
    self.ViewCleanlinessClosetsHeight.active = YES;
    self.ViewCleanlinessClosetsHeight.constant=ViewCleanlinessClosetsHeightValue;
    
    self.ViewCleanlinessFrigStoveHeight.active = YES;
    self.ViewCleanlinessFrigStoveHeight.constant=ViewCleanlinessFrigStoveHeightValue;
    
    self.ViewCleanlinessNopersonalitemsHeight.active = YES;
    self.ViewCleanlinessNopersonalitemsHeight.constant=ViewCleanlinessNopersonalitemsHeightValue;
    
    
    self.ViewCleanlinessOtherHeight.active = YES;
    self.ViewCleanlinessOtherHeight.constant=ViewCleanlinessOtherHeightValue;
    
    

    [self.view layoutIfNeeded];
    
    self.ImgAddCleanliness.image=[UIImage imageNamed:@"sub-bt"];
    [self SetContainer];

}
- (void)OpenLivingRoom
{

    
    
//    self.ViewLivingRoomContainerHeight.active = YES;
//    self.ViewLivingRoomContainerHeight.constant=((75 * 7)+240);
    
    self.ViewLivingRoomWallsOutletstHeight.active = YES;
    self.ViewLivingRoomWallsOutletstHeight.constant=ViewLivingRoomWallsOutletstHeightValue;
    
    self.ViewLivingRoomCeilingsLightsHeight.active = YES;
    self.ViewLivingRoomCeilingsLightsHeight.constant=ViewLivingRoomCeilingMoveInMoveOutightsHeightValue;
    
    self.ViewLivingRoomFloorsCarpetHeight.active = YES;
    self.ViewLivingRoomFloorsCarpetHeight.constant=ViewLivingRoomFloorsCarpetHeightValue;
    
    self.ViewLivingRoomWindowHeight.active = YES;
    self.ViewLivingRoomWindowHeight.constant=ViewLivingRoomWindowHeightValue;
    
    
    self.ViewLivingRoomWindowcoveringsHeight.active = YES;
    self.ViewLivingRoomWindowcoveringsHeight.constant=ViewLivingRoomWindowcoveringsHeightValue;

    self.ViewLivingRoomDoorClosetHeight.active = YES;
    self.ViewLivingRoomDoorClosetHeight.constant=ViewLivingRoomDoorClosetHeightValue;
    
    self.ViewLivingRoomOtherHeight.active = YES;
    self.ViewLivingRoomOtherHeight.constant=ViewLivingRoomOtherHeightValue;

    
    [self.view layoutIfNeeded];
    
    self.ImgAddLivingRoom.image=[UIImage imageNamed:@"sub-bt"];
    [self SetContainer];

    
}
- (void)OpenDiningRoom
{
    
    
    
    //    self.ViewLivingRoomContainerHeight.active = YES;
    //    self.ViewLivingRoomContainerHeight.constant=((75 * 7)+240);
    
    self.ViewDiningRoomWallsOutletstHeight.active = YES;
    self.ViewDiningRoomWallsOutletstHeight.constant=ViewDiningRoomWallsOutletstHeightValue;
    
    self.ViewDiningRoomCeilingsLightsHeight.active = YES;
    self.ViewDiningRoomCeilingsLightsHeight.constant=ViewDiningRoomCeilingMoveInMoveOutightsHeightValue;
    
    self.ViewDiningRoomFloorsCarpetHeight.active = YES;
    self.ViewDiningRoomFloorsCarpetHeight.constant=ViewDiningRoomFloorsCarpetHeightValue;
    
    self.ViewDiningRoomWindowHeight.active = YES;
    self.ViewDiningRoomWindowHeight.constant=ViewDiningRoomWindowHeightValue;
    
    
    self.ViewDiningRoomWindowcoveringsHeight.active = YES;
    self.ViewDiningRoomWindowcoveringsHeight.constant=ViewDiningRoomWindowcoveringsHeightValue;
    
    self.ViewDiningRoomDoorClosetHeight.active = YES;
    self.ViewDiningRoomDoorClosetHeight.constant=ViewDiningRoomDoorClosetHeightValue;
    
    
    
    [self.view layoutIfNeeded];
    
    self.ImgAddDiningRoom.image=[UIImage imageNamed:@"sub-bt"];
    [self SetContainer];
    
    
}
- (void)OpenKitchen
{
    
    
    
    //    self.ViewLivingRoomContainerHeight.active = YES;
    //    self.ViewLivingRoomContainerHeight.constant=((75 * 7)+240);
    
    
    self.ViewKitchenRefrigeratorHeight.active = YES;
    self.ViewKitchenRefrigeratorHeight.constant=ViewKitchenRefrigeratorHeightValue;
    
    
    
    self.ViewKitchenMicrowaveHeight.active = YES;
    self.ViewKitchenMicrowaveHeight.constant=ViewKitchenMicrowaveHeightValue;
    
    
    self.ViewKitchenWasherdryerHeight.active = YES;
    self.ViewKitchenWasherdryerHeight.constant=ViewKitchenWasherdryerHeightValue;
    
    
    self.ViewKitchenRangeVenthoodHeight.active = YES;
    self.ViewKitchenRangeVenthoodHeight.constant=ViewKitchenRangeVenthoodHeightValue;
    
    
    self.ViewKitchenDishwasherDisposalHeight.active = YES;
    self.ViewKitchenDishwasherDisposalHeight.constant=ViewKitchenDishwasherDisposalHeightValue;
    
    
    self.ViewKitchenWallsOutletstHeight.active = YES;
    self.ViewKitchenWallsOutletstHeight.constant=ViewKitchenWallsOutletstHeightValue;
    
    
    
    self.ViewKitchenCeilingsLightsHeight.active = YES;
    self.ViewKitchenCeilingsLightsHeight.constant=ViewKitchenCeilingsLightsHeightValue;
    
    
    self.ViewKitchenFloorsCarpetHeight.active = YES;
    self.ViewKitchenFloorsCarpetHeight.constant=ViewKitchenFloorsCarpetHeightValue;
    
    
    self.ViewKitchenWindowHeight.active = YES;
    self.ViewKitchenWindowHeight.constant=ViewKitchenWindowHeightValue;
    
    
    self.ViewKitchenWindowcoveringsHeight.active = YES;
    self.ViewKitchenWindowcoveringsHeight.constant=ViewKitchenWindowcoveringsHeightValue;
    
    self.ViewKitchenCountertopHeight.active = YES;
    self.ViewKitchenCountertopHeight.constant=ViewKitchenCountertopHeightValue;
    
    
    
    self.ViewKitchenDoorClosetHeight.active = YES;
    self.ViewKitchenDoorClosetHeight.constant=ViewKitchenDoorClosetHeightValue;
    
    
    
    self.ViewKitchenCabinetFormicaTilesHeight.active = YES;
    self.ViewKitchenCabinetFormicaTilesHeight.constant=ViewKitchenCabinetFormicaTilesHeightValue;
    
    
    self.ViewKitchenOtherHeight.active = YES;
    self.ViewKitchenOtherHeight.constant=ViewKitchenOtherHeightValue;

    
    
    
    
    
    
    
    
    
    
    [self.view layoutIfNeeded];
    
    self.ImgAddKitchen.image=[UIImage imageNamed:@"sub-bt"];
    [self SetContainer];
    
    
}
- (void)OpenHalls
{
    
    
    
    //    self.ViewLivingRoomContainerHeight.active = YES;
    //    self.ViewLivingRoomContainerHeight.constant=((75 * 7)+240);
    
    self.ViewHallsWallsOutletstHeight.active = YES;
    self.ViewHallsWallsOutletstHeight.constant=ViewHallsWallsOutletstHeightValue;
    
    self.ViewHallsCeilingsLightsHeight.active = YES;
    self.ViewHallsCeilingsLightsHeight.constant=ViewHallsCeilingsLightsHeightValue;
    
    self.ViewHallsFloorsCarpetHeight.active = YES;
    self.ViewHallsFloorsCarpetHeight.constant=ViewHallsFloorsCarpetHeightValue;
    
    
    
    
    [self.view layoutIfNeeded];
    
    self.ImgAddHalls.image=[UIImage imageNamed:@"sub-bt"];
    [self SetContainer];
    
    
}
- (void)OpenBedrooms
{
    
  
    //    self.ViewLivingRoomContainerHeight.active = YES;
    //    self.ViewLivingRoomContainerHeight.constant=((75 * 7)+240);
    
    self.ViewBedroomsWallsOutletstHeight.active = YES;
    self.ViewBedroomsWallsOutletstHeight.constant=ViewBedRoomWallsOutletstHeightValue;
    
    self.ViewBedroomsCeilingsLightsHeight.active = YES;
    self.ViewBedroomsCeilingsLightsHeight.constant=ViewBedRoomCeilingsLightsHeightValue;
    
    self.ViewBedroomsFloorsCarpetHeight.active = YES;
    self.ViewBedroomsFloorsCarpetHeight.constant=ViewBedRoomFloorsCarpetHeightValue;
    
    self.ViewBedroomsWindowHeight.active = YES;
    self.ViewBedroomsWindowHeight.constant=ViewBedRoomWindowHeightValue;
    
    
    self.ViewBedroomsWindowcoveringsHeight.active = YES;
    self.ViewBedroomsWindowcoveringsHeight.constant=ViewBedRoomWindowcoveringsHeightValue;
    
    self.ViewBedroomsDoorClosetHeight.active = YES;
    self.ViewBedroomsDoorClosetHeight.constant=ViewBedRoomDoorClosetHeightValue;
    
    self.ViewBedroomsOtherHeight.active = YES;
    self.ViewBedroomsOtherHeight.constant=ViewBedRoomOtherHeightValue;
    
    
    [self.view layoutIfNeeded];
    
    self.ImgAddBedrooms.image=[UIImage imageNamed:@"sub-bt"];
    [self SetContainer];
    
    
}
- (void)OpenBaths
{
    
    
 

    
    //    self.ViewLivingRoomContainerHeight.active = YES;
    //    self.ViewLivingRoomContainerHeight.constant=((75 * 7)+240);
    
    self.ViewBathsWallsOutletsHeight.active = YES;
    self.ViewBathsWallsOutletsHeight.constant=ViewBathsWallsOutletstHeightValue;
    
    self.ViewBathsCeilingsLightsHeight.active = YES;
    self.ViewBathsCeilingsLightsHeight.constant=ViewBathsCeilingsLightsHeightValue;
    
    self.ViewBathsFloorsCarpetHeight.active = YES;
    self.ViewBathsFloorsCarpetHeight.constant=ViewBathsFloorsCarpetHeightValue;
    
    self.ViewBathsFormicaTileHeight.active = YES;
    self.ViewBathsFormicaTileHeight.constant=ViewBathsFormicaTileHeightValue;
    
    
    self.ViewBathsCabinetsMirrorHeight.active = YES;
    self.ViewBathsCabinetsMirrorHeight.constant=ViewBathsCabinetsMirrorHeightValue;
    
    self.ViewBathsWindowHeight.active = YES;
    self.ViewBathsWindowHeight.constant=ViewBathsWindowHeightValue;
    
    self.ViewBathsDoorClosetHeight.active = YES;
    self.ViewBathsDoorClosetHeight.constant=ViewBathsDoorClosetHeightValue;
    
    self.ViewBathsOtherHeight.active = YES;
    self.ViewBathsOtherHeight.constant=ViewBathsOtherHeightValue;

    
    
    [self.view layoutIfNeeded];
    
    self.ImgAddBaths.image=[UIImage imageNamed:@"sub-bt"];
    [self SetContainer];
    
    
}
- (void)OpenMisc
{
    
    
    self.ViewMiscSmokealarmHeight.active = YES;
    self.ViewMiscSmokealarmHeight.constant=ViewMiscSmokealarmHeightValue;
    
    self.ViewMiscFireextinguisherHeight.active = YES;
    self.ViewMiscFireextinguisherHeight.constant=ViewMiscFireextinguisherHeightValue;
    
    self.ViewMiscScreensHeight.active = YES;
    self.ViewMiscScreensHeight.constant=ViewMiscScreensHeightValue;
    
    self.ViewMiscHeatingACHeight.active = YES;
    self.ViewMiscHeatingACHeight.constant=ViewMiscHeatingACHeightValue;
    
    
    self.ViewMiscOtherHeight.active = YES;
    self.ViewMiscOtherHeight.constant=ViewMiscOtherHeightValue;
    
    
    //    self.ViewLivingRoomContainerHeight.active = YES;
    //    self.ViewLivingRoomContainerHeight.constant=((75 * 7)+240);
    
    
    
    [self.view layoutIfNeeded];
    
    self.ImgAddMisc.image=[UIImage imageNamed:@"sub-bt"];
    [self SetContainer];
    
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldBeginEditing");
    
    if([textField isEqual:self.LastActiveTextField]){
        
//        if([textField isEqual:self.TxtCleanliness]){
//            
//            [self CloseCleaniless];
// 
//            
//        }
//        if([textField isEqual:self.TxtLivingRoom]){
//            
//            [self CloseLivingRoom];
//            
//            
//        }
        self.LastActiveTextField=nil;

        [self Close];
       // [self SetContainer];
     

      //  [self setScrollViewSize];

    }
    else
    {
        self.LastActiveTextField=textField;

        [self Close];
        
        if([textField isEqual:self.TxtCleanliness]){
            
                        [self OpenCleaniless];
            
            
                    }
                    else if([textField isEqual:self.TxtLivingRoom]){
            
                        [self OpenLivingRoom];
                        
                        
                    }
                    else if([textField isEqual:self.TxtDiningRoom]){
                        
                        [self OpenDiningRoom];
                        
                        
                    }
                    else if([textField isEqual:self.TxtKitchen]){
                        
                        [self OpenKitchen];
                        
                        
                    }
                    else if([textField isEqual:self.TxtHalls]){
                        
                        [self OpenHalls];
                        
                        
                    }
                    else if([textField isEqual:self.TxtBedrooms]){
                        
                        [self OpenBedrooms];
                        
                        
                    }
                    else if([textField isEqual:self.TxtBaths]){
                        
                        [self OpenBaths];
                        
                        
                    }
                    else if([textField isEqual:self.TxtMisc]){
                        
                        [self OpenMisc];
                        
                        
                    }
        
//        [self Open];
       // [self setScrollViewSize];
    }
   // }
    
    
    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldDidBeginEditing");
}
- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    textView.text = @"";
    textView.textColor = [UIColor blackColor];
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
- (IBAction)GoBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)AttachPhoto:(id)sender {
    

    self.LastActiveButton =(UIButton*)sender;
    
//    self.LastActiveButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    self.LastActiveButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
//    self.LastActiveButton.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;

    
    
    
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

    
    UIImageView *imageView = [[UIImageView alloc] init];
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
    [self.LastActiveButton addSubview:mySmallButton];
    
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
-(void)DeleteImage:(id)sender{
    
    
    
    
    UIButton *b = (UIButton*)sender;
    NSArray *viewsToRemove = [[b superview]subviews];
    NSLog(@"[b superview] %d",[b superview].tag);
    for (UIView *v in viewsToRemove) {
        
        NSString *strClass = NSStringFromClass([v class]);
         if([strClass isEqualToString:@"UIImageView"]) {
    
             if(v.userInteractionEnabled){
            
                 [v removeFromSuperview];

            
                }
         }
             else{
                 
                 [v removeFromSuperview];

             }
    }
    
    
    
//    [[[b superview]subviews]
//     makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    [((UIButton*)[b superview])setImage:[UIImage imageNamed:@"add-img"] forState:UIControlStateNormal];
    
    
   // [self.LastActiveButton setImage:nil forState:UIControlStateNormal];
}
- (IBAction)CleanlinessSweptOK:(id)sender {
    
    self.ViewCleanlinessSweptHeight.active = YES;
    self.ViewCleanlinessSweptHeight.constant=70.0f;
    ViewCleanlinessContainerHeightValue=70.0f;
    [self.BtnCleanlinessSweptOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnCleanlinessSweptNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:0 :Ok];
    [self SetCleanLinessAllOk_Click];

    
    
}

- (IBAction)CleanlinessSweptNotOK:(id)sender {
    
    self.ViewCleanlinessSweptHeight.active = YES;
    self.ViewCleanlinessSweptHeight.constant=300.0f;
    ViewCleanlinessContainerHeightValue=300.0f;

    [self.BtnCleanlinessSweptOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnCleanlinessSweptNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    
    [self SetContainer];
    [self SetOKNOTOKData:0 :NotOk];
    [self ResetCleanLinessAllOk_Click];



}

- (IBAction)CleanlinessClosestOK:(id)sender {
    
    self.ViewCleanlinessClosetsHeight.active = YES;
    self.ViewCleanlinessClosetsHeight.constant=70.0f;
    ViewCleanlinessClosetsHeightValue=70.0f;
    
    [self.BtnCleanlinessClosestOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnCleanlinessClosestNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];

   
    [self SetContainer];
    [self SetOKNOTOKData:1 :Ok];
    [self SetCleanLinessAllOk_Click];


}

- (IBAction)CleanlinessClosestNotOK:(id)sender {
    
    self.ViewCleanlinessClosetsHeight.active = YES;
    self.ViewCleanlinessClosetsHeight.constant=300.0f;
    ViewCleanlinessClosetsHeightValue=300.0f;

    [self.BtnCleanlinessClosestOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnCleanlinessClosestNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];

    [self SetContainer];
    [self SetOKNOTOKData:1 :NotOk];
    [self ResetCleanLinessAllOk_Click];



}

- (IBAction)CleanlinessFrigStoveOK:(id)sender{
    
    self.ViewCleanlinessFrigStoveHeight.active = YES;
    self.ViewCleanlinessFrigStoveHeight.constant=70.0f;
    ViewCleanlinessFrigStoveHeightValue=70.0f;
    
    [self.BtnCleanlinessFrigStoveOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnCleanlinessFrigStovetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
   
    [self SetContainer];
    [self SetOKNOTOKData:2 :Ok];
    [self SetCleanLinessAllOk_Click];



}

- (IBAction)CleanlinessFrigStoveNotOK:(id)sender {
    
    self.ViewCleanlinessFrigStoveHeight.active = YES;
    self.ViewCleanlinessFrigStoveHeight.constant=300.0f;
    ViewCleanlinessFrigStoveHeightValue=300.0f;

    [self.BtnCleanlinessFrigStoveOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnCleanlinessFrigStovetNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:2 :NotOk];
    [self ResetCleanLinessAllOk_Click];


    
}
- (IBAction)CleanlinessNopersonalitemsOK:(id)sender {
    
    self.ViewCleanlinessNopersonalitemsHeight.active = YES;
    self.ViewCleanlinessNopersonalitemsHeight.constant=70.0f;
    ViewCleanlinessNopersonalitemsHeightValue=70.0f;

    
    [self.BtnCleanlinessNopersonalitemsOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnCleanlinessNopersonalitemsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];

    
    [self SetContainer];
    [self SetOKNOTOKData:3 :Ok];
    [self SetCleanLinessAllOk_Click];


    
    
}
- (IBAction)CleanlinessNopersonalitemsNotOK:(id)sender {
    
    self.ViewCleanlinessNopersonalitemsHeight.active = YES;
    self.ViewCleanlinessNopersonalitemsHeight.constant=300.0f;
    ViewCleanlinessNopersonalitemsHeightValue=300.0f;

    [self.BtnCleanlinessNopersonalitemsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnCleanlinessNopersonalitemsNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:3 :NotOk];
    [self ResetCleanLinessAllOk_Click];

    
    
}
- (IBAction)CleanlinessOtherOK:(id)sender {
    
    self.ViewCleanlinessOtherHeight.active = YES;
    self.ViewCleanlinessOtherHeight.constant=70.0f;
    ViewCleanlinessOtherHeightValue=70.0f;
    [self.BtnCleanlinessOtherOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnCleanlinessOtherNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:4 :Ok];
    [self SetCleanLinessAllOk_Click];


    
    
}
- (IBAction)CleanlinessOtherNotOK:(id)sender{
    
    self.ViewCleanlinessOtherHeight.active = YES;
    self.ViewCleanlinessOtherHeight.constant=300.0f;
    ViewCleanlinessOtherHeightValue=300.0f;

    [self.BtnCleanlinessOtherOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnCleanlinessOtherNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:4 :NotOk];
    [self ResetCleanLinessAllOk_Click];

    
    
}
- (IBAction)LivingRoomWallsOutletstOK:(id)sender{
    
    self.ViewLivingRoomWallsOutletstHeight.active = YES;
    self.ViewLivingRoomWallsOutletstHeight.constant=70.0f;
    ViewLivingRoomWallsOutletstHeightValue=70.0f;
    
    [self.BtnLivingRoomWallsOutletstOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnLivingRoomWallsOutletstNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:5 :Ok];
    [self SetLivingRoomAllOk_Click];


}
- (IBAction)LivingRoomWallsOutletstNotOK:(id)sender{
    
    self.ViewLivingRoomWallsOutletstHeight.active = YES;
    self.ViewLivingRoomWallsOutletstHeight.constant=300.0f;
    ViewLivingRoomWallsOutletstHeightValue=300.0f;

    [self.BtnLivingRoomWallsOutletstOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnLivingRoomWallsOutletstNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:5 :NotOk];
    [self ResetLivingRoomAllOk_Click];

}

- (IBAction)LivingRoomCeilingsLightsOK:(id)sender{
    
    self.ViewLivingRoomCeilingsLightsHeight.active = YES;
    self.ViewLivingRoomCeilingsLightsHeight.constant=70.0f;
    ViewLivingRoomCeilingMoveInMoveOutightsHeightValue=70.0f;

    [self.BtnLivingRoomCeilingsLightsOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnLivingRoomCeilingsLightsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:6 :Ok];
    [self SetLivingRoomAllOk_Click];



}
- (IBAction)LivingRoomCeilingsLightsNotOK:(id)sender{
    
    self.ViewLivingRoomCeilingsLightsHeight.active = YES;
    self.ViewLivingRoomCeilingsLightsHeight.constant=300.0f;
    ViewLivingRoomCeilingMoveInMoveOutightsHeightValue=300.0f;

    [self.BtnLivingRoomCeilingsLightsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnLivingRoomCeilingsLightsNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:6 :NotOk];
    [self ResetLivingRoomAllOk_Click];



}

- (IBAction)LivingRoomFloorsCarpetOK:(id)sender{
    
    self.ViewLivingRoomFloorsCarpetHeight.active = YES;
    self.ViewLivingRoomFloorsCarpetHeight.constant=70.0f;
    ViewLivingRoomFloorsCarpetHeightValue=70.0f;

    [self.BtnLivingRoomFloorsCarpetOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnLivingRoomFloorsCarpetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:7 :Ok];
    [self SetLivingRoomAllOk_Click];



}
- (IBAction)LivingRoomFloorsCarpetNotOK:(id)sender{
    
    self.ViewLivingRoomFloorsCarpetHeight.active = YES;
    self.ViewLivingRoomFloorsCarpetHeight.constant=300.0f;
    ViewLivingRoomFloorsCarpetHeightValue=300.0f;

    [self.BtnLivingRoomFloorsCarpetOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnLivingRoomFloorsCarpetNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:7 :NotOk];
    [self ResetLivingRoomAllOk_Click];

    


}

- (IBAction)LivingRoomWindowOK:(id)sender{
    self.ViewLivingRoomWindowHeight.active = YES;
    self.ViewLivingRoomWindowHeight.constant=70.0f;
    ViewLivingRoomWindowHeightValue=70.0f;

    [self.BtnLivingRoomWindowOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnLivingRoomWindowNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:8 :Ok];
    [self SetLivingRoomAllOk_Click];
    


}
- (IBAction)LivingRoomWindowNotOK:(id)sender{
    
    self.ViewLivingRoomWindowHeight.active = YES;
    self.ViewLivingRoomWindowHeight.constant=300.0f;
    ViewLivingRoomWindowHeightValue=300.0f;

    [self.BtnLivingRoomWindowOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnLivingRoomWindowNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:8 :NotOk];
    [self ResetLivingRoomAllOk_Click];


}

- (IBAction)LivingRoomWindowcoveringsOK:(id)sender{
    
    self.ViewLivingRoomWindowcoveringsHeight.active = YES;
    self.ViewLivingRoomWindowcoveringsHeight.constant=70.0f;
    ViewLivingRoomWindowcoveringsHeightValue=70.0f;

    [self.BtnLivingRoomWindowcoveringsOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnLivingRoomWindowcoveringsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:9 :Ok];
    [self SetLivingRoomAllOk_Click];


}
- (IBAction)LivingRoomWindowcoveringsNotOK:(id)sender{
    
    self.ViewLivingRoomWindowcoveringsHeight.active = YES;
    self.ViewLivingRoomWindowcoveringsHeight.constant=300.0f;
    ViewLivingRoomWindowcoveringsHeightValue=300.0f;

    [self.BtnLivingRoomWindowcoveringsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnLivingRoomWindowcoveringsNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:9 :NotOk];
    [self ResetLivingRoomAllOk_Click];

}

- (IBAction)LivingRoomDoorClosetOK:(id)sender{
    
    self.ViewLivingRoomDoorClosetHeight.active = YES;
    self.ViewLivingRoomDoorClosetHeight.constant=70.0f;
    ViewLivingRoomDoorClosetHeightValue=70.0f;

    [self.BtnLivingRoomDoorClosetOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnLivingRoomDoorClosetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:10 :Ok];
    [self SetLivingRoomAllOk_Click];


}
- (IBAction)LivingRoomDoorClosetNotOK:(id)sender{
    
    self.ViewLivingRoomDoorClosetHeight.active = YES;
    self.ViewLivingRoomDoorClosetHeight.constant=300.0f;
    ViewLivingRoomDoorClosetHeightValue=300.0f;
    [self.BtnLivingRoomDoorClosetOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnLivingRoomDoorClosetNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:10 :NotOk];
    [self ResetLivingRoomAllOk_Click];



}


- (IBAction)LivingRoomOtherOK:(id)sender{
    
    self.ViewLivingRoomOtherHeight.active = YES;
    self.ViewLivingRoomOtherHeight.constant=70.0f;
    ViewLivingRoomOtherHeightValue=70.0f;
    [self.BtnLivingRoomOtherOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnLivingRoomOtherNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:11 :Ok];
    [self SetLivingRoomAllOk_Click];



}

- (IBAction)LivingRoomOtherNotOK:(id)sender{
    
    self.ViewLivingRoomOtherHeight.active = YES;
    self.ViewLivingRoomOtherHeight.constant=300.0f;
    ViewLivingRoomOtherHeightValue=300.0f;

    [self.BtnLivingRoomOtherOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnLivingRoomOtherNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:11 :NotOk];
    [self ResetLivingRoomAllOk_Click];



}
#pragma DiningROOM
- (IBAction)DiningRoomWallsOutletstOK:(id)sender{
    
    self.ViewDiningRoomWallsOutletstHeight.active = YES;
    self.ViewDiningRoomWallsOutletstHeight.constant=70.0f;
    ViewDiningRoomWallsOutletstHeightValue=70.0f;
    
    [self.BtnDiningRoomWallsOutletstOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnDiningRoomWallsOutletstNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:12 :Ok];
    [self SetDiningRoomAllOk_Click];
    
    
}
- (IBAction)DiningRoomWallsOutletstNotOK:(id)sender{
    
    self.ViewDiningRoomWallsOutletstHeight.active = YES;
    self.ViewDiningRoomWallsOutletstHeight.constant=300.0f;
    ViewDiningRoomWallsOutletstHeightValue=300.0f;
    
    [self.BtnDiningRoomWallsOutletstOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnDiningRoomWallsOutletstNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:12 :NotOk];
    [self ResetDiningRoomAllOk_Click];
    
}

- (IBAction)DiningRoomCeilingsLightsOK:(id)sender{
    
    self.ViewDiningRoomCeilingsLightsHeight.active = YES;
    self.ViewDiningRoomCeilingsLightsHeight.constant=70.0f;
    ViewDiningRoomCeilingMoveInMoveOutightsHeightValue=70.0f;
    
    [self.BtnDiningRoomCeilingsLightsOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnDiningRoomCeilingsLightsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:13 :Ok];
    [self SetDiningRoomAllOk_Click];

    
}
- (IBAction)DiningRoomCeilingsLightsNotOK:(id)sender{
    
    self.ViewDiningRoomCeilingsLightsHeight.active = YES;
    self.ViewDiningRoomCeilingsLightsHeight.constant=300.0f;
    ViewDiningRoomCeilingMoveInMoveOutightsHeightValue=300.0f;
    
    [self.BtnDiningRoomCeilingsLightsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnDiningRoomCeilingsLightsNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:13 :NotOk];
    [self ResetDiningRoomAllOk_Click];

    
}

- (IBAction)DiningRoomFloorsCarpetOK:(id)sender{
    
    self.ViewDiningRoomFloorsCarpetHeight.active = YES;
    self.ViewDiningRoomFloorsCarpetHeight.constant=70.0f;
    ViewDiningRoomFloorsCarpetHeightValue=70.0f;
    
    [self.BtnDiningRoomFloorsCarpetOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnDiningRoomFloorsCarpetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:14 :Ok];
    [self SetDiningRoomAllOk_Click];

    
    
}
- (IBAction)DiningRoomFloorsCarpetNotOK:(id)sender{
    
    self.ViewDiningRoomFloorsCarpetHeight.active = YES;
    self.ViewDiningRoomFloorsCarpetHeight.constant=300.0f;
    ViewDiningRoomFloorsCarpetHeightValue=300.0f;
    
    [self.BtnDiningRoomFloorsCarpetOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnDiningRoomFloorsCarpetNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:14 :NotOk];
    [self ResetDiningRoomAllOk_Click];

    
}

- (IBAction)DiningRoomWindowOK:(id)sender{
    self.ViewDiningRoomWindowHeight.active = YES;
    self.ViewDiningRoomWindowHeight.constant=70.0f;
    ViewDiningRoomWindowHeightValue=70.0f;
    
    [self.BtnDiningRoomWindowOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnDiningRoomWindowNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:15 :Ok];
    [self SetDiningRoomAllOk_Click];

    
}
- (IBAction)DiningRoomWindowNotOK:(id)sender{
    
    self.ViewDiningRoomWindowHeight.active = YES;
    self.ViewDiningRoomWindowHeight.constant=300.0f;
    ViewDiningRoomWindowHeightValue=300.0f;
    
    [self.BtnDiningRoomWindowOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnDiningRoomWindowNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:15 :NotOk];
    [self ResetDiningRoomAllOk_Click];

}

- (IBAction)DiningRoomWindowcoveringsOK:(id)sender{
    
    self.ViewDiningRoomWindowcoveringsHeight.active = YES;
    self.ViewDiningRoomWindowcoveringsHeight.constant=70.0f;
    ViewDiningRoomWindowcoveringsHeightValue=70.0f;
    
    [self.BtnDiningRoomWindowcoveringsOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnDiningRoomWindowcoveringsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:16 :Ok];
    [self SetDiningRoomAllOk_Click];

    
}
- (IBAction)DiningRoomWindowcoveringsNotOK:(id)sender{
    
    self.ViewDiningRoomWindowcoveringsHeight.active = YES;
    self.ViewDiningRoomWindowcoveringsHeight.constant=300.0f;
    ViewDiningRoomWindowcoveringsHeightValue=300.0f;
    
    [self.BtnDiningRoomWindowcoveringsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnDiningRoomWindowcoveringsNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:16 :NotOk];
    [self ResetDiningRoomAllOk_Click];

}

- (IBAction)DiningRoomDoorClosetOK:(id)sender{
    
    self.ViewDiningRoomDoorClosetHeight.active = YES;
    self.ViewDiningRoomDoorClosetHeight.constant=70.0f;
    ViewDiningRoomDoorClosetHeightValue=70.0f;
    
    [self.BtnDiningRoomDoorClosetOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnDiningRoomDoorClosetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:17 :Ok];
    [self SetDiningRoomAllOk_Click];

    
}
- (IBAction)DiningRoomDoorClosetNotOK:(id)sender{
    
    self.ViewDiningRoomDoorClosetHeight.active = YES;
    self.ViewDiningRoomDoorClosetHeight.constant=300.0f;
    ViewDiningRoomDoorClosetHeightValue=300.0f;
    [self.BtnDiningRoomDoorClosetOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnDiningRoomDoorClosetNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:17 :NotOk];
    [self ResetDiningRoomAllOk_Click];

    
    
}
- (IBAction)KitchenRefrigeratorOK:(id)sender{
    
    
    self.ViewKitchenRefrigeratorHeight.active = YES;
    self.ViewKitchenRefrigeratorHeight.constant=70.0f;
    ViewKitchenRefrigeratorHeightValue=70.0f;
    
    [self.BtnKitchenRefrigeratorOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnKitchenRefrigeratorNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:18 :Ok];
    [self SetKitchenAllOk_Click];
    
    
}
- (IBAction)KitchenRefrigeratorNotOK:(id)sender{
    
    self.ViewKitchenRefrigeratorHeight.active = YES;
    self.ViewKitchenRefrigeratorHeight.constant=300.0f;
    ViewKitchenRefrigeratorHeightValue=300.0f;
    [self.BtnKitchenRefrigeratorOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenRefrigeratorNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:18 :NotOk];
    [self ResetKitchenAllOk_Click];

    
}

- (IBAction)KitchenMicrowaveOK:(id)sender{
    
    self.ViewKitchenMicrowaveHeight.active = YES;
    self.ViewKitchenMicrowaveHeight.constant=70.0f;
    ViewKitchenMicrowaveHeightValue=70.0f;
    
    [self.BtnKitchenMicrowaveOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnKitchenMicrowaveNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:19 :Ok];
    [self SetKitchenAllOk_Click];

    
}
- (IBAction)KitchenMicrowaveNotOK:(id)sender{
    
    self.ViewKitchenMicrowaveHeight.active = YES;
    self.ViewKitchenMicrowaveHeight.constant=300.0f;
    ViewKitchenMicrowaveHeightValue=300.0f;
    [self.BtnKitchenMicrowaveOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenMicrowaveNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:19 :NotOk];
    [self ResetKitchenAllOk_Click];

}

- (IBAction)KitchenWasherdryerOK:(id)sender{
    
    self.ViewKitchenWasherdryerHeight.active = YES;
    self.ViewKitchenWasherdryerHeight.constant=70.0f;
    ViewKitchenWasherdryerHeightValue=70.0f;
    
    [self.BtnKitchenWasherdryerOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnKitchenWasherdryerNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:20 :Ok];
    [self SetKitchenAllOk_Click];

}
- (IBAction)KitchenWasherdryerNotOK:(id)sender{
    
    self.ViewKitchenWasherdryerHeight.active = YES;
    self.ViewKitchenWasherdryerHeight.constant=300.0f;
    ViewKitchenWasherdryerHeightValue=300.0f;
    [self.BtnKitchenWasherdryerOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenWasherdryerNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:20 :NotOk];
    [self ResetKitchenAllOk_Click];

    
}

- (IBAction)KitchenVenthoodOK:(id)sender{
    self.ViewKitchenRangeVenthoodHeight.active = YES;
    self.ViewKitchenRangeVenthoodHeight.constant=70.0f;
    ViewKitchenRangeVenthoodHeightValue=70.0f;
    
    [self.BtnKitchenVenthoodOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnKitchenVenthoodNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:21 :Ok];
    [self SetKitchenAllOk_Click];

    
}
- (IBAction)KitchenVenthoodNotOK:(id)sender{
    self.ViewKitchenRangeVenthoodHeight.active = YES;
    self.ViewKitchenRangeVenthoodHeight.constant=300.0f;
    ViewKitchenRangeVenthoodHeightValue=300.0f;
    [self.BtnKitchenVenthoodOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenVenthoodNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:21 :NotOk];
    [self ResetKitchenAllOk_Click];

}

- (IBAction)KitchenDishwasherDisposalOK:(id)sender{
    
    self.ViewKitchenDishwasherDisposalHeight.active = YES;
    self.ViewKitchenDishwasherDisposalHeight.constant=70.0f;
    ViewKitchenDishwasherDisposalHeightValue=70.0f;
    
    [self.BtnKitchenDishwasherDisposalOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnKitchenDishwasherDisposalNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:22 :Ok];
    [self SetKitchenAllOk_Click];


    
}
- (IBAction)KitchenDishwasherDisposalNotOK:(id)sender{
    self.ViewKitchenDishwasherDisposalHeight.active = YES;
    self.ViewKitchenDishwasherDisposalHeight.constant=300.0f;
    ViewKitchenDishwasherDisposalHeightValue=300.0f;
    [self.BtnKitchenDishwasherDisposalOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenDishwasherDisposalNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:22 :NotOk];
    [self ResetKitchenAllOk_Click];


}

- (IBAction)KitchenWallsOutletsOK:(id)sender{
    
    self.ViewKitchenWallsOutletstHeight.active = YES;
    self.ViewKitchenWallsOutletstHeight.constant=70.0f;
    ViewKitchenWallsOutletstHeightValue=70.0f;
    
    [self.BtnKitchenWallsOutletsOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnKitchenWallsOutletsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:23 :Ok];
    [self SetKitchenAllOk_Click];


    
}
- (IBAction)KitchenWallsOutletsNotOK:(id)sender{
    
    self.ViewKitchenWallsOutletstHeight.active = YES;
    self.ViewKitchenWallsOutletstHeight.constant=300.0f;
    ViewKitchenWallsOutletstHeightValue=300.0f;
    [self.BtnKitchenWallsOutletsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenWallsOutletsNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:23 :NotOk];
    [self ResetKitchenAllOk_Click];

}

- (IBAction)KitchenCeilingsLightsOK:(id)sender{
    
    self.ViewKitchenCeilingsLightsHeight.active = YES;
    self.ViewKitchenCeilingsLightsHeight.constant=70.0f;
    ViewKitchenCeilingsLightsHeightValue=70.0f;
    
    [self.BtnKitchenCeilingsLightsOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnKitchenCeilingsLightsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:24 :Ok];
    [self SetKitchenAllOk_Click];


    
}
- (IBAction)KitchenCeilingsLightsNotOK:(id)sender{
    
    self.ViewKitchenCeilingsLightsHeight.active = YES;
    self.ViewKitchenCeilingsLightsHeight.constant=300.0f;
    ViewKitchenCeilingsLightsHeightValue=300.0f;
    [self.BtnKitchenCeilingsLightsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenCeilingsLightsNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:24 :NotOk];
    [self ResetKitchenAllOk_Click];


    
}

- (IBAction)KitchenFloorsCarpetOK:(id)sender{
    
    self.ViewKitchenFloorsCarpetHeight.active = YES;
    self.ViewKitchenFloorsCarpetHeight.constant=70.0f;
    ViewKitchenFloorsCarpetHeightValue=70.0f;
    
    [self.BtnKitchenFloorsCarpetOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnKitchenFloorsCarpetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:25 :Ok];
    [self SetKitchenAllOk_Click];

    
}
- (IBAction)KitchenFloorsCarpetNotOK:(id)sender{
    
    self.ViewKitchenFloorsCarpetHeight.active = YES;
    self.ViewKitchenFloorsCarpetHeight.constant=300.0f;
    ViewKitchenFloorsCarpetHeightValue=300.0f;
    [self.BtnKitchenFloorsCarpetOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenFloorsCarpetNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:25 :NotOk];
    [self ResetKitchenAllOk_Click];

    
}

- (IBAction)KitchenWindowOK:(id)sender{
    
    self.ViewKitchenWindowHeight.active = YES;
    self.ViewKitchenWindowHeight.constant=70.0f;
    ViewKitchenWindowHeightValue=70.0f;
    
    [self.BtnKitchenWindowOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnKitchenWindowNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:26 :Ok];
    [self SetKitchenAllOk_Click];


}
- (IBAction)KitchenWindowNotOK:(id)sender{
    
    self.ViewKitchenWindowHeight.active = YES;
    self.ViewKitchenWindowHeight.constant=300.0f;
    ViewKitchenWindowHeightValue=300.0f;
    [self.BtnKitchenWindowOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenWindowNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:26 :NotOk];
    [self ResetKitchenAllOk_Click];

}

- (IBAction)KitchenWindowcoveringsOK:(id)sender{
    
    self.ViewKitchenWindowcoveringsHeight.active = YES;
    self.ViewKitchenWindowcoveringsHeight.constant=70.0f;
    ViewKitchenWindowcoveringsHeightValue=70.0f;
    
    [self.BtnKitchenWindowcoveringsOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnKitchenWindowcoveringsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:27 :Ok];
    [self SetKitchenAllOk_Click];



}
- (IBAction)KitchenWindowcoveringsNotOK:(id)sender{

    self.ViewKitchenWindowcoveringsHeight.active = YES;
    self.ViewKitchenWindowcoveringsHeight.constant=300.0f;
    ViewKitchenWindowcoveringsHeightValue=300.0f;
    [self.BtnKitchenWindowcoveringsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenWindowcoveringsNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:27 :NotOk];
    [self ResetKitchenAllOk_Click];

}

- (IBAction)KitchenCountertopOK:(id)sender{
    self.ViewKitchenCountertopHeight.active = YES;
    self.ViewKitchenCountertopHeight.constant=70.0f;
    ViewKitchenCountertopHeightValue=70.0f;
    
    [self.BtnKitchenCountertopOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnKitchenCountertopNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:28 :Ok];
    [self SetKitchenAllOk_Click];

    
}
- (IBAction)KitchenCountertopNotOK:(id)sender{
    self.ViewKitchenCountertopHeight.active = YES;
    self.ViewKitchenCountertopHeight.constant=300.0f;
    ViewKitchenCountertopHeightValue=300.0f;
    [self.BtnKitchenCountertopOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenCountertopNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:28 :NotOk];
    [self ResetKitchenAllOk_Click];

}

- (IBAction)KitchenDoorClosetOK:(id)sender{
    
    self.ViewKitchenDoorClosetHeight.active = YES;
    self.ViewKitchenDoorClosetHeight.constant=70.0f;
    ViewKitchenDoorClosetHeightValue=70.0f;
    
    [self.BtnKitchenDoorClosetOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnKitchenDoorClosetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:29 :Ok];
    [self SetKitchenAllOk_Click];

}
- (IBAction)KitchenDoorClosetNotOK:(id)sender{

    self.ViewKitchenDoorClosetHeight.active = YES;
    self.ViewKitchenDoorClosetHeight.constant=300.0f;
    ViewKitchenDoorClosetHeightValue=300.0f;
    [self.BtnKitchenDoorClosetOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenDoorClosetNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:29 :NotOk];
    [self ResetKitchenAllOk_Click];

    
}

- (IBAction)KitchenCabinetFormicaTilesOK:(id)sender{

    self.ViewKitchenCabinetFormicaTilesHeight.active = YES;
    self.ViewKitchenCabinetFormicaTilesHeight.constant=70.0f;
    ViewKitchenCabinetFormicaTilesHeightValue=70.0f;
    
    [self.BtnKitchenCabinetFormicaTilesOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnKitchenCabinetFormicaTilesNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:30 :Ok];
    [self SetKitchenAllOk_Click];


}
- (IBAction)KitchenCabinetFormicaTilesNotOK:(id)sender{

    self.ViewKitchenCabinetFormicaTilesHeight.active = YES;
    self.ViewKitchenCabinetFormicaTilesHeight.constant=300.0f;
    ViewKitchenCabinetFormicaTilesHeightValue=300.0f;
    [self.BtnKitchenCabinetFormicaTilesOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenCabinetFormicaTilesNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:30 :NotOk];
    [self ResetKitchenAllOk_Click];

}

- (IBAction)BtnKitchenOtherOK:(id)sender{
    
    self.ViewKitchenOtherHeight.active = YES;
    self.ViewKitchenOtherHeight.constant=70.0f;
    ViewKitchenOtherHeightValue=70.0f;
    
    [self.BtnKitchenOtherOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnKitchenOtherNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:31 :Ok];
    [self SetKitchenAllOk_Click];


}
- (IBAction)BtnKitchenOtherNotOK:(id)sender{
    
    self.ViewKitchenOtherHeight.active = YES;
    self.ViewKitchenOtherHeight.constant=300.0f;
    ViewKitchenOtherHeightValue=300.0f;
    [self.BtnKitchenOtherOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnKitchenOtherNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:31 :NotOk];
    [self ResetKitchenAllOk_Click];



}
#pragma DiningROOM
- (IBAction)HallsWallsOutletstOK:(id)sender{
    
    self.ViewHallsWallsOutletstHeight.active = YES;
    self.ViewHallsWallsOutletstHeight.constant=70.0f;
    ViewHallsWallsOutletstHeightValue=70.0f;
    
    [self.BtnHallsWallsOutletstOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnHallsWallsOutletstNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:32 :Ok];
    [self SetHallsAllOk_Click];
    
    
}
- (IBAction)HallsWallsOutletstNotOK:(id)sender{
    
    self.ViewHallsWallsOutletstHeight.active = YES;
    self.ViewHallsWallsOutletstHeight.constant=300.0f;
    ViewHallsWallsOutletstHeightValue=300.0f;
    
    [self.BtnHallsWallsOutletstOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnHallsWallsOutletstNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:32 :NotOk];
    [self ResetHallsAllOk_Click];

}

- (IBAction)HallsCeilingsLightsOK:(id)sender{
    
    self.ViewHallsCeilingsLightsHeight.active = YES;
    self.ViewHallsCeilingsLightsHeight.constant=70.0f;
    ViewHallsCeilingsLightsHeightValue=70.0f;
    
    [self.BtnHallsCeilingsLightsOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnHallsCeilingsLightsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:33 :Ok];
    [self SetHallsAllOk_Click];

    
}
- (IBAction)HallsCeilingsLightsNotOK:(id)sender{
    
    self.ViewHallsCeilingsLightsHeight.active = YES;
    self.ViewHallsCeilingsLightsHeight.constant=300.0f;
    ViewHallsCeilingsLightsHeightValue=300.0f;
    
    [self.BtnHallsCeilingsLightsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnHallsCeilingsLightsNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:33 :NotOk];
    [self ResetHallsAllOk_Click];

    
}

- (IBAction)HallsFloorsCarpetOK:(id)sender{
    
    self.ViewHallsFloorsCarpetHeight.active = YES;
    self.ViewHallsFloorsCarpetHeight.constant=70.0f;
    ViewHallsFloorsCarpetHeightValue=70.0f;
    
    [self.BtnHallsFloorsCarpetOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnHallsFloorsCarpetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:34 :Ok];
    [self SetHallsAllOk_Click];

    
}
- (IBAction)HallsFloorsCarpetNotOK:(id)sender{
    
    self.ViewHallsFloorsCarpetHeight.active = YES;
    self.ViewHallsFloorsCarpetHeight.constant=300.0f;
    ViewHallsFloorsCarpetHeightValue=300.0f;
    
    [self.BtnHallsFloorsCarpetOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnHallsFloorsCarpetNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:34 :NotOk];
    [self ResetHallsAllOk_Click];
    
    
}

- (IBAction)BedroomsWallsOutletstOK:(id)sender{
    
    self.ViewBedroomsWallsOutletstHeight.active = YES;
    self.ViewBedroomsWallsOutletstHeight.constant=70.0f;
    ViewBedRoomWallsOutletstHeightValue=70.0f;
    
    [self.BtnBedroomsWallsOutletstOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnBedroomsWallsOutletstNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:35 :Ok];
    [self SetBedroomAllOk_Click];
    
    
}
- (IBAction)BedroomsWallsOutletstNotOK:(id)sender{
    
    self.ViewBedroomsWallsOutletstHeight.active = YES;
    self.ViewBedroomsWallsOutletstHeight.constant=300.0f;
    ViewBedRoomWallsOutletstHeightValue=300.0f;
    
    [self.BtnBedroomsWallsOutletstOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBedroomsWallsOutletstNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:35 :NotOk];
    [self ResetBedroomAllOk_Click];
    
}

- (IBAction)BedroomsCeilingsLightsOK:(id)sender{
    
    self.ViewBedroomsCeilingsLightsHeight.active = YES;
    self.ViewBedroomsCeilingsLightsHeight.constant=70.0f;
    ViewBedRoomCeilingsLightsHeightValue=70.0f;
    
    [self.BtnBedroomsCeilingsLightsOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnBedroomsCeilingsLightsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:36 :Ok];
    [self SetBedroomAllOk_Click];

    
    
}
- (IBAction)BedroomsCeilingsLightsNotOK:(id)sender{
    
    self.ViewBedroomsCeilingsLightsHeight.active = YES;
    self.ViewBedroomsCeilingsLightsHeight.constant=300.0f;
    ViewBedRoomCeilingsLightsHeightValue=300.0f;
    
    [self.BtnBedroomsCeilingsLightsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBedroomsCeilingsLightsNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:36 :NotOk];
    [self ResetBedroomAllOk_Click];

    
}

- (IBAction)BedroomsFloorsCarpetOK:(id)sender{
    
    self.ViewBedroomsFloorsCarpetHeight.active = YES;
    self.ViewBedroomsFloorsCarpetHeight.constant=70.0f;
    ViewBedRoomFloorsCarpetHeightValue=70.0f;
    
    [self.BtnBedroomsFloorsCarpetOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnBedroomsFloorsCarpetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:37 :Ok];
    [self SetBedroomAllOk_Click];

    
    
}
- (IBAction)BedroomsFloorsCarpetNotOK:(id)sender{
    
    self.ViewBedroomsFloorsCarpetHeight.active = YES;
    self.ViewBedroomsFloorsCarpetHeight.constant=300.0f;
    ViewBedRoomFloorsCarpetHeightValue=300.0f;
    
    [self.BtnBedroomsFloorsCarpetOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBedroomsFloorsCarpetNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:37 :NotOk];
    [self ResetBedroomAllOk_Click];

    
}

- (IBAction)BedroomsWindowOK:(id)sender{
    self.ViewBedroomsWindowHeight.active = YES;
    self.ViewBedroomsWindowHeight.constant=70.0f;
    ViewBedRoomWindowHeightValue=70.0f;
    
    [self.BtnBedroomsWindowOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnBedroomsWindowNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:38 :Ok];
    [self SetBedroomAllOk_Click];

    
}
- (IBAction)BedroomsWindowNotOK:(id)sender{
    
    self.ViewBedroomsWindowHeight.active = YES;
    self.ViewBedroomsWindowHeight.constant=300.0f;
    ViewBedRoomWindowHeightValue=300.0f;
    
    [self.BtnBedroomsWindowOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBedroomsWindowNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:38 :NotOk];
    [self ResetBedroomAllOk_Click];

}

- (IBAction)BedroomsWindowcoveringsOK:(id)sender{
    
    self.ViewBedroomsWindowcoveringsHeight.active = YES;
    self.ViewBedroomsWindowcoveringsHeight.constant=70.0f;
    ViewBedRoomWindowcoveringsHeightValue=70.0f;
    
    [self.BtnBedroomsWindowcoveringsOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnBedroomsWindowcoveringsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:39 :Ok];
    [self SetBedroomAllOk_Click];

    
}
- (IBAction)BedroomsWindowcoveringsNotOK:(id)sender{
    
    self.ViewBedroomsWindowcoveringsHeight.active = YES;
    self.ViewBedroomsWindowcoveringsHeight.constant=300.0f;
    ViewBedRoomWindowcoveringsHeightValue=300.0f;
    
    [self.BtnBedroomsWindowcoveringsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBedroomsWindowcoveringsNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:39 :NotOk];
    [self ResetBedroomAllOk_Click];

}

- (IBAction)BedroomsDoorClosetOK:(id)sender{
    
    self.ViewBedroomsDoorClosetHeight.active = YES;
    self.ViewBedroomsDoorClosetHeight.constant=70.0f;
    ViewBedRoomWindowcoveringsHeightValue=70.0f;
    
    [self.BtnBedroomsDoorClosetOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnBedroomsDoorClosetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:40 :Ok];
    [self SetBedroomAllOk_Click];

    
}
- (IBAction)BedroomsDoorClosetNotOK:(id)sender{
    
    self.ViewBedroomsDoorClosetHeight.active = YES;
    self.ViewBedroomsDoorClosetHeight.constant=300.0f;
    ViewBedRoomWindowcoveringsHeightValue=300.0f;
    [self.BtnBedroomsDoorClosetOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBedroomsDoorClosetNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:40 :NotOk];
    [self ResetBedroomAllOk_Click];

    
    
}


- (IBAction)BedroomsOtherOK:(id)sender{
    
    self.ViewBedroomsOtherHeight.active = YES;
    self.ViewBedroomsOtherHeight.constant=70.0f;
    ViewBedRoomOtherHeightValue=70.0f;
    [self.BtnBedroomsOtherOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnBedroomsOtherNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:41 :Ok];
    [self SetBedroomAllOk_Click];

    
    
}

- (IBAction)BedroomsOtherNotOK:(id)sender{
    
    self.ViewBedroomsOtherHeight.active = YES;
    self.ViewBedroomsOtherHeight.constant=300.0f;
    ViewBedRoomOtherHeightValue=300.0f;
    
    [self.BtnBedroomsOtherOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBedroomsOtherNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:41 :NotOk];
    [self ResetBedroomAllOk_Click];

    
    
}


- (IBAction)BathsWallsOutletstOK:(id)sender{
    
    self.ViewBathsWallsOutletsHeight.active = YES;
    self.ViewBathsWallsOutletsHeight.constant=70.0f;
    ViewBathsWallsOutletstHeightValue=70.0f;
    
    [self.BtnBathsWallsOutletstOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnBathsWallsOutletstNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:42 :Ok];
    [self SetBathsAllOk_Click];

    
    
    
}
- (IBAction)BathsWallsOutletstNotOK:(id)sender{

    self.ViewBathsWallsOutletsHeight.active = YES;
    self.ViewBathsWallsOutletsHeight.constant=300.0f;
    ViewBathsWallsOutletstHeightValue=300.0f;
    
    [self.BtnBathsWallsOutletstOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBathsWallsOutletstNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:42 :NotOk];
    [self ResetBathsAllOk_Click];


}

- (IBAction)BathsCeilingsLightsOK:(id)sender{

    self.ViewBathsCeilingsLightsHeight.active = YES;
    self.ViewBathsCeilingsLightsHeight.constant=70.0f;
    ViewBathsCeilingsLightsHeightValue=70.0f;
    
    [self.BtnBathsCeilingsLightsOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnBathsCeilingsLightsNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:43 :Ok];
    [self SetBathsAllOk_Click];

}
- (IBAction)BathsCeilingsLightsNotOK:(id)sender{

    self.ViewBathsCeilingsLightsHeight.active = YES;
    self.ViewBathsCeilingsLightsHeight.constant=300.0f;
    ViewBathsCeilingsLightsHeightValue=300.0f;
    
    [self.BtnBathsCeilingsLightsOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBathsCeilingsLightsNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:43 :NotOk];
    [self ResetBathsAllOk_Click];


}

- (IBAction)BathsFloorsCarpetOK:(id)sender{

    
    self.ViewBathsFloorsCarpetHeight.active = YES;
    self.ViewBathsFloorsCarpetHeight.constant=70.0f;
    ViewBathsFloorsCarpetHeightValue=70.0f;
    
    [self.BtnBathsFloorsCarpetOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnBathsFloorsCarpetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:44 :Ok];
    [self SetBathsAllOk_Click];


}
- (IBAction)BathsFloorsCarpetNotOK:(id)sender{

    self.ViewBathsFloorsCarpetHeight.active = YES;
    self.ViewBathsFloorsCarpetHeight.constant=300.0f;
    ViewBathsFloorsCarpetHeightValue=300.0f;
    
    [self.BtnBathsFloorsCarpetOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBathsFloorsCarpetNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:44 :NotOk];
    [self ResetBathsAllOk_Click];

}

- (IBAction)BathsFormicaTileOK:(id)sender{

    self.ViewBathsFormicaTileHeight.active = YES;
    self.ViewBathsFormicaTileHeight.constant=70.0f;
    ViewBathsFormicaTileHeightValue=70.0f;
    
    [self.BtnBathsFormicaTileOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnBathsFormicaTileNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:45 :Ok];
    [self SetBathsAllOk_Click];

    
    
}
- (IBAction)BathsFormicaTileNotOK:(id)sender{
    self.ViewBathsFormicaTileHeight.active = YES;
    self.ViewBathsFormicaTileHeight.constant=300.0f;
    ViewBathsFormicaTileHeightValue=300.0f;
    
    [self.BtnBathsFormicaTileOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBathsFormicaTileNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:45 :NotOk];
    [self ResetBathsAllOk_Click];

}

- (IBAction)BathsCabinetsMirrorOK:(id)sender{

    self.ViewBathsCabinetsMirrorHeight.active = YES;
    self.ViewBathsCabinetsMirrorHeight.constant=70.0f;
    ViewBathsCabinetsMirrorHeightValue=70.0f;
    
    [self.BtnBathsCabinetsMirrorOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnBathsCabinetsMirrorNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:46 :Ok];
    [self SetBathsAllOk_Click];

}
- (IBAction)BathsCabinetsMirrorNotOK:(id)sender{
    self.ViewBathsCabinetsMirrorHeight.active = YES;
    self.ViewBathsCabinetsMirrorHeight.constant=300.0f;
    ViewBathsCabinetsMirrorHeightValue=300.0f;
    
    [self.BtnBathsCabinetsMirrorOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBathsCabinetsMirrorNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:46 :NotOk];
    [self ResetBathsAllOk_Click];

}

- (IBAction)BathsWindowOK:(id)sender{

    self.ViewBathsWindowHeight.active = YES;
    self.ViewBathsWindowHeight.constant=70.0f;
    ViewBathsWindowHeightValue=70.0f;
    
    [self.BtnBathsWindowOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnBathsWindowNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:47 :Ok];
    [self SetBathsAllOk_Click];


}
- (IBAction)BathsWindowNotOK:(id)sender{

    self.ViewBathsWindowHeight.active = YES;
    self.ViewBathsWindowHeight.constant=300.0f;
    ViewBathsWindowHeightValue=300.0f;
    
    [self.BtnBathsWindowOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBathsWindowNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:47 :NotOk];
    [self ResetBathsAllOk_Click];

}

- (IBAction)BathsDoorClosetOK:(id)sender{

    self.ViewBathsDoorClosetHeight.active = YES;
    self.ViewBathsDoorClosetHeight.constant=70.0f;
    ViewBathsDoorClosetHeightValue=70.0f;
    
    [self.BtnBathsDoorClosetOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnBathsDoorClosetNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:48 :Ok];
    [self SetBathsAllOk_Click];

    
}
- (IBAction)BathsDoorClosetNotOK:(id)sender{

    self.ViewBathsDoorClosetHeight.active = YES;
    self.ViewBathsDoorClosetHeight.constant=300.0f;
    ViewBathsDoorClosetHeightValue=300.0f;
    
    [self.BtnBathsDoorClosetOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBathsDoorClosetNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:48 :NotOk];
    [self ResetBathsAllOk_Click];


}

- (IBAction)BathsOtherOK:(id)sender{

    self.ViewBathsOtherHeight.active = YES;
    self.ViewBathsOtherHeight.constant=70.0f;
    ViewBathsOtherHeightValue=70.0f;
    
    [self.BtnBathsOtherOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnBathsOtherNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:49 :Ok];
    [self SetBathsAllOk_Click];


}
- (IBAction)BathsOtherNotOK:(id)sender{

    self.ViewBathsOtherHeight.active = YES;
    self.ViewBathsOtherHeight.constant=300.0f;
    ViewBathsOtherHeightValue=300.0f;
    
    [self.BtnBathsOtherOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnBathsOtherNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:49 :NotOk];
    [self ResetBathsAllOk_Click];

}
//Uiview Misc Uiview UIBUTTONS Radio Buttons
- (IBAction)MiscSmokealarmOK:(id)sender{
    
    self.ViewMiscSmokealarmHeight.active = YES;
    self.ViewMiscSmokealarmHeight.constant=70.0f;
    ViewMiscSmokealarmHeightValue=70.0f;
    
    [self.BtnMiscSmokealarmOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnMiscSmokealarmNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:50 :Ok];
    [self SetMiscAllOk_Click];
    
}
- (IBAction)MiscSmokealarmNotOK:(id)sender{
    self.ViewMiscSmokealarmHeight.active = YES;
    self.ViewMiscSmokealarmHeight.constant=300.0f;
    ViewMiscSmokealarmHeightValue=300.0f;
    
    [self.BtnMiscSmokealarmOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnMiscSmokealarmNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:50 :NotOk];
    [self ResetMiscAllOk_Click];

}

- (IBAction)MiscFireextinguisherOK:(id)sender{
    
    self.ViewMiscFireextinguisherHeight.active = YES;
    self.ViewMiscFireextinguisherHeight.constant=70.0f;
    ViewMiscFireextinguisherHeightValue=70.0f;
    
    [self.BtnMiscFireextinguisherOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnMiscFireextinguisherNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:51 :Ok];
    [self SetMiscAllOk_Click];


    
}
- (IBAction)MiscFireextinguisherNotOK:(id)sender{
    
    self.ViewMiscFireextinguisherHeight.active = YES;
    self.ViewMiscFireextinguisherHeight.constant=300.0f;
    ViewMiscFireextinguisherHeightValue=300.0f;
    
    [self.BtnMiscFireextinguisherOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnMiscFireextinguisherNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:51 :NotOk];
    [self ResetMiscAllOk_Click];

}

- (IBAction)MiscScreensOK:(id)sender{
    
    self.ViewMiscScreensHeight.active = YES;
    self.ViewMiscScreensHeight.constant=70.0f;
    ViewMiscScreensHeightValue=70.0f;
    
    [self.BtnMiscScreensOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnMiscScreensNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:52 :Ok];
    [self SetMiscAllOk_Click];

    
}
- (IBAction)MiscScreensNotOK:(id)sender{
    self.ViewMiscScreensHeight.active = YES;
    self.ViewMiscScreensHeight.constant=300.0f;
    ViewMiscScreensHeightValue=300.0f;
    
    [self.BtnMiscScreensOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnMiscScreensNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:52 :NotOk];
    [self ResetMiscAllOk_Click];

}

- (IBAction)MiscHeatingACOK:(id)sender{
    
    self.ViewMiscHeatingACHeight.active = YES;
    self.ViewMiscHeatingACHeight.constant=70.0f;
    ViewMiscHeatingACHeightValue=70.0f;
    
    [self.BtnMiscHeatingACOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnMiscHeatingACNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:53 :Ok];
    [self SetMiscAllOk_Click];

    
}
- (IBAction)MiscHeatingACNotOK:(id)sender{
    self.ViewMiscHeatingACHeight.active = YES;
    self.ViewMiscHeatingACHeight.constant=300.0f;
    ViewMiscHeatingACHeightValue=300.0f;
    
    [self.BtnMiscHeatingACOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnMiscHeatingACNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:53 :NotOk];
    [self ResetMiscAllOk_Click];

}

- (IBAction)MiscOtherOK:(id)sender{
    
    self.ViewMiscOtherHeight.active = YES;
    self.ViewMiscOtherHeight.constant=70.0f;
    ViewMiscOtherHeightValue=70.0f;
    
    [self.BtnMiscOtherOK setImage:[UIImage imageNamed:@"ok-active"] forState:UIControlStateNormal];
    [self.BtnMiscOtherNotOK setImage:[UIImage imageNamed:@"not-ok-disable"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:54 :Ok];
    [self SetMiscAllOk_Click];

    
}
- (IBAction)MiscOtherNotOK:(id)sender{
    
    self.ViewMiscOtherHeight.active = YES;
    self.ViewMiscOtherHeight.constant=300.0f;
    ViewMiscOtherHeightValue=300.0f;
    
    [self.BtnMiscOtherOK setImage:[UIImage imageNamed:@"ok-disable"] forState:UIControlStateNormal];
    [self.BtnMiscOtherNotOK setImage:[UIImage imageNamed:@"not-ok-active"] forState:UIControlStateNormal];
    [self SetContainer];
    [self SetOKNOTOKData:54 :NotOk];
    [self ResetMiscAllOk_Click];

}


#pragma DININGEND
-(void)SetOKNOTOKData:(int)index :(NSString*)Status{
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    AddMoveInMoveOutServiceRequest *service_request= [app.arrAllData objectAtIndex:index];
    service_request.is_ok=Status;
    [app.arrAllData replaceObjectAtIndex:index withObject:service_request];
    
    
}
-(void)SetImageData:(UIButton *)activebutton :(UIImage*)Image{
    
    int index = 0;
    int sts =1;
    
    if(activebutton.tag==111){
        index=0;
        sts=1;
    }
    else if(activebutton.tag==112){
        index=0;
        sts=2;
    }
    if(activebutton.tag==121){
        index=1;
        sts=1;
    }
    else if(activebutton.tag==122){
        index=1;
        sts=2;
    }
    
    if(activebutton.tag==131){
        index=2;
        sts=1;
    }
    else if(activebutton.tag==132){
        index=2;
        sts=2;
    }
    if(activebutton.tag==141){
        index=3;
        sts=1;
    }
    else if(activebutton.tag==142){
        index=3;
        sts=2;
    }
    if(activebutton.tag==151){
        index=4;
        sts=1;
    }
    else if(activebutton.tag==152){
        index=4;
        sts=2;
    }
    
    if(activebutton.tag==211){
        index=5;
        sts=1;
    }
    else if(activebutton.tag==212){
        index=5;
        sts=2;
    }
    
    if(activebutton.tag==221){
        index=6;
        sts=1;
    }
    else if(activebutton.tag==222){
        index=6;
        sts=2;
    }
    if(activebutton.tag==231){
        index=7;
        sts=1;
    }
    else if(activebutton.tag==232){
        index=7;
        sts=2;
    }
    
    if(activebutton.tag==241){
        index=8;
        sts=1;
    }
    else if(activebutton.tag==242){
        index=8;
        sts=2;
    }

    if(activebutton.tag==251){
        index=9;
        sts=1;
    }
    else if(activebutton.tag==252){
        index=9;
        sts=2;
    }
    if(activebutton.tag==261){
        index=10;
        sts=1;
    }
    else if(activebutton.tag==262){
        index=10;
        sts=2;
    }
    if(activebutton.tag==271){
        index=11;
        sts=1;
    }
    else if(activebutton.tag==272){
        index=11;
        sts=2;
    }
    else if(activebutton.tag==311){
        index=12;
        sts=1;
    }
    else if(activebutton.tag==312){
        index=12;
        sts=2;
    }
    else if(activebutton.tag==321){
        index=13;
        sts=1;
    }
    else if(activebutton.tag==322){
        index=13;
        sts=2;
    }
    else if(activebutton.tag==331){
        index=14;
        sts=1;
    }
    else if(activebutton.tag==332){
        index=14;
        sts=2;
    }
    else if(activebutton.tag==341){
        index=15;
        sts=1;
    }
    else if(activebutton.tag==342){
        index=15;
        sts=2;
    }
    else if(activebutton.tag==351){
        index=16;
        sts=1;
    }
    else if(activebutton.tag==352){
        index=16;
        sts=2;
    }
    else if(activebutton.tag==361){
        index=17;
        sts=1;
    }
    else if(activebutton.tag==362){
        index=17;
        sts=2;
    }
    else if(activebutton.tag==411){
        index=18;
        sts=1;
    }
    else if(activebutton.tag==412){
        index=18;
        sts=2;
    }
    else if(activebutton.tag==421){
        index=19;
        sts=1;
    }
    else if(activebutton.tag==422){
        index=19;
        sts=2;
    }
    else if(activebutton.tag==431){
        index=20;
        sts=1;
    }
    else if(activebutton.tag==432){
        index=20;
        sts=2;
    }
    else if(activebutton.tag==441){
        index=21;
        sts=1;
    }
    else if(activebutton.tag==442){
        index=21;
        sts=2;
    }
    else if(activebutton.tag==451){
        index=22;
        sts=1;
    }
    else if(activebutton.tag==452){
        index=22;
        sts=2;
    }
    else if(activebutton.tag==461){
        index=23;
        sts=1;
    }
    else if(activebutton.tag==462){
        index=23;
        sts=2;
    }
    else if(activebutton.tag==471){
        index=24;
        sts=1;
    }
    else if(activebutton.tag==472){
        index=24;
        sts=2;
    }
    else if(activebutton.tag==481){
        index=25;
        sts=1;
    }
    else if(activebutton.tag==482){
        index=25;
        sts=2;
    }
    else if(activebutton.tag==491){
        index=26;
        sts=1;
    }
    else if(activebutton.tag==492){
        index=26;
        sts=2;
    }
    else if(activebutton.tag==4101){
        index=27;
        sts=1;
    }
    else if(activebutton.tag==4102){
        index=27;
        sts=2;
    }
    else if(activebutton.tag==4111){
        index=28;
        sts=1;
    }
    else if(activebutton.tag==4112){
        index=28;
        sts=2;
    }
    else if(activebutton.tag==4121){
        index=29;
        sts=1;
    }
    else if(activebutton.tag==4122){
        index=29;
        sts=2;
    }
    else if(activebutton.tag==4131){
        index=30;
        sts=1;
    }
    else if(activebutton.tag==4132){
        index=30;
        sts=2;
    }
    else if(activebutton.tag==4141){
        index=31;
        sts=1;
    }
    else if(activebutton.tag==4142){
        index=31;
        sts=2;
    }
    
    else if(activebutton.tag==511){
        index=32;
        sts=1;
    }
    else if(activebutton.tag==512){
        index=32;
        sts=2;
    }
    else if(activebutton.tag==521){
        index=33;
        sts=1;
    }
    else if(activebutton.tag==522){
        index=33;
        sts=2;
    }
    else if(activebutton.tag==531){
        index=34;
        sts=1;
    }
    else if(activebutton.tag==532){
        index=34;
        sts=2;
    }
    else if(activebutton.tag==611){
        index=35;
        sts=1;
    }
    else if(activebutton.tag==612){
        index=35;
        sts=2;
    }
    else if(activebutton.tag==621){
        index=36;
        sts=1;
    }
    else if(activebutton.tag==622){
        index=36;
        sts=2;
    }
    else if(activebutton.tag==631){
        index=37;
        sts=1;
    }
    else if(activebutton.tag==632){
        index=37;
        sts=2;
    }
    else if(activebutton.tag==641){
        index=38;
        sts=1;
    }
    else if(activebutton.tag==642){
        index=38;
        sts=2;
    }
    else if(activebutton.tag==651){
        index=39;
        sts=1;
    }
    else if(activebutton.tag==652){
        index=39;
        sts=2;
    }
    else if(activebutton.tag==661){
        index=40;
        sts=1;
    }
    else if(activebutton.tag==662){
        index=40;
        sts=2;
    }
    else if(activebutton.tag==671){
        index=41;
        sts=1;
    }
    else if(activebutton.tag==672){
        index=41;
        sts=2;
    }
    else if(activebutton.tag==711){
        index=42;
        sts=1;
    }
    else if(activebutton.tag==712){
        index=42;
        sts=2;
    }
    else if(activebutton.tag==721){
        index=43;
        sts=1;
    }
    else if(activebutton.tag==722){
        index=43;
        sts=2;
    }
    else if(activebutton.tag==731){
        index=44;
        sts=1;
    }
    else if(activebutton.tag==732){
        index=44;
        sts=2;
    }
    else if(activebutton.tag==741){
        index=45;
        sts=1;
    }
    else if(activebutton.tag==742){
        index=45;
        sts=2;
    }
    else if(activebutton.tag==751){
        index=46;
        sts=1;
    }
    else if(activebutton.tag==752){
        index=46;
        sts=2;
    }
    else if(activebutton.tag==761){
        index=47;
        sts=1;
    }
    else if(activebutton.tag==762){
        index=47;
        sts=2;
    }
    else if(activebutton.tag==771){
        index=48;
        sts=1;
    }
    else if(activebutton.tag==772){
        index=48;
        sts=2;
    }
    else if(activebutton.tag==781){
        index=49;
        sts=1;
    }
    else if(activebutton.tag==782){
        index=49;
        sts=2;
    }
    else if(activebutton.tag==811){
        index=50;
        sts=1;
    }
    else if(activebutton.tag==812){
        index=50;
        sts=2;
    }
    else if(activebutton.tag==821){
        index=51;
        sts=1;
    }
    else if(activebutton.tag==822){
        index=51;
        sts=2;
    }
    else if(activebutton.tag==831){
        index=52;
        sts=1;
    }
    else if(activebutton.tag==832){
        index=52;
        sts=2;
    }
    else if(activebutton.tag==841){
        index=53;
        sts=1;
    }
    else if(activebutton.tag==842){
        index=53;
        sts=2;
    }
    else if(activebutton.tag==851){
        index=54;
        sts=1;
    }
    else if(activebutton.tag==852){
        index=54;
        sts=2;
    }
    
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    AddMoveInMoveOutServiceRequest *service_request= [app.arrAllData objectAtIndex:index];
    if(sts==1){
        service_request.image1=[self encodeToBase64String:Image];;
    }
    else
    {
        service_request.image2=[self encodeToBase64String:Image];;

    }
    [app.arrAllData replaceObjectAtIndex:index withObject:service_request];
        
        
   
    
    
}
-(void)SetImageData:(int)index :(NSString*)Image :(NSString*)Parameter{
    if([Parameter isEqualToString:@"image1"]){
        
        AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        AddMoveInMoveOutServiceRequest *service_request= [app.arrAllData objectAtIndex:index];
        service_request.image1=Image;
        [app.arrAllData replaceObjectAtIndex:index withObject:service_request];

        
    }
    else
    {
        AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        AddMoveInMoveOutServiceRequest *service_request= [app.arrAllData objectAtIndex:index];
        service_request.image2=Image;
        [app.arrAllData replaceObjectAtIndex:index withObject:service_request];

    }
    
    
}
- (NSString *)encodeToBase64String:(UIImage *)image {
    
    
    image = [UIImage compressImage:image
                                        compressRatio:0.9f];
    
    return [UIImageJPEGRepresentation(image,1) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    int counterData=1;
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    MoveINViewController3 *three = segue.destinationViewController;
    three.moveInOutType=self.moveInOutType;
//    for (AddMoveInMoveOutServiceRequest *request in app.arrAllData){
    
    for (int a = 0;a<[app.arrAllData count];a++){

    
        AddMoveInMoveOutServiceRequest *request=[app.arrAllData objectAtIndex:a];
        
        if([request.is_ok isEqualToString:@"Not Ok"]){
            
           
            if(counterData==1){
                
                request.comment=self.TxtComment1.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges1.text;
                    
                }

            }
            else if(counterData==2){
                
                request.comment=self.TxtComment2.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges2.text;
                    
                }
            }
            else if(counterData==3){
                
                request.comment=self.TxtComment3.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges3.text;
                    
                }
            }
            else if(counterData==4){
                
                request.comment=self.TxtComment4.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges4.text;
                    
                }
            }
            else if(counterData==5){
                
                request.comment=self.TxtComment5.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges5.text;
                    
                }
            }
            else if(counterData==6){
                
                request.comment=self.TxtComment6.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges6.text;
                    
                }
            }
            else if(counterData==7){
                
                request.comment=self.TxtComment7.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges7.text;
                    
                }
            }
            else if(counterData==8){
                
                request.comment=self.TxtComment8.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges8.text;
                    
                }
            }
            else if(counterData==9){
                
                request.comment=self.TxtComment9.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges9.text;
                    
                }
            }
            else if(counterData==10){
                
                request.comment=self.TxtComment10.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges10.text;
                    
                }
            }
            else if(counterData==11){
                
                request.comment=self.TxtComment11.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges11.text;
                    
                }
            }
            else if(counterData==12){
                
                request.comment=self.TxtComment12.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges12.text;
                    
                }
            }
            else if(counterData==13){
                
                request.comment=self.TxtComment13.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges13.text;
                    
                }
            }
            else if(counterData==14){
                
                request.comment=self.TxtComment14.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges14.text;
                    
                }
            }
            else if(counterData==15){
                
                request.comment=self.TxtComment15.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges15.text;
                    
                }
            }
            else if(counterData==16){
                
                request.comment=self.TxtComment16.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges16.text;
                    
                }
            }
            else if(counterData==17){
                
                request.comment=self.TxtComment17.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges17.text;
                    
                }
            }
            else if(counterData==18){
                
                request.comment=self.TxtComment18.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges18.text;
                    
                }
            }
            else if(counterData==19){
                
                request.comment=self.TxtComment19.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges19.text;
                    
                }
            }
            else if(counterData==20){
                
                request.comment=self.TxtComment20.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges20.text;
                    
                }
            }
            else if(counterData==21){
                
                request.comment=self.TxtComment21.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges21.text;
                    
                }
            }
            else if(counterData==22){
                
                request.comment=self.TxtComment22.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges22.text;
                    
                }
            }
            else if(counterData==23){
                
                request.comment=self.TxtComment23.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges23.text;
                    
                }
            }
            else if(counterData==24){
                
                request.comment=self.TxtComment24.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges24.text;
                    
                }
            }
            else if(counterData==25){
                
                request.comment=self.TxtComment25.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges25.text;
                    
                }
            }
            else if(counterData==26){
                
                request.comment=self.TxtComment26.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges26.text;
                    
                }
            }
            else if(counterData==27){
                
                request.comment=self.TxtComment27.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges27.text;
                    
                }
            }
            else if(counterData==28){
                
                request.comment=self.TxtComment28.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges28.text;
                    
                }
            }
            else if(counterData==29){
                
                request.comment=self.TxtComment29.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges29.text;
                    
                }
                
            }
            else if(counterData==30){
                
                request.comment=self.TxtComment30.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges30.text;
                    
                }
            }
            else if(counterData==31){
                
                request.comment=self.TxtComment31.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges31.text;
                    
                }
            }
            else if(counterData==32){
                
                request.comment=self.TxtComment32.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges32.text;
                    
                }
            }
            else if(counterData==33){
                
                request.comment=self.TxtComment33.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges33.text;
                    
                }
            }
            else if(counterData==34){
                
                request.comment=self.TxtComment34.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges34.text;
                    
                }
            }
            else if(counterData==35){
                
                request.comment=self.TxtComment35.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges35.text;
                    
                }
            }
            else if(counterData==36){
                
                request.comment=self.TxtComment36.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges36.text;
                    
                }
            }
            else if(counterData==37){
                
                request.comment=self.TxtComment37.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges37.text;
                    
                }
            }
            else if(counterData==38){
                
                request.comment=self.TxtComment38.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges38.text;
                    
                }
            }
            else if(counterData==39){
                
                request.comment=self.TxtComment39.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges39.text;
                    
                }
            }
            else if(counterData==40){
                
                request.comment=self.TxtComment40.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges40.text;
                    
                }
            }
            else if(counterData==41){
                
                request.comment=self.TxtComment41.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges41.text;
                    
                }
            }
            else if(counterData==42){
                
                request.comment=self.TxtComment42.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges42.text;
                    
                }
            }
            else if(counterData==43){
                
                request.comment=self.TxtComment43.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges43.text;
                    
                }
            }
            else if(counterData==44){
                
                request.comment=self.TxtComment44.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges44.text;
                    
                }
            }
            else if(counterData==45){
                
                request.comment=self.TxtComment45.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges45.text;
                    
                }
            }
            else if(counterData==46){
                
                request.comment=self.TxtComment46.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges46.text;
                    
                }
            }
            else if(counterData==47){
                
                request.comment=self.TxtComment47.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges47.text;
                    
                }
            }
            else if(counterData==48){
                
                request.comment=self.TxtComment48.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges48.text;
                    
                }
            }
            else if(counterData==49){
                
                request.comment=self.TxtComment49.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges49.text;
                    
                }
            }
            else if(counterData==50){
                
                request.comment=self.TxtComment50.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges50.text;
                    
                }
            }
            else if(counterData==51){
                
                request.comment=self.TxtComment51.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges51.text;
                    
                }
            }
            else if(counterData==52){
                
                request.comment=self.TxtComment52.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges52.text;
                    
                }
            }
            else if(counterData==53){
                
                request.comment=self.TxtComment53.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges53.text;
                    
                }
            }
            else if(counterData==54){
                
                request.comment=self.TxtComment54.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges54.text;
                    
                }
            }else if(counterData==55){
                
                request.comment=self.TxtComment55.text;
                if([self.moveInOutType isEqualToString:@"move-out"]){
                    
                    request.charges=self.TxtCharges55.text;
                    
                }
            }
            if([request.comment isEqualToString:@"Please add Comment"]){
                
            request.comment=@"";
            }
            [app.arrAllData replaceObjectAtIndex:a withObject:request];

        
            
        }
        counterData++;
    }

    
}

/*
 

 */
-(void)HideAllCharges{
    self.ViewCharges1.hidden=YES;
    self.ViewCharges2.hidden=YES;
    self.ViewCharges3.hidden=YES;
    self.ViewCharges4.hidden=YES;

    self.ViewCharges5.hidden=YES;

    self.ViewCharges6.hidden=YES;

    self.ViewCharges7.hidden=YES;

    self.ViewCharges8.hidden=YES;
    self.ViewCharges9.hidden=YES;
    self.ViewCharges10.hidden=YES;
    self.ViewCharges11.hidden=YES;
    self.ViewCharges12.hidden=YES;
    self.ViewCharges13.hidden=YES;
    self.ViewCharges14.hidden=YES;
    self.ViewCharges15.hidden=YES;
    self.ViewCharges16.hidden=YES;
    self.ViewCharges17.hidden=YES;
    self.ViewCharges18.hidden=YES;
    self.ViewCharges19.hidden=YES;
    self.ViewCharges20.hidden=YES;
    self.ViewCharges21.hidden=YES;
    self.ViewCharges22.hidden=YES;
    self.ViewCharges23.hidden=YES;
    self.ViewCharges24.hidden=YES;
    self.ViewCharges25.hidden=YES;
    self.ViewCharges26.hidden=YES;
    self.ViewCharges27.hidden=YES;
    self.ViewCharges28.hidden=YES;
    self.ViewCharges29.hidden=YES;
    self.ViewCharges30.hidden=YES;
    self.ViewCharges31.hidden=YES;
    self.ViewCharges32.hidden=YES;
    self.ViewCharges33.hidden=YES;
    self.ViewCharges34.hidden=YES;
    self.ViewCharges35.hidden=YES;
    self.ViewCharges36.hidden=YES;
    self.ViewCharges37.hidden=YES;
    self.ViewCharges38.hidden=YES;
    self.ViewCharges39.hidden=YES;
    self.ViewCharges40.hidden=YES;
    self.ViewCharges41.hidden=YES;
    self.ViewCharges42.hidden=YES;
    self.ViewCharges43.hidden=YES;
    self.ViewCharges44.hidden=YES;
    self.ViewCharges45.hidden=YES;
    self.ViewCharges46.hidden=YES;
    self.ViewCharges47.hidden=YES;
    self.ViewCharges48.hidden=YES;
    self.ViewCharges49.hidden=YES;
    self.ViewCharges50.hidden=YES;
    self.ViewCharges51.hidden=YES;
    self.ViewCharges52.hidden=YES;
    self.ViewCharges53.hidden=YES;
    self.ViewCharges54.hidden=YES;
    self.ViewCharges55.hidden=YES;


    
}
-(void)ShowAllCharges{
    self.ViewCharges1.hidden=NO;
    self.ViewCharges2.hidden=NO;
    self.ViewCharges3.hidden=NO;
    self.ViewCharges4.hidden=NO;
    
    self.ViewCharges5.hidden=NO;
    
    self.ViewCharges6.hidden=NO;
    
    self.ViewCharges7.hidden=NO;
    
    self.ViewCharges8.hidden=NO;
    self.ViewCharges9.hidden=NO;
    self.ViewCharges10.hidden=NO;
    self.ViewCharges11.hidden=NO;
    self.ViewCharges12.hidden=NO;
    self.ViewCharges13.hidden=NO;
    self.ViewCharges14.hidden=NO;
    self.ViewCharges15.hidden=NO;
    self.ViewCharges16.hidden=NO;
    self.ViewCharges17.hidden=NO;
    self.ViewCharges18.hidden=NO;
    self.ViewCharges19.hidden=NO;
    self.ViewCharges20.hidden=NO;
    self.ViewCharges21.hidden=NO;
    self.ViewCharges22.hidden=NO;
    self.ViewCharges23.hidden=NO;
    self.ViewCharges24.hidden=NO;
    self.ViewCharges25.hidden=NO;
    self.ViewCharges26.hidden=NO;
    self.ViewCharges27.hidden=NO;
    self.ViewCharges28.hidden=NO;
    self.ViewCharges29.hidden=NO;
    self.ViewCharges30.hidden=NO;
    self.ViewCharges31.hidden=NO;
    self.ViewCharges32.hidden=NO;
    self.ViewCharges33.hidden=NO;
    self.ViewCharges34.hidden=NO;
    self.ViewCharges35.hidden=NO;
    self.ViewCharges36.hidden=NO;
    self.ViewCharges37.hidden=NO;
    self.ViewCharges38.hidden=NO;
    self.ViewCharges39.hidden=NO;
    self.ViewCharges40.hidden=NO;
    self.ViewCharges41.hidden=NO;
    self.ViewCharges42.hidden=NO;
    self.ViewCharges43.hidden=NO;
    self.ViewCharges44.hidden=NO;
    self.ViewCharges45.hidden=NO;
    self.ViewCharges46.hidden=NO;
    self.ViewCharges47.hidden=NO;
    self.ViewCharges48.hidden=NO;
    self.ViewCharges49.hidden=NO;
    self.ViewCharges50.hidden=NO;
    self.ViewCharges51.hidden=NO;
    self.ViewCharges52.hidden=NO;
    self.ViewCharges53.hidden=NO;
    self.ViewCharges54.hidden=NO;
    self.ViewCharges55.hidden=NO;
    
    
    
}
-(void)ResetCleanLinessAllOk_Click{
    
    self.ImgCleanilessAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
    CleanLinessAllOk=NO;

}
-(void)SetCleanLinessAllOk_Click{
    
   // self.ImgCleanilessAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
    //CleanLinessAllOk=NO;
    BOOL bb =YES;
    for(int i = 0;i<5;i++){
        
        AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        AddMoveInMoveOutServiceRequest *service_request= [app.arrAllData objectAtIndex:i];
        if(![service_request.is_ok isEqualToString:@"Ok"]){
            
            bb=NO;
            break;
        }

    }
    if(bb){
        self.ImgCleanilessAllokcheck.image=[UIImage imageNamed:@"check-box-active.png"];
        CleanLinessAllOk=YES;

    }
    else
    {
        self.ImgCleanilessAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
        CleanLinessAllOk=NO;

    }
    
}
- (IBAction)CleanLinessAllOk_Click:(id)sender {
    [self Close];
    self.LastActiveTextField = self.TxtCleanliness;
    [self ResetAllCleanliness];
    if(CleanLinessAllOk){
        
        self.ImgCleanilessAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
        CleanLinessAllOk=NO;
        [self SetAllCleanlinessValue];
        [self OpenCleaniless];
        [self SetOKNOTOKData:0 :@""];
        [self SetOKNOTOKData:1 :@""];
        [self SetOKNOTOKData:2 :@""];
        [self SetOKNOTOKData:3 :@""];
        [self SetOKNOTOKData:4 :@""];


    }
    else
    {
        self.ImgCleanilessAllokcheck.image=[UIImage imageNamed:@"check-box-active.png"];
        CleanLinessAllOk=YES;
//        [self SetAllOkCleanliness];
//        [self SetOKNOTOKData:0 :Ok];
//        [self SetOKNOTOKData:1 :Ok];
//        [self SetOKNOTOKData:2 :Ok];
//        [self SetOKNOTOKData:3 :Ok];
//        [self SetOKNOTOKData:4 :Ok];
        
        [self OpenCleaniless];

        [self CleanlinessSweptOK:@""];
        [self CleanlinessClosestOK:@""];
        [self CleanlinessFrigStoveOK:@""];
        [self CleanlinessNopersonalitemsOK:@""];
        [self CleanlinessOtherOK:@""];

        



    }

}
-(void)ResetLivingRoomAllOk_Click{
    
    self.ImgLivingRoomAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
    LivingRoomAllOk=NO;
    
}
-(void)SetLivingRoomAllOk_Click{
    
    // self.ImgCleanilessAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
    //CleanLinessAllOk=NO;
    BOOL bb =YES;
    for(int i = 5;i<12;i++){
        
        AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        AddMoveInMoveOutServiceRequest *service_request= [app.arrAllData objectAtIndex:i];
        if(![service_request.is_ok isEqualToString:@"Ok"]){
            
            bb=NO;
            break;
        }
        
    }
    if(bb){
        self.ImgLivingRoomAllokcheck.image=[UIImage imageNamed:@"check-box-active.png"];
        LivingRoomAllOk=YES;
        
    }
    else
    {
        self.ImgLivingRoomAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
        LivingRoomAllOk=NO;
        
    }
    
}

- (IBAction)LivingRoomAllOk_Click:(id)sender
{
    [self Close];
    self.LastActiveTextField = self.TxtLivingRoom;
    [self ResetAllLivingRoom];
    if(LivingRoomAllOk){
        
        self.ImgLivingRoomAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
        LivingRoomAllOk=NO;
        [self SetAllLeavingRoomValue];
        [self OpenLivingRoom];
        [self SetOKNOTOKData:5 :@""];
        [self SetOKNOTOKData:6 :@""];
        [self SetOKNOTOKData:7 :@""];
        [self SetOKNOTOKData:8 :@""];
        [self SetOKNOTOKData:9 :@""];
        [self SetOKNOTOKData:10 :@""];
        [self SetOKNOTOKData:11 :@""];

        
    }
    else
    {
        self.ImgLivingRoomAllokcheck.image=[UIImage imageNamed:@"check-box-active.png"];
        LivingRoomAllOk=YES;
        [self OpenLivingRoom];
        
        [self LivingRoomWallsOutletstOK:@""];
        [self LivingRoomCeilingsLightsOK:@""];
        [self LivingRoomFloorsCarpetOK:@""];
        [self LivingRoomWindowOK:@""];
        [self LivingRoomWindowcoveringsOK:@""];
        [self LivingRoomDoorClosetOK:@""];
        [self LivingRoomOtherOK:@""];

        
        
        
    }
}
-(void)ResetDiningRoomAllOk_Click{
    
    self.ImgDiningRoomAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
    DiningRoomAllOk=NO;
    
}
-(void)SetDiningRoomAllOk_Click{
    
    // self.ImgCleanilessAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
    //CleanLinessAllOk=NO;
    BOOL bb =YES;
    for(int i = 12;i<18;i++){
        
        AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        AddMoveInMoveOutServiceRequest *service_request= [app.arrAllData objectAtIndex:i];
        if(![service_request.is_ok isEqualToString:@"Ok"]){
            
            bb=NO;
            break;
        }
        
    }
    if(bb){
        self.ImgDiningRoomAllokcheck.image=[UIImage imageNamed:@"check-box-active.png"];
        DiningRoomAllOk=YES;
        
    }
    else
    {
        self.ImgDiningRoomAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
        DiningRoomAllOk=NO;
        
    }
    
}

- (IBAction)DiningRoomAllOk_Click:(id)sender{

    
    [self Close];
    self.LastActiveTextField = self.TxtDiningRoom;
    [self ResetAllDiningRoom];
    if(DiningRoomAllOk){
        
        self.ImgDiningRoomAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
        DiningRoomAllOk=NO;
        [self SetAllDiningRoomValue];
        [self OpenDiningRoom];
        [self SetOKNOTOKData:12 :@""];
        [self SetOKNOTOKData:13 :@""];
        [self SetOKNOTOKData:14 :@""];
        [self SetOKNOTOKData:15 :@""];
        [self SetOKNOTOKData:16 :@""];
        [self SetOKNOTOKData:17 :@""];
        
        
    }
    else
    {
        self.ImgDiningRoomAllokcheck.image=[UIImage imageNamed:@"check-box-active.png"];
        DiningRoomAllOk=YES;
        [self OpenDiningRoom];
        
        [self DiningRoomWallsOutletstOK:@""];
        [self DiningRoomCeilingsLightsOK:@""];
        [self DiningRoomFloorsCarpetOK:@""];
        [self DiningRoomWindowOK:@""];
        [self DiningRoomWindowcoveringsOK:@""];
        [self DiningRoomDoorClosetOK:@""];
        
        
        
        
    }

    
    
  

}
-(void)ResetKitchenAllOk_Click{
    
    self.ImgKitchenAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
    KitchenAllOk=NO;
    
}
-(void)SetKitchenAllOk_Click{
    
    // self.ImgCleanilessAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
    //CleanLinessAllOk=NO;
    BOOL bb =YES;
    for(int i = 18;i<32;i++){
        
        AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        AddMoveInMoveOutServiceRequest *service_request= [app.arrAllData objectAtIndex:i];
        if(![service_request.is_ok isEqualToString:@"Ok"]){
            
            bb=NO;
            break;
        }
        
    }
    if(bb){
        self.ImgKitchenAllokcheck.image=[UIImage imageNamed:@"check-box-active.png"];
        KitchenAllOk=YES;
        
    }
    else
    {
        self.ImgKitchenAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
        KitchenAllOk=NO;
        
    }
    
}
- (IBAction)KitchenAllOk_Click:(id)sender{

    [self Close];
    self.LastActiveTextField = self.TxtKitchen;
    [self ResetAllKitchen];
    if(KitchenAllOk){
        
        self.ImgKitchenAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
        KitchenAllOk=NO;
        [self SetAllKitchen];
        [self OpenKitchen];
        [self SetOKNOTOKData:18 :@""];
        [self SetOKNOTOKData:19 :@""];
        [self SetOKNOTOKData:20 :@""];
        [self SetOKNOTOKData:21 :@""];
        [self SetOKNOTOKData:22 :@""];
        [self SetOKNOTOKData:23 :@""];
        [self SetOKNOTOKData:24 :@""];
        [self SetOKNOTOKData:25 :@""];
        [self SetOKNOTOKData:26 :@""];
        [self SetOKNOTOKData:27 :@""];
        [self SetOKNOTOKData:28 :@""];
        [self SetOKNOTOKData:29 :@""];
        [self SetOKNOTOKData:30 :@""];
        [self SetOKNOTOKData:31 :@""];

        
    }
    else
    {
        self.ImgKitchenAllokcheck.image=[UIImage imageNamed:@"check-box-active.png"];
        KitchenAllOk=YES;
        [self OpenKitchen];
        
        [self KitchenRefrigeratorOK:@""];
        [self KitchenMicrowaveOK:@""];
        [self KitchenWasherdryerOK:@""];
        [self KitchenVenthoodOK:@""];
        [self KitchenDishwasherDisposalOK:@""];
        [self KitchenWallsOutletsOK:@""];
        [self KitchenCeilingsLightsOK:@""];
        [self KitchenFloorsCarpetOK:@""];
        [self KitchenWindowOK:@""];
        [self KitchenWindowcoveringsOK:@""];
        [self KitchenCountertopOK:@""];
        [self KitchenDoorClosetOK:@""];
        [self KitchenCabinetFormicaTilesOK:@""];
        [self BtnKitchenOtherOK:@""];

        
        
        
        
        
        
    }



}
-(void)ResetHallsAllOk_Click{
    
    self.ImgHallsAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
    HallsAllOk=NO;
    
}
-(void)SetHallsAllOk_Click{
    
    // self.ImgCleanilessAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
    //CleanLinessAllOk=NO;
    BOOL bb =YES;
    for(int i = 32;i<35;i++){
        
        AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        AddMoveInMoveOutServiceRequest *service_request= [app.arrAllData objectAtIndex:i];
        if(![service_request.is_ok isEqualToString:@"Ok"]){
            
            bb=NO;
            break;
        }
        
    }
    if(bb){
        self.ImgHallsAllokcheck.image=[UIImage imageNamed:@"check-box-active.png"];
        HallsAllOk=YES;
        
    }
    else
    {
        self.ImgHallsAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
        HallsAllOk=NO;
        
    }
    
}
- (IBAction)HallsAllOk_Click:(id)sender{
    
    [self Close];
    self.LastActiveTextField = self.TxtHalls;
    [self ResetAllHalls];
    if(HallsAllOk){
        
        self.ImgHallsAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
        HallsAllOk=NO;
        [self SetAllHallsValue];
        [self OpenHalls];
        [self SetOKNOTOKData:32 :@""];
        [self SetOKNOTOKData:33 :@""];
        [self SetOKNOTOKData:34 :@""];
        
        
    }
    else
    {
        self.ImgHallsAllokcheck.image=[UIImage imageNamed:@"check-box-active.png"];
        HallsAllOk=YES;
        [self OpenHalls];
        
        [self HallsWallsOutletstOK:@""];
        [self HallsCeilingsLightsOK:@""];
        [self HallsFloorsCarpetOK:@""];
        
        
        
        
        
        
    }
    

}
-(void)ResetBedroomAllOk_Click{
    
    self.ImgBedroomAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
    BedroomAllOk=NO;
    
}
-(void)SetBedroomAllOk_Click{
    
    // self.ImgCleanilessAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
    //CleanLinessAllOk=NO;
    BOOL bb =YES;
    for(int i = 35;i<42;i++){
        
        AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        AddMoveInMoveOutServiceRequest *service_request= [app.arrAllData objectAtIndex:i];
        if(![service_request.is_ok isEqualToString:@"Ok"]){
            
            bb=NO;
            break;
        }
        
    }
    if(bb){
        self.ImgBedroomAllokcheck.image=[UIImage imageNamed:@"check-box-active.png"];
        BedroomAllOk=YES;
        
    }
    else
    {
        self.ImgBedroomAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
        BedroomAllOk=NO;
        
    }
    
}
- (IBAction)BedroomAllOk_Click:(id)sender{

    [self Close];
    self.LastActiveTextField = self.TxtBedrooms;
    [self ResetAllBedrooms];
    if(BedroomAllOk){
        
        self.ImgBedroomAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
        BedroomAllOk=NO;
        [self SetAllBedroomsValue];
        [self OpenBedrooms];
        [self SetOKNOTOKData:35 :@""];
        [self SetOKNOTOKData:36 :@""];
        [self SetOKNOTOKData:37 :@""];
        [self SetOKNOTOKData:38 :@""];
        [self SetOKNOTOKData:39 :@""];
        [self SetOKNOTOKData:40 :@""];
        [self SetOKNOTOKData:41 :@""];
        
        
    }
    else
    {
        self.ImgBedroomAllokcheck.image=[UIImage imageNamed:@"check-box-active.png"];
        BedroomAllOk=YES;
        [self OpenBedrooms];
        
        [self BedroomsWallsOutletstOK:@""];
        [self BedroomsCeilingsLightsOK:@""];
        [self BedroomsFloorsCarpetOK:@""];
        [self BedroomsWindowOK:@""];
        [self BedroomsWindowcoveringsOK:@""];
        [self BedroomsDoorClosetOK:@""];
        [self BedroomsOtherOK:@""];
        
        
        
        
        
        
    }
    


}
-(void)ResetBathsAllOk_Click{
    
    self.ImgBathsAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
    BathsAllOk=NO;
    
}
-(void)SetBathsAllOk_Click{
    
    // self.ImgCleanilessAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
    //CleanLinessAllOk=NO;
    BOOL bb =YES;
    for(int i = 42;i<50;i++){
        
        AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        AddMoveInMoveOutServiceRequest *service_request= [app.arrAllData objectAtIndex:i];
        if(![service_request.is_ok isEqualToString:@"Ok"]){
            
            bb=NO;
            break;
        }
        
    }
    if(bb){
        self.ImgBathsAllokcheck.image=[UIImage imageNamed:@"check-box-active.png"];
        BathsAllOk=YES;
        
    }
    else
    {
        self.ImgBathsAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
        BathsAllOk=NO;
        
    }
    
}
- (IBAction)BathsAllOk_Click:(id)sender{


    [self Close];
    self.LastActiveTextField = self.TxtBaths;
    [self ResetAllBaths];
    if(BathsAllOk){
        
        self.ImgBathsAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
        BathsAllOk=NO;
        [self SetAllBathsValue];
        [self OpenBaths];
        [self SetOKNOTOKData:42 :@""];
        [self SetOKNOTOKData:43 :@""];
        [self SetOKNOTOKData:44 :@""];
        [self SetOKNOTOKData:45 :@""];
        [self SetOKNOTOKData:46 :@""];
        [self SetOKNOTOKData:47 :@""];
        [self SetOKNOTOKData:48 :@""];
        [self SetOKNOTOKData:49 :@""];

        
    }
    else
    {
        self.ImgBathsAllokcheck.image=[UIImage imageNamed:@"check-box-active.png"];
        BathsAllOk=YES;
        [self OpenBaths];
        
        [self BathsWallsOutletstOK:@""];
        [self BathsCeilingsLightsOK:@""];
        [self BathsFloorsCarpetOK:@""];
        [self BathsFormicaTileOK:@""];
        [self BathsCabinetsMirrorOK:@""];
        [self BathsWindowOK:@""];
        [self BathsDoorClosetOK:@""];
        [self BathsOtherOK:@""];

        
        
        
        
    }

}
-(void)ResetMiscAllOk_Click{
    
    self.ImgMiscAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
    MiscAllOk=NO;
    
}
-(void)SetMiscAllOk_Click{
    
    // self.ImgCleanilessAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
    //CleanLinessAllOk=NO;
    BOOL bb =YES;
    for(int i = 50;i<55;i++){
        
        AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        AddMoveInMoveOutServiceRequest *service_request= [app.arrAllData objectAtIndex:i];
        if(![service_request.is_ok isEqualToString:@"Ok"]){
            
            bb=NO;
            break;
        }
        
    }
    if(bb){
        self.ImgMiscAllokcheck.image=[UIImage imageNamed:@"check-box-active.png"];
        MiscAllOk=YES;
        
    }
    else
    {
        self.ImgMiscAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
        MiscAllOk=NO;
        
    }
    
}

- (IBAction)MiscAllOk_Click:(id)sender{

    [self Close];
    self.LastActiveTextField = self.TxtMisc;
    [self ResetAllMisc];
    if(MiscAllOk){
        
        self.ImgMiscAllokcheck.image=[UIImage imageNamed:@"check-box-disable.png"];
        MiscAllOk=NO;
        [self SetAllMiscValue];
        [self OpenMisc];
        [self SetOKNOTOKData:50 :@""];
        [self SetOKNOTOKData:51 :@""];
        [self SetOKNOTOKData:52 :@""];
        [self SetOKNOTOKData:53 :@""];
        [self SetOKNOTOKData:54 :@""];
        
        
    }
    else
    {
        self.ImgMiscAllokcheck.image=[UIImage imageNamed:@"check-box-active.png"];
        MiscAllOk=YES;
        [self OpenMisc];
        
        [self MiscSmokealarmOK:@""];
        [self MiscFireextinguisherOK:@""];
        [self MiscScreensOK:@""];
        [self MiscHeatingACOK:@""];
        [self MiscOtherOK:@""];

        
        
        
    }



}
- (IBAction)ShowPrice:(UIButton*)sender{
    
    
    [self GetParentIDandChildID:sender.tag andCompletionHandler:^(NSString *_id, NSString *_cid,UITextField *ActiveTextField) {
        
       
        self.ActiveTextField=ActiveTextField;
        
        self.arrChoices = [[NSMutableArray alloc]init];
        
        [self.arrChoices addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                    @"Clean",@"Choices",@"$ 100",@"Price", nil]];
        [self.arrChoices addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                    @"Repair",@"Choices",@"$ 200",@"Price", nil]];
        [self.arrChoices addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                    @"Replace",@"Choices",@"$ 300",@"Price", nil]];
        
        [self showSelectionVCForOpponents:self.arrChoices];

        
        
    }];
    
    
    
    
    
    
}


-(void)showSelectionVCForOpponents:(NSMutableArray*)arrvalue{
    
    
    SLSelectionViewController *aWSelectionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SLSelectionViewController"];
    
    
    aWSelectionViewController.itemList =arrvalue;//arrLevels; //list to display
    aWSelectionViewController.displayItemKey = @"Choices"; //key of value to display
    aWSelectionViewController.subtitleDisplayItemKey =@"Price";// @"coachID"; //key of value to display
    aWSelectionViewController.delegate  = self;
    aWSelectionViewController.titleForSelection = @"Select";
    [self presentViewController:aWSelectionViewController animated:YES completion:nil];
    
    
    
    
    
    
}

-(void)didSelectItem:(MoveInMoveOutBaseModel *)selectedItem{
    
    
            self.ActiveTextField.text=[selectedItem valueForKey:@"Price"];
            self.ActiveTextField=nil;
    
    
    
    
    
    
    // matchNoteToAdd.opponent = opponent.displayName;
}


-(void)GetParentIDandChildID:(int)_tag andCompletionHandler:(void (^)(NSString *_id,NSString *_cid,UITextField *ActiveTextField))completionHandler{
    
    if(_tag==112){
        
        completionHandler(@"1",@"12",self.TxtCharges1);
    }
    else if(_tag==113){
        
        completionHandler(@"1",@"13",self.TxtCharges2);
    }
    else if(_tag==114){
        
        completionHandler(@"1",@"14",self.TxtCharges3);
    }
    else if(_tag==115){
        
        completionHandler(@"1",@"15",self.TxtCharges4);
    }
    else if(_tag==116){
        
        completionHandler(@"1",@"16",self.TxtCharges5);
    }


}

















@end
