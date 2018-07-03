//
//  InterfaceController.m
//  iWatch WatchKit Extension
//
//  Created by caopengxu on 2018/7/3.
//  Copyright © 2018年 caopengxu. All rights reserved.
//

#import "InterfaceController.h"
#import <WatchConnectivity/WatchConnectivity.h>
#import <WatchKit/WatchKit.h>


@interface InterfaceController () <WCSessionDelegate>
@property (nonatomic, weak) IBOutlet WKInterfaceImage *image;
@property (nonatomic, weak) IBOutlet WKInterfaceLabel *nameL;
@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

}


- (void)willActivate {
    [super willActivate];
    
    WCSession *session = [WCSession defaultSession];
    session.delegate = self;
    [session activateSession];
}


- (void)didDeactivate {
    [super didDeactivate];
    
}



#pragma mark === <WCSessionDelegate>
- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message replyHandler:(void (^)(NSDictionary<NSString *,id> * _Nonnull))replyHandler
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.image setImageNamed:message[@"image"]];
        [self.nameL setText:message[@"name"]];
        
        [session sendMessage:@{@"result": @"OK!"} replyHandler:^(NSDictionary<NSString *,id> * _Nonnull replyMessage) {
            
        } errorHandler:^(NSError * _Nonnull error) {
            
        }];
    });
}
//- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message
//{
//}

- (void)session:(nonnull WCSession *)session activationDidCompleteWithState:(WCSessionActivationState)activationState error:(nullable NSError *)error
{
//    dispatch_async(dispatch_get_main_queue(), ^{
//
////        [self.image setImageNamed:message[@"image"]];
////        [self.nameL setText:message[@"name"]];
//
//        [session sendMessage:@{@"result": @"OK!"} replyHandler:^(NSDictionary<NSString *,id> * _Nonnull replyMessage) {
//
//        } errorHandler:^(NSError * _Nonnull error) {
//
//        }];
//    });
}


@end



