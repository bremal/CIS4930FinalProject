//
//  WebViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Breanna Maldonado on 11/21/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    @IBOutlet var webSite: UIWebView!
    
    var html:NSString!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = NSURL(string:"http://www.dreammoods.com")!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            if let urlContent = data
            {
                //print(urlContent)
                self.html = NSString(data: urlContent, encoding: NSUTF8StringEncoding)!
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                    self.webSite.loadHTMLString(String(self.html), baseURL: nil)
                    //webView.loadRequest( NSURLRequest(URL: url!))
                    
                })
                
            }
            else
            {
                print("something is up")
            }
            
        }
        task.resume()
    
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
