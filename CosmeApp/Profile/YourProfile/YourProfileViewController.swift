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
    var fromfollow: Bool = false
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
        mainView.secondScrollBar.isHidden = true
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
    func didEndYourScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset == CGPoint(x: 0, y: 0) {
            mainView.scrollBar.isHidden = false
            mainView.secondScrollBar.isHidden = true
        }else {
            mainView.scrollBar.isHidden = true
            mainView.secondScrollBar.isHidden = false
        }
    }
    
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
        let reviewDetailViewController = ReviewDetailViewController()
        reviewDetailViewController.reviewPostModel = reviewPostModels[indexPath.row]
        reviewDetailViewController.fromProfile = true
        navigationController?.pushViewController(reviewDetailViewController, animated: true)
        animatorManager.navigationType = .push
    }
    
    func didSelectItemAtYourGenre(indexPath: IndexPath) {
        mainView.scrollMainView.yourGenreMainView.isHidden = true
        
        switch indexPath.row {
        case 0:
            ReviewPostModel.reads { (reviewPostModels) in
                let eyeshadow = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if reviewPostModel.post_user_id == self.userModel.id && reviewPostModel.category == "アイシャドウ"{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(reviewPostModels: eyeshadow)
                self.reviewPostModels = eyeshadow
            }
        case 1:
            ReviewPostModel.reads { (reviewPostModels) in
                let eyeliner = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if reviewPostModel.post_user_id == self.userModel.id && reviewPostModel.category == "アイライナー"{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(reviewPostModels: eyeliner)
                self.reviewPostModels = eyeliner
            }
        case 2:
            ReviewPostModel.reads { (reviewPostModels) in
                let mascara = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if reviewPostModel.post_user_id == self.userModel.id && reviewPostModel.category == "マスカラ"{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(reviewPostModels: mascara)
                self.reviewPostModels = mascara
            }
        case 3:
            ReviewPostModel.reads { (reviewPostModels) in
                let colorcontact = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if reviewPostModel.post_user_id == self.userModel.id && reviewPostModel.category == "カラコン"{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(reviewPostModels: colorcontact)
                self.reviewPostModels = colorcontact
            }
        case 4:
            ReviewPostModel.reads { (reviewPostModels) in
                let eyebrow = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if reviewPostModel.post_user_id == self.userModel.id && reviewPostModel.category == "アイブロウ"{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(reviewPostModels: eyebrow)
                self.reviewPostModels = eyebrow
            }
        case 5:
            ReviewPostModel.reads { (reviewPostModels) in
                let basemake = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if reviewPostModel.post_user_id == self.userModel.id && reviewPostModel.category
                        == "ベースメイク"{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(reviewPostModels: basemake)
                self.reviewPostModels = basemake
            }
        case 6:
            ReviewPostModel.reads { (reviewPostModels) in
                let highlight = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if reviewPostModel.post_user_id == self.userModel.id && reviewPostModel.category == "ハイライト"{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(reviewPostModels: highlight)
                self.reviewPostModels = highlight
            }
        case 7:
            ReviewPostModel.reads { (reviewPostModels) in
                let shading = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if reviewPostModel.post_user_id == self.userModel.id && reviewPostModel.category == "シェーディング"{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(reviewPostModels: shading)
                self.reviewPostModels = shading
            }
        case 8:
            ReviewPostModel.reads { (reviewPostModels) in
                let cheek = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if reviewPostModel.post_user_id == self.userModel.id && reviewPostModel.category == "チーク"{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(reviewPostModels: cheek)
                self.reviewPostModels = cheek
            }
        case 9:
            ReviewPostModel.reads { (reviewPostModels) in
                let skincare = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if reviewPostModel.post_user_id == self.userModel.id && reviewPostModel.category == "スキンケア"{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(reviewPostModels: skincare)
                self.reviewPostModels = skincare
            }
        case 10:
            ReviewPostModel.reads { (reviewPostModels) in
                let lip = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if reviewPostModel.post_user_id == self.userModel.id && reviewPostModel.category == "リップ"{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(reviewPostModels: lip)
                self.reviewPostModels = lip
            }
        case 11:
            ReviewPostModel.reads { (reviewPostModels) in
                let haircare = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if reviewPostModel.post_user_id == self.userModel.id && reviewPostModel.category == "ヘアケア"{
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(reviewPostModels: haircare)
                self.reviewPostModels = haircare
            }
        case 12:
            ReviewPostModel.reads { (reviewPostModels) in
                let another = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if reviewPostModel.post_user_id == self.userModel.id && reviewPostModel.category == "その他" {
                        return true
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchYourGenreMainView.getModel(reviewPostModels: another)
                self.reviewPostModels = another
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
            //ブロックしたらblockUserのその人のidをtrueに、followUserのその人のidをfalseに（ブロックした相手のフォローを外す）
            UserModel.addBlockUser(request: userModel, isBlock: isBlock, isFollow: isFollowd)
            //ブロックされたらblockedUserのその人のidをtrueに、followUserのその人のidをfalseに（ブロックしてきた相手のフォローを外す）
            UserModel.addBlockedUser(request: userModel, isBlock: isBlock, isFollow: isFollowd)
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
        mainView.scrollBar.isHidden = false
        mainView.secondScrollBar.isHidden = true
    }
    
    func touchedGenreButton() {
        let secondPoint = CGPoint(x: mainView.frame.width, y: 0)
        mainView.scrollMainView.scrollView.setContentOffset(secondPoint, animated: true)
        mainView.scrollMainView.yourGenreMainView.isHidden = false
        
        mainView.scrollBar.isHidden = true
        mainView.secondScrollBar.isHidden = false
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
                if let userId = userModel.id {
                    noticeModel.notice_my_id = userId
                }
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
        if fromfollow {
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
        headerView.setLeft(text: "＜", fontSize: 16, color: #colorLiteral(red: 0.7390006781, green: 0.7434574962, blue: 1, alpha: 1))
        }
        if fromfollow {
            headerView.setCenter(text: "- profile -", fontSize: 20, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            headerView.setLeft(text: "＜", fontSize: 16, color: #colorLiteral(red: 0.7390006781, green: 0.7434574962, blue: 1, alpha: 1))
        }
        headerView.setCenter(text: "- profile -", fontSize: 20, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
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
