//
//  NSString+Jukaela.h
//  Core
//
//  Created by Josh on 8/21/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//

/**
 NSString helper methods.
 */
@interface NSString (Jukaela)

///---------------------------------------
/// @name Class Methods
///---------------------------------------

/**
 The home folder for the current application on iOS, or the user's home folder on Macintosh.
 @return 'NSString' of the path of the home folder.
 */
+(NSString *)documentsPath;

@end
