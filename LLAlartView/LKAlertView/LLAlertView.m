//
//  LLAlertView.m
//  LLAlartView
//
//  Created by taodi on 16/4/12.
//  Copyright © 2016年 taodi. All rights reserved.
//

#import "LLAlertView.h"
#import "UIImage+RTTint.h"
#import "DefineMacro.h"

static int textFont = 14.0;

@interface LLAlertView()
@property (nonatomic, strong) NSString *alertTitle;
@property (nonatomic, strong) NSString *quitTitle;
@property (nonatomic, strong) NSString *dealTitle;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, copy) HandleAction quitAction;
@property (nonatomic, copy) HandleAction dealAction;

@property (nonatomic, readonly, copy) HandleAction showAction;
@property (nonatomic, readonly,copy) HandleAction hiddenAction;

@property (nonatomic, weak) IBOutlet UIView *containerView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIButton *quitButton;
@property (nonatomic, weak) IBOutlet UIButton *dealButton;
@property (nonatomic, weak) IBOutlet UILabel *messageLabel;


@end

@implementation LLAlertView
+(instancetype)alertWithTitle:(NSString *)title dealAction:(HandleAction)dealAction{
    return [LLAlertView alertWithTitle:title message:nil quitTitle:@"取消" quitAction:nil dealTitle:@"确定" dealAction:dealAction];
}
+ (instancetype)alertWithTitle:(NSString *)title
                       message:(NSString *)message
                     quitTitle:(NSString *)quitTitle
                    quitAction:(HandleAction)quitAction
                     dealTitle:(NSString *)dealTitle
                    dealAction:(HandleAction)dealAction{
    return [[LLAlertView alloc] initWithTitle:title message:message quitTitle:quitTitle quitAction:quitAction dealTitle:dealTitle dealAction:dealAction];
}
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                    quitTitle:(NSString *)quitTitle
                   quitAction:(HandleAction)quitAction
                    dealTitle:(NSString *)dealTitle
                   dealAction:(HandleAction)dealAction
{
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"LLAlertView" owner:nil options:nil];
    
    LLAlertView *tempView = (LLAlertView*)[nibContents objectAtIndex:0];
    tempView.frame = [UIScreen mainScreen].bounds;
    self = tempView;
    if (self) {
        self.alertTitle = title;
        self.message = message;
        self.quitTitle = quitTitle;
        self.quitAction = quitAction;
        self.dealTitle = dealTitle;
        self.dealAction = dealAction;
        __weak LLAlertView *weakSelf  = self;
        _showAction = ^{
            weakSelf.containerView.alpha = 0;
            weakSelf.containerView.transform = CGAffineTransformMakeScale(0.9, 0.9);
            [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                weakSelf.containerView.transform = CGAffineTransformIdentity;
                weakSelf.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
                weakSelf.containerView.alpha = 1;
            } completion:nil];
        };
        _hiddenAction = ^{
            weakSelf.containerView.clipsToBounds = YES;
            [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                weakSelf.containerView.alpha = 0;
                weakSelf.containerView.transform = CGAffineTransformMakeScale(0.9, 0.9);
                weakSelf.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
            } completion:^(BOOL finished) {
            }];
        };
        [self initSubViews];
    }
    if (!self.alertTitle) {
        return nil;
    }
    return self;
}
- (void)initSubViews{
    self.containerView .backgroundColor = [UIColor whiteColor];
    self.containerView .layer.cornerRadius = 10.0;
    self.containerView .layer.masksToBounds = true;
    
    self.titleLabel.text = self.alertTitle;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = BLACK_COLOR;
    self.titleLabel.font = FONT_OF_SIZE(textFont);
    
    self.messageLabel.textColor = BLACK_COLOR;
    self.messageLabel.text = self.message;
    self.messageLabel.font = FONT_OF_SIZE(textFont);
    self.messageLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.quitButton setTitle:self.quitTitle forState:UIControlStateNormal];
    [self.quitButton setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    [self.quitButton setBackgroundImage:[[[UIImage imageNamed:@"cornerButton_img"] rt_tintedImageWithColor:QUITBUTTON_BACKGROUNDCOLOR] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)] forState:UIControlStateNormal];
    self.quitButton.titleLabel.font = FONT_OF_SIZE(textFont);
    [self.quitButton addTarget:self action:@selector(quitButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.dealButton setTitle:self.dealTitle forState:UIControlStateNormal];
    [self.dealButton setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    [self.dealButton setBackgroundImage:[[[UIImage imageNamed:@"cornerButton_img"] rt_tintedImageWithColor:DEALBUTTON_BACKGROUNDCOLOR] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)] forState:UIControlStateNormal];
    self.dealButton.titleLabel.font = FONT_OF_SIZE(textFont);
    [self.dealButton addTarget:self action:@selector(dealButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)messageTextAlignment:(NSTextAlignment)alignment{
    self.messageLabel.textAlignment = alignment;
}
- (void)quitButtonAction{
    self.quitAction();
}
- (void)dealButtonAction{
    self.dealAction();
}
- (void)alertShow{
    UIWindow *window = [UIApplication sharedApplication].windows.firstObject;
    window.frame = [UIScreen mainScreen].bounds;
    [window addSubview:self];
    self.showAction();
}
- (void)alertQuit{
    self.hiddenAction();
    [self removeFromSuperview];
}
@end