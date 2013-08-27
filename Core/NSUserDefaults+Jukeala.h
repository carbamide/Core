//
//  NSUserDefaults+Jukeala.h
//  JukaelaCore
//
//  Created by Josh on 8/26/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//

@import Foundation;

/**
 NSUserDefaults helper methods.
 */
@interface NSUserDefaults (Jukeala)

///---------------------------------------
/// @name Class Methods
///---------------------------------------

/** Sets and saves a given object for a given key value
 @param object The object to save
 @param key The key to save the object to
 */
+(void)saveObject:(id)object forKey:(NSString *)key;

/** Deletes object at given key
 @param key The key to delete the object from
 */
+(void)deleteObjectForKey:(NSString *)key;

@end
