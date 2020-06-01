//
//  YourProfileViewController.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
import FirebaseAuth
// MARK: - Property
class YourProfileViewController: BaseViewController {
    //data
    var userModel: UserModel = UserModel()
    var reviewPostModel: ReviewPostModel = ReviewPostModel()
    var noticeModel: NoticeModel = NoticeModel()
    //Outlet
    @IBOutlet weak var mainView: YourProfileMainView!
}
// MARK: - Life cycle
extension YourProfileViewController {
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
        noticeGetModel()
    }
}
// MARK: - Protocol
extension YourProfileViewController :YourProfileMainViewDelegate{
    func touchedPostButton() {
        let firstPosint = CGPoint(x: 0, y: 0)
        mainView.scrollMainView.scrollView.setContentOffset(firstPosint, animated: true)
    }
    
    func touchedGenreButton() {
        let secondPoint = CGPoint(x: mainView.frame.width, y: 0)
        mainView.scrollMainView.scrollView.setContentOffset(secondPoint, animated: true)
    }
    
}
// MARK: - method
extension YourProfileViewController {
    func setDelegate() {
        mainView.delegate = self
    }

    func getModel() {
        if reviewPostModel.post_user_id != "" {
        UserModel.readAt(userId: reviewPostModel.post_user_id) { (userModel) in
            if let icon = userModel.photo_path {
                self.reviewPostModel.post_user_icon = icon
            }
              self.userModel = userModel
              self.mainView.getModel(userModel: userModel)
            }
        } else {
//            self.userModel = userModel
//            self.mainView.getModel(userModel: userModel)
        }
    }
    func noticeGetModel() {
        if noticeModel.post_user_id != "" {
                UserModel.readAt(userId: noticeModel.post_user_id) { (userModel) in
                    if let icon = userModel.photo_path {
                        self.noticeModel.post_user_icon = icon
                    }
                      self.userModel = userModel
                      self.mainView.getModel(userModel: userModel)
                    }
                } else {
        //            self.userModel = userModel
        //            self.mainView.getModel(userModel: userModel)
                }
    }
}
