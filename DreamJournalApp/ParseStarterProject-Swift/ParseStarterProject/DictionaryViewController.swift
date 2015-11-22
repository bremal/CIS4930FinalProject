//
//  DictionaryViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Breanna Maldonado on 11/21/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class DictionaryViewController: UIViewController {

    @IBOutlet var instruction: UILabel!
    @IBOutlet var word: UITextField!
    var stringToPass = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func lookUp(sender: AnyObject) {
        if word.text == "" {
            instruction.text = "Please enter a word to look up"
        }
        else {
            let query = PFQuery(className: "Dictionary")
            query.whereKey("keyName", equalTo: word.text!.lowercaseString)
            do {
                let words =  try query.findObjects()
                if words.count == 0 {
                    stringToPass = "Sorry that word is not in the dictionary"
                }
                else {
                    for word in words {
                        stringToPass = String(word["keyDefined"])
                    }
                }
            }
            catch {
                stringToPass = "Sorry something went wrong. Try again."
            }
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
