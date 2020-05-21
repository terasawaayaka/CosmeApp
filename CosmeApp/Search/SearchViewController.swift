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
    }
}
// MARK: - Protocol
extension SearchViewController: SearchTextViewDelegate {
    func touchedSearchButton() {
        //タグ〜とかボタンが置いてあるバーが出現する
        mainView.searchCategoryButtonView.isHidden = false
        mainView.searchResultMainView.isHidden = true
        mainView.tagResultView.isHidden = false
        mainView.userResultView.isHidden = true
        mainView.productNameResultView.isHidden = true
        mainView.brandResultView.isHidden = true
        
        //最初はタグの検索結果が出てくる
    }
}
extension SearchViewController: SearchMainViewDelegate {
    func didSelectItemAt() {
        let reviewDetailViewController = ReviewDetailViewController()
        navigationController?.pushViewController(reviewDetailViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    
    func touchedEyeShadowButton() {
        let categorySearchViewController = CategorySearchViewController()
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedEyeLinerButton() {
        let categorySearchViewController = CategorySearchViewController()
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedMascaraButton() {
        let categorySearchViewController = CategorySearchViewController()
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedColorContctButton() {
        let categorySearchViewController = CategorySearchViewController()
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedEyeBrowButton() {
        let categorySearchViewController = CategorySearchViewController()
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedBaseButton() {
        let categorySearchViewController = CategorySearchViewController()
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedHiLightButton() {
        let categorySearchViewController = CategorySearchViewController()
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedShadingButton() {
        let categorySearchViewController = CategorySearchViewController()
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedCheekButton() {
        let categorySearchViewController = CategorySearchViewController()
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedSkinCareButton() {
        let categorySearchViewController = CategorySearchViewController()
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedLipButton() {
        let categorySearchViewController = CategorySearchViewController()
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedHairCareButton() {
        let categorySearchViewController = CategorySearchViewController()
        navigationController?.pushViewController(categorySearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedTagButton() {
        //SearchMainViewのView２がタグ検索結果Viewを表示
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
}
// MARK: - method
extension SearchViewController {
    func setDelegate(){
        searchTextView.delegate = self
        mainView.delegate = self
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
