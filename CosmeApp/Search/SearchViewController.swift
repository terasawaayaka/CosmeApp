//
//  SearchViewController.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/14.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
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
        mainView.tagResultView.isHidden = false
        mainView.userResultView.isHidden = true
        mainView.productNameResultView.isHidden = true
        mainView.brandResultView.isHidden = true
        
        mainView.getReviewPostModel(reviewPostModels: reviewPostModels, text: text)
        
    }
    
    func searchBarCancelButtonClicked() {
        
        mainView.searchCategoryButtonView.isHidden = true
        mainView.searchResultMainView.isHidden = false
        mainView.tagResultView.isHidden = true
        mainView.userResultView.isHidden = true
        mainView.productNameResultView.isHidden = true
        mainView.brandResultView.isHidden = true
    }
  
}
//タグとかユーザーとかが出てくるView
extension SearchViewController: SearchMainViewDelegate {
    //タグとかユーザーとかのセルをタッチしたら詳細画面へ遷移する
    func touchedUserCellButton() {
        let searchUserResultViewController = SearchUserSelectResultViewController()
        navigationController?.pushViewController(searchUserResultViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    
    func touchedProductNAmeCellButton() {
        let reviewDatailViewController = ReviewDetailViewController()
        navigationController?.pushViewController(reviewDatailViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    
    func touchedBrandCellButton() {
        let reviewDatailViewController = ReviewDetailViewController()
        navigationController?.pushViewController(reviewDatailViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    
    func touchedCellButton() {
        let reviewDatailViewController = ReviewDetailViewController()
        navigationController?.pushViewController(reviewDatailViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    //タグとかユーザーとかのボタンを押した結果画面の表示
      func touchedTagButton() {
          //SearchMainViewがタグ検索結果Viewを表示
          mainView.tagResultView.isHidden = false
          mainView.userResultView.isHidden = true
          mainView.productNameResultView.isHidden = true
          mainView.brandResultView.isHidden = true
          mainView.searchResultMainView.isHidden = true
      }
      func touchedUserButton() {
          
          //SearchMainViewのView２がユーザー検索結果Viewを表示
          mainView.userResultView.isHidden = false
          mainView.tagResultView.isHidden = true
          mainView.productNameResultView.isHidden = true
          mainView.brandResultView.isHidden = true
          mainView.searchResultMainView.isHidden = true
      }
      func touchedProductNameButton() {
          //SearchMainViewのView２が商品名検索結果Viewを表示
          mainView.productNameResultView.isHidden = false
          mainView.tagResultView.isHidden = true
          mainView.userResultView.isHidden = true
          mainView.brandResultView.isHidden = true
          mainView.searchResultMainView.isHidden = true
      }
      func touchedBrandButton() {
          //SearchMainViewのView２がブランド名検索結果Viewを表示
          mainView.brandResultView.isHidden = false
          mainView.tagResultView.isHidden = true
          mainView.userResultView.isHidden = true
          mainView.productNameResultView.isHidden = true
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
    
}
// MARK: - method
extension SearchViewController {
    func setDelegate(){
        searchTextView.delegate = self
        mainView.delegate = self
    }
    func getModel(){
        UserModel.reads { userModels in
            self.mainView.getModel(userModels: userModels)
//            for userModel in userModels {
//            print("ユーザーネーム:", userModel.nickname)
//            }
        }
    }
    func getReviewPostModel(){
        ReviewPostModel.reads { (reviewPostModels) in
//            for reviewPostModel in reviewPostModels {
//                print("DESC: ",reviewPostModel.title) }
            self.mainView.getReviewPostModel(reviewPostModels: reviewPostModels)
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
}
