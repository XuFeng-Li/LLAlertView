//
//  LLAlertModel.h
//  LLAlartView
//
//  Created by taodi on 16/4/12.
//  Copyright © 2016年 taodi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLAlertView.h"

@interface LLAlertModel : NSObject
+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
      messageAlignment:(NSTextAlignment)textAlignment
             quitTitle:(NSString *)quitTitle
            quitAction:(HandleAction)quitAction
             dealTitle:(NSString *)dealTitle
            dealAction:(HandleAction)dealAction;
+ (void)alertWithTitle:(NSString *)title dealAction:(HandleAction)dealAction;
+ (void)alertWithTitle:(NSString *)title quitAction:(HandleAction)quitAction dealAction:(HandleAction)dealAction;

@end
