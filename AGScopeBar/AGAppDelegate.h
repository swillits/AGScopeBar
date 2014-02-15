//
//  AGAppDelegate.h
//  AGScopeBar
//
//  Created by Seth Willits on 6/25/12.
//  Copyright (c) 2012 Araelium Group. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MGScopeBar.h"
@class AGScopeBar;


@interface AGAppDelegate : NSObject <NSApplicationDelegate, MGScopeBarDelegate>
{
	IBOutlet AGScopeBar * agScopeBar;
	IBOutlet MGScopeBar * mgScopeBar;
	IBOutlet NSWindow * window;
	IBOutlet NSMenu * agMenu;
	IBOutlet NSMenu * mgMenu;
	IBOutlet NSView * agAccessoryView;
	IBOutlet NSView * mgAccessoryView;
}

@end
