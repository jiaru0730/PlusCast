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
}