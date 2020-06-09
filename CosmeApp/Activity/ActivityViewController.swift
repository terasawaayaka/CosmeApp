//
//  ActivityViewController.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/14.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
// MARK: - Property
class ActivityViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: ActivityMainView!
    
    var noticeModels: [NoticeModel] = [NoticeModel]()
}
// MARK: - Life cycle
extension ActivityViewController {
    override func loadView() {
        super.loadView()
        setHeaderView()
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
extension ActivityViewController:ActivityMainViewDelegate {
    
    func touchedProfilePageButton(indexPath: IndexPath) {
        let yourProfileViewController = YourProfileViewController()
        yourProfileViewController.noticeModel = noticeModels[indexPath.row]
        yourProfileViewController.fromPost = true
        navigationController?.pushViewController(yourProfileViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    
    func touchedPostPageButton(indexPath: IndexPath) {
        let reviewDetailViewController = ReviewDetailViewController()
        reviewDetailViewController.noticeModel = noticeModels[indexPath.row]
        reviewDetailViewController.reviewPostModel.id = noticeModels[indexPath.row].post_id
        navigationController?.pushViewController(reviewDetailViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedSecondProfileButton(indexPath: IndexPath) {
        let yourProfileViewController = YourProfileViewController()
        yourProfileViewController.noticeModel = noticeModels[indexPath.row]
        yourProfileViewController.fromPost = true
        navigationController?.pushViewController(yourProfileViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedSecondPostPageButton(indexPath: IndexPath) {
        let reviewDetailViewController = ReviewDetailViewController()
        reviewDetailViewController.noticeModel = noticeModels[indexPath.row]
        reviewDetailViewController.reviewPostModel.id = noticeModels[indexPath.row].post_id
        navigationController?.pushViewController(reviewDetailViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedThirdProfileButton(indexPath: IndexPath) {
        let yourProfileViewController = YourProfileViewController()
        yourProfileViewController.noticeModel = noticeModels[indexPath.row]
        yourProfileViewController.fromPost = true
        navigationController?.pushViewController(yourProfileViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
}
// MARK: - method
extension ActivityViewController {
    func setHeaderView() {
        headerView.setCenter(text: "アクティビティ", fontSize: 19, color: UIColor.black)
        headerView.setLeft(text: "")
    }
    func setDelegate() {
        mainView.delegate = self
        
    }
    func getModel() {
        NoticeModel.reads { (noticeModels) in
            for noticeModel in noticeModels {
                
                if noticeModel.notice_user_id != "" {
                    UserModel.readAt(userId: noticeModel.notice_user_id) { (userModel) in
                        if let name = userModel.nickname {
                            noticeModel.notice_user_name = name
                        }
                        if let icon = userModel.photo_path {
                            noticeModel.notice_user_icon = icon
                        }
                        self.noticeModels = noticeModels
                        self.mainView.getModel(noticeModels: noticeModels)
                    }
                    if noticeModel.post_id != "" {
                        ReviewPostModel.readAt(id: noticeModel.post_id, success: { (reviewPostModel) in
                            if reviewPostModel.image_paths.count != 0 {
                                noticeModel.post_icon = reviewPostModel.image_paths[0]
                            }
                        }) {
                            print("read at reviewPostModel error")
                        }
                    }
                }
            }
        }
    }
}
