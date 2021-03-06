//
//  SearchViewController.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/14.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
import FirebaseAuth
// MARK: - Property
class SearchViewController: BaseViewController {
    @IBOutlet weak var searchTextView: SearchTextView!
    @IBOutlet weak var mainView: SearchMainView!
    
    var userModels: [UserModel] = [UserModel]()
    var reviewPostModels: [ReviewPostModel] = [ReviewPostModel]()
}
// MARK: - Life cycle
extension SearchViewController {
    override func loadView() {
        super.loadView()
        setDelegate()
        hideKeybord()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getModel()
        getReviewPostModel()

    }
}
// MARK: - Protocol
//検索バーのあるView
extension SearchViewController: SearchTextViewDelegate {
    func searchBarSearchButtonClicked(text: String) {
      
        mainView.searchCategoryButtonView.isHidden = false
        mainView.searchResultMainView.isHidden = true
        mainView.tagResultView.isHidden = true
        mainView.userResultView.isHidden = true
        mainView.productNameResultView.isHidden = false
        
        mainView.getReviewPostModel(reviewPostModels: reviewPostModels,text: text)
        mainView.getModel(userModels: userModels,text: text)
    }
    
    func searchBarCancelButtonClicked() {
        
        mainView.searchCategoryButtonView.isHidden = true
        mainView.searchResultMainView.isHidden = false
        mainView.tagResultView.isHidden = true
        mainView.userResultView.isHidden = true
        mainView.productNameResultView.isHidden = true
        searchTextView.searchBar.searchTextField.text = ""
        hideKeybord()
    }
}
    
//タグとかユーザーとかが出てくるView
extension SearchViewController: SearchMainViewDelegate {
    func touchedCellButton(reviewPostModel: ReviewPostModel) {
        let reviewDetailViewController = ReviewDetailViewController()
        reviewDetailViewController.reviewPostModel = reviewPostModel
        navigationController?.pushViewController(reviewDetailViewController, animated: true)
        animatorManager.navigationType = .slide_push
  
    }
    
   
    //タグとかユーザーとかのセルをタッチしたら詳細画面へ遷移する
    func touchedUserCellButton(userModel: UserModel,reviewPostModel: ReviewPostModel) {
        if let uid = Auth.auth().currentUser?.uid {
            if userModel.id == uid {
                let myProfileViewController = MyProfileViewController()
                    myProfileViewController.userModel = userModel
                    myProfileViewController.reviewPostModels = reviewPostModels
                    myProfileViewController.fromPost = true
                    navigationController?.pushViewController(myProfileViewController, animated: true)
                    animatorManager.navigationType = .slide_push
                }else{
                    let yourProfileViewController = YourProfileViewController()
                    yourProfileViewController.userModel = userModel
                    yourProfileViewController.reviewPostModels = reviewPostModels
                    yourProfileViewController.fromPost = true
                    navigationController?.pushViewController(yourProfileViewController, animated: true)
                    animatorManager.navigationType = .slide_push
            }
        }
    }
    
    func touchedProductNAmeCellButton(reviewPostModel: ReviewPostModel) {
        let reviewDatailViewController = ReviewDetailViewController()
        reviewDatailViewController.reviewPostModel = reviewPostModel
        navigationController?.pushViewController(reviewDatailViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    
    //タグとかユーザーとかのボタンを押した結果画面の表示
      func touchedTagButton() {
          //SearchMainViewがタグ検索結果Viewを表示
          mainView.tagResultView.isHidden = false
          mainView.userResultView.isHidden = true
          mainView.productNameResultView.isHidden = true
          mainView.searchResultMainView.isHidden = true
      }
      func touchedUserButton() {
          
          //SearchMainViewのView２がユーザー検索結果Viewを表示
          mainView.userResultView.isHidden = false
          mainView.tagResultView.isHidden = true
          mainView.productNameResultView.isHidden = true
          mainView.searchResultMainView.isHidden = true
      }
      func touchedProductNameButton() {
          //SearchMainViewのView２が商品名検索結果Viewを表示
          mainView.productNameResultView.isHidden = false
          mainView.tagResultView.isHidden = true
          mainView.userResultView.isHidden = true
          mainView.searchResultMainView.isHidden = true
      }
  
//カテゴリ分けしたアイシャドウとかベースメイクとかボタン
    func touchedEyeShadowButton() {
        let categorySearchViewController = CategorySearchViewController()
        categorySearchViewController.categoryType = CategoryType.eyeShadow
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedEyeLinerButton() {
        let categorySearchViewController = CategorySearchViewController()
        categorySearchViewController.categoryType = CategoryType.eyeLiner
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedMascaraButton() {
        let categorySearchViewController = CategorySearchViewController()
        categorySearchViewController.categoryType = CategoryType.mascara
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedColorContctButton() {
        let categorySearchViewController = CategorySearchViewController()
        categorySearchViewController.categoryType = CategoryType.colorContact
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedEyeBrowButton() {
        let categorySearchViewController = CategorySearchViewController()
        categorySearchViewController.categoryType = CategoryType.eyeBrow
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedBaseButton() {
        let categorySearchViewController = CategorySearchViewController()
        categorySearchViewController.categoryType = CategoryType.baseMake
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedHiLightButton() {
        let categorySearchViewController = CategorySearchViewController()
        categorySearchViewController.categoryType = CategoryType.hiLight
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedShadingButton() {
        let categorySearchViewController = CategorySearchViewController()
        categorySearchViewController.categoryType = CategoryType.shading
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedCheekButton() {
        let categorySearchViewController = CategorySearchViewController()
        categorySearchViewController.categoryType = CategoryType.cheek
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedSkinCareButton() {
        let categorySearchViewController = CategorySearchViewController()
        categorySearchViewController.categoryType = CategoryType.skinCare
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedLipButton() {
        let categorySearchViewController = CategorySearchViewController()
        categorySearchViewController.categoryType = CategoryType.lip
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedHairCareButton() {
        let categorySearchViewController = CategorySearchViewController()
        categorySearchViewController.categoryType = CategoryType.hairCare
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedEtrButton() {
        let categorySearchViewController = CategorySearchViewController()
        categorySearchViewController.categoryType = CategoryType.etr
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    
}
// MARK: - method
extension SearchViewController {
    func setDelegate(){
        searchTextView.delegate = self
        mainView.delegate = self
    }
    func getModel(){
        UserModel.reads { userModels in
            self.mainView.getModel(userModels: userModels,text: self.searchTextView.searchBar.text)
//            for userModel in userModels {
//            print("ユーザーネーム:", userModel.nickname)
//            }
            self.userModels = userModels
        }
    }
    func getReviewPostModel(){
        ReviewPostModel.reads { (reviewPostModels) in
//            for reviewPostModel in reviewPostModels {
//                print("DESC: ",reviewPostModel.title) }
            self.mainView.getReviewPostModel(reviewPostModels: reviewPostModels,text: self.searchTextView.searchBar.text)
            self.reviewPostModels = reviewPostModels
        }
    }
    
    func hideKeybord() {
        let hideTap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKyeoboardTap))
        hideTap.numberOfTapsRequired = 1
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(hideTap)
    }
    @objc func hideKyeoboardTap(recognizer : UITapGestureRecognizer){
        self.view.endEditing(true)
    }
//    func returnSearchVC(){
//        mainView.searchCategoryButtonView.isHidden = false
//        mainView.searchResultMainView.isHidden = true
//        mainView.tagResultView.isHidden = true
//        mainView.userResultView.isHidden = true
//        mainView.productNameResultView.isHidden = false
//
//        if let text = searchTextView.searchBar.text {
//            mainView.getReviewPostModel(reviewPostModels: reviewPostModels,text: text)
//            mainView.getModel(userModels: userModels,text: text) }
//    }
}
