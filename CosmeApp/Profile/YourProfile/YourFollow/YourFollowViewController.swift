//
//  YourFollowViewController.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/06/16.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
import FirebaseAuth
// MARK: - Property
class YourFollowViewController: BaseViewController {
    @IBOutlet weak var mainView: YourFollowMainView!
    @IBOutlet weak var headerView: HeaderView!
    
    var userModel: UserModel = UserModel()
    var userModels: [UserModel] = [UserModel]()
    
    
    var yourFollow: Bool = false
    var yourFollower: Bool = false
}
// MARK: - Life cycle
extension YourFollowViewController {
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
extension YourFollowViewController :YourFollowMainViewDelegate{
    func didSelectRowAt(indexPath: IndexPath) {
        let yourProfileViewController = YourProfileViewController()
        yourProfileViewController.userModel = userModels[indexPath.row]
        navigationController?.pushViewController(yourProfileViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
}
extension YourFollowViewController :HeaderViewDelegate{
    func touchedLeftButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        animatorManager.navigationType = .slide_pop
    }
}
// MARK: - method
extension YourFollowViewController {
    func setDelegate() {
        mainView.delegate = self
        headerView.delegate = self
    }
    func setHeaderView() {
        if yourFollow {
            headerView.setCenter(text: "フォローリスト", fontSize: 20, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        }
        if yourFollower {
            headerView.setCenter(text: "フォロワーリスト", fontSize: 20, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        }
        headerView.setLeft(text: "戻る", fontSize: 20, color: #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1))
    }
    func getModel() {
        if yourFollow {
            var yourFollowUsers = [UserModel]()
            UserModel.readAt(userId: userModel.id!) { (userModel) in
                userModel.follow_users.forEach { (yourFollowUser) in
                    yourFollowUser.forEach { (key, val) in
                        if val == true {
                            UserModel.readAt(userId: key) { (userModel) in
                                yourFollowUsers.append(userModel)
                                self.mainView.getModel(userModels: yourFollowUsers)
                                self.userModels = yourFollowUsers
                            }
                        }
                    }
                }
            }
        }
        if yourFollower {
            var yourFollowerUsers = [UserModel]()
            UserModel.readAt(userId: userModel.id!) { (userModel) in
                userModel.follower_users.forEach { (yourFollowUser) in
                    yourFollowUser.forEach { (key, val) in
                        if val == true {
                            UserModel.readAt(userId: key) { (userModel) in
                                yourFollowerUsers.append(userModel)
                                self.mainView.getModel(userModels: yourFollowerUsers)
                                self.userModels = yourFollowerUsers
                            }
                        }
                    }
                }
            }
        }
    }
}
