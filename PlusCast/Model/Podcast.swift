//
//  Podcast.swift
//  PlusCast
//
//  Created by JiaRu on 16/5/13.
//  Copyright © 2016年 Jiaru. All rights reserved.
//

import Foundation

class Podcast: NSObject {
    var podcastID: String = ""
    var title: String = ""
    var link: String = ""
    var podcastDescription: String = ""
    var imageURL: PodcastImage? = nil
    
    var episodes: Array<Episode>?
    
    init(xmlElement: XMLElement) {
        super.init()
        
        if let childElements = xmlElement.childElements {
            for childElement in childElements {
                if childElement.elementName == "title" {
                    self.title = childElement.textContent!
                } else if childElement.elementName == "description" {
                    self.podcastDescription = childElement.textContent!
                } else if childElement.elementName == "link" {
                    self.link = childElement.textContent!
                }
            }
        }
    }
}