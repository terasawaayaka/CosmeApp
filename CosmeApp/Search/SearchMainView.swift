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
}

