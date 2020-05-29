//
//  SearchMainView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol SearchMainViewDelegate: NSObjectProtocol{
    //SearchMainViewのボタン
    func touchedTagButton()
    func touchedUserButton()
    func touchedProductNameButton()
    //SearchResultMainViewのボタン
    func touchedEyeLinerButton()
    func touchedEyeShadowButton()
    func touchedMascaraButton()
    func touchedColorContctButton()
    func touchedEyeBrowButton()
    func touchedBaseButton()
    func touchedHiLightButton()
    func touchedShadingButton()
    func touchedCheekButton()
    func touchedSkinCareButton()
    func touchedLipButton()
    func touchedHairCareButton()
    
    func touchedCellButton(reviewPostModel: ReviewPostModel)
    func touchedProductNAmeCellButton()
    func touchedUserCellButton()
    
}
extension SearchMainViewDelegate {
}
// MARK: - Property
class SearchMainView: BaseView {
    weak var delegate: SearchMainViewDelegate? = nil
    //検索ジャンルを変えるボタンのあるview
    @IBOutlet weak var searchCategoryButtonView: UIView!
    
    //検索結果の画面を変えるためのボタン
    @IBOutlet weak var touchedTagButton: UIButton!
    @IBOutlet weak var touchedUserButton: UIButton!
    @IBOutlet weak var touchedProductNameButton: UIButton!
    
    //検索結果画面のview
    @IBOutlet weak var searchResultMainView: SearchResultMainView!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var tagResultView: TagSearchResultMainView!
    @IBOutlet weak var userResultView: UserSearchResultMainView!
    @IBOutlet weak var productNameResultView: ProductNameSearchResultView!
    
    
    //Action
    @IBAction func touchedTagButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedTagButton()}
    }
    @IBAction func touchedUserButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedUserButton()}
    }
    @IBAction func touchedProductNameButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedProductNameButton()}
    }
    //Models
    var userModels: [UserModel] = [UserModel]()
    var reviewPostModels: [ReviewPostModel] = [ReviewPostModel]()
}


extension SearchMainView: SearchResultMainViewDelegate {
    func touchedEyeShadowButton() {
        if let delegate = delegate {
            delegate.touchedEyeShadowButton()}
    }
    func touchedEyeLinerButton() {
         if let delegate = delegate {
             delegate.touchedEyeLinerButton()}
     }
    
    func touchedMascaraButton() {
        if let delegate = delegate {
            delegate.touchedMascaraButton()}
    }
    
    func touchedColorContctButton() {
        if let delegate = delegate {
            delegate.touchedColorContctButton()}
    }
    
    func touchedEyeBrowButton() {
        if let delegate = delegate{
            delegate.touchedEyeBrowButton()}
    }
    
    func touchedBaseButton() {
        if let delegate = delegate {
            delegate.touchedBaseButton()}
    }
    
    func touchedHiLightButton() {
        if let delegate = delegate {
            delegate.touchedHiLightButton()}
    }
    
    func touchedShadingButton() {
        if let delegate = delegate {
            delegate.touchedShadingButton()}
    }
    
    func touchedCheekButton() {
        if let delegate = delegate {
            delegate.touchedCheekButton()}
    }
    
    func touchedSkinCareButton() {
        if let delegate = delegate {
            delegate.touchedSkinCareButton()}
    }
    
    func touchedLipButton() {
        if let delegate = delegate {
            delegate.touchedLipButton()}
    }
    
    func touchedHairCareButton() {
        if let delegate = delegate {
            delegate.touchedHairCareButton()}
    }
}

// MARK: - Life cycle
extension SearchMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        searchResultMainView.isHidden = false
        searchCategoryButtonView.isHidden = true
        tagResultView.isHidden = true
        userResultView.isHidden = true
        productNameResultView.isHidden = true
        
        setLayout()
        setDelegate()
    }
}
// MARK: - Protocol
extension SearchMainView: TagSearchResultMainViewDelegate{
    func touchedCellButton(reviewPostModel: ReviewPostModel) {
         if let delegate = delegate {
                   delegate.touchedCellButton(reviewPostModel: reviewPostModel)}
           }
    }

extension SearchMainView: ProductNameSearchResultViewDelegate {
    func touchedProductNAmeCellButton(reviewPostModel: ReviewPostModel) {
        if let delegate = delegate {
                delegate.touchedProductNAmeCellButton()}
        }
    }
extension SearchMainView: UserSearchResultMainViewDelegate {
    func touchedUserCellButton() {
        if let delegate = delegate{
            delegate.touchedUserCellButton()}
    }
}
// MARK: - method
extension SearchMainView {
    func setLayout(){
        //タグのボタン
        touchedTagButton.layer.borderWidth = 1
        touchedTagButton.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        touchedTagButton.layer.cornerRadius = 5
        touchedTagButton.layer.borderColor = #colorLiteral(red: 0.8397446066, green: 0.3103108182, blue: 0.5394304367, alpha: 1)
        //ユーザーのボタン
        touchedUserButton.layer.borderWidth = 1
        touchedUserButton.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        touchedUserButton.layer.cornerRadius = 5
        touchedUserButton.layer.borderColor = #colorLiteral(red: 0.8397446066, green: 0.3103108182, blue: 0.5394304367, alpha: 1)
        //商品名のボタン
        touchedProductNameButton.layer.borderWidth = 1
        touchedProductNameButton.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        touchedProductNameButton.layer.cornerRadius = 5
        touchedProductNameButton.layer.borderColor = #colorLiteral(red: 0.8397446066, green: 0.3103108182, blue: 0.5394304367, alpha: 1)
    }
    func setDelegate(){
        searchResultMainView.delegate = self
        tagResultView.delegate = self
        productNameResultView.delegate = self
        userResultView.delegate = self
    }
    func getModel(userModels: [UserModel],text: String!=nil){
        self.userModels = userModels
        userResultView.getModel(userModels: userModels,text: text)
    }
    func getReviewPostModel(reviewPostModels: [ReviewPostModel],text: String?=nil){
        self.reviewPostModels = reviewPostModels
        tagResultView.getReviewPostModel(reviewPostModels: reviewPostModels,text: text)
        productNameResultView.getReviewPostModel(reviewPostModels: reviewPostModels,text: text)
    }
    
}

