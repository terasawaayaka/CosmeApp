//
//  TagSearchResultMainView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol TagSearchResultMainViewDelegate: NSObjectProtocol{
}
extension TagSearchResultMainViewDelegate {
}
// MARK: - Property
class TagSearchResultMainView: BaseView {
    weak var delegate: TagSearchResultMainViewDelegate? = nil
}
// MARK: - Life cycle
extension TagSearchResultMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension TagSearchResultMainView {
}
// MARK: - method
extension TagSearchResultMainView {
}

