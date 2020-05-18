//
//  SearchResultMainView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol SearchResultMainViewDelegate: NSObjectProtocol{
}
extension SearchResultMainViewDelegate {
}
// MARK: - Property
class SearchResultMainView: BaseView {
    weak var delegate: SearchResultMainViewDelegate? = nil
}
// MARK: - Life cycle
extension SearchResultMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension SearchResultMainView {
}
// MARK: - method
extension SearchResultMainView {
}

