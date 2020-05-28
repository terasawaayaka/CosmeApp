//
//  ReviewDetailViewController.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
// MARK: - Property
class ReviewDetailViewController: BaseViewController {
    
    var commentPostModel : CommentPostModel = CommentPostModel()
    var reviewPostModel : ReviewPostModel = ReviewPostModel()
    
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: ReviewDetailMainView!
    @IBOutlet weak var mainViewBottomMergin: NSLayoutConstraint!
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
        reviewUpdateView()
        reviewGetModel()
        commentGetModel()
        
    }
}
// MARK: - Protocol
extension ReviewDetailViewController :HeaderViewDelegate{
    func touchedLeftButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        animatorManager.navigationType = .slide_pop
    }
    func touchedRightButton(_ sender: UIButton) {
        let editReviewViewController = EditReviewViewController()
        editReviewViewController.reviewPostModel = reviewPostModel
        editReviewViewController.modalPresentationStyle = .fullScreen
        present(editReviewViewController, animated: true, completion: nil)
    }
}

extension ReviewDetailViewController:ReviewDetailMainViewDelegate {
    func commentDeleteButton2() {
        CommentPostModel.delete(id: commentPostModel.id) {
        }
    }
    
    func commentSendButton() {
        let commentPostModel  : CommentPostModel = CommentPostModel()
        if let text = mainView.commentTextField.text{
            commentPostModel.description = text
        }
        CommentPostModel.create(request: commentPostModel) {
            self.mainView.commentTextField.endEditing(true)
            self.mainView.commentTextField.text = ""
        }
    }
    
    func iconViewButton2() {
        //TODO : 自分か他人のprofile画面に遷移
    }
    
    func touchedIconViewButton() {
        //TODO : 自分か他人のprofile画面に遷移
    }
    
    
}
// MARK: - method
extension ReviewDetailViewController {
    func setHeaderView(){
        headerView.setLeft(text: "＜", fontSize: 18, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        headerView.setCenter(text: "レビュー詳細", fontSize: 20, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        headerView.setRight(text: "編集", fontSize: 18, color: #colorLiteral(red: 1, green: 0.6230913235, blue: 0.7894609614, alpha: 1))
    }
    func setDelegate(){
        headerView.delegate = self
        mainView.delegate = self
    }
    func commentGetModel(){
        CommentPostModel.reads{(commentPostModels)in
            self.mainView.commentGetModel(commentPostModels: commentPostModels)
        }
    }
    func reviewGetModel(){
        ReviewPostModel.readAt(id: reviewPostModel.id, success: { (reviewPostModel) in
            self.reviewPostModel = reviewPostModel
        }) {
            self.navigationController?.popViewController(animated: true)
            self.animatorManager.navigationType = .slide_pop
        }
    }
    func reviewUpdateView(){
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
        }
        if case reviewPostModel.review_num = 3{
            mainView.firstStarImage.image = UIImage(named: "checkedStar")
            mainView.secondStarImage.image = UIImage(named: "checkedStar")
            mainView.thirdStarImage.image = UIImage(named: "checkedStar")
        }
        if case reviewPostModel.review_num = 2{
            mainView.firstStarImage.image = UIImage(named: "checkedStar")
            mainView.secondStarImage.image = UIImage(named: "checkedStar")
        }
        if case reviewPostModel.review_num = 1{
            mainView.firstStarImage.image = UIImage(named: "checkedStar")
        }
        
        //画像
        switch reviewPostModel.image_paths.count {
        case 0:
            mainView.firstImageView.image = UIImage(named: "noimage.png")
            mainView.secondImageView.image = UIImage(named: "noimage.png")
            mainView.thirdImageView.image = UIImage(named: "noimage.png")
            mainView.fourthImageView.image = UIImage(named: "noimage.png")
            
        case 1:
            if let url = URL(string: reviewPostModel.image_paths[0]){
                mainView.firstImageView.af_setImage(withURL: url)
            }
            mainView.secondImageView.image = UIImage(named: "noimage.png")
            mainView.thirdImageView.image = UIImage(named: "noimage.png")
            mainView.fourthImageView.image = UIImage(named: "noimage.png")
        case 2:
            if let url = URL(string: reviewPostModel.image_paths[0]){
                mainView.firstImageView.af_setImage(withURL: url)
            }
            if let url = URL(string: reviewPostModel.image_paths[1]){
                mainView.secondImageView.af_setImage(withURL: url)
            }
            mainView.thirdImageView.image = UIImage(named: "noimage.png")
            mainView.fourthImageView.image = UIImage(named: "noimage.png")
        case 3:
            if let url = URL(string: reviewPostModel.image_paths[0]){
                mainView.firstImageView.af_setImage(withURL: url)
            }
            if let url = URL(string: reviewPostModel.image_paths[1]){
                mainView.secondImageView.af_setImage(withURL: url)
            }
            if let url = URL(string: reviewPostModel.image_paths[2]){
                mainView.thirdImageView.af_setImage(withURL: url)
            }
            mainView.fourthImageView.image = UIImage(named: "noimage.png")

        case 4:
            if let url = URL(string: reviewPostModel.image_paths[0]){
                mainView.firstImageView.af_setImage(withURL: url)
            }
            if let url = URL(string: reviewPostModel.image_paths[1]){
                mainView.secondImageView.af_setImage(withURL: url)
            }
            if let url = URL(string: reviewPostModel.image_paths[2]){
                mainView.thirdImageView.af_setImage(withURL: url)
            }
            if let url = URL(string: reviewPostModel.image_paths[3]){
                mainView.fourthImageView.af_setImage(withURL: url)
            }
        default:
            break
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

