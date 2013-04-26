//
//  MGRecessedPopUpButtonCell.m
//  MGScopeBar
//
//  Created by Matt Gemmell on 20/03/2008.
//  Copyright 2008 Instinctive Code.
//

#import "MGRecessedPopUpButtonCell.h"


#define USE_SUB_POPUPCELL 1

@interface NSButtonCell (asdf)
- (BOOL)_shouldDrawBezel;
@end


@implementation MGRecessedPopUpButtonCell

- (id)initTextCell:(NSString *)title pullsDown:(BOOL)pullsDown
{
	if ((self = [super initTextCell:title pullsDown:pullsDown])) {
		recessedButton = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 30, 20)]; // arbitrary frame.
		[recessedButton setTitle:@""];
		[recessedButton setBezelStyle:NSRecessedBezelStyle];
		[recessedButton setButtonType:NSPushOnPushOffButton];
		[[recessedButton cell] setHighlightsBy:NSCellIsBordered | NSCellIsInsetButton];
		[recessedButton setShowsBorderOnlyWhileMouseInside:NO];
		[recessedButton setState:NSOnState]; // ensures it looks pushed-in.
		
		// We use another popup cell so that the font of the displayed menu does not
		// have to be the font of the cell itself. The only other solid way around
		// that problem is to do the tracking and popup the menu ourselves. It may
		// be a bit odd, but it's easier to override methods and pass to popupCell
		popupCell = [[NSPopUpButtonCell alloc] initTextCell:title pullsDown:pullsDown];
	}
	return self;
}


- (void)dealloc
{
	[popupCell release];
	[recessedButton release];
	[super dealloc];
}




//drawInteriorWithFrame
- (void)drawTitleWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
	// Inset title rect since its position is broken when NSPopUpButton
	// isn't using its selected item as its title.
	NSRect titleFrame = cellFrame;
	titleFrame.origin.y += 1.0;
	[super drawTitleWithFrame:titleFrame inView:controlView];
}

// drawWithFrame:
// drawBorderAndBackground:
- (void)drawBezelWithFrame:(NSRect)frame inView:(NSView *)controlView
{
	[recessedButton setFrame:frame];
	[recessedButton drawRect:frame];
}


- (NSSize)cellSizeForBounds:(NSRect)frame
{
	if (USE_SUB_POPUPCELL) {
		NSSize superSize = [super cellSizeForBounds:frame];
		NSSize size = NSMakeSize(0, superSize.height);
		NSRect titleRect = [self titleRectForBounds:frame];
		NSRect imageRect = [self imageRectForBounds:frame];
		CGFloat titleWidth = round(self.attributedTitle.size.width);
		CGFloat sizeForPopupImage = 12.0;
		CGFloat imgWidthPlusPadding = 0;
		CGFloat padding = 0;
		
		if (imageRect.size.width > 0) {
			padding = imageRect.origin.x;
			imgWidthPlusPadding = (imageRect.size.width + (NSMinX(titleRect) - NSMaxX(imageRect)));
		} else {
			padding = titleRect.origin.x;
		}
		
		size.width += padding + imgWidthPlusPadding + titleWidth + sizeForPopupImage + padding;
		size.width = MIN(frame.size.width, size.width);
		
		return size;
	} else {
		return [super cellSizeForBounds:frame];
	}
}





#pragma mark -

- (void)setAltersStateOfSelectedItem:(BOOL)flag
{
	if (USE_SUB_POPUPCELL) {
		[popupCell setAltersStateOfSelectedItem:flag];
	} else {
		[super setAltersStateOfSelectedItem:flag];
	}
}


- (BOOL)altersStateOfSelectedItem
{
	if (USE_SUB_POPUPCELL) {
		return [popupCell altersStateOfSelectedItem];
	} else {
		return [super altersStateOfSelectedItem];
	}
}


- (void)selectItem:(NSMenuItem *)item
{
	if (USE_SUB_POPUPCELL) {
		[popupCell selectItem:item];
	} else {
		[super selectItem:item];
	}
}


- (NSMenuItem *)selectedItem
{
	if (USE_SUB_POPUPCELL) {
		return [popupCell selectedItem];
	} else {
		return [super selectedItem];
	}
}


- (void)attachPopUpWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
	if (USE_SUB_POPUPCELL) {
		[popupCell attachPopUpWithFrame:cellFrame inView:controlView];
	} else {
		[super attachPopUpWithFrame:cellFrame inView:controlView];
	}
}


- (void)dismissPopUp
{
	if (USE_SUB_POPUPCELL) {
		[popupCell dismissPopUp];
	} else {
		[super dismissPopUp];
	}
}


- (BOOL)trackMouse:(NSEvent *)theEvent inRect:(NSRect)cellFrame ofView:(NSView *)controlView untilMouseUp:(BOOL)untilMouseUp
{
	if (USE_SUB_POPUPCELL) {
		popupCell.controlView = controlView;
		popupCell.menu = self.menu;	
		return [popupCell trackMouse:theEvent inRect:cellFrame ofView:controlView untilMouseUp:untilMouseUp];
	} else {
		return [super trackMouse:theEvent inRect:cellFrame ofView:controlView untilMouseUp:untilMouseUp];
	}
}



@end
