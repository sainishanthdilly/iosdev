//
//  Item.swift
//  HomeWork03
//
//  Created by Sai Nishanth Dilly on 10/21/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import Foundation
open class Item{
    
    var  title: String
    var additionalInfo : String
    var pubDate: String
    var subtitle: String
    var summary: String
    var author: String
    var audioURL: String
    var audioDur : String
    
    init(_ title:String,ainfo additonalInfo1 : String, pubDate date1 : String
        , sum summary: String, subtit subtitle: String, auth author: String, aud audio: String,
          duration audioDur: String) {
        
        self.title = title
        self.additionalInfo = additonalInfo1
        self.pubDate = date1
        self.summary = summary
        self.author = author
        self.subtitle = subtitle
        self.audioURL = audio
        self.audioDur = audioDur
        
}
}

