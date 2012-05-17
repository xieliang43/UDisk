//
//  XLTools.m
//  UDisk
//
//  Created by xie liang on 5/17/12.
//  Copyright (c) 2012 pretang. All rights reserved.
//

#import "XLTools.h"

@implementation XLTools

+ (void)savePassword:(NSString *)password
{
    [[NSUserDefaults standardUserDefaults] setObject:password forKey:@"password"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)password
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
}

@end
