#import "SVGKDOMDocument.h"
#import "Document+Mutable.h"

#import "DOMHelperUtilities.h"

#import "NodeList+Mutable.h" // needed for access to underlying array, because SVG doesnt specify how lists are made mutable

@implementation SVGKDOMDocument

@synthesize doctype;
@synthesize implementation;
@synthesize documentElement;


- (void)dealloc {
  [doctype release];
  [implementation release];
  [documentElement release];
  [super dealloc];
}

-(SVGKDOMElement*) createElement:(NSString*) tagName
{
	SVGKDOMElement* newElement = [[SVGKDOMElement alloc] initWithLocalName:tagName attributes:nil];
	
	DDLogVerbose( @"[%@] WARNING: SVG Spec, missing feature: if there are known attributes with default values, Attr nodes representing them SHOULD BE automatically created and attached to the element.", [self class] );
	
	return newElement;
}

-(DocumentFragment*) createDocumentFragment
{
	return [[DocumentFragment alloc] init];
}

-(SVGKDOMText*) createTextNode:(NSString*) data
{
	return [[SVGKDOMText alloc] initWithValue:data];
}

-(SVGKDOMComment*) createComment:(NSString*) data
{
	return [[SVGKDOMComment alloc] initWithValue:data];
}

-(CDATASection*) createCDATASection:(NSString*) data
{
	return [[CDATASection alloc] initWithValue:data];
}

-(ProcessingInstruction*) createProcessingInstruction:(NSString*) target data:(NSString*) data
{
	return [[ProcessingInstruction alloc] initProcessingInstruction:target value:data];
}

-(Attr*) createAttribute:(NSString*) n
{
	return [[Attr alloc] initWithName:n value:@""];
}

-(EntityReference*) createEntityReference:(NSString*) data
{
	NSAssert( FALSE, @"Not implemented. According to spec: Creates an EntityReference object. In addition, if the referenced entity is known, the child list of the EntityReference  node is made the same as that of the corresponding Entity  node. Note: If any descendant of the Entity node has an unbound namespace prefix, the corresponding descendant of the created EntityReference node is also unbound; (its namespaceURI is null). The DOM Level 2 does not support any mechanism to resolve namespace prefixes." );
	return nil;
}

-(NodeList*) getElementsByTagName:(NSString*) data
{
	NodeList* accumulator = [[[NodeList alloc] init] autorelease];
	[DOMHelperUtilities privateGetElementsByName:data inNamespace:nil childrenOfElement:self.documentElement addToList:accumulator];
	
	return accumulator;
}

// Introduced in DOM Level 2:
-(SVGKDOMNode*) importNode:(SVGKDOMNode*) importedNode deep:(BOOL) deep
{
	NSAssert( FALSE, @"Not implemented." );
	return nil;
}

// Introduced in DOM Level 2:
-(SVGKDOMElement*) createElementNS:(NSString*) namespaceURI qualifiedName:(NSString*) qualifiedName
{
	SVGKDOMElement* newElement = [[SVGKDOMElement alloc] initWithQualifiedName:qualifiedName inNameSpaceURI:namespaceURI attributes:nil];
	
	DDLogVerbose( @"[%@] WARNING: SVG Spec, missing feature: if there are known attributes with default values, Attr nodes representing them SHOULD BE automatically created and attached to the element.", [self class] );
	
	return newElement;
}

// Introduced in DOM Level 2:
-(Attr*) createAttributeNS:(NSString*) namespaceURI qualifiedName:(NSString*) qualifiedName
{
	NSAssert( FALSE, @"This should be re-implemented to share code with createElementNS: method above" );
	Attr* newAttr = [[[Attr alloc] initWithNamespace:namespaceURI qualifiedName:qualifiedName value:@""] autorelease];
	return newAttr;
}

// Introduced in DOM Level 2:
-(NodeList*) getElementsByTagNameNS:(NSString*) namespaceURI localName:(NSString*) localName
{
	NodeList* accumulator = [[[NodeList alloc] init] autorelease];
	[DOMHelperUtilities privateGetElementsByName:localName inNamespace:namespaceURI childrenOfElement:self.documentElement addToList:accumulator];
	
	return accumulator;
}

// Introduced in DOM Level 2:
-(SVGKDOMElement*) getElementById:(NSString*) elementId
{
	return [DOMHelperUtilities privateGetElementById:elementId childrenOfElement:self.documentElement];
}

@end
