//
//  XLMainViewController.h
//  UDisk
//
//  Created by xie liang on 5/17/12.
//  Copyright (c) 2012 pretang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLTools.h"

@interface XLMainViewController : UIViewController
<UIAlertViewDelegate>
{
    NSString *_password;
    
    UITextField *_setPassField;
}

@property(nonatomic,strong) IBOutlet UITextField *passwordField;

- (IBAction)doVerify:(id)sender;

@end
