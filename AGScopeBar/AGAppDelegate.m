//
//  AGAppDelegate.m
//  AGScopeBar
//
//  Created by Seth Willits on 6/25/12.
//  Copyright (c) 2012 Araelium Group. All rights reserved.
//

#import "AGAppDelegate.h"
#import "AGScopeBar.h"


@implementation AGAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	AGScopeBarGroup * group = nil;
	AGScopeBarItem * item = nil;
	
	agScopeBar.accessoryView = agAccessoryView;
	
	group = [agScopeBar addGroupWithIdentifier:@"0" label:nil items:nil];
	item = [group addItemWithIdentifier:@"a" title:nil];
	item.image = [NSImage imageNamed:@"NSAddTemplate"];
	item = [group addItemWithIdentifier:@"r" title:nil];
	item.image = [NSImage imageNamed:@"NSRemoveTemplate"];
	item = [group addItemWithIdentifier:@"m" title:@"Menu"];
	item.menu = agMenu;
	group.selectionMode = AGScopeBarGroupSelectNone;
	group.canBeCollapsed = NO;
	
	group = [agScopeBar addGroupWithIdentifier:@"1" label:@"Radio:" items:nil];
	[group addItemWithIdentifier:@"all" title:@"All"];
	[group addItemWithIdentifier:@"dict" title:@"Dictionary"];
	[group addItemWithIdentifier:@"thes" title:@"Thesaurus"];
	group.selectionMode = AGScopeBarGroupSelectOne;
	
	
	group = [agScopeBar addGroupWithIdentifier:@"2" label:@"Multi:" items:nil];
	[group addItemWithIdentifier:@"errs" title:@"Errors"];
	[group addItemWithIdentifier:@"warn" title:@"Warnings"];
	group.selectionMode = AGScopeBarGroupSelectAny; //tLeastOne;
	group.showsSeparator = NO;
}



- (void)scopeBar:(AGScopeBar *)theScopeBar item:(AGScopeBarItem *)item wasSelected:(BOOL)selected;
{
	NSLog(@"AG item selection changed");
}



@end
