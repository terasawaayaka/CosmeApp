//
//  CommentModel.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/22.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import UIKit
import PGFramework
import FirebaseDatabase

class CommentPostModel{
    fileprivate static let PATH: String = "post"
    var id  :String = String()
    var title: String = String()
    var category: String = String()
    var review: String = String()
    var tag: String = String()
    var image_paths: [String] = [String]()
    //ユーザーの情報
    var post_user_name: String = String()
    var post_user_id: String = String()
    var post_user_icon: String?
}

extension CommentPostModel{
    static func parse(data: [String:Any]) -> CommentPostModel {
        let model:CommentPostModel = CommentPostModel()
        if let id = data["id"]as? String{model.id = id}
        if let post_user_id = data["post_user_id"]as? String{model.post_user_id = post_user_id}
        if let review = data["review"]as? String{model.review = review}
        if let image_paths = data["image_paths"]as? [String]{model.image_paths = image_paths}
        if let title = data["title"]as? String{model.title = title}
        if let category = data["category"]as? String{model.category = category}
        if let tag = data["tag"]as? String{model.tag = tag}
        return model
    }
    
    
    static func setParameter(request: CommentPostModel) -> [String:Any] {
        var parameter:[String:Any] = [:]
        parameter["id"] = request.id
        parameter["post_user_id"] = request.post_user_id
        parameter["review"] = request.review
        parameter["title"] = request.title
        parameter["category"] = request.category
        parameter["tag"] = request.tag
        parameter["image_paths"] = request.image_paths
        return parameter
    }
    
}

//MARK: -Create
extension CommentPostModel{
    static func create(request:CommentPostModel, images:[UIImage], success:@escaping () -> Void) {
        let dbRef = Database.database().reference().child(PATH).childByAutoId()
        if let key = dbRef.key{
            request.id = key
        }
        let parameter = setParameter(request:request)
        dbRef.setValue(parameter)
        success()
        }
}


//MARK: -Read
extension CommentPostModel{
    static func reads(success:@escaping ([CommentPostModel]) -> Void) {
        let dbRef = Database.database().reference().child(PATH)
        dbRef.observe(.value, with: {snapshot in
            var models: [CommentPostModel] = [CommentPostModel]()
            for item in (snapshot.children){
                let snapshot = item as! DataSnapshot
                let data = snapshot.value as! [String: Any]
                let model: CommentPostModel = parse(data:data)
                model.id = snapshot.key
                models.append(model)
            }
            success(models)
        })
    }
    
    static func readAt(id:String, success:@escaping (CommentPostModel) -> Void, failure:@escaping () -> Void){
        let dbRef = Database.database().reference().child(PATH).child(id)
        dbRef.observe(.value) {(snapshot)in
            guard let data = snapshot.value as? [String:Any]else{
                failure()
                return
            }
            let model:CommentPostModel = parse(data: data)
            success(model)
        }
    }
}

//MARK: -Update
extension CommentPostModel{
    static func update(request:CommentPostModel,images:[UIImage],success:@escaping() -> Void){
            let id = request.id
            let dbRef = Database.database().reference().child(PATH).child(id)
        let parameter = setParameter(request: request)
        dbRef.updateChildValues(parameter){(error,dbRef)in
                if error != nil{
                    print("updateエラー：",error)
                }else{
                    success()
                }
        }
    }
}


//MARK: -Delete
extension CommentPostModel{
    static func delete (id:String, success:@escaping () -> Void) {
        let dbRef = Database.database().reference().child(PATH).child(id)
        dbRef.removeValue{(error,dbRef)in
            if error != nil{
                print("deleteエラー：",error)
            }else{
                success()
            }
        }
    }
}
