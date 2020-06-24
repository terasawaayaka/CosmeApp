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
    @IBOutlet weak var headerView: HeaderView!
    
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
        setHeaderView()
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
        yourProfileViewController.fromfollow = true
        navigationController?.pushViewController(yourProfileViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
}
extension FollowViewController :HeaderViewDelegate{
    func touchedLeftButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        animatorManager.navigationType = .slide_pop
    }
}
// MARK: - method
extension FollowViewController {
    func setDelegate() {
        mainView.delegate = self
        headerView.delegate = self
    }
    func setHeaderView() {
        if follow {
            headerView.setCenter(text: "フォローリスト", fontSize: 20, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        }
        if follower {
            headerView.setCenter(text: "フォロワーリスト", fontSize: 20, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        }
        headerView.setLeft(text: "＜", fontSize: 16, color: #colorLiteral(red: 0.7390006781, green: 0.7434574962, blue: 1, alpha: 1))
    }
    func getModel() {
        if follow {
        var followUsers = [UserModel]()
        UserModel.readMe { (userModel) in
            userModel.follow_users.forEach { (followUser) in
                followUser.forEach { (key, val) in
                    if val == true {
                        UserModel.readAt(userId: key) { (userModel) in
                            followUsers.append(userModel)
                            self.mainView.getModel(userModels: followUsers)
                            self.userModels = followUsers
                        }
                    }
                }
            }
        }
        }
        if follower {
            var followerUsers = [UserModel]()
            UserModel.readMe { (userModel) in
                userModel.follower_users.forEach { (followerUser) in
                    followerUser.forEach { (key, val) in
                        if val == true {
                            UserModel.readAt(userId: key) { (userModel) in
                                followerUsers.append(userModel)
                                self.mainView.getModel(userModels: followerUsers)
                                self.userModels = followerUsers

                            }
                        }
                    }
                }
            }
        }
    }
}
