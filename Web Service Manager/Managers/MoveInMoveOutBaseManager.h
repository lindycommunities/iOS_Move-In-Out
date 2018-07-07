//
//  BaseManager.h
//  SoapAfNetworkingTest
//
//  Created by Bonnie Jaiswal on 04/06/15.
//  Copyright (c) 2015 Bonnie Jaiswal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomError.h"
#import "MoveInMoveOutWebRequestHelper.h"
#import "MoveInMoveOutBaseRequest.h"
#import "MoveInMoveOutBaseResponse.h"

typedef void (^successBlock)(MoveInMoveOutBaseResponse *result);
typedef void (^failureBlock)(CustomError *error);
typedef void (^successBlockWithDictionay)(NSDictionary *result);

typedef void (^successBlockWithBlock)(MoveInMoveOutBaseResponse *result, void (^)());
typedef void (^failureBlockWithBlock)(CustomError *error, void (^)());

typedef void(^successBlockArray)(NSArray *resultArray);

@interface MoveInMoveOutBaseManager : NSObject
- (CustomError *)createErrorFromResponse:(MoveInMoveOutBaseResponse *)responseDictionary;
- (CustomError *)GetCustomErrorFromNSError:(NSError *)error;


- (id)parseResponse:(NSDictionary *)dict
          forAction:(NSString *)action;

-(void)reloginWithRequest:(MoveInMoveOutBaseRequest *)request
                  success:(successBlock)success
                  failure:(failureBlock)failure;

-(void)reloginForChangeMpin:(successBlock)success
                    failure:(failureBlock)failure;

-(void)reloginWithRequest:(MoveInMoveOutBaseRequest *)request
         parentController:(id)parentController
                  success:(successBlock)success
                  failure:(failureBlock)failure;

-(void)reloginForInitiatedTransactionAmount:(NSString *) amount
                                withRequest:(MoveInMoveOutBaseRequest *)request
                                    success:(successBlock)success
                                    failure:(failureBlock)failure;

-(void)resetAuthTokenWithRequest:(MoveInMoveOutBaseRequest *)resetAuthTokenRequest
                     success:(successBlock)success
                     failure:(failureBlock)failure;

- (NSString *)getResponseBody:(NSDictionary *)jsonDict
                    forAction:(NSString *)action;

- (UIViewController*) topMostController;

+ (instancetype)sharedInstance;

@end
