//
//  UIImage+Jukaela.h
//  Core
//
//  Created by Josh on 8/22/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//


/**
 UIImage catagory, with all manor of neat things
 */
@interface UIImage (Jukaela)

///---------------------------------------
/// @name Class Methods
///---------------------------------------

/** Saves UIImage to users Documents folder
 
 Saves a given UIImage to the user's Documents folder on an async background thread
 
 @param image The 'UIImage' to save
 @param filename 'NSString' of what to name the file
 */
+(void)saveImage:(UIImage *)image withFileName:(NSString *)filename;

@end
