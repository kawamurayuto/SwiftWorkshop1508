//
//  Presenter.swift
//  SwiftWorkshop1508
//
// 記事一覧、詳細、設定画面の表示要素データ、状態を保持する
//
//  Created by 川村祐人 on 2015/09/17.
//  Copyright (c) 2015年 ever sense, Inc. All rights reserved.
//

import Foundation

class Presenter: NSObject {

    static let appName = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as? String;
    static var selectedPost:Post!
    static var postTypeIndex:Int = 0
    
}