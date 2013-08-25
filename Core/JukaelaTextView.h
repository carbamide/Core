//
//  JukaelaTextView.h
//  Jukaela
//
//  Created by Josh on 8/20/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//

@import Foundation;
@import UIKit;

/** 'UITextVIew' that has a placeholder ability
 */
@interface JukaelaTextView : UITextView

///---------------------------------------
/// @name Properties
///---------------------------------------

/** The 'NSString' of the placeholder text
 */
@property (strong, nonatomic) NSString *placeholder;

/** The color of the placeholder.  If this is not specified, it defaults to darkGrayColor
 */
@property (strong, nonatomic) UIColor *placeholderColor;

///---------------------------------------
/// @name Instance methods
///---------------------------------------

/** Manually notify of the text changed NSNotification
 
 @param notification The textChanged notification
 */
-(void)textChanged:(NSNotification*)notification;

@end
