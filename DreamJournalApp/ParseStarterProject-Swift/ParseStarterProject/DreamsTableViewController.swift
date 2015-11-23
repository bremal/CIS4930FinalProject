//
//  DreamsTableViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Breanna Maldonado on 11/23/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class DreamsTableViewController: UIViewController {

    var userDreamEntries = [PFObject]()
    var dreamTitles = [String]()
    var dreamDates = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        getDreamEntries()
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell")
        cell.textLabel!.text = dreamTitles[indexPath.row]
        cell.detailTextLabel?.text = dreamDates[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showItemDetail", sender: tableView)}
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "showItemDetail" {
            let indexPath:NSIndexPath = self.tableView.indexPathForSelectedRow()!
            let detailVC:ItemDetailViewController = segue.destinationViewController as ItemDetailViewController
            detailVC.item = items[indexPath.row] as Item
        }
    }
    
    func getDreamEntries() {
        let query = PFQuery(className: "Dreams")
        let currentUsername = PFUser.currentUser()?.username
        query.whereKey("Username", equalTo: currentUsername!)
        do {
            userDreamEntries = try query.findObjects()
            for entry in userDreamEntries {
                dreamTitles.append(String(entry["Title"]))
                dreamDates.append(String(entry["Date"]))
            }
        }
        catch {
            print("Something bad happened")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
