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
    func touchedEyeShadowButton() {
        let eyeShadowVSearchViewConreoller = EyeShadowSearchViewController()
        navigationController?.pushViewController(eyeShadowVSearchViewConreoller, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedEyeLinerButton() {
        let eyeLinerSearchViewController = EyeLinerSearchViewController()
        navigationController?.pushViewController(eyeLinerSearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedMascaraButton() {
        let mascaraSearchViewController = MascaraViewController()
        navigationController?.pushViewController(mascaraSearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedColorContctButton() {
        let colorContactSearchViewController = ColorContactViewController()
        navigationController?.pushViewController(colorContactSearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedEyeBrowButton() {
        let eyeBrowSearchViewController = EyeBrowSearchViewController()
        navigationController?.pushViewController(eyeBrowSearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedBaseButton() {
        let baseSearchViewController = BaseSearchViewController()
        navigationController?.pushViewController(baseSearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedHiLightButton() {
        let hiLightSearchViewController = HiLightSearchViewController()
        navigationController?.pushViewController(hiLightSearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedShadingButton() {
        let shadingSearchViewController = ShadingSearchViewController()
        navigationController?.pushViewController(shadingSearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedCheekButton() {
        let cheekSearchViewController = CheekSearchViewController()
        navigationController?.pushViewController(cheekSearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedSkinCareButton() {
        let skinCareSearchViewController = SkinCareSearchViewController()
        navigationController?.pushViewController(skinCareSearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedLipButton() {
        let lipSearchViewController = LipSearchViewController()
        navigationController?.pushViewController(lipSearchViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedHairCareButton() {
        let hairCareSearchViewController = HairCareSearchViewController()
        navigationController?.pushViewController(hairCareSearchViewController, animated: true)
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
}
