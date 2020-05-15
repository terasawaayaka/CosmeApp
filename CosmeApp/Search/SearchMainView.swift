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
}
extension SearchMainViewDelegate {
}
// MARK: - Property
class SearchMainView: BaseView {
    weak var delegate: SearchMainViewDelegate? = nil
    @IBOutlet weak var touchedTagButton: UIButton!
    @IBOutlet weak var touchedUserButton: UIButton!
    @IBOutlet weak var touchedProductNameButton: UIButton!
    @IBOutlet weak var touchedbrandButton: UIButton!
}
// MARK: - Life cycle
extension SearchMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
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

