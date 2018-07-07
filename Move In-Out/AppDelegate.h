//
//  AppDelegate.h
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddMoveInMoveOutRequest.h"
#import "MoveInMoveOutBaseResponse.h"
#import "AddPreventionRequest.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,retain)NSMutableArray *arrAllData;
@property(nonatomic,retain)AddMoveInMoveOutRequest *addRequest;
@property(nonatomic,retain)MoveInMoveOutBaseResponse *resultData;
@property(nonatomic,retain)AddPreventionRequest *addPreventionRequest;


@property(nonatomic,retain)NSMutableDictionary *arrAllDataDict;

@end

