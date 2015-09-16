//
//  BrowserViewController.swift
//  SwiftWorkshop1508
//
//  Created by 川村祐人 on 2015/09/16.
//  Copyright (c) 2015年 ever sense, Inc. All rights reserved.
//

import Foundation
import UIKit

class BrowserViewController: UIViewController {
    
    var loaded:Bool = false
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loaded = false
        let url: NSURL = NSURL(string: "http://192abc.com")!
        let request: NSURLRequest = NSURLRequest(URL: url)
        webView.loadRequest(request)
        println("init")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        println(webView.loading)
        if !loaded {
            let title:String? = webView.stringByEvaluatingJavaScriptFromString("document.title")
            navBar.topItem?.title = title!
        }
        loaded = true;
    }
}
