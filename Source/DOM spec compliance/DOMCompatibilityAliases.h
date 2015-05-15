//
//  DOMCompatibilityAlias.h
//  SVGKit-iOS
//
//  Created by Karsten Rohweder on 15/05/15.
//  Copyright (c) 2015 na. All rights reserved.
//

#import "SVGKDOMDocument.h"
#import "SVGKDOMComment.h"
#import "SVGKDOMText.h"
#import "SVGKDOMNode.h"
#import "SVGKDOMElement.h"

@compatibility_alias Element SVGKDOMElement;
@compatibility_alias Node SVGKDOMNode;
@compatibility_alias Document SVGKDOMDocument;
@compatibility_alias Comment SVGKDOMComment;
@compatibility_alias Text SVGKDOMText;
