//
//  File.swift
//  PlusCast
//
//  Created by JiaRu on 16/5/14.
//  Copyright © 2016年 Jiaru. All rights reserved.
//

import Foundation

protocol PodcastParseServiceDelegate {
    func podcastParseDidFinish(parseService: PodcastParseService)
}

class PodcastParseService: NSObject, NSXMLParserDelegate {
    
    var url: NSURL?
    var delegate: PodcastParseServiceDelegate?
    
    var podcast: Podcast?
    var episodes = [Episode]()
    
    var elementStack = [XMLElement]()
    var latestElementString = ""
    
    init(url: NSURL) {
        super.init()
        self.url = url
    }
    
    func requestPodcastInfo() {
        let parser = NSXMLParser(contentsOfURL: self.url!)!
        parser.delegate = self
        let flag = parser.parse()
        
    }
    
    
    
    
    
    // MARK: - NSXMLParser Delegate
    
    func parserDidStartDocument(parser: NSXMLParser) {
        NSLog("RSS parsing started.")
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        let newElement = XMLElement()
        newElement.elementName = elementName
        self.pushXMLElement(newElement)
        
        self.latestElementString = ""
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        self.latestElementString = self.latestElementString + string
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        let endElement = self.popXMLElement()
        endElement.textContent = self.latestElementString
        
        if let parentElement = self.topXMLElement() {
            parentElement .addChildElement(endElement)
        }
        
        self.evaluateObject(endElement)
    }
    
    func parserDidEndDocument(parser: NSXMLParser) {
        NSLog("RSS parsing ended.")
        self.delegate?.podcastParseDidFinish(self)
    }
    
    func parser(parser: NSXMLParser, foundCDATA CDATABlock: NSData) {
        NSLog("CDATA found======================@")
        if let cdataString = String(data: CDATABlock, encoding: NSUTF8StringEncoding) {
            NSLog(String(format: "CDATA string:%@", cdataString))
            self.latestElementString = self.latestElementString + cdataString
        }
    }
    
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
    }
    
    // MARK: - XML Element Parse
    
    func pushXMLElement(element: XMLElement) {
        self.elementStack .append(element)
    }
    
    func popXMLElement() -> XMLElement {
        return self.elementStack.removeLast()
    }
    
    func topXMLElement() -> XMLElement? {
        if self.elementStack.count > 0 {
            return self.elementStack.last!
        } else {
            return nil
        }
    }
    
    func evaluateObject(xmlElement: XMLElement) {
        if xmlElement.elementName == "item" {
            self.episodes.append(Episode(xmlElement: xmlElement))
        } else if xmlElement.elementName == "channel" {
            self.podcast = Podcast(xmlElement: xmlElement)
            self.podcast?.episodes = self.episodes
        }
    }
}