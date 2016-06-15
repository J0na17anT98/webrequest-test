//
//  ViewController.swift
//  webrequest-test
//
//  Created by Jonathan Tsistinas on 6/15/16.
//  Copyright © 2016 Techinator. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "http://swapi.co/api/people/1/"
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)!
        
        session.dataTaskWithURL(url) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            if let responseData = data {
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.AllowFragments)
                    
                    print(json)
                } catch {
                    print("Could not Serialize")
                }

            }
        }.resume()
    
    }


}

