//
//  ViewController.h
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "UIImage+ImageCompress.h"
#import "SLSelectionViewController.h"

@interface MoveINViewController2 : UIViewController<UITextFieldDelegate,UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,SLSelectionDelegate>
{
    float ViewCleanlinessContainerHeightValue,ViewCleanlinessClosetsHeightValue;
    
    float ViewCleanlinessFrigStoveHeightValue,ViewCleanlinessNopersonalitemsHeightValue;

    float ViewCleanlinessOtherHeightValue;

    float ViewLivingRoomWallsOutletstHeightValue,ViewLivingRoomCeilingMoveInMoveOutightsHeightValue;
    float ViewLivingRoomFloorsCarpetHeightValue,ViewLivingRoomWindowHeightValue;
    float ViewLivingRoomWindowcoveringsHeightValue,ViewLivingRoomDoorClosetHeightValue;
    float ViewLivingRoomOtherHeightValue;

    
    float ViewDiningRoomWallsOutletstHeightValue,ViewDiningRoomCeilingMoveInMoveOutightsHeightValue;
    float ViewDiningRoomFloorsCarpetHeightValue,ViewDiningRoomWindowHeightValue;
    float ViewDiningRoomWindowcoveringsHeightValue,ViewDiningRoomDoorClosetHeightValue;
    float ViewDiningRoomOtherHeightValue;

    
    float ViewKitchenRefrigeratorHeightValue;
    float ViewKitchenMicrowaveHeightValue;
    float ViewKitchenWasherdryerHeightValue;
    float ViewKitchenRangeVenthoodHeightValue;
    float ViewKitchenDishwasherDisposalHeightValue;
    float ViewKitchenWallsOutletstHeightValue;
    float ViewKitchenCeilingsLightsHeightValue;
    float ViewKitchenFloorsCarpetHeightValue;
    float ViewKitchenWindowHeightValue;
    float ViewKitchenWindowcoveringsHeightValue;
    float ViewKitchenCountertopHeightValue;
    float ViewKitchenDoorClosetHeightValue;
    float ViewKitchenCabinetFormicaTilesHeightValue;
    float ViewKitchenOtherHeightValue;


    float ViewHallsWallsOutletstHeightValue,ViewHallsCeilingsLightsHeightValue;
    float ViewHallsFloorsCarpetHeightValue;

    

    float ViewBedRoomWallsOutletstHeightValue,ViewBedRoomCeilingsLightsHeightValue;
    float ViewBedRoomFloorsCarpetHeightValue,ViewBedRoomWindowHeightValue;
    float ViewBedRoomWindowcoveringsHeightValue,ViewBedRoomDoorClosetHeightValue;
    float ViewBedRoomOtherHeightValue;

    
    float ViewBathsWallsOutletstHeightValue;
    float ViewBathsCeilingsLightsHeightValue;
    float ViewBathsFloorsCarpetHeightValue;
    float ViewBathsFormicaTileHeightValue;
    float ViewBathsCabinetsMirrorHeightValue;
    float ViewBathsWindowHeightValue;
    float ViewBathsDoorClosetHeightValue;
    float ViewBathsOtherHeightValue;

    float ViewMiscSmokealarmHeightValue;
    float ViewMiscFireextinguisherHeightValue;
    float ViewMiscScreensHeightValue;
    float ViewMiscHeatingACHeightValue;
    float ViewMiscOtherHeightValue;



    
    
    
    
    BOOL CleanLinessAllOk;
    BOOL LivingRoomAllOk;
    BOOL DiningRoomAllOk;
    BOOL KitchenAllOk;
    BOOL HallsAllOk;
    BOOL BedroomAllOk;
    BOOL BathsAllOk;
    BOOL MiscAllOk;

    
    
    

    
    
}
- (IBAction)CleanLinessAllOk_Click:(id)sender;
- (IBAction)LivingRoomAllOk_Click:(id)sender;
- (IBAction)DiningRoomAllOk_Click:(id)sender;
- (IBAction)KitchenAllOk_Click:(id)sender;
- (IBAction)HallsAllOk_Click:(id)sender;
- (IBAction)BedroomAllOk_Click:(id)sender;
- (IBAction)BathsAllOk_Click:(id)sender;
- (IBAction)MiscAllOk_Click:(id)sender;

@property(nonatomic,retain)NSString *moveInOutType;
- (IBAction)GoBack:(id)sender;
- (IBAction)AttachPhoto:(id)sender;
- (IBAction)ShowPrice:(UIButton*)sender;

@end

