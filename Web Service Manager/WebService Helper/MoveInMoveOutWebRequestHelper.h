//
//  WebRequestHelper.h
//  AxisWallet
//
//  Created by Bonnie Jaiswal on 02/06/15.
//  Copyright (c) 2012 Bonnie Jaiswal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ServiceResponse.h"
#import "CustomError.h"
#import "MoveInMoveOutBaseRequest.h"
#import "MBProgressHud.h"

//#define kBaseURL @"https://www.whitelakeinteractive.com/lindy-certification/certificate-production_api/api/move-in-out-api.php?action="

//#define kBaseURL @"https://whitelakedigital.com/lindy-certifications/certificate-production_api/api/move-in-out-api.php?action="

//http://whitelakedigital.com/lindy-certifications/certificate-production_api/api/move-in-out-api.php?action=addTurnover&apt=Testing
//http://whitelakedigital.com/lindy-certification/certificate-production_api/api/move-in-out-api.php?action=addTurnover&apt=Testing

#define kBaseURL @"http://certification.comehometolindy.com/certificate-production_api/api/move-in-out-api.php?action="




@interface MoveInMoveOutWebRequestHelper : NSObject{
    
    MBProgressHUD *hudUploadProgress;

}
@property(nonatomic,retain)    NSProgress *progress;
@property(nonatomic,assign) BOOL isNetWorking;

+ (instancetype)sharedInstance;

- (void)hitRequestServiceFor:(MoveInMoveOutBaseRequest *)soapRequest
                     success:(void (^) (NSDictionary *result))success
                     failure:(void (^) (CustomError *error))failure;

- (void)requestServiceFor:(MoveInMoveOutBaseRequest *)soapRequest
                  success:(void (^) (NSDictionary *result))success
                  failure:(void (^) (CustomError *error))failure;
- (void) downloadVideoFromURL: (NSString *) URL withProgress:(void (^)(CGFloat progress))progressBlock completion:(void (^)(NSURL *filePath))completionBlock onError:(void (^)(NSError *error))errorBlock;
- (BOOL)isInternetWorking;
-(void)CheckInternet;



@end
