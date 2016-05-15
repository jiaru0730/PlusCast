//
//  Episode.swift
//  PlusCast
//
//  Created by JiaRu on 16/5/14.
//  Copyright © 2016年 Jiaru. All rights reserved.
//

import Foundation

class Episode: NSObject {
    var episodeID: String = ""
    var title: String = ""
    var episodeDescription: String = ""
    var publishDate: String = ""
    var link: String = ""
    var guid: String = ""
    var content: String = ""
    
    init(xmlElement: XMLElement) {
        super.init()
        
        if let childElements = xmlElement.childElements {
            for childElement in childElements {
                if childElement.elementName == "title" {
                    self.title = childElement.textContent!
                } else if childElement.elementName == "description" {
                    self.episodeDescription = childElement.textContent!
                } else if childElement.elementName == "pubDate" {
                    self.publishDate = childElement.textContent!
                } else if childElement.elementName == "link" {
                    self.link = childElement.textContent!
                } else if childElement.elementName == "guid" {
                    self.guid = childElement.textContent!
                }
            }
        }
    }
}