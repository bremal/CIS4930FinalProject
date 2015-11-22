//
//  AddDreamViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Breanna Maldonado on 11/21/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class AddDreamViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet var date: UIDatePicker!
    @IBOutlet var dreamTitle: UITextField!
    @IBOutlet var dreamType: UIPickerView!
    @IBOutlet var userText: UITextView!
    
    var wordsToHighlight = [String]()
    let pickerData = ["Lucid", "Nightmare", "Normal", "False Awakening"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dreamType.dataSource = self
        dreamType.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func findKeywords(sender: AnyObject) {
        let userString = String(userText.text)  //string to be searched
        let stringArray = userString.componentsSeparatedByString(" ")
        
        let query = PFQuery(className: "Dictionary")
        for word in stringArray {
            query.whereKey("keyName", equalTo: word)
            do {
                let words =  try query.findObjects()
                if words.count != 0 {
                    for word in words {
                        //try! highlightWord(userString, word: String(word["keyName"]))
                        wordsToHighlight.append(String(word["keyName"]))
                    }
                }
            }
            catch {
                print("Something went wrong")
            }
        }
        
        try! self.highlightWord(userString)
        
    }
    
    func highlightWord(searchString: String) throws {
        let attributed = NSMutableAttributedString(string: searchString)
        for word in wordsToHighlight {
            let regex = try! NSRegularExpression(pattern: word, options: .CaseInsensitive)
            
            for match in regex.matchesInString(searchString, options: NSMatchingOptions(), range: NSRange(location: 0, length: searchString.utf16.count)) as [NSTextCheckingResult] {
                attributed.addAttribute(NSBackgroundColorAttributeName, value: UIColor.yellowColor(), range: match.range)
            }
        }
        userText.attributedText = attributed
        
        
    }
    
    
    
    @IBAction func addDream(sender: AnyObject) { //add dream entry to Parse
        let dateEntry = date.date
        let title = dreamTitle.text
        let row = dreamType.selectedRowInComponent(0)
        let type = pickerData[row]
        let description = userText.text
        let currentUsername = PFUser.currentUser()?.username
        
        if(dateEntry != "" && title != "" && type != "" && description != "") {
            let newDream = PFObject(className: "Dreams")
            newDream["Username"] = currentUsername
            newDream["Title"] = title
            newDream["Type"] = type
            newDream["Description"] = description
            newDream["Date"] = dateEntry
            
            newDream.saveInBackgroundWithBlock {
                (success: Bool, error:NSError?) -> Void in
                
                if(success)
                {
                    //We saved our information
                    print("Saved")
                    
                }
                else
                {
                    //there was a problem
                    print("Error")
                }
            }
            
        }
        else {
            //display message to tell user to fill out all fields
        }
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        return pickerData[row]
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
