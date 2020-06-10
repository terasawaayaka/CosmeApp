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
    var reviewPostModels: [ReviewPostModel] = [ReviewPostModel]()
    
    //Outlet
    @IBOutlet weak var mainView: YourProfileMainView!
    @IBOutlet weak var headerView: HeaderView!
    
    var fromPost: Bool = false
    var isFollow: Bool = false
    var isFollowd: Bool = false
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
        getNoticeModels()
        judgedFollow()
    }
}
// MARK: - Protocol
extension YourProfileViewController :YourProfileMainViewDelegate{
    func didSelectItemAt(indexPath: IndexPath) {
        let reviewDetailViewController = ReviewDetailViewController()
        reviewDetailViewController.reviewPostModel = reviewPostModels[indexPath.row]
        navigationController?.pushViewController(reviewDetailViewController, animated: true)
        animatorManager.navigationType = .slide_pop
    }
    
    func touchedPostButton() {
        let firstPosint = CGPoint(x: 0, y: 0)
        mainView.scrollMainView.scrollView.setContentOffset(firstPosint, animated: true)
    }
    
    func touchedGenreButton() {
        let secondPoint = CGPoint(x: mainView.frame.width, y: 0)
        mainView.scrollMainView.scrollView.setContentOffset(secondPoint, animated: true)
    }
    func followButton() {
        mainView.isFollowButtonTouched = !mainView.isFollowButtonTouched
        mainView.updateFollow()

        
        
        if let uid = Auth.auth().currentUser?.uid {
            var isFollowd: Bool = false
            userModel.follower_users.forEach { (followerUser) in
                followerUser.forEach { (key,val) in
                    if key == uid {
                        isFollow = !isFollow
                        isFollowd = true
                    }
                }
            }
            userModel.follow_users.forEach { (followUser) in
                followUser.forEach { (key,val) in
                    if key == uid {
                        isFollow = !isFollow
                        isFollowd = true
                    }
                }
            }
            if isFollowd == false {
                let noticeModel : NoticeModel = NoticeModel()
                if let uid = Auth.auth().currentUser?.uid {
                    noticeModel.notice_user_id = uid
                }
                noticeModel.notice_my_id = reviewPostModel.post_user_id
                noticeModel.noticeType = ActivityType.follow.rawValue
                NoticeModel.create(request: noticeModel) {

                }
                isFollow = true
            }
            UserModel.addFollowerUser(request:userModel,isFollow: isFollow)
            UserModel.addFollowUser(request: userModel, isFollow: isFollow)
        }

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
        ReviewPostModel.reads { (reviewPostModels) in
            //メインビューにreviewPostModelを渡す
            let filterdReviewPostModels = reviewPostModels.filter { (reviewPostModel) -> Bool in
                if reviewPostModel.post_user_id == self.userModel.id {
                    return true
                }else {
                    return false
                }
            }
            self.reviewPostModels = filterdReviewPostModels
            self.mainView.reviewPostModels = filterdReviewPostModels
            self.mainView.getModelforCell(filterdReviewPostModels: reviewPostModels, userModel: self.userModel)
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
        if noticeModel.notice_user_id != "" {
            UserModel.readAt(userId: noticeModel.notice_user_id) { (userModel) in
                if let icon = userModel.photo_path {
                    self.noticeModel.notice_user_icon = icon
                }
                self.userModel = userModel
                self.mainView.getModel(userModel: userModel)
            }
        } else {
            //            self.userModel = userModel
            //            self.mainView.getModel(userModel: userModel)
        }
    }
    func getNoticeModels() {
        NoticeModel.reads { (noticeModels) in
            for noticeModel in noticeModels {
                if let uid = Auth.auth().currentUser?.uid {
                    if noticeModel.notice_user_id == uid {
                        self.isFollowd = true
                    } else {
                        self.isFollowd = false
                    }
                }
            }
        }
    }
    func judgedFollow() {
        if let uid = Auth.auth().currentUser?.uid {
            var isFollowd: Bool = false
            userModel.follow_users.forEach { (followUser) in
                followUser.forEach { (key,val) in
                    if key == uid {
                        self.isFollow = val
                        self.mainView.isFollowButtonTouched = self.isFollow
                        self.mainView.updateFollow()
                    }
                }
            }
//            userModel.follower_users.forEach { (followerUser) in
//                followerUser.forEach { (key,val) in
//                    if key == uid {
//                        self.isFollow = val
//                        self.mainView.isFollowButtonTouched = self.isFollow
//                        self.mainView.updateFollow()
//                    }
//                }
//            }
        }
    }
}
