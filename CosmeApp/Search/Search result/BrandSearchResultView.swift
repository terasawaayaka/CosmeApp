//
//  BrandSearchResultView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol BrandSearchResultViewDelegate: NSObjectProtocol{
}
extension BrandSearchResultViewDelegate {
}
// MARK: - Property
class BrandSearchResultView: BaseView {
    weak var delegate: BrandSearchResultViewDelegate? = nil
}
// MARK: - Life cycle
extension BrandSearchResultView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension BrandSearchResultView {
}
// MARK: - method
extension BrandSearchResultView {
}

