//
//  DetailViewController.swift
//  HomeWork03
//
//  Created by Sai Nishanth Dilly on 10/22/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import UIKit
import AVKit

class DetailViewController: UIViewController {

    var item: Item?
    
    var player:AVPlayer?
    var playerItem:AVPlayerItem?
    var playerLayer:AVPlayerLayer?
    
    @IBOutlet weak var summary: UILabel!
    
    
    @IBOutlet weak var pubDate: UILabel!
    
    @IBOutlet weak var author: UILabel!
    
    @IBOutlet weak var subTitle: UILabel!
    
    
    @IBOutlet weak var songPlay: UISlider!
    
    
    @IBOutlet weak var max: UILabel!
    
    
    @IBOutlet weak var sender: UIButton!
   
    @IBOutlet weak var min: UILabel!
    
    
    @IBOutlet weak var played: UIBarButtonItem!
    
    
    @IBAction func addToPlay(_ sender: UIBarButtonItem) {
        
        
        if sender.title! == "Add To Playlist"{
            sender.title = "Remove From Playlist"
            let preferences = UserDefaults.standard
            
            preferences.set(item!.audioURL, forKey: item!.title)
            preferences.synchronize()
        }
        else{
            sender.title = "Add To Playlist"
            let preferences = UserDefaults.standard
            
            preferences.removeObject(forKey: item!.title)
            preferences.synchronize()
        }
        
        
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        player!.pause()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func play(_ sender: UIButton) {
       
        if(sender.currentTitle! == "Play"){
           
            self.player!.play()
            sender.setTitle("Pause", for: UIControlState.normal)
        }
        else{
         self.player!.pause()
            sender.setTitle("Play", for: UIControlState.normal)
            
        }
        
    }
    func setPlayer(){
        let url = URL(string: item!.audioURL)
        let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
        player = AVPlayer(playerItem: playerItem)
        playerLayer=AVPlayerLayer(player: player!)
        playerLayer?.frame=CGRect(x: 0, y: 0, width: 10, height: 50)
        self.view.layer.addSublayer(playerLayer!)
        let hms = item!.audioDur.split(separator: ":")
        //componentsSeparatedByString(":")
        let seconds = ( (Float64(hms[0])!*60*60 + Float64(hms[1])!*60) + Float64(hms[2])!)
        
        player!.addPeriodicTimeObserver(forInterval: CMTimeMakeWithSeconds(1, 1), queue: DispatchQueue.main) { (CMTime) -> Void in
            if self.player!.currentItem?.status == .readyToPlay {
                let time : Float64 = CMTimeGetSeconds(self.player!.currentTime());
                
                if(time == seconds){
                    self.player!.pause()
                    self.player = nil
                    self.setPlayer()
                    self.sender.setTitle("Play", for: UIControlState.normal)
                    
                }
                
                let mySecs2 = Int(time) % 60
                let myMins2 = Int(time / 60)
                let myHrs2 = Int(time / 3600)
                var x = String(myHrs2)
                var y = String(myMins2)
                var z = String(mySecs2)
                if myHrs2 < 10{
                   x =  "0" + String(myHrs2)
                }
                if myMins2 < 10 {
                    y = "0" + String(myMins2)
                }
                if mySecs2 < 10{
                    z = "0" + String(mySecs2)
                }
                
                let myTimes2 = x + ":" + y + ":" + z;
                self.min.text = myTimes2;//current time of audio track
                self.songPlay!.value = Float ( time );
            }
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let preferences = UserDefaults.standard
        
        if preferences.object(forKey: item!.title) == nil {
            
             played.title = "Add To Playlist"
        } else {
            played.title = "Remove From Playlist"
        }
        
        summary.text = summary.text! + item!.summary
        pubDate.text = pubDate.text! + item!.pubDate
        author.text = author.text! + item!.author
        subTitle.text = subTitle.text! + item!.subtitle
        min.text = "00:00:00"
        max.text = item?.audioDur
        songPlay.minimumValue = 0
        let hms = item!.audioDur.split(separator: ":")
    //componentsSeparatedByString(":")
        let h = ( (Float(hms[0])!*60*60 + Float(hms[1])!*60) + Float(hms[2])!)
        songPlay.maximumValue = h
        setPlayer();
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
