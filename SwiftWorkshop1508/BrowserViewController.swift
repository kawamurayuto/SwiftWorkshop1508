//
//  BrowserViewController.swift
//  SwiftWorkshop1508
//
//  記事をブラウザで表示する
//
//  Created by 川村祐人 on 2015/09/16.
//  Copyright (c) 2015年 ever sense, Inc. All rights reserved.
//

import Foundation
import UIKit

class BrowserViewController: UIViewController {
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let post = Presenter.selectedPost
        let url: NSURL = NSURL(string: post.url)!
        let request: NSURLRequest = NSURLRequest(URL: url)
        
        navBar.topItem?.title = post.title
        webView.loadRequest(request)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
