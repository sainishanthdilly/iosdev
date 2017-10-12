//
//  DemoURL.swift
//  Cassini
//
//  Created by Sai Nishanth Dilly on 10/4/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//


import Foundation

struct DemoURL
{
    static let stanford = URL(string: "https://cdn.pixabay.com/photo/2014/11/28/01/01/jay-548381_1280.jpg")
    static var NASA: Dictionary<String,URL> = {
        let NASAURLStrings = [
            "cassini" : "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
            "earth" : "http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
            "saturn" : "http://www.nasa.gov/sites/default/files/saturn_collage.jpg"
        ]
        var urls = Dictionary<String,URL>()
        for (key, value) in NASAURLStrings {
            urls[key] = URL(string: value)
        }
        return urls
    }()
    
    
}
