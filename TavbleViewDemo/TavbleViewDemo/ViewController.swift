//
//  ViewController.swift
//  TavbleViewDemo
//
//  Created by Sai Nishanth Dilly on 10/5/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var data = ["Brad","Butter","Jam", "IOP"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tbView.dequeueReusableCell(withIdentifier: "cellC", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print ("Item selected \(data[indexPath.row])")
        
    }

    @IBOutlet weak var tbView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbView.delegate = self
        tbView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

