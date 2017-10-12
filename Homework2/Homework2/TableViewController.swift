//
//  TableViewController.swift
//  Homework2
//
//  Created by Sai Nishanth Dilly on 10/7/17.
//  Copyright © 2017 Shehab, Mohamed. All rights reserved.
//

import UIKit
import Alamofire
class TableViewController: UITableViewController {
    
 var feeds: [[Feed]] = [[]]
var appSections: [String]?
    
    private func loadData() {
        Alamofire.request("http://dev.theappsdr.com/apis/summer_2016_ios/data.json").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
                print(type(of: json))
                self.feeds = ParseJsonApp.parseJson(json as! [String: Any])
                self.appSections = ParseJsonApp.getAppSection()
                self.tableView.reloadData()
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      //  tableView.estimatedRowHeight = tableView.rowHeight
       // tableView.rowHeight = UITableViewAutomaticDimension
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
        return feeds.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feeds[section].count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let x = appSections {
            
            return x[section]
    
    }
        return " "
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if let x  = feeds[indexPath.section][indexPath.row].optionalImage{
            cell = tableView.dequeueReusableCell(withIdentifier: "appCellIdentifier2", for: indexPath)
            if let appCell = cell as? TableViewCell2{
                appCell.devName2.text = feeds[indexPath.section][indexPath.row].name
                appCell.appTitle2.text = feeds[indexPath.section][indexPath.row].title
                appCell.releaseDate2.text = feeds[indexPath.section][indexPath.row].releaseDate
                appCell.price2.text = "$"+feeds[indexPath.section][indexPath.row].price
                appCell.imageURL = feeds[indexPath.section][indexPath.row].squareImage
                appCell.imageOptionalURL = x
            }
            
        }
        else if let x  = feeds[indexPath.section][indexPath.row].summary{
            cell = tableView.dequeueReusableCell(withIdentifier: "appCellIdentifier3", for: indexPath)
            if let appCell = cell as? TableViewCell3{
                appCell.devName3.text = feeds[indexPath.section][indexPath.row].name
                appCell.appTitle3.text = feeds[indexPath.section][indexPath.row].title
                appCell.releaseDate3.text = feeds[indexPath.section][indexPath.row].releaseDate
                appCell.price3.text = "$"+feeds[indexPath.section][indexPath.row].price
                appCell.imageURL = feeds[indexPath.section][indexPath.row].squareImage
                appCell.summary.text = x
                
            }
            
            
        }
        else{
            cell = tableView.dequeueReusableCell(withIdentifier: "appCellIdentifier", for: indexPath)
            
         //cell = tableView.dequeueReusableCell(withIdentifier: "appCellIdentifier", for: indexPath)
        // Configure the cell...
        if let appCell = cell as? TableViewCell{
            appCell.devName.text = feeds[indexPath.section][indexPath.row].name
            appCell.appTitle.text = feeds[indexPath.section][indexPath.row].title
            appCell.rDate.text = feeds[indexPath.section][indexPath.row].releaseDate
            appCell.price.text = "$"+feeds[indexPath.section][indexPath.row].price
            appCell.imageURL = feeds[indexPath.section][indexPath.row].squareImage
        }
        }

       return cell
        
      
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let x  = feeds[indexPath.section][indexPath.row].summary{
            return CGFloat((350 + (x.characters.count / 2)))
        }
        return UITableViewAutomaticDimension
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
