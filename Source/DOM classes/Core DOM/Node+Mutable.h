/**
 Makes the writable properties all package-private, effectively
 */
#import "SVGKDOMNode.h"

@interface SVGKDOMNode()
@property(nonatomic,retain,readwrite) NSString* nodeName;
@property(nonatomic,retain,readwrite) NSString* nodeValue;

@property(nonatomic,readwrite) DOMNodeType nodeType;
@property(nonatomic,assign,readwrite) SVGKDOMNode* parentNode;
@property(nonatomic,retain,readwrite) NodeList* childNodes;
@property(nonatomic,retain,readwrite) NamedNodeMap* attributes;

@property(nonatomic,assign,readwrite) SVGKDOMDocument* ownerDocument;

// Introduced in DOM Level 2:
@property(nonatomic,retain,readwrite) NSString* namespaceURI;

// Introduced in DOM Level 2:
@property(nonatomic,retain,readwrite) NSString* prefix;

// Introduced in DOM Level 2:
@property(nonatomic,retain,readwrite) NSString* localName;

@end
