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
    var makePostModel : MakePostModel = MakePostModel()
    var commentPostModel : CommentPostModel = CommentPostModel()
    var noticeModel: NoticeModel = NoticeModel()
    //Outlet
    @IBOutlet weak var mainView: YourProfileMainView!
    @IBOutlet weak var headerView: HeaderView!
    
    var fromPost: Bool = false
}
// MARK: - Life cycle
extension YourProfileViewController {
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
        makeGetModel()
        commentGetModel()
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

extension YourProfileViewController:HeaderViewDelegate{
    func touchedLeftButton(_ sender: UIButton) {
        if fromPost{
        navigationController?.popViewController(animated: true)
        animatorManager.navigationType = .slide_pop
        }
    }
}
// MARK: - method
extension YourProfileViewController {
    func setDelegate() {
        mainView.delegate = self
        headerView.delegate = self
    }
    
    func setHeaderView(){
        if fromPost{
        headerView.setCenter(text: "- profile -", fontSize: 20, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        headerView.setLeft(text: "戻る", fontSize: 18, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        }else{
            headerView.setCenter(text: "- profile -", fontSize: 20, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            headerView.setLeft(text: "")
        }
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
    func makeGetModel() {
        if makePostModel.post_user_id != "" {
            UserModel.readAt(userId: makePostModel.post_user_id) { (userModel) in
                if let icon = userModel.photo_path {
                    self.makePostModel.post_user_icon = icon
                }
                self.userModel = userModel
                self.mainView.getModel(userModel: userModel)
            }
        } else {
//            self.userModel = userModel
 //            self.mainView.getModel(userModel: userModel)
        }
    }

    func commentGetModel() {
        if commentPostModel.post_user_id != "" {
            UserModel.readAt(userId: commentPostModel.post_user_id) { (userModel) in
                if let icon = userModel.photo_path {
                    self.commentPostModel.post_user_icon = icon
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
