//
//  FirstViewController.swift
//  PlusCast
//
//  Created by JiaRu on 16/4/20.
//  Copyright © 2016年 Jiaru. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, NSXMLParserDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.requestPodcastInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    func requestPodcastInfo() {
        let parser = NSXMLParser(contentsOfURL: NSURL(string: "http://www.npr.org/rss/rss.php?id=1033")!)
        parser?.delegate = self
        let flag = parser?.parse()
        
        
    }
    
    // MARK: - NSXMLParser Delegate
    
    func parserDidStartDocument(parser: NSXMLParser) {
        NSLog("JeRRY")
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        NSLog("JeRRY")
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        NSLog("JeRRY")
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        NSLog("JeRRY")
    }
    
    func parserDidEndDocument(parser: NSXMLParser) {
        NSLog("JeRRY")
    }
    
    func parser(parser: NSXMLParser, foundCDATA CDATABlock: NSData) {
        NSLog("JeRRY")
    }
    
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        NSLog("JeRRY")
    }
    
}

