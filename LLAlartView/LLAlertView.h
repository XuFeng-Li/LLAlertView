//
//  LLAlertView.h
//  LLAlartView
//
//  Created by taodi on 16/4/12.
//  Copyright © 2016年 taodi. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^HandleAction)(void);
@interface LLAlertView : UIView
+ (instancetype)alertWithTitle:(NSString *)title
                message:(NSString *)message
              quitTitle:(NSString *)quitTitle
             quitAction:(HandleAction)quitAction
              dealTitle:(NSString *)dealTitle
                    dealAction:(HandleAction)dealAction;
- (void)messageTextAlignment:(NSTextAlignment)alignment;
- (void)alertShow;
- (void)alertQuit;
@end
