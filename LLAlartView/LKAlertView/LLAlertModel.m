//
//  LLAlertModel.m
//  LLAlartView
//
//  Created by taodi on 16/4/12.
//  Copyright © 2016年 taodi. All rights reserved.
//

#import "LLAlertModel.h"
@interface LLAlertModel()
@property (nonatomic, strong) NSString *alertTitle;
@property (nonatomic, strong) NSString *quitTitle;
@property (nonatomic, strong) NSString *dealTitle;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, copy) HandleAction quitAction;
@property (nonatomic, copy) HandleAction dealAction;

@property (nonatomic, strong) LLAlertView *alertView;
@end
@implementation LLAlertModel
+(LLAlertModel *)shartInstance{
    static LLAlertModel *_instance = nil;
    @synchronized([LLAlertModel class]) {
        if (!_instance) {
            _instance = [[LLAlertModel alloc] init];
        }
    }
    return _instance;
}
+(void)alertWithTitle:(NSString *)title message:(NSString *)message
     messageAlignment:(NSTextAlignment)textAlignment quitTitle:(NSString *)quitTitle quitAction:(HandleAction)quitAction dealTitle:(NSString *)dealTitle dealAction:(HandleAction)dealAction{
    LLAlertModel *alertModel = [LLAlertModel shartInstance];
    alertModel.alertTitle = title;
    alertModel.message = message;
    alertModel.quitTitle = quitTitle ? quitTitle : @"取消";
    alertModel.quitAction = quitAction;
    alertModel.dealTitle = dealTitle ? dealTitle : @"确定";
    alertModel.dealAction = dealAction;
    alertModel.alertView = [alertModel createAlertView];
    [alertModel.alertView messageTextAlignment:textAlignment];
    [alertModel.alertView alertShow];
}
+(void)alertWithTitle:(NSString *)title quitAction:(HandleAction)quitAction dealAction:(HandleAction)dealAction{
    [LLAlertModel alertWithTitle:title message:nil messageAlignment:NSTextAlignmentCenter quitTitle:nil quitAction:quitAction dealTitle:nil dealAction:dealAction];
}
+(void)alertWithTitle:(NSString *)title dealAction:(HandleAction)dealAction{
    [LLAlertModel alertWithTitle:title message:nil messageAlignment:NSTextAlignmentCenter quitTitle:nil quitAction:nil dealTitle:nil dealAction:dealAction];
}
- (LLAlertView *)createAlertView{
    __weak LLAlertModel *weakModel = self;
    return [LLAlertView alertWithTitle:weakModel.alertTitle message:weakModel.message quitTitle:weakModel.quitTitle quitAction:^{
        if (weakModel.quitAction) {
            weakModel.quitAction();
        }
        [weakModel.alertView alertQuit];
        [weakModel clearData];
    }dealTitle:weakModel.dealTitle dealAction:^{
        if (weakModel.dealAction) {
            weakModel.dealAction();
        }
        [weakModel.alertView alertQuit];
        [weakModel clearData];
    }];
}
- (void)clearData{
    _alertTitle = nil;
    _message = nil;
    _quitTitle = nil;
    _quitAction = nil;
    _dealTitle = nil;
    _dealAction = nil;
    _alertView = nil;
}
@end
