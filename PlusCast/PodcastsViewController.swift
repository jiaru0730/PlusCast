//
//  PodcastsViewController.swift
//  PlusCast
//
//  Created by JiaRu on 16/5/15.
//  Copyright © 2016年 Jiaru. All rights reserved.
//

import Foundation
import UIKit

class PodcastsViewController: UITableViewController, PodcastParseServiceDelegate {
    var podcastExampleURLs = [String]()
    
    var podcasts: [Podcast]?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.podcastExampleURLs = [ "http://dameshek.libsyn.com/rss", "http://www.npr.org/rss/rss.php?id=1033", "http://norm.videopodcastnetwork.libsynpro.com/rss" ]
    }
    
    override func viewDidAppear(animated: Bool) {
        for eachPodcastURL in self.podcastExampleURLs {
            let podcastParseService = PodcastParseService(url: NSURL(string: eachPodcastURL)!)
            podcastParseService.delegate = self
            podcastParseService.requestPodcastInfo()
        }
    }
    
    // MARK: - UITableViewDataSource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let podcasts = self.podcasts {
            return podcasts.count
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let podcast = self.podcasts![indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = podcast.title
        
        return cell
    }
    
    // MARK: PodcastParseServiceDelegate
    func podcastParseDidFinish(parseService: PodcastParseService) {
        if self.podcasts == nil {
            self.podcasts = [Podcast]()
        }
        
        self.podcasts?.append(parseService.podcast!)
        
        self.tableView .reloadData()
    }




}