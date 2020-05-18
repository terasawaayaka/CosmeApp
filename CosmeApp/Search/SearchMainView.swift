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
    func touchedTagButton()
    func touchedUserButton()
    func touchedProductNameButton()
    func touchedBrandButton()
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
    @IBOutlet weak var touchedbrandButton: UIButton!
    
    //検索結果画面のview
    @IBOutlet weak var searchResultMainView: SearchResultMainView!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var tagResultView: TagSearchResultMainView!
    @IBOutlet weak var userResultView: UserSearchResultMainView!
    @IBOutlet weak var productNameResultView: ProductNameSearchResultView!
    @IBOutlet weak var brandResultView: BrandSearchResultView!
    
    
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
    @IBAction func touchedBrandButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedBrandButton()}
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
        brandResultView.isHidden = true
        setLayout()
    }
}
// MARK: - Protocol
extension SearchMainView {
}
// MARK: - method
extension SearchMainView {
    func setLayout(){
        //タグのボタン
        touchedTagButton.layer.borderWidth = 1
        touchedTagButton.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        touchedTagButton.layer.cornerRadius = 5
        //ユーザーのボタン
        touchedUserButton.layer.borderWidth = 1
        touchedUserButton.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        touchedUserButton.layer.cornerRadius = 5
        //商品名のボタン
        touchedProductNameButton.layer.borderWidth = 1
        touchedProductNameButton.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        touchedProductNameButton.layer.cornerRadius = 5
        //ブランドのボタン
        touchedbrandButton.layer.borderWidth = 1
        touchedbrandButton.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        touchedbrandButton.layer.cornerRadius = 5
        
    }
}

