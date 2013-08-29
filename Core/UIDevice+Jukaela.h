//
//  UIDevice+Jukaela.h
//  JukaelaCore
//
//  Created by Josh on 8/27/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//

@import UIKit;

/**
 UIColor helper methods.
 */
@interface UIDevice (Jukaela)

///---------------------------------------
/// @name Class Methods
///---------------------------------------

/** Is the device in question an iPad? */
+(BOOL)isDeviceiPad;

/** Is the device in question an iPhone or iPod? */
+(BOOL)isDeviceiPhone;

/** Is the device in question an Retina capable? */
+(BOOL)isDeviceRetina;

/** The current freespace of the device 
 @return float Current free space
 */
+(float)getFreeSpace;

@end
