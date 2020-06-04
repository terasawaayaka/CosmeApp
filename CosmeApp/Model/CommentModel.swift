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
    fileprivate static let PATH: String = "commentPost"
    var id  :String = String()
    var description: String = String()
    var review_post_id : String = String()
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
        if let description = data["description"]as? String{model.description = description}
        if let review_post_id = data["review_post_id"]as? String{model.review_post_id = review_post_id}
        return model
    }
    
    
    static func setParameter(request: CommentPostModel) -> [String:Any] {
        var parameter:[String:Any] = [:]
        parameter["id"] = request.id
        parameter["description"] = request.description
        parameter["post_user_id"] = request.post_user_id
        parameter["review_post_id"] = request.review_post_id
        return parameter
    }
    
}

//MARK: -Create
extension CommentPostModel{
    static func create(request:CommentPostModel, success:@escaping () -> Void) {
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
    static func delete(id:String, success:@escaping () -> Void) {
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
