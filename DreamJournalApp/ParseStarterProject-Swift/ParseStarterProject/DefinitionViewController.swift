//
//  DefinitionViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Breanna Maldonado on 11/21/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {
    var stringFromParse = ""
    @IBOutlet var displayDefinition: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        displayDefinition.text = stringFromParse
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
