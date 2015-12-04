//
//  SettingsViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Breanna Maldonado on 11/26/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class SettingsViewController: UIViewController {
    var dateTime = NSDate()
    @IBOutlet var datePickerOutlet: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func datePicker(sender: AnyObject) {
        dateTime = datePickerOutlet.date
    }

    
    @IBAction func setReminder(sender: AnyObject) {
        print(dateTime)
        let localNotification = UILocalNotification()
        localNotification.fireDate = dateTime
        localNotification.repeatInterval = NSCalendarUnit.Day
        if #available(iOS 8.2, *) {
            localNotification.alertTitle = "Reminder"
        } else {
            // Fallback on earlier versions
        }
        localNotification.alertBody = "Reality Check Time!"
        localNotification.soundName = UILocalNotificationDefaultSoundName
        localNotification.applicationIconBadgeNumber = 1
        let application = UIApplication.sharedApplication()
        application.scheduleLocalNotification(localNotification)
        
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
