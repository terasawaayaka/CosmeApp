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
    var userModel : UserModel = UserModel()
    
    var activityType: ActivityType = ActivityType.comment
    var isGood: Bool = false
    var isGooded: Bool = false
    var isFavorite:Bool = false
    var isFavorited:Bool = false
    var fromSignUp:Bool = false
}
// MARK: - Life cycle
extension TimeLineViewController {
    override func loadView() {
        super.loadView()
        setDelegate()
        tabBarController?.tabBar.isHidden = false
        mainView.pleaseFollowLabel.isHidden = true
        if fromSignUp{
            mainView.pleaseFollowLabel.isHidden = false
        }
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
        getNoticeModel()
    }
}
// MARK: - Protocol
extension TimeLineViewController :TimeLineMainViewDelegate{
    func favoriteButton(reviewPostModel: ReviewPostModel) {
        //TODO お気に入り機能
        if let uid = Auth.auth().currentUser?.uid {
            var isFavorited : Bool = false
            reviewPostModel.favorite_users.forEach { (favoriteUser) in
                favoriteUser.forEach { (key,val) in
                    if key == uid {
                        isFavorite = val
                        isFavorite = !isFavorite
                        isFavorited = true
                    }
                }
            }
            if isFavorited == false{
                isFavorite = true
            }
            ReviewPostModel.addFavoriteUser(request: reviewPostModel, isFavorite: isFavorite)
        }
    }
    
    
    func goodButton(reviewPostModel: ReviewPostModel) {
        
        if let uid = Auth.auth().currentUser?.uid {
            var isGooded: Bool = false
            reviewPostModel.good_users.forEach { (goodUser) in
                goodUser.forEach { (key,val) in
                    if key == uid {
                        isGood = val
                        isGood = !isGood
                        isGooded = true
                    }
                }
            }
            if isGooded == false {
                let noticeModel : NoticeModel = NoticeModel()
                if let uid = Auth.auth().currentUser?.uid {
                    noticeModel.notice_user_id = uid
                }
                noticeModel.post_id = reviewPostModel.id
                noticeModel.notice_my_id = reviewPostModel.post_user_id
                noticeModel.noticeType = ActivityType.good.rawValue
                NoticeModel.create(request: noticeModel) {
                }
                isGood = true
            }
            ReviewPostModel.addGoodUser(request: reviewPostModel, isGood: isGood)
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
            var filterdReviewPostModels: [ReviewPostModel] = []
            UserModel.readMe { (userModel) in
                
                //自分
                var me :[String] = []
                if let uid = Auth.auth().currentUser?.uid {
                        me.append(uid)
                }
                //フォローしている人
                var followUsers:[String] = []
                userModel.follow_users.forEach { (followUser) in
                    followUser.forEach { (key,val) in
                        if val == true{
                            followUsers.append(key)
                        }
                    }
                }
                //ブロックしている人を排除
//                var blockUsers:[String] = []
//                userModel.block_users.forEach { (blockUser) in
//                    blockUser.forEach { (key,val) in
//                        if val == true{
//                            blockUsers.append(key)
//                        }
//                    }
//                }
                //自分をブロックしている人を排除
//                var blockedUsers:[String] = []
//                userModel.blocked_users.forEach { (blockedUser) in
//                    blockedUser.forEach { (key,val) in
//                        if val == true{
//                            blockedUsers.append(key)
//                        }
//                    }
//                }
                filterdReviewPostModels = reviewPostModels.filter{ (reviewPostModel) -> Bool in
                    if followUsers.contains(reviewPostModel.post_user_id){
                    return true
                    }else if me.contains(reviewPostModel.post_user_id){
                        return true
//                    }else if blockUsers.contains(reviewPostModel.post_user_id){
//                        return false
//                    }else if blockedUsers.contains(reviewPostModel.post_user_id){
//                        return false
                    }else{
                        return false
                    }
                   
                }
                self.reviewPostModels = filterdReviewPostModels
                    self.mainView.reviewGetModel(reviewPostModels:filterdReviewPostModels)
                    print("カウント:", filterdReviewPostModels.count)
                }
                
                //フォローしている人と自分を抽出
//                for followUser in userModel.follow_users {
//                    followUser.forEach { (followUserId, isFollow) in
//                        filterdReviewPostModels = reviewPostModels.filter{ (reviewPostModel) -> Bool in
//                            if let uid = Auth.auth().currentUser?.uid {
//                                if reviewPostModel.post_user_id == uid {
//                                    return true
//                                }else if followUserId == reviewPostModel.post_user_id && isFollow == true{
//                                    return true
//                                }else{
//                                    return false
//                                }
//                            }
//                            return false
//                        }
//                    }
//                }
                //ブロックしている人を排除
//                for blockUser in userModel.block_users {
//                    blockUser.forEach { (blockUserId, isBlock) in
//                        filterdReviewPostModels = filterdReviewPostModels.filter{ (reviewPostModel) -> Bool in
//                            if blockUserId == reviewPostModel.post_user_id && isBlock == true{
//                                return false
//                            }else{
//                                return true
//                            }
//                        }
//                    }
//                }
//                //自分をブロックしている人を排除
//                for blockedUser in userModel.blocked_users {
//                    blockedUser.forEach { (blockedUserId, isBlocked) in
//                        filterdReviewPostModels = filterdReviewPostModels.filter{ (reviewPostModel) -> Bool in
//                            if blockedUserId == reviewPostModel.post_user_id && isBlocked == true {
//                                return false
//                            }else{
//                                return true
//                            }
//                        }
//                    }
//                }
                
                
                //誰もフォローしていない場合自分だけを抽出
//                if userModel.follow_users.count == 0{
//                    filterdReviewPostModels = reviewPostModels.filter { (reviewPostModel) -> Bool in
//                        if let uid = Auth.auth().currentUser?.uid {
//                            if reviewPostModel.post_user_id == uid{
//                                return true
//                            }else{
//                                return false
//                        }
//                        }else{
//                            return false
//                        }
//                    }
//                }
                
                
//                self.reviewPostModels = filterdReviewPostModels
//                self.mainView.reviewGetModel(reviewPostModels:filterdReviewPostModels)
//                print("カウント:", filterdReviewPostModels.count)
//            }
                
            for reviewPostModel in reviewPostModels {
                if reviewPostModel.post_user_id != "" {
                    UserModel.readAt(userId: reviewPostModel.post_user_id) { (userModel) in
                        if let name = userModel.nickname{
                            reviewPostModel.post_user_name = name
                        }
                        if let icon = userModel.photo_path{
                            reviewPostModel.post_user_icon = icon
                        }
                        
                        if let uid = Auth.auth().currentUser?.uid {
                            //good
                            var isGood: Bool = false
                            reviewPostModel.good_users.forEach { (goodUser) in
                                goodUser.forEach { (key,val) in
                                    if key == uid {
                                        self.isGood = val
                                        reviewPostModel.isGood = val
                                    }
                                }
                            }
                            //favorite
                            var isFavorite: Bool = false
                            reviewPostModel.favorite_users.forEach { (favoriteUser) in
                                favoriteUser.forEach { (key,val) in
                                    if key == uid {
                                        self.isFavorite = val
                                        reviewPostModel.isFavorite = val
                                    }
                                }
                            }
                            
                            self.reviewPostModel = reviewPostModel
                            self.reviewPostModels = filterdReviewPostModels
                            self.mainView.reviewGetModel(reviewPostModels:filterdReviewPostModels)
                        }
                    }
                }
                
            }
            
        }
        
    }

    
    func getNoticeModel() {
        NoticeModel.reads { (noticeModels) in
            for noticeModel in noticeModels {
                if noticeModel.post_id == self.reviewPostModel.id {
                    if let uid = Auth.auth().currentUser?.uid {
                        if noticeModel.notice_user_id == uid {
                            self.isGood = true
                        } else {
                            self.isGood = false
                        }
                    }
                }
            }
        }
    }
    
    func makeGetModel(){
        MakePostModel.reads { (makePostModels) in
            var filterdMakePostModels: [MakePostModel] = []
            UserModel.readMe { (userModel) in
                
                //自分
                var me :[String] = []
                if let uid = Auth.auth().currentUser?.uid {
                    me.append(uid)
                }
                //フォローしている人
                var followUsers:[String] = []
                userModel.follow_users.forEach { (followUser) in
                    followUser.forEach { (key,val) in
                        if val == true{
                            followUsers.append(key)
                        }
                    }
                }
                filterdMakePostModels = makePostModels.filter{ (makePostModel) -> Bool in
                    if followUsers.contains(makePostModel.post_user_id){
                        return true
                    }else if me.contains(makePostModel.post_user_id){
                        return true
                    }else{
                        return false
                    }
                    
                }
                self.makePostModels = filterdMakePostModels
                    self.mainView.makeGetModel(makePostModels:filterdMakePostModels)
                    print("カウント:", filterdMakePostModels.count)
                }
//                //誰もフォローしていない場合自分だけを抽出
//                if userModel.follow_users.count == 0{
//                    filterdMakePostModels = makePostModels.filter { (reviewPostModel) -> Bool in
//                        if let uid = Auth.auth().currentUser?.uid {
//                            if reviewPostModel.post_user_id == uid{
//                                return true
//                            }else{
//                                return false
//                            }
//                        }else{
//                            return false
//                        }
//                    }
//                }
//                //フォローしている人と自分を抽出
//                for followUser in userModel.follow_users {
//                    followUser.forEach { (followUserId, isFollow) in
//                        filterdMakePostModels = makePostModels.filter{ (reviewPostModel) -> Bool in
//                            if let uid = Auth.auth().currentUser?.uid {
//                                if reviewPostModel.post_user_id == uid {
//                                    return true
//                                }else if followUserId == reviewPostModel.post_user_id && isFollow == true{
//                                    return true
//                                }else{
//                                    return false
//                                }
//                            }
//                            return false
//                        }
//                    }
//                }
//                //ブロックしている人を排除
//                for blockUser in userModel.block_users {
//                    blockUser.forEach { (blockUserId, isBlock) in
//                        filterdMakePostModels = filterdMakePostModels.filter{ (reviewPostModel) -> Bool in
//                            if blockUserId == reviewPostModel.post_user_id && isBlock == true{
//                                return false
//                            }else{
//                                return true
//                            }
//                        }
//                    }
//                }
//                //自分をブロックしている人を排除
//                for blockedUser in userModel.blocked_users {
//                    blockedUser.forEach { (blockedUserId, isBlocked) in
//                        filterdMakePostModels = filterdMakePostModels.filter{ (reviewPostModel) -> Bool in
//                            if blockedUserId == reviewPostModel.post_user_id && isBlocked == true {
//                                return false
//                            }else{
//                                return true
//                            }
//                        }
//                    }
//                }
                
            
            
            for makePostModel in makePostModels {
                if makePostModel.post_user_id != "" {
                    UserModel.readAt(userId: makePostModel.post_user_id) { (userModel) in
                        if let name = userModel.nickname{
                            makePostModel.post_user_name = name
                        }
                        if let icon = userModel.photo_path{
                            makePostModel.post_user_icon = icon
                        }
                        self.makePostModels = filterdMakePostModels
                        self.mainView.makeGetModel(makePostModels:filterdMakePostModels)
                    }
//                }else{
//                    self.makePostModels = makePostModels
//                    self.mainView.makeGetModel(makePostModels:makePostModels)
//                }
                }
            }
        }
    }
}
    

