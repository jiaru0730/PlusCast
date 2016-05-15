//
//  PodcastListViewController.swift
//  PlusCast
//
//  Created by JiaRu on 16/4/20.
//  Copyright © 2016年 Jiaru. All rights reserved.
//

import UIKit

class PodcastListViewController: UIViewController {
    
    var podcastParseService = PodcastParseService(url: NSURL(string: "http://www.npr.org/rss/rss.php?id=1033")!)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.podcastParseService.requestPodcastInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    

    

    
}

