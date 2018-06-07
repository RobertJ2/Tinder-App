//
//  ViewController.swift
//  Tinder
//
//  Created by Robert Jackson Jr on 6/7/18.
//  Copyright © 2018 Robert Jackson Jr. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let testObject = PFObject(className: "Testing")
        testObject["foo"] = "bar"
        testObject.saveInBackground { (success, error) in
            print("object has been saved")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

