//
//  ReviewReviewPostModel.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/22.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth

class ReviewPostModel{
    fileprivate static let PATH: String = "reviewPost"
    var id  :String = String()
    var title: String = String()
    var category: String = String()
    var review: String = String()
    var tag: String = String()
    var image_paths: [String] = [String]()
    var review_num: Int = Int() //星の数
    var good_users: [[String: Bool]] = [[String: Bool]]() //いいねした人の一覧
    var isGood: Bool = false //いいねしたか否か
    var favorite_users:[[String: Bool]] = [[String: Bool]]()
    var isFavorite:Bool = false
    
    var reportText: [String] = [String]()//通報の文章
    var report_num: Int = Int()//通報の数
    
    //ユーザーの情報
    var post_user_name: String = String()
    var post_user_id: String = String()
    var post_user_icon: String?
}

extension ReviewPostModel{
    static func parse(data: [String:Any]) -> ReviewPostModel {
        let model:ReviewPostModel = ReviewPostModel()
        if let id = data["id"]as? String{model.id = id}
        if let post_user_id = data["post_user_id"]as? String{model.post_user_id = post_user_id}
        if let review = data["review"]as? String{model.review = review}
        if let title = data["title"]as? String{model.title = title}
        if let category = data["category"]as? String{model.category = category}
        if let tag = data["tag"]as? String{model.tag = tag}
        if let image_paths = data["image_paths"]as? [String]{model.image_paths = image_paths}
        if let review_num = data["review_num"]as? Int{model.review_num = review_num}
        if let good_users = data["good_users"] as? [String: Bool] {
            good_users.forEach { (key, value) in
                model.good_users.append([key:value])
            }
        }
        if let favorite_users = data["favorite_users"] as? [String: Bool] {
            favorite_users.forEach { (key, value) in
                model.favorite_users.append([key:value])
            }
        }
        if let reportText = data["reportText"]as? [String]{model.reportText = reportText }
        if let report_num = data["report_num"]as? Int{model.report_num = report_num}
        return model
    }
    
    
    static func setParameter(request: ReviewPostModel) -> [String:Any] {
        var parameter:[String:Any] = [:]
        parameter["id"] = request.id
        parameter["post_user_id"] = request.post_user_id
        parameter["review"] = request.review
        parameter["title"] = request.title
        parameter["category"] = request.category
        parameter["tag"] = request.tag
        parameter["image_paths"] = request.image_paths
        parameter["review_num"] = request.review_num
        parameter["reportText"] = request.reportText
        parameter["report_num"] = request.report_num
        return parameter
    }
    
}

//MARK: -Create
extension ReviewPostModel{
    static func create(request:ReviewPostModel, images:[UIImage], success:@escaping () -> Void) {
        let dbRef = Database.database().reference().child(PATH).childByAutoId()
        if let key = dbRef.key{
            request.id = key
        }
        var parameter = setParameter(request:request)
        uploadPhoto(photoName: request.id, image: images, success: { (downloadPaths) in
            parameter["image_paths"] = downloadPaths
            dbRef.setValue(parameter)
            success()
        }) {
            print("写真アップロードエラー：")
        }
    }
}

//MARK: -Read
extension ReviewPostModel{
    static func reads(success:@escaping ([ReviewPostModel]) -> Void) {
        let dbRef = Database.database().reference().child(PATH)
        dbRef.observe(.value, with: {snapshot in
            var models: [ReviewPostModel] = [ReviewPostModel]()
            var sortedModels :[ReviewPostModel] = []
            for item in (snapshot.children){
                let snapshot = item as! DataSnapshot
                let data = snapshot.value as! [String: Any]
                let model: ReviewPostModel = parse(data:data)
                model.id = snapshot.key
                models.append(model)
            }
            var num : Int = 0
            num = models.count
            models.forEach { (model) in
                num -= 1
                sortedModels.append(models[num])
            }
            success(sortedModels)
        })
    }
    
    static func readAt(id:String, success:@escaping (ReviewPostModel) -> Void, failure:@escaping () -> Void){
        let dbRef = Database.database().reference().child(PATH).child(id)
        dbRef.observe(.value) {(snapshot)in
            guard let data = snapshot.value as? [String:Any]else{
                failure()
                return
            }
            let model:ReviewPostModel = parse(data: data)
            success(model)
        }
    }
}

//MARK: -Update
extension ReviewPostModel{
    static func update(request:ReviewPostModel,images:[UIImage]?=nil,success:@escaping() -> Void){
            let id = request.id
            let dbRef = Database.database().reference().child(PATH).child(id)
        var parameter = setParameter(request: request)
        if images == nil {
            dbRef.updateChildValues(parameter){(error,dbRef)in
                if error != nil{
                    print("updateエラー：",error)
                }else{
                    success()
                }
            }
        }else {
            uploadPhoto(photoName: request.id, image: images, success: { (downloadPaths) in
                parameter["image_paths"] = downloadPaths
                dbRef.updateChildValues(parameter){(error,dbRef)in
                    if error != nil{
                        print("updateエラー：",error)
                    }else{
                        success()
                    }
                }
            })
            {
                print("updateエラー：")
            }
        }
    }
    static func addGoodUser(request: ReviewPostModel,isGood: Bool) {
        if let uid = Auth.auth().currentUser?.uid {
            let dbRef = Database.database().reference().child(PATH).child(request.id).child("good_users").child(uid)
            dbRef.setValue(isGood)
        }
    }
    static func addFavoriteUser(request: ReviewPostModel,isFavorite: Bool) {
        if let uid = Auth.auth().currentUser?.uid {
            let dbRef = Database.database().reference().child(PATH).child(request.id).child("favorite_users").child(uid)
            dbRef.setValue(isFavorite)
        }
    }
}


//MARK: -Delete
extension ReviewPostModel{
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

extension ReviewPostModel{
    static func uploadPhoto(photoName: String, image: [UIImage]?, success: @escaping ([String]) -> Void, failure: @escaping () -> Void) -> Void{
        let group = DispatchGroup()
        let queue = DispatchQueue(label: ".photo")
        guard let images = image else {return}
        var num = 1
        var paths: [String] = []
        images.forEach { (image) in
            group.enter()
            queue.async {
                guard let data = image.jpegData(compressionQuality: 0.05), data.count < 4000000 else {
                    group.leave()
                    return failure()
                }
                let fileRef = Storage.storage().reference().child("images/" + photoName + num.description)
                num += 1
                let metaData = StorageMetadata()
                metaData.contentType = "image/jpeg"
                fileRef.putData(data, metadata: metaData) { (meta, error) in
                    fileRef.downloadURL { (url, error) in
                        if let _ = error {
                            return
                        } else {
                            paths.append(url?.description ?? "")
                            group.leave()
                        }
                    }
                }
            }
        }
        group.notify(queue: .main) {
            success(paths)
        }
    }
}

