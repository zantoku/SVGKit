//
//  Text.m
//  SVGKit
//
//  Created by adam on 22/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DOMText.h"

@implementation DOMText

- (id)initWithValue:(NSString*) v
{
    self = [super initType:DOMNodeType_TEXT_NODE name:@"#text" value:v];
    if (self) {
		
    }
    return self;
}
-(DOMText*) splitText:(unsigned long) offset;
{
	NSAssert( FALSE, @"Not implemented yet" );
	return nil;
}

@end