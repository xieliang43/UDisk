//
//  XLMainViewController.m
//  UDisk
//
//  Created by xie liang on 5/17/12.
//  Copyright (c) 2012 pretang. All rights reserved.
//

#import "XLMainViewController.h"

@interface XLMainViewController ()

@end

@implementation XLMainViewController

@synthesize passwordField = _passwordField;

- (void)dealloc
{
    [_password release];
    [_passwordField release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self isLogin];
}

- (void)isLogin
{
    _password = [[XLTools password] copy];
    if (_password && [_password length] > 5) {
        [_passwordField becomeFirstResponder];
    }else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请输入密码"
                                                        message:@"\n\n"
                                                       delegate:self
                                              cancelButtonTitle:@"确定" 
                                              otherButtonTitles:nil];
        
        _setPassField = [[UITextField alloc] initWithFrame:CGRectMake(11.0, 55.0, 261.0, 31.0)];
        _setPassField.borderStyle = UITextBorderStyleRoundedRect;
        _setPassField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _setPassField.textAlignment = UITextAlignmentCenter;
        _setPassField.secureTextEntry = YES;
        [_setPassField becomeFirstResponder];
        [_setPassField setPlaceholder:@"设置密码"];
        [alert addSubview:_setPassField];
        [_setPassField release];
        
        alert.tag = 1001;
        
        [alert show];
        [alert release];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIDeviceOrientationPortrait);
}

- (IBAction)doVerify:(id)sender
{
    NSString *tempStr = _passwordField.text;
    if ([tempStr isEqualToString:_password]) {
        //success
    }else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"密码不正确！"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1001) {
        _password = [[_setPassField.text stringByReplacingOccurrencesOfString:@" " 
                                                                   withString:@""] copy];
        if ([_password length] < 6) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"密码至少为6位！"
                                                           delegate:self
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
            alert.tag = 1002;
            [alert show];
            [alert release];
            return;
        }
        [XLTools savePassword:_password];
        [_passwordField becomeFirstResponder];
    }else {
        [self isLogin];
    }
    
}

@end
