//
//  ViewController.swift
//  SwiftWorkshop1508
//
//  記事一覧を表示
//
//  Created by 川村祐人 on 2015/09/16.
//  Copyright (c) 2015年 ever sense, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var table: UITableView!
    @IBAction func back (segue: UIStoryboardSegue) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: "reloadData:", name: "query", object: nil)
        
        navBar.topItem?.title = Presenter.appName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func reloadData(notification: NSNotification) {
        table.reloadData()
    }
    
    func tableView(table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostService.results().count
    }
    
    func tableView(table: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let post = PostService.results()[indexPath.row];
        let cell = table.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath) as! UITableViewCell
        let label = table.viewWithTag(1) as! UILabel
        label.text = post.title
        
        let url = NSURL(string: post.image);
        let request = NSURLRequest(URL: url!)
        let imageView = table.viewWithTag(2) as! UIImageView
        
        NSURLConnection.sendAsynchronousRequest(request, queue:NSOperationQueue.mainQueue()){(res, data, err) in
            let image = UIImage(data:data)
            imageView.image = image
        }
        
        return cell
    }
    
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        Presenter.selectedPost = PostService.results()[indexPath.row];
        performSegueWithIdentifier("gotoBrowserViewController",sender: nil)
    }
    
}

