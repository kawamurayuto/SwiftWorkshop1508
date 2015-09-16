//
//  Post.swift
//  SwiftWorkshop1508
//
//  記事のデータ
//
//  Created by 川村祐人 on 2015/09/17.
//  Copyright (c) 2015年 ever sense, Inc. All rights reserved.
//

import RealmSwift

class Post: Object {
    
    dynamic var id = 0
    dynamic var type = 0
    dynamic var title = ""
    dynamic var url = ""
    dynamic var image = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
