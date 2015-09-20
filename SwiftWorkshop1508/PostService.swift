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

    private static var res: Results<Post>! /* getter にしたい */
    private static var condition:String!
    private static let config = Realm.Configuration(
        path: NSBundle.mainBundle().pathForResource("Assets/default", ofType:"realm"),
        readOnly: true
    )


    static func query(condition: String = "") {
        if (self.condition != nil && self.condition == condition) {
            return
        }
        
        self.condition = condition
        
        /* @todo 可変引数を apply みたいなことがしたい */
        do {
            let realm = try Realm(configuration: config)
            res = realm.objects(Post)
            
            if !condition.isEmpty {
                res = res.filter(condition)
            }
            
            let notificationCenter = NSNotificationCenter.defaultCenter()
            notificationCenter.postNotificationName("query", object: self, userInfo: ["condition": condition])
        } catch _ {
            /* @todo エラー処理 */
        }
    }
    
    static func results() -> Results<Post> {
        if res == nil {
            query();
        }
        
        return res;
    }

}