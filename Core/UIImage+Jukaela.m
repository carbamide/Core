//
//  UIImage+Jukaela.m
//  Core
//
//  Created by Josh on 8/22/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//

@import UIKit;

#import "UIImage+Jukaela.h"

@implementation UIImage (Jukaela)

+(void)saveImage:(UIImage *)image withFileName:(NSString *)filename
{
    if (image != nil) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
        
        dispatch_async(queue, ^{
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            
            NSString *documentsDirectory = paths[0];
            NSString *path = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithString:[NSString stringWithFormat:@"%@.png", filename]]];
            
            NSData *data = UIImagePNGRepresentation(image);
            
            [data writeToFile:path atomically:YES];
        });
    }
}

@end
