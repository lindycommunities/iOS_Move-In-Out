//
//  AWSelectionViewController.h
//  AxisWallet
//
//  Created by Avin More on 30/06/15.
//  Copyright (c) 2015 AgreeYa Mobility. All rights reserved.
//

#import "MoveInMoveOutBaseModel.h"
#import "BaseViewController.h"
@protocol SLSelectionDelegate <NSObject>
@optional
- (void)didSelectItem:(MoveInMoveOutBaseModel*)selectedItem;
- (void)didSelectMultipleItem:(NSMutableArray *)selectedItems andIndexes:(NSMutableDictionary *)selectedIndexesDictionary;

@end

@interface SLSelectionViewController :BaseViewController
@property(nonatomic,retain)NSMutableDictionary *AllOfflineAmenitiesData;

@property (strong, nonatomic) IBOutlet UIView *ViewSearchBar;

@property(nonatomic,strong)NSArray *itemList;
@property(nonatomic,strong)NSString *displayItemKey;
@property(nonatomic,strong)NSString *subtitleDisplayItemKey;
@property(nonatomic,weak) id<SLSelectionDelegate>delegate;
@property(nonatomic,strong)NSString *titleForSelection;

@property (nonatomic) BOOL hideCancel; // if cancel needs to be hidden
@property (nonatomic, strong) NSMutableDictionary *selectedIndexDictionary;
@property (nonatomic) BOOL isMutliSelect; // if cancel needs to be hidden
@property (nonatomic, strong) NSMutableArray *selectedIndexValue;
@property (nonatomic) BOOL isSortAllow; // if cancel needs to be hidden

@end
