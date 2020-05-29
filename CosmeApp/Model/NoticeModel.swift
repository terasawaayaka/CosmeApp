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

class NoticeModel {
    fileprivate static let PATH: String = "notice"
    var id: String = String()
    var comment: String = String() //コメント
    var good: String = String() //いいね
    var follow: String = String() //フォロー
    var image_paths: [String] = [String]()
    
    //ユーザーの情報
    var post_user_name: String = String()
    var post_user_id: String = String()
    var post_user_icon: String?
}

extension NoticeModel {
    static func parse(data: [String: Any]) -> NoticeModel {
        let model: NoticeModel = NoticeModel()
        if let id = data["id"] as? String {model.id = id}
        if let comment = data["comment"] as? String {model.comment = comment}
        if let good = data["good"] as? String {model.good = good}
        if let follow = data["follow"] as? String {model.follow = follow}
        if let image_paths = data["image_paths"] as? [String] {model.image_paths = image_paths}
        if let post_user_id = data["post_user_id"] as? String {model.post_user_id = post_user_id}
        return model
    }
}


extension NoticeModel {
    static func setParameter(request: NoticeModel) -> [String: Any] {
        var parameter: [String: Any] = [:]
        parameter["id"] = request.id
        parameter["comment"] = request.comment
        parameter["good"] = request.good
        parameter["follow"] = request.follow
        parameter["image_paths"] = request.image_paths
        parameter["post_user_id"] = request.post_user_id
        return parameter
    }
}

//MARK: Create
extension NoticeModel {
    static func create(request: NoticeModel,success:@escaping() -> Void) {
        let dbRef = Database.database().reference().child(PATH).childByAutoId()
        if let key = dbRef.key {
            request.id = key
        }
        let parameter = setParameter(request: request)
        dbRef.setValue(parameter)
        success()
    }
}

//MARK: Read
extension NoticeModel {
    static func reads(success:@escaping ([NoticeModel]) -> Void) {
        let dbRef = Database.database().reference().child(PATH)
        dbRef.observe(.value, with: { snapshot in
            var models: [NoticeModel] = [NoticeModel]()
            for item in (snapshot.children) {
                let snapshot = item as! DataSnapshot
                let data = snapshot.value as! [String: Any]
                let model: NoticeModel = parse(data: data)
                model.id = snapshot.key
                models.append(model)
            }
            success(models)
        })
    }
    static func readAt(id: String,success:@escaping(NoticeModel) -> Void,failure:@escaping() -> Void) {
        let dbRef = Database.database().reference().child(PATH).child(id)
        dbRef.observe(.value) { (snapshot) in
            guard let data = snapshot.value as? [String: Any] else {
                failure()
                return
            }
            let model: NoticeModel = parse(data: data)
            success(model)
        }
    }
}


//MARK: Update
extension NoticeModel {
    static func update(request: NoticeModel,success:@escaping() -> Void) {
        let id = request.id
        let dbRef = Database.database().reference().child(PATH).child(request.id)
        let parameter = setParameter(request: request)
        dbRef.updateChildValues(parameter) {(error,dbRef) in
            if error != nil {
                print("updateエラー:",error)
            } else {
                success()
            }
        }
    }
}
//MARK: Delete
extension NoticeModel {
    static func delete(id: String,success:@escaping() -> Void) {
        let dbRef = Database.database().reference().child(PATH).child(id)
        dbRef.removeValue {(error,dbRef) in
            if error != nil {
                print("deleteエラー:",error)
            } else {
                success()
            }
        }
    }
}

//写真アップロード
extension NoticeModel {
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
