//
//  TimeLineViewController.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/14.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
import FirebaseAuth
// MARK: - Property
class TimeLineViewController: BaseViewController {
    
    @IBOutlet weak var mainView: TimeLineMainView!
    
    var reviewPostModels : [ReviewPostModel] = [ReviewPostModel]()
    var makePostModels : [MakePostModel] = [MakePostModel]()
    var reviewPostModel : ReviewPostModel = ReviewPostModel()
    
    var activityType: ActivityType = ActivityType.comment
//    var isGood: Bool = false
//    var isGooded: Bool = false
}
// MARK: - Life cycle
extension TimeLineViewController {
    override func loadView() {
        super.loadView()
        setDelegate()
        tabBarController?.tabBar.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Auth.auth().currentUser == nil{
            let signUpViewController = SignUpViewController()
            navigationController?.pushViewController(signUpViewController, animated: false)
        }
        reviewGetModel()
        makeGetModel()
//        getNoticeModel()
    }
}
// MARK: - Protocol
extension TimeLineViewController :TimeLineMainViewDelegate {
    func goodButton(reviewPostModel: ReviewPostModel) {
        

        let noticeModel : NoticeModel = NoticeModel()
        if let uid = Auth.auth().currentUser?.uid {
            noticeModel.notice_user_id = uid
        }
        noticeModel.noticeType = ActivityType.good.rawValue
        NoticeModel.create(request: noticeModel) {
        }
    }
    
    func touchedIconViewButton(reviewPostModel: ReviewPostModel) {
        if let uid = Auth.auth().currentUser?.uid {
            if reviewPostModel.post_user_id == uid {
                let myProfileViewController = MyProfileViewController()
                myProfileViewController.fromPost = true
                navigationController?.pushViewController(myProfileViewController, animated: true)
                animatorManager.navigationType = .slide_push
            }else{
                let yourPlofileViewController = YourProfileViewController()
                yourPlofileViewController.reviewPostModel = reviewPostModel
                yourPlofileViewController.fromPost = true
                navigationController?.pushViewController(yourPlofileViewController, animated: true)
                animatorManager.navigationType = .slide_push
            }
        }
    }
    
    func didSelectCollectionViewCell(indexPath: IndexPath) {
        let makeDetailViewController = MakeDetailViewController()
        makeDetailViewController.makePostModel = makePostModels[indexPath.row]
        navigationController?.pushViewController(makeDetailViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }


    func didSelectRowAt(indexPath:IndexPath) {
        let reviewDetailViewController = ReviewDetailViewController()
        reviewDetailViewController.reviewPostModel = reviewPostModels[indexPath.row - 1]
        navigationController?.pushViewController(reviewDetailViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
}
// MARK: - method
extension TimeLineViewController {
    func setDelegate(){
        mainView.delegate = self
    }
    func reviewGetModel(){
        ReviewPostModel.reads { (reviewPostModels) in
            for reviewPostModel in reviewPostModels {
                if reviewPostModel.post_user_id != "" {
                    UserModel.readAt(userId: reviewPostModel.post_user_id) { (userModel) in
                        if let name = userModel.nickname{
                            reviewPostModel.post_user_name = name
                        }
                        if let icon = userModel.photo_path{
                            reviewPostModel.post_user_icon = icon
                        }
                        self.reviewPostModels = reviewPostModels
                        self.mainView.reviewGetModel(reviewPostModels:reviewPostModels)
                    }
                }else{
                    self.reviewPostModels = reviewPostModels
                    self.mainView.reviewGetModel(reviewPostModels:reviewPostModels)
                }
            }
        }
    }
//    func reviewGetModel(){
//        ReviewPostModel.reads { (reviewPostModels) in
//            self.mainView.reviewGetModel(reviewPostModels: reviewPostModels)
//            self.reviewPostModels = reviewPostModels
//        }
//    }
    
//    func reviewGetModel2() {
//        ReviewPostModel.readAt(id: reviewPostModel.id, success: { (reviewPostModel) in
//            if let uid = Auth.auth().currentUser?.uid {
//                var isGood: Bool = false
//                reviewPostModel.good_users.forEach { (goodUser) in
//                    goodUser.forEach { (key,val) in
//                        if key == uid {
//                            self.isGood = val
//                            self.mainView.isGoodTouched = self.isGood
//                        }
//                    }
//                }
//            }
//            self.reviewPostModel = reviewPostModel
//            self.mainView.reviewGetModel(reviewPostModel: reviewPostModel)
//        }) {
//            self
//        }
//    }
    
    
    func makeGetModel(){
        MakePostModel.reads { (makePostModels) in
            for makePostModel in makePostModels {
                if makePostModel.post_user_id != "" {
                    UserModel.readAt(userId: makePostModel.post_user_id) { (userModel) in
                        if let name = userModel.nickname{
                            makePostModel.post_user_name = name
                        }
                        if let icon = userModel.photo_path{
                            makePostModel.post_user_icon = icon
                        }
                        self.makePostModels = makePostModels
                        self.mainView.makeGetModel(makePostModels:makePostModels)
                    }
                }else{
                    self.makePostModels = makePostModels
                    self.mainView.makeGetModel(makePostModels:makePostModels)
                }
            }
        }
    }
}
    
//    func makeGetModel(){
//        MakePostModel.reads { (makePostModels) in
//            self.mainView.makeGetModel(makePostModels: makePostModels)
//            self.makePostModels = makePostModels
//        }
//    }
//}
