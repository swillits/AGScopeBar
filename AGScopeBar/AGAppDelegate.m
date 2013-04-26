//
//  AGAppDelegate.m
//  AGScopeBar
//
//  Created by Seth Willits on 6/25/12.
//  Copyright (c) 2012 Araelium Group. All rights reserved.
//

#import "AGAppDelegate.h"
#import "AGScopeBar.h"
#import "MGScopeBar.h"


@implementation AGAppDelegate
@synthesize window;
@synthesize agMenu;
@synthesize mgMenu;
@synthesize agAccessoryView;
@synthesize mgAccessoryView;
@synthesize agScopeBar;
@synthesize mgScopeBar;


- (void)dealloc
{
    [super dealloc];
}


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
	
	
	[mgScopeBar reloadData];
}








- (NSUInteger)numberOfGroupsInScopeBar:(MGScopeBar *)theScopeBar;
{
	return 3;
}

- (NSArray *)scopeBar:(MGScopeBar *)theScopeBar itemIdentifiersForGroup:(NSInteger)groupNumber;
{
	if (groupNumber == 0) return [NSArray arrayWithObjects:@"a", @"r", @"m", nil];
	if (groupNumber == 1) return [NSArray arrayWithObjects:@"all", @"dict", @"thes", nil];
	if (groupNumber == 2) return [NSArray arrayWithObjects:@"errs", @"warn", nil];
	return nil;
}

- (NSString *)scopeBar:(MGScopeBar *)theScopeBar labelForGroup:(NSInteger)groupNumber;
{
	if (groupNumber == 0) return nil;
	if (groupNumber == 1) return @"Radio:";
	if (groupNumber == 2) return @"Multi:";
	return nil;
}

- (MGScopeBarGroupSelectionMode)scopeBar:(MGScopeBar *)theScopeBar selectionModeForGroup:(NSInteger)groupNumber;
{
	if (groupNumber == 0) return MGMultipleSelectionMode;
	if (groupNumber == 1) return MGRadioSelectionMode;
	if (groupNumber == 2) return MGMultipleSelectionMode;
	return 0;
}



- (NSString *)scopeBar:(MGScopeBar *)theScopeBar titleOfItem:(NSString *)identifier inGroup:(NSInteger)groupNumber;
{
	if (groupNumber == 0) {
		if ([identifier isEqual:@"m"]) return @"Menu";
		return nil;
	}
	
	if (groupNumber == 1) {
		if ([identifier isEqual:@"all"]) return @"All";
		if ([identifier isEqual:@"dict"]) return @"Dictionary";
		if ([identifier isEqual:@"thes"]) return @"Thesaurus";
	}
	
	if (groupNumber == 2) {
		if ([identifier isEqual:@"errs"]) return @"Errors";
		if ([identifier isEqual:@"warn"]) return @"Warnings";
	}
	
	return nil;
}



- (NSImage *)scopeBar:(MGScopeBar *)theScopeBar imageForItem:(NSString *)identifier inGroup:(NSInteger)groupNumber;
{
	if (groupNumber == 0) {
		if ([identifier isEqual:@"a"]) return [NSImage imageNamed:@"NSAddTemplate"];
		if ([identifier isEqual:@"r"]) return [NSImage imageNamed:@"NSRemoveTemplate"];
	}
	
	return nil;
}



- (NSMenu *)scopeBar:(MGScopeBar *)theScopeBar menuForItem:(NSString *)identifier inGroup:(NSInteger)groupNumber;
{
	if (groupNumber == 0) {
		if ([identifier isEqual:@"m"]) return mgMenu;
	}
	
	return nil;
}



- (BOOL)scopeBar:(MGScopeBar *)theScopeBar showSeparatorBeforeGroup:(NSInteger)groupNumber;
{
	if ((groupNumber == 0) || (groupNumber == 2)) {
		return NO;
	}
	
	return YES;
}


- (NSView *)accessoryViewForScopeBar:(MGScopeBar *)theScopeBar;
{
	return mgAccessoryView;
}



- (void)scopeBar:(MGScopeBar *)theScopeBar selectedStateChanged:(BOOL)selected forItem:(NSString *)identifier inGroup:(NSInteger)groupNumber;
{
	NSLog(@"MG item selection changed");
}


- (void)scopeBar:(AGScopeBar *)theScopeBar item:(AGScopeBarItem *)item wasSelected:(BOOL)selected;
{
	NSLog(@"AG item selection changed");
}



@end
