//
//  NoticeModel.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/26.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
import FirebaseDatabase
import FirebaseStorage

class NoticeModel{
    fileprivate static let PATH: String = "notice"
    var id: String = String()
    
    //ユーザーの情報
    var post_user_name: String = String()
    var post_user_id: String = String()
    var post_user_icon: String?
}

