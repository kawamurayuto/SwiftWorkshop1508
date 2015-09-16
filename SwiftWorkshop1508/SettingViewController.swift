//
//  SettingViewController.swift
//  SwiftWorkshop1508
//
//  一覧表示に出す記事を絞り込む
//
//  Created by 川村祐人 on 2015/09/16.
//  Copyright (c) 2015年 ever sense, Inc. All rights reserved.
//

import Foundation
import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var segueControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segueControl.selectedSegmentIndex = Presenter.postTypeIndex
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(animated: Bool) {
        var index = segueControl.selectedSegmentIndex
        var title = segueControl.titleForSegmentAtIndex(index)!
        
        if title == "all" {
            PostService.query()
        } else {
            PostService.query(condition: "type=\(title)") /* @todo プレースホルダーみたいなことしたい */
        }
        
        Presenter.postTypeIndex = index;
        
        super.viewDidDisappear(animated)
    }
    
}
