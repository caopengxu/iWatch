//
//  ViewController.m
//  iWatch
//
//  Created by caopengxu on 2018/7/3.
//  Copyright © 2018年 caopengxu. All rights reserved.
//

#import "ViewController.h"
#import <WatchConnectivity/WatchConnectivity.h>


@interface ViewController () <WCSessionDelegate>
@property (nonatomic, weak) IBOutlet UITextField *sendTextF;
@property (nonatomic, weak) IBOutlet UIButton *sendBtn;
@property (nonatomic, weak) IBOutlet UILabel *resultL;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WCSession *session = [WCSession defaultSession];
    session.delegate = self;
    [session activateSession];
}


#pragma mark === 发送消息
- (IBAction)sendBtnAction:(UIButton *)sender
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [[WCSession defaultSession] sendMessage:@{@"name": self.sendTextF.text, @"image": @"待付款"} replyHandler:^(NSDictionary<NSString *,id> * _Nonnull replyMessage) {
            
        } errorHandler:^(NSError * _Nonnull error) {
            
        }];
    });
}



#pragma mark === <WCSessionDelegate>
- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message replyHandler:(void (^)(NSDictionary<NSString *,id> * _Nonnull))replyHandler
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.resultL.text = message[@"result"];
    });
}
//- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message
//{
//}
- (void)session:(nonnull WCSession *)session activationDidCompleteWithState:(WCSessionActivationState)activationState error:(nullable NSError *)error {
    
}


- (void)sessionDidBecomeInactive:(nonnull WCSession *)session {
    
}


- (void)sessionDidDeactivate:(nonnull WCSession *)session {
    
}



- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}

//- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
//
//}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    
}

- (void)setNeedsFocusUpdate {
    
}

//- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
//
//}

- (void)updateFocusIfNeeded {
    
}

@end



