//
//  ViewController.h
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface MyPendingSurveListViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>{
    
    
    int counterData,AttemptCount;

}

@property(nonatomic,weak)IBOutlet UITableView *TblALLData;
@property(nonatomic,retain)NSString *form_id;
@property(nonatomic,retain)NSString *moveInOutType;
@property(nonatomic,retain)NSMutableArray *arrAllData;
@property(nonatomic,retain)NSMutableArray *arrOKAllData;
@property(nonatomic,assign)int *currentIndex;
@property(nonatomic,retain)NSString *rent_update_id;
@property(nonatomic,retain)NSMutableArray *arrAmminities;
@property(nonatomic,retain)NSString *preventmain_id;

@end

