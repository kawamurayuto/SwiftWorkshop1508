//
//  PostService.swift
//  SwiftWorkshop1508
//
//  記事のデータの取得方法を提供する
//
//  Created by 川村祐人 on 2015/09/16.
//  Copyright (c) 2015年 ever sense, Inc. All rights reserved.
//

import Foundation
import RealmSwift

class PostService: NSObject {

    private static let realm = try! Realm()
    private static var res: Results<Post>! /* getter にしたい */
    private static var condition:String!

    static func query(condition: String = "") {
        if (self.condition != nil && self.condition == condition) {
            return
        }
        
        self.condition = condition
        
        /* @todo 可変引数を apply みたいなことがしたい */
        res = realm.objects(Post)
        
        if !condition.isEmpty {
            res = res.filter(condition)
        }
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.postNotificationName("query", object: self, userInfo: ["condition": condition])
    }
    
    static func results() -> Results<Post> {
        if res == nil {
            query();
        }
        
        return res;
    }

}