//
//  DetailedEntryViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Breanna Maldonado on 11/23/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class DetailedEntryViewController: UIViewController {

    @IBOutlet var navigationBar: UINavigationBar!
    @IBOutlet var entryText: UITextView!
    @IBOutlet var dreamType: UILabel!
    
    var dreamTitle = ""
    var dreamDate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        showDreamInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showDreamInfo() {
        let query = PFQuery(className: "Dreams")
        let currentUsername = PFUser.currentUser()?.username
        query.whereKey("Username", equalTo: currentUsername!)
        do {
            let userDreamEntries = try query.findObjects()
            for entry in userDreamEntries {
                let title = String(entry["Title"])
                let date = String(entry["Date"])
                if title == dreamTitle && date == dreamDate {
                    navigationBar.topItem!.title = title
                    entryText.text = String(entry["Description"])
                    dreamType.text = String(entry["Type"])
                }
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
