//
//  ParseXML.swift
//  HomeWork03
//
//  Created by Sai Nishanth Dilly on 10/21/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import Foundation


class ParseXML: NSObject, XMLParserDelegate{
    
    private var rssItems = Array<Array<Item>>()
    private var currentElement = ""
    private var completionHandler: (([[Item]]) -> Void)?
    
    private var currentTitle = ""{
        didSet{
            currentTitle = currentTitle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentDescription: String = ""{
        didSet{
            currentDescription = currentDescription.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentPubDate: String = ""{
        didSet{
            currentPubDate = currentPubDate.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentsubtitle: String = ""{
        didSet{
            currentsubtitle =  currentsubtitle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    private var currentsummary: String = ""{
        didSet{
            currentsummary =  currentsummary.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    private var currentauthor: String = ""{
        didSet{
            currentauthor =  currentauthor.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentaudio: String = ""{
        didSet{
            currentaudio =  currentaudio.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentDuration: String = ""{
        didSet{
            currentDuration =  currentDuration.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    
    
    
    func parseFeed(url: String, completionHandler: (([[Item]]) -> Void)?){
        
        self.completionHandler = completionHandler
        let request = URLRequest(url: URL(string: url)!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request){ (data, response, error) in
            guard let data = data else{
                if let error = error{
                    print(error.localizedDescription)
                }
                return
                
        }
         //Parse data line by line
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
        
    }
        task.resume()
       
    }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if currentElement == "item"{
            currentPubDate = ""
            currentDescription = ""
            currentTitle = ""
            currentauthor = ""
            currentsubtitle = ""
            currentsummary = ""
            currentaudio = ""
            currentDuration = ""
            
        }
        if currentElement == "enclosure"{
            currentaudio = attributeDict["url"]!
        }
        
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case "title":
            currentTitle += string
        case "description":
            currentDescription += string
        case "pubDate":
            currentPubDate += string
        case "itunes:subtitle":
            currentsubtitle += string
        case "itunes:author":
            currentauthor += string
        case "itunes:summary":
            currentsummary += string
        case "itunes:duration":
            currentDuration += string
        default:
            break
        }
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item"{
            //let x = currentDescription.range(of: "<img")
            //currentDescription = currentDescription.index(before: )
            let it =  Item(currentTitle, ainfo: currentDescription, pubDate : currentPubDate, sum: currentsummary, subtit: currentsubtitle,
                           auth : currentauthor, aud: currentaudio, duration : currentDuration)
            rssItems.append([it])
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        completionHandler?(rssItems)
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("error occured")
        print(parseError.localizedDescription)
    }
    
    
}
