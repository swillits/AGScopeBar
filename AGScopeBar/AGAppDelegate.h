//
//  AGAppDelegate.h
//  AGScopeBar
//
//  Created by Seth Willits on 6/25/12.
//  Copyright (c) 2012 Araelium Group. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class AGScopeBar;
#import "MGScopeBar.h"

@interface AGAppDelegate : NSObject <NSApplicationDelegate, MGScopeBarDelegate>
{
	AGScopeBar * agScopeBar;
	MGScopeBar * mgScopeBar;
	NSWindow * window;
	NSMenu * agMenu;
	NSMenu * mgMenu;
	NSView * agAccessoryView;
	NSView * mgAccessoryView;
}

@property (assign) IBOutlet AGScopeBar * agScopeBar;
@property (assign) IBOutlet MGScopeBar * mgScopeBar;
@property (assign) IBOutlet NSWindow * window;
@property (assign) IBOutlet NSMenu * agMenu;
@property (assign) IBOutlet NSMenu * mgMenu;
@property (assign) IBOutlet NSView * agAccessoryView;
@property (assign) IBOutlet NSView * mgAccessoryView;

@end
