//
//  ProductNameSearchResultView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol ProductNameSearchResultViewDelegate: NSObjectProtocol{
}
extension ProductNameSearchResultViewDelegate {
}
// MARK: - Property
class ProductNameSearchResultView: BaseView {
    weak var delegate: ProductNameSearchResultViewDelegate? = nil
}
// MARK: - Life cycle
extension ProductNameSearchResultView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension ProductNameSearchResultView {
}
// MARK: - method
extension ProductNameSearchResultView {
}

