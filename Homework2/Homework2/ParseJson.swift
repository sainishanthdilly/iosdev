//
//  ParseJson.swift
//  Homework2
//
//  Created by Sai Nishanth Dilly on 10/10/17.
//  Copyright © 2017 Shehab, Mohamed. All rights reserved.
//

import Foundation

open class ParseJsonApp{
    
    static var appSection1: [String] = []
    
   static func getAppSection() -> [String]?{
        
        return appSection1
    }
    
  static func parseJson(_ jsObj : [String: Any] ) -> Array<Array<Feed>>{
        var feeds : Array<Array<Feed>> = Array<Array<Feed>>()
        let arrayF = jsObj ["feed"] as! NSArray
        
        print(type(of: arrayF))
        
        var currCategory = ""
        var i = -1
       for obj in arrayF {
        let fd = Feed()
        let each  =  obj as! [String: Any]
        let art = each["artist"] as! [String: Any]
        let artLable = art["label"] as! String
        let releaseDate = each["releaseDate"] as! [String: Any]
        let releaseDateLabel = releaseDate["label"] as! String
        let price = each["price"] as! [String: Any]
        let priceLabel = price["amount"] as! NSNumber
        let img = each["squareImage"] as! NSArray
        for square in img {
            let imgLabel = square as! [String:Any]
            fd.squareImage = imgLabel["label"] as! String
            
        }
        if let imgOptional = each["otherImage"] as? NSArray{
        for opt in imgOptional {
            let imgLabel = opt as! [String:Any]
            fd.optionalImage = imgLabel["label"] as? String
            
        }
        }
        if let summary = each["summary"] as? [String: Any]{
            
            let sum = summary["label"] as! String
            
            fd.summary = sum
        }
        
        
        
        let tit = each["name"] as! [String: Any]
        let titLabel = tit["label"] as! String
        
        let cat = each["category"] as! [String: Any]
        let att = cat["attributes"] as! [String: Any]
        let term = att["term"] as! String
        fd.title = titLabel
        fd.name = artLable
        fd.releaseDate = releaseDateLabel
        fd.price =  String(describing: priceLabel)
        
        
        if term != currCategory{
            i = i + 1
            
            feeds.append([fd])
            currCategory = term
            appSection1.append(currCategory)
            
        }
        else{
            feeds[i].append(fd)
            
        }
        
        
        print(fd)
        print(feeds.startIndex)
        
        //    feeds.index(0).append([fd])
        //}
        }

        return feeds
        
    }
    
}
