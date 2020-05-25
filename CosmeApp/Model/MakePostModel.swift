//
//  MakePostModel.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/22.  
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
import FirebaseDatabase
import FirebaseStorage

class MakePostModel{
    fileprivate static let PATH: String = "MakePost"
    var id  :String = String()
    var basemake: String = String()
    var highlight: String = String()
    var shading: String = String()
    var eyeshadow: String = String()
    var eyeliner: String = String()
    var mascara: String = String()
    var colorcontact: String = String()
    var eyebrow: String = String()
    var cheek: String = String()
    var lip: String = String()
    var skincare: String = String()
    var haircare: String = String()
    var process: String = String()
    var image_paths: [String] = [String]()
    //ユーザーの情報
    var post_user_name: String = String()
    var post_user_id: String = String()
    var post_user_icon: String?
}

extension MakePostModel{
    static func parse(data: [String:Any]) -> MakePostModel {
        let model:MakePostModel = MakePostModel()
        if let id = data["id"]as? String{model.id = id}
        if let post_user_id = data["post_user_id"]as? String{model.post_user_id = post_user_id}
        if let basemake = data["basemake"]as? String{model.basemake = basemake}
        if let highlight = data["highlight"]as? String{model.highlight = highlight}
        if let shading = data["shading"]as? String{model.shading = shading}
        if let eyeshadow = data["eyeshadow"]as? String{model.eyeshadow = eyeshadow}
        if let eyeliner = data["eyeliner"]as? String{model.eyeliner = eyeliner}
        if let mascara = data["mascara"]as? String{model.mascara = mascara}
        if let colorcontact = data["colorcontact"]as? String{model.colorcontact = colorcontact}
        if let eyebrow = data["eyebrow"]as? String{model.eyebrow = eyebrow}
        if let cheek = data["cheek"]as? String{model.cheek = cheek}
        if let lip = data["lip"]as? String{model.lip = lip}
        if let skincare = data["skincare"]as? String{model.skincare = skincare}
        if let haircare = data["haircare"]as? String{model.haircare = haircare}
        if let process = data["process"]as? String{model.process = process}
        if let image_paths = data["image_paths"]as? [String]{model.image_paths = image_paths}
        return model
    }
    
    
    static func setParameter(request: MakePostModel) -> [String:Any] {
        var parameter:[String:Any] = [:]
        parameter["id"] = request.id
        parameter["post_user_id"] = request.post_user_id
        parameter["basemake"] = request.basemake
        parameter["highlight"] = request.highlight
        parameter["shading"] = request.shading
        parameter["eyeshadow"] = request.eyeshadow
        parameter["eyeliner"] = request.eyeliner
        parameter["mascara"] = request.mascara
        parameter["colorcontact"] = request.colorcontact
        parameter["eyebrow"] = request.eyebrow
        parameter["cheek"] = request.cheek
        parameter["lip"] = request.lip
        parameter["skincare"] = request.skincare
        parameter["haircare"] = request.haircare
        parameter["process"] = request.process
        parameter["image_paths"] = request.image_paths
        return parameter
    }
    
}

//MARK: -Create
extension MakePostModel{
    static func create(request:MakePostModel, images:[UIImage], success:@escaping () -> Void) {
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
extension MakePostModel{
    static func reads(success:@escaping ([MakePostModel]) -> Void) {
        let dbRef = Database.database().reference().child(PATH)
        dbRef.observe(.value, with: {snapshot in
            var models: [MakePostModel] = [MakePostModel]()
            for item in (snapshot.children){
                let snapshot = item as! DataSnapshot
                let data = snapshot.value as! [String: Any]
                let model: MakePostModel = parse(data:data)
                model.id = snapshot.key
                models.append(model)
            }
            success(models)
        })
    }
    
    static func readAt(id:String, success:@escaping (MakePostModel) -> Void, failure:@escaping () -> Void){
        let dbRef = Database.database().reference().child(PATH).child(id)
        dbRef.observe(.value) {(snapshot)in
            guard let data = snapshot.value as? [String:Any]else{
                failure()
                return
            }
            let model:MakePostModel = parse(data: data)
            success(model)
        }
    }
}

//MARK: -Update
extension MakePostModel{
    static func update(request:MakePostModel,images:[UIImage],success:@escaping() -> Void){
            let id = request.id
            let dbRef = Database.database().reference().child(PATH).child(id)
        var parameter = setParameter(request: request)
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


//MARK: -Delete
extension MakePostModel{
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

extension MakePostModel{
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

