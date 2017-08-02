//
//  NSString+URLEncoding.m
//  AdyenClientsideEncryptionDemo
//
//  Created by Oleg Lutsenko on 8/8/16.
//  Copyright © 2016 Adyen. All rights reserved.
//

#import "NSString+AdyenURLEncoding.h"

@implementation NSString (AdyenURLEncoding)

-(NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding {
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                 (CFStringRef)self,
                                                                                 NULL,
                                                                                 (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                                                 CFStringConvertNSStringEncodingToEncoding(encoding)));
#pragma GCC diagnostic pop
}

@end
