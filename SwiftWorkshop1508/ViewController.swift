//
//  ViewController.swift
//  SwiftWorkshop1508
//
//  Created by 川村祐人 on 2015/09/16.
//  Copyright (c) 2015年 ever sense, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appName = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as? String;
        navBar.topItem?.title = appName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func back (segue: UIStoryboardSegue) {
    }
    
    func tableView(table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(table: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath) as! UITableViewCell
        
        let label = table.viewWithTag(1) as! UILabel
        label.text = "No.\(indexPath.row + 1)"
        
        let url = NSURL(string: "http://d3reun7bhr7fny.cloudfront.net/uploads/2015/04/18202119/2-160x160.jpg");
        let request = NSURLRequest(URL: url!)
        let imageView = table.viewWithTag(2) as! UIImageView
        
        NSURLConnection.sendAsynchronousRequest(request, queue:NSOperationQueue.mainQueue()){(res, data, err) in
            let image = UIImage(data:data)
            imageView.image = image
        }
        
        return cell
    }
    
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        //indexPath.row
    performSegueWithIdentifier("gotoBrowserViewController",sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "gotoBrowserViewController") {
        }
    }
}

