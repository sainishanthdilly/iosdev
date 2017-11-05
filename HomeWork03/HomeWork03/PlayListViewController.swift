//
//  PlayListViewController.swift
//  HomeWork03
//
//  Created by Sai Nishanth Dilly on 10/22/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import UIKit
import AVKit
class PlayListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var sngPlay: UISlider!
    
    var player:AVPlayer?
    var playerItem:AVPlayerItem?
    var playerLayer:AVPlayerLayer?
    var curIdx = 0
    
    
    var titleList = [String : String]()
    
    var playList = Array<String>()
    
    
    override func viewWillDisappear(_ animated: Bool) {
        player!.pause()
    }
    
    func playNext(){
        curIdx += 1
        curIdx = curIdx % playList.count
        self.player!.pause()
        self.player = nil
        self.setPlayer()
    }
    
    
    func setPlayer(){
        let preferences = UserDefaults.standard
        let audioURl = preferences.string(forKey: playList[curIdx])
        sngPlay.minimumValue = 0.0
        let url = URL(string: audioURl!)
        let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
        player = AVPlayer(playerItem: playerItem)
        playerLayer=AVPlayerLayer(player: player!)
        playerLayer?.frame=CGRect(x: 0, y: 0, width: 10, height: 50)
        self.view.layer.addSublayer(playerLayer!)
        let audDur = titleList[playList[curIdx]]
        self.mx.text = audDur
        let hms = audDur!.split(separator: ":")
        //componentsSeparatedByString(":")
        let seconds = ( (Float64(hms[0])!*60*60 + Float64(hms[1])!*60) + Float64(hms[2])!)
        sngPlay.maximumValue = ((Float(hms[0])!*60*60 + Float(hms[1])!*60) + Float(hms[2])!)
        
        
        player!.addPeriodicTimeObserver(forInterval: CMTimeMakeWithSeconds(1, 1), queue: DispatchQueue.main) { (CMTime) -> Void in
            if self.player!.currentItem?.status == .readyToPlay {
                let time : Float64 = CMTimeGetSeconds(self.player!.currentTime());
                
                if(time == seconds){
                    
                    
                     self.playNext()
                    //self.player!.pause()
                    //self.player = nil
                    //self.setPlayer()
                    //self.sender.setTitle("Play", for: UIControlState.normal)
                    
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
                self.mi.text = myTimes2;//current time of audio track
                self.sngPlay!.value = Float ( time );
            }
        }
        
        
    }
    
    
    
    @IBOutlet weak var mi: UILabel!
    
    @IBOutlet weak var mx: UILabel!
    
    
    @IBAction func playall(_ sender: UIButton) {
        
        if(sender.currentTitle! == "Play All"){
            
            self.player!.play()
            sender.setTitle("Stop", for: UIControlState.normal)
        }
        else{
            self.player!.pause()
            sender.setTitle("Play All", for: UIControlState.normal)
            
        }
        
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier : "cell")
        cell.textLabel?.text = playList[indexPath.row]
        return cell
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let pref = UserDefaults.standard
        
        for ech in titleList.keys{
            if pref.value(forKey: ech) != nil{
                playList.append(ech)
            }
        }
        setPlayer()
        
       
 
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
