//
//  SettingViewController.swift
//  SwiftWorkshop1508
//
//  Created by 川村祐人 on 2015/09/16.
//  Copyright (c) 2015年 ever sense, Inc. All rights reserved.
//

import Foundation
import UIKit

class SettingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onValueChanged(sender: AnyObject) {
        var segControl = sender as! UISegmentedControl
        var index = segControl.selectedSegmentIndex
        var title = segControl.titleForSegmentAtIndex(index)
        println(title)
    }
    
}
