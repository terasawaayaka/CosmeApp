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
    var makePostModels: [MakePostModel] = [MakePostModel]()
    var commentPostModel : CommentPostModel = CommentPostModel()
    var noticeModel: NoticeModel = NoticeModel()
    var reviewPostModels: [ReviewPostModel] = [ReviewPostModel]()
    
    //Outlet
    @IBOutlet weak var mainView: YourProfileMainView!
    @IBOutlet weak var headerView: HeaderView!
    
    var fromPost: Bool = false
    var isFollow: Bool = false
    var isFollowd: Bool = false
    var isBlock: Bool = false
    var isBlocked: Bool = false
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
        judgedBlock()
    }
}
// MARK: - Protocol
extension YourProfileViewController :YourProfileMainViewDelegate{
    func touchedFollowButton() {
        let yourFollowViewController = YourFollowViewController()
        navigationController?.pushViewController(yourFollowViewController, animated: true)
        yourFollowViewController.userModel = userModel
        yourFollowViewController.yourFollow = true
        animatorManager.navigationType = .slide_push
    }
    
    func touchedFollowerButton() {
        let yourFollowViewController = YourFollowViewController()
        navigationController?.pushViewController(yourFollowViewController, animated: true)
        yourFollowViewController.userModel = userModel
        yourFollowViewController.yourFollower = true
        animatorManager.navigationType = .slide_push
    }
    
    func didSelectItemAtSearchYourGenre(indexPath: IndexPath) {
        let makeDetailViewController = MakeDetailViewController()
        makeDetailViewController.makePostModel = makePostModels[indexPath.row]
        navigationController?.pushViewController(makeDetailViewController, animated: true)
        animatorManager.navigationType = .push
    }
    
    func didSelectItemAtYourGenre(indexPath: IndexPath) {
        mainView.scrollMainView.yourGenreMainView.isHidden = true
        
        switch indexPath.row {
        case 0:
            MakePostModel.reads { (makePostModels) in
                let eyeshadow = makePostModels.filter { (makePostModel) -> Bool in
                    if makePostModel.post_user_id == self.userModel.id && makePostModel.eyeshadow != ""{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(makePostModels: eyeshadow)
                self.makePostModels = eyeshadow
            }
        case 1:
            MakePostModel.reads { (makePostModels) in
                let eyeliner = makePostModels.filter { (makePostModel) -> Bool in
                    if makePostModel.post_user_id == self.userModel.id && makePostModel.eyeliner != ""{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(makePostModels: eyeliner)
                self.makePostModels = eyeliner
            }
        case 2:
            MakePostModel.reads { (makePostModels) in
                let mascara = makePostModels.filter { (makePostModel) -> Bool in
                    if makePostModel.post_user_id == self.userModel.id && makePostModel.mascara != ""{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(makePostModels: mascara)
                self.makePostModels = mascara
            }
        case 3:
            MakePostModel.reads { (makePostModels) in
                let colorcontact = makePostModels.filter { (makePostModel) -> Bool in
                    if makePostModel.post_user_id == self.userModel.id && makePostModel.colorcontact != ""{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(makePostModels: colorcontact)
                self.makePostModels = colorcontact
            }
        case 4:
            MakePostModel.reads { (makePostModels) in
                let eyebrow = makePostModels.filter { (makePostModel) -> Bool in
                    if makePostModel.post_user_id == self.userModel.id && makePostModel.eyebrow != ""{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(makePostModels: eyebrow)
                self.makePostModels = eyebrow
            }
        case 5:
            MakePostModel.reads { (makePostModels) in
                let basemake = makePostModels.filter { (makePostModel) -> Bool in
                    if makePostModel.post_user_id == self.userModel.id && makePostModel.basemake
                        != ""{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(makePostModels: basemake)
                self.makePostModels = basemake
            }
        case 6:
            MakePostModel.reads { (makePostModels) in
                let highlight = makePostModels.filter { (makePostModel) -> Bool in
                    if makePostModel.post_user_id == self.userModel.id && makePostModel.highlight != ""{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(makePostModels: highlight)
                self.makePostModels = highlight
            }
        case 7:
            MakePostModel.reads { (makePostModels) in
                let shading = makePostModels.filter { (makePostModel) -> Bool in
                    if makePostModel.post_user_id == self.userModel.id && makePostModel.shading != ""{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(makePostModels: shading)
                self.makePostModels = shading
            }
        case 8:
            MakePostModel.reads { (makePostModels) in
                let cheek = makePostModels.filter { (makePostModel) -> Bool in
                    if makePostModel.post_user_id == self.userModel.id && makePostModel.cheek != ""{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(makePostModels: cheek)
                self.makePostModels = cheek
            }
        case 9:
            MakePostModel.reads { (makePostModels) in
                let skincare = makePostModels.filter { (makePostModel) -> Bool in
                    if makePostModel.post_user_id == self.userModel.id && makePostModel.skincare != ""{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(makePostModels: skincare)
                self.makePostModels = skincare
            }
        case 10:
            MakePostModel.reads { (makePostModels) in
                let lip = makePostModels.filter { (makePostModel) -> Bool in
                    if makePostModel.post_user_id == self.userModel.id && makePostModel.lip != ""{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(makePostModels: lip)
                self.makePostModels = lip
            }
        case 11:
            MakePostModel.reads { (makePostModels) in
                let haircare = makePostModels.filter { (makePostModel) -> Bool in
                    if makePostModel.post_user_id == self.userModel.id && makePostModel.haircare != ""{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(makePostModels: haircare)
                self.makePostModels = haircare
            }
        default:
            break
        }
    }
    
    func secondDidSelectItemAt(indexPath: IndexPath) {
        let makeDetailViewController = MakeDetailViewController()
        makeDetailViewController.makePostModel = makePostModels[indexPath.row]
        navigationController?.pushViewController(makeDetailViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    
    func blockButton() {
        mainView.isBlockButtonTouched = !mainView.isBlockButtonTouched
        mainView.updateBlock()
        
        
        if let uid = Auth.auth().currentUser?.uid {
            var isBlocked : Bool = false
            
            userModel.block_users.forEach { (blockUser) in
                blockUser.forEach { (key,val) in
                    if key == uid {
                        //isBlock = val
                        isBlock = !isBlock
                        isBlocked = true
                    }
                }
            }
            userModel.blocked_users.forEach { (blockedUser) in
                blockedUser.forEach { (key,val) in
                    if key == uid {
                        isBlock = !isBlock
                        isBlocked = true
                    }
                }
            }
            if isBlocked == false {
                isBlock = true
            }
            //ブロックボタンを押したら投稿非表示、解除したら表示
            if isBlock == true {
                self.mainView.yourTodayCollectionView.isHidden = true
                self.mainView.scrollMainView.isHidden = true
                self.mainView.followButton.isHidden = true
            }else{
                self.mainView.yourTodayCollectionView.isHidden = false
                self.mainView.scrollMainView.isHidden = false
                self.mainView.followButton.isHidden = false
            }
            
            UserModel.addBlockUser(request: userModel, isBlock: isBlock)
            UserModel.addBlockedUser(request: userModel, isBlock: isBlock)
        }

    }
    
    func didSelectItemAt(indexPath: IndexPath) {
        let reviewDetailViewController = ReviewDetailViewController()
        reviewDetailViewController.reviewPostModel = reviewPostModels[indexPath.row]
        navigationController?.pushViewController(reviewDetailViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    
    func touchedPostButton() {
        let firstPosint = CGPoint(x: 0, y: 0)
        mainView.scrollMainView.scrollView.setContentOffset(firstPosint, animated: true)
    }
    
    func touchedGenreButton() {
        let secondPoint = CGPoint(x: mainView.frame.width, y: 0)
        mainView.scrollMainView.scrollView.setContentOffset(secondPoint, animated: true)
        mainView.scrollMainView.yourGenreMainView.isHidden = false
    }
    func followButton() {
        mainView.isFollowButtonTouched = !mainView.isFollowButtonTouched
        mainView.updateFollow()

        
        
        if let uid = Auth.auth().currentUser?.uid {
            var isFollowd: Bool = false
            
            userModel.follow_users.forEach { (followUser) in
                followUser.forEach { (key,val) in
                    if key == uid {
                        isFollowd = true
                    }
                }
            }
            isFollow = !isFollow
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
            self.mainView.getModel(userModel: userModel)
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
        
        MakePostModel.reads { (makePostModels) in
            let filterMakePostModels = makePostModels.filter { (makePostModel) -> Bool in
                if makePostModel.post_user_id == self.userModel.id {
                    return true
                } else {
                    return false
                }
            }
            self.mainView.getTodayModel(makePostModels: filterMakePostModels)
            self.makePostModels = filterMakePostModels
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
            UserModel.readMe { (userModel) in
                userModel.follow_users.forEach { (followUser) in
                    followUser.forEach { (key,val) in
                        if key == self.userModel.id {
                            self.isFollow = val
                            self.mainView.isFollowButtonTouched = self.isFollow
                            self.mainView.updateFollow()
                        
                    }
                }
            }
        }
    }
    func judgedBlock() {
        UserModel.readMe { (userModel) in
            userModel.block_users.forEach { (blockUser) in
                blockUser.forEach { (key,val) in
                    userModel.blocked_users.forEach { (blockedUser) in
                        blockedUser.forEach { (key2,val2) in
                            if key == self.userModel.id {
                                self.isBlock = val
                                self.mainView.isBlockButtonTouched = self.isBlock
                                self.mainView.updateBlock()
                            }
                            //ブロック中だったら投稿とフォローボタンを非表示
                            if key == self.userModel.id && val == true {
                                self.mainView.yourTodayCollectionView.isHidden = true
                                self.mainView.scrollMainView.isHidden = true
                                self.mainView.followButton.isHidden = true
                            }
                            //ブロックされていたらそのユーザーの投稿とフォローボタンとブロックボタンを非表示
                            if key2 == self.userModel.id && val2 == true {
                                self.mainView.yourTodayCollectionView.isHidden = true
                                self.mainView.scrollMainView.isHidden = true
                                self.mainView.followButton.isHidden = true
                                self.mainView.blockButton.isHidden = true
                                
                            }
                        }
                    }
                }
            }
        }
    }
}
