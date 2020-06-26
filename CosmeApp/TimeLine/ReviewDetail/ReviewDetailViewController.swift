//
//  ReviewDetailViewController.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
import  FirebaseAuth
// MARK: - Property
class ReviewDetailViewController: BaseViewController, UITableViewDelegate {
    
    var commentPostModel : CommentPostModel = CommentPostModel()
    var commentPostModels : [CommentPostModel] = [CommentPostModel]()
    var reviewPostModel : ReviewPostModel = ReviewPostModel()
    var noticeModel: NoticeModel = NoticeModel()
    var userModel: UserModel = UserModel()
    
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: ReviewDetailMainView!
    @IBOutlet weak var mainViewBottomMergin: NSLayoutConstraint!
    
    var activityType: ActivityType = ActivityType.comment
    var isGood: Bool = false
    var isGooded: Bool = false
    var isFavorite: Bool = false
    var isFavorited: Bool = false
    var fromProfile: Bool = false
    

}
// MARK: - Life cycle
extension ReviewDetailViewController {
    
    
    override func loadView() {
        super.loadView()
        setDelegate()
        setHeaderView()
        hideKeybord()
        showKeyboardObserver(self, selector: #selector(showKeyboard(notification:)))
        hideKeyboardObserver(self, selector: #selector(hideKeyboard(notification:)))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reviewGetModel()
        commentGetModel()
        reviewUpdateView()
        reviewGetModel()
        getNoticeModel()
    }
    
    override func viewWillLayoutSubviews() {
        mainView.tableHeight.constant = CGFloat(mainView.tableView.contentSize.height)
        super.updateViewConstraints()
        //self.mainView.tableHeight.constant = self.mainView.tableView.contentSize.height
    }
}
// MARK: - Protocol

extension ReviewDetailViewController :HeaderViewDelegate{
    func touchedLeftButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        if fromProfile {
            animatorManager.navigationType = .pop
        } else {
            animatorManager.navigationType = .slide_pop
        }
//        let index = self.navigationController!.viewControllers.count - 1
//        let vc: SearchViewController = self.navigationController?.viewControllers[index] as? SearchViewController ?? UIViewController() as! SearchViewController
//        vc.returnSearchVC()
    }
    func touchedRightButton(_ sender: UIButton) {
        mainView.imageCollectionView.reloadData()
        let editReviewViewController = EditReviewViewController()
        editReviewViewController.reviewPostModel = reviewPostModel
        editReviewViewController.modalPresentationStyle = .fullScreen
        present(editReviewViewController, animated: true, completion: nil)
    }
}

extension ReviewDetailViewController:ReviewDetailMainViewDelegate {
    
    func touchedReportButton() {
        mainView.updateReport()
        
        let reportViewController = ReportViewController()
        reportViewController.reviewPostModel = reviewPostModel
        navigationController?.pushViewController(reportViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    
    func favoriteButton(reviewPostModel: ReviewPostModel) {
        mainView.isFavoriteButtonTouched = !mainView.isFavoriteButtonTouched
        mainView.updateFavorite()
        
        if let uid = Auth.auth().currentUser?.uid {
            var isFavorited : Bool = false
            reviewPostModel.favorite_users.forEach { (favoriteUser) in
                favoriteUser.forEach { (key,val) in
                    if key == uid {
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
    
    
    func deleteButton(commentPostModel: CommentPostModel) {
        CommentPostModel.delete(id: commentPostModel.id) {
            self.mainView.tableHeight.constant = CGFloat(self.mainView.tableView.contentSize.height)
        }
        NoticeModel.reads { (noticeModels) in
            for noticeModel in noticeModels {
                if noticeModel.comment_id == commentPostModel.id {
                    NoticeModel.delete(id: noticeModel.id) {
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    func iconViewButton(reviewPostModel: ReviewPostModel) {
        if let uid = Auth.auth().currentUser?.uid {
            if reviewPostModel.post_user_id == uid {
                let myProfileViewController = MyProfileViewController()
                myProfileViewController.fromPost = true
                navigationController?.pushViewController(myProfileViewController, animated: true)
                animatorManager.navigationType = .slide_push
            }else{
                let yourProfileViewController = YourProfileViewController()
                yourProfileViewController.reviewPostModel = reviewPostModel
                yourProfileViewController.fromPost = true
                navigationController?.pushViewController(yourProfileViewController, animated: true)
                animatorManager.navigationType = .slide_push
            }
        }
    }
    
    func commentIconViewCutton(commentPostModel: CommentPostModel) {
        if let uid = Auth.auth().currentUser?.uid {
            if commentPostModel.post_user_id == uid {
                let myProfileViewController = MyProfileViewController()
                myProfileViewController.fromPost = true
                navigationController?.pushViewController(myProfileViewController, animated: true)
                animatorManager.navigationType = .slide_push
            }else{
                let yourProfileViewController = YourProfileViewController()
                yourProfileViewController.commentPostModel = commentPostModel
                yourProfileViewController.fromPost = true
                navigationController?.pushViewController(yourProfileViewController, animated: true)
                animatorManager.navigationType = .slide_push
            }
        }
    }
    func commentSendButton() {
        let commentPostModel  : CommentPostModel = CommentPostModel()
        if let text = mainView.commentTextField.text{
            commentPostModel.description = text
        }
        if let uid = Auth.auth().currentUser?.uid {
            commentPostModel.post_user_id = uid
        }
        commentPostModel.review_post_id = reviewPostModel.id
        CommentPostModel.create(request: commentPostModel) {
            self.mainView.tableHeight.constant = CGFloat(self.mainView.tableView.contentSize.height)
            self.mainView.commentTextField.endEditing(true)
            self.mainView.commentTextField.text = ""
        }
        activityType = ActivityType.comment
        let noticeModel: NoticeModel = NoticeModel()
        if let text = mainView.commentTextField.text {
            noticeModel.comment = text
        }
        if let uid = Auth.auth().currentUser?.uid {
            noticeModel.notice_user_id = uid
        }
        noticeModel.post_id = reviewPostModel.id
        noticeModel.notice_my_id = reviewPostModel.post_user_id
        noticeModel.comment_id = commentPostModel.id
        noticeModel.comment = commentPostModel.description
        noticeModel.noticeType = ActivityType.comment.rawValue
        NoticeModel.create(request: noticeModel) {
        }
        
        
    }
    func goodButton(reviewPostModel: ReviewPostModel) {
        mainView.isGoodButtonTouched = !mainView.isGoodButtonTouched
        mainView.updateGood()
        
        if let uid = Auth.auth().currentUser?.uid {
            var isGooded: Bool = false
            reviewPostModel.good_users.forEach { (goodUser) in
                goodUser.forEach { (key,val) in
                    if key == uid {
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
            ReviewPostModel.addGoodUser(request:reviewPostModel,isGood: isGood)
        }
        
    }
}
// MARK: - method
extension ReviewDetailViewController {
    func setHeaderView(){
        if fromProfile {
            headerView.setLeft(text: "閉じる", fontSize: 16, color: #colorLiteral(red: 0.7404877639, green: 0.7449720201, blue: 1, alpha: 1))
        } else {
            headerView.setLeft(text: "＜", fontSize: 16, color: #colorLiteral(red: 0.7404877639, green: 0.7449720201, blue: 1, alpha: 1))
        }
        headerView.setCenter(text: "-review detail-", fontSize: 20, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        if let uid = Auth.auth().currentUser?.uid {
            if reviewPostModel.post_user_id == uid {
                headerView.setRight(text: "編集", fontSize: 16, color: #colorLiteral(red: 1, green: 0.6230913235, blue: 0.7894609614, alpha: 1))
            }
        }
        if let uid = Auth.auth().currentUser?.uid {
            if noticeModel.notice_my_id == uid {
                headerView.setRight(text: "編集", fontSize: 16, color: #colorLiteral(red: 1, green: 0.6230913235, blue: 0.7894609614, alpha: 1))
            }
        }
    }
    func setDelegate(){
        headerView.delegate = self
        mainView.delegate = self
        mainView.tableView.delegate = self
    }
    
    
    func commentGetModel(){
        CommentPostModel.reads { (commentPostModels) in
            for commentPostModel in commentPostModels {
                if commentPostModel.post_user_id != "" {
                    UserModel.readAt(userId: commentPostModel.post_user_id) { (userModel) in
                        if let name = userModel.nickname{
                            commentPostModel.post_user_name = name
                        }
                        if let icon = userModel.photo_path{
                            commentPostModel.post_user_icon = icon
                        }
                        let filterdCommentPostModels = commentPostModels.filter { (commentPostModel) -> Bool in
                            if commentPostModel.review_post_id == self.reviewPostModel.id {
                                return true
                            }else {
                                return false
                            }
                        }
                        self.commentPostModels = filterdCommentPostModels
                        self.mainView.commentGetModel(commentPostModels: filterdCommentPostModels)
                        self.viewWillLayoutSubviews()
                        // self.mainView.commentGetModel(commentPostModels:commentPostModels)
                    }
                }else{
                    self.mainView.commentGetModel(commentPostModels:commentPostModels)
                }
            }
        }
    }

    
//    func commentGetModel(){
//        CommentPostModel.reads{(commentPostModels)in
//            self.mainView.commentGetModel(commentPostModels: commentPostModels)
//        }
//    }
    func reviewGetModel(){
        ReviewPostModel.readAt(id: reviewPostModel.id, success: { (reviewPostModel) in
            UserModel.readAt(userId: reviewPostModel.post_user_id) { (userModel) in
                if let name = userModel.nickname {
                    reviewPostModel.post_user_name = name }
                if let icon = userModel.photo_path{
                    reviewPostModel.post_user_icon = icon }
                self.reviewPostModel = reviewPostModel
                self.mainView.reviewGetModel(reviewPostModel: reviewPostModel)
            }
            if let uid = Auth.auth().currentUser?.uid {
                var isGooded: Bool = false
                reviewPostModel.good_users.forEach { (goodUser) in
                    goodUser.forEach { (key,val) in
                        if key == uid {
                            self.isGood = val
                            self.mainView.isGoodButtonTouched = self.isGood
                        }
                    }
                }
                var isFavorited: Bool = false
                reviewPostModel.favorite_users.forEach { (favoriteUser) in
                    favoriteUser.forEach { (key,val) in
                        if key == uid {
                            self.isFavorite = val
                            self.mainView.isFavoriteButtonTouched = self.isFavorite
                        }
                    }
                }
            }
            self.reviewPostModel = reviewPostModel
            self.reviewUpdateView()
            self.mainView.reviewGetModel(reviewPostModel: reviewPostModel)
        }) {
            self.navigationController?.popViewController(animated: true)
            self.animatorManager.navigationType = .slide_pop
            }
        }
    
//    func reviewGetModel2(){
//        ReviewPostModel.reads { (reviewPostModels) in
//            let filteredReviewPostModels = reviewPostModels.filter{ (reviewPostModel) -> Bool in
//                if let uid = Auth.auth().currentUser?.uid {
//                    if reviewPostModel.post_user_id == uid {
//                        return true
//                    }else{
//                        return false
//                    }
//                }else{
//                    return false
//                }
//            }
//            self.mainView.
//        }
//    }
    func reviewUpdateView(){
        mainView.imageCollectionView.reloadData()
        //text
        mainView.titleLabel.text = "商品名：　" + reviewPostModel.title
        mainView.categoryLabel.text = "カテゴリ：　" + reviewPostModel.category
        mainView.reviewLabel.text = reviewPostModel.review
        mainView.tagLabel.text = reviewPostModel.tag
        
        //星の数
        if case reviewPostModel.review_num = 5{
            mainView.firstStarImage.image = UIImage(named: "checkedStar")
            mainView.secondStarImage.image = UIImage(named: "checkedStar")
            mainView.thirdStarImage.image = UIImage(named: "checkedStar")
            mainView.fourthStarImage.image = UIImage(named: "checkedStar")
            mainView.fifthStarImage.image = UIImage(named: "checkedStar")
        }
        if case reviewPostModel.review_num = 4{
            mainView.firstStarImage.image = UIImage(named: "checkedStar")
            mainView.secondStarImage.image = UIImage(named: "checkedStar")
            mainView.thirdStarImage.image = UIImage(named: "checkedStar")
            mainView.fourthStarImage.image = UIImage(named: "checkedStar")
            mainView.fifthStarImage.image = UIImage(named: "star")
        }
        if case reviewPostModel.review_num = 3{
            mainView.firstStarImage.image = UIImage(named: "checkedStar")
            mainView.secondStarImage.image = UIImage(named: "checkedStar")
            mainView.thirdStarImage.image = UIImage(named: "checkedStar")
            mainView.fourthStarImage.image = UIImage(named: "star")
            mainView.fifthStarImage.image = UIImage(named: "star")
        }
        if case reviewPostModel.review_num = 2{
            mainView.firstStarImage.image = UIImage(named: "checkedStar")
            mainView.secondStarImage.image = UIImage(named: "checkedStar")
            mainView.thirdStarImage.image = UIImage(named: "star")
            mainView.fourthStarImage.image = UIImage(named: "star")
            mainView.fifthStarImage.image = UIImage(named: "star")

        }
        if case reviewPostModel.review_num = 1{
            mainView.firstStarImage.image = UIImage(named: "checkedStar")
            mainView.secondStarImage.image = UIImage(named: "star")
            mainView.thirdStarImage.image = UIImage(named: "star")
            mainView.fourthStarImage.image = UIImage(named: "star")
            mainView.fifthStarImage.image = UIImage(named: "star")
        }
        
        //ユーザー情報
        if reviewPostModel.post_user_name == ""{
            mainView.userName.text = "メンバーがいません"
        }else{
            mainView.userName.text = reviewPostModel.post_user_name
        }
        if let photo_path = reviewPostModel.post_user_icon{
            if let url = URL(string: photo_path){
                mainView.iconView.af_setImage(for: .normal, url: url)
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
    
    
    
    //キーボードとテキストフィールド以外をタップでキーボードを隠す
    func hideKeybord() {
        let hideTap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKyeoboardTap))
        hideTap.numberOfTapsRequired = 1
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(hideTap)
    }
    @objc func hideKyeoboardTap(recognizer : UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    

    @objc func showKeyboard(notification: Notification) {
        let userInfo = notification.userInfo!
        let keyboardRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        var tabHeight: CGFloat = 0.0
        if let tabBarController = tabBarController {
            tabHeight = tabBarController.tabBar.frame.height
        }
        mainViewBottomMergin.constant = keyboardRect.height - tabHeight
        updateView()
    }
    @objc func hideKeyboard(notification: Notification) {
        mainViewBottomMergin.constant = 0
        updateView()
    }
    func updateView() {
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
            self.view.updateConstraints()
        }
    }
    func showKeyboardObserver(_ observer: Any, selector aSelector: Selector) {
        NotificationCenter.default.addObserver(observer,
                                               selector: aSelector,
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
    }
    func hideKeyboardObserver(_ observer: Any,
                              selector aSelector: Selector) {
        NotificationCenter.default.addObserver(observer, selector: aSelector, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    func removeShowKeyboardObserver(_ observer: Any) {
        NotificationCenter.default.removeObserver(observer,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
    }
    func removeHideKeyboardObserver(_ observer: Any) {
        NotificationCenter.default.removeObserver(observer,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
}

