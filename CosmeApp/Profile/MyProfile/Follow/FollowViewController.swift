//
//  FollowViewController.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/06/08.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
import FirebaseAuth
// MARK: - Property
class FollowViewController: BaseViewController {
    @IBOutlet weak var mainView: FollowMainView!
    
    var userModel : UserModel = UserModel()
    var userModels : [UserModel] = [UserModel]()
    var noticeModels: [NoticeModel] = [NoticeModel]()
    
    var follow: Bool = false
    var follower: Bool = false
}
// MARK: - Life cycle
extension FollowViewController {
    override func loadView() {
        super.loadView()
        setDelegate()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getModel()
    }
}
// MARK: - Protocol
extension FollowViewController :FollowMainViewDelegate{
    func didSelectRowAt(indexPath: IndexPath) {
        let yourProfileViewController = YourProfileViewController()
        yourProfileViewController.userModel = userModels[indexPath.row]
        navigationController?.pushViewController(yourProfileViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    
}
// MARK: - method
extension FollowViewController {
    func setDelegate() {
        mainView.delegate = self
    }
    func getModel() {
        var followUsers = [UserModel]()
        UserModel.readMe { (userModel) in
            userModel.follow_users.forEach { (followUser) in
                followUser.forEach { (key, val) in
                    if val == true {
                        UserModel.readAt(userId: key) { (userModel) in
                            followUsers.append(userModel)
                        }
                    }
                }
            }
            self.mainView.getModel(userModels: followUsers)
            self.userModels = followUsers
        }
    }
//    func getModel(){
//        NoticeModel.reads { (noticeModels) in
//            let follow = noticeModels.filter { (noticeModel) -> Bool in
//                if let uid = Auth.auth().currentUser?.uid {
//                    if noticeModel.notice_user_id == uid && noticeModel.noticeType == "フォロー" {
//                        return true
//                    }else {
//                        return false
//                    }
//                } else{
//                    return false
//                }
//            }
//            self.noticeModels = follow
//            self.mainView.getModel(noticeModels: follow)
//
//            for noticeModel in noticeModels {
//                if noticeModel.notice_my_id != "" {
//                    UserModel.readAt(userId: noticeModel.notice_my_id) { (userModel) in
//                        if let name = userModel.nickname {
//                            noticeModel.notice_user_name = name
//                        }
//                        if let icon = userModel.photo_path {
//                            noticeModel.notice_user_icon = icon
//                        }
//                        self.mainView.getModel(noticeModels: self.noticeModels)
//                    }
//                }
//            }
//        }
//    }
}
