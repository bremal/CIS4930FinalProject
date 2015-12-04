//
//  HomeViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Breanna Maldonado on 11/21/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if(identifier == "logOut") {
            PFUser.logOutInBackground()
            print(PFUser.currentUser()?.username)
            if(PFUser.currentUser()?.username == nil) {
                return true
            }
            else {
                return false
            }
        }
        return true
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
