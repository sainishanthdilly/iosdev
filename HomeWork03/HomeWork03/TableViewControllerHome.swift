//
//  TableViewControllerHome.swift
//  HomeWork03
//
//  Created by Sai Nishanth Dilly on 10/18/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import UIKit
import Alamofire

class TableViewControllerHome: UITableViewController {
    var topics = Array<Array<Item>>()
    
    var indicator = UIActivityIndicatorView()
    
    func activityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x:0, y:0, width:40, height:40))
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        indicator.center = self.view.center
        self.view.addSubview(indicator)
    }
    
    private func loadData() {
        indicator.startAnimating()
        let xmlp = ParseXML()
        xmlp.parseFeed(url: "http://feed.thisamericanlife.org/talpodcast"){[weak self](rssItem) in
           
            DispatchQueue.main.async {
                 self?.topics = rssItem
                self?.indicator.stopAnimating()
                self?.tableView.reloadData()
            }
            
        }
        /*Alamofire.request("http://feed.thisamericanlife.org/talpodcast").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let xml = response.result.value {
                print("XML: \(xml)")
                print(type(of: xml))
                
                //self.topics = ParseJsonApp.parseGetAllTopics(json as! [String: Any])
                self.tableView.reloadData()
                DispatchQueue.main.async {
                    self.indicator.stopAnimating()
                }
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }*/
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator()
        loadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return topics.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return topics[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let t = topics[indexPath.section][indexPath.row] as Item
        cell.textLabel?.text = t.title
        cell.detailTextLabel?.text = t.summary

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "detailSegue"{
        let cell = sender as! UITableViewCell
        let idx = tableView.indexPath(for:cell)!
        
        if let y = segue.destination as? UINavigationController{
        if let x = y.visibleViewController as? DetailViewController{
            x.item = topics[idx.section][idx.row]
        }
        }
        
    }
        else{
            var temp =  [String : String]()
            for i in topics{
                temp[i[0].title] = i[0].audioDur
            }
            if let seg = segue.destination as? PlayListViewController{
                seg.titleList = temp
            }
            
        }
    }
 

}
