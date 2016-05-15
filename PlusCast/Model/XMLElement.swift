//
//  XMLElement.swift
//  PlusCast
//
//  Created by JiaRu on 16/5/15.
//  Copyright © 2016年 Jiaru. All rights reserved.
//

import Foundation

class XMLElement {
    var elementName: String?
    var childElements: Array<XMLElement>?
    var textContent: String?
    
    func addChildElement(childElement: XMLElement) {
        if self.childElements == nil {
            self.childElements = [XMLElement]()
        }
        self.childElements!.append(childElement)
    }
}