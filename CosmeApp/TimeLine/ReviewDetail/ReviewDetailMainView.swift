//
//  ReviewDetailMainView.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework

protocol ReviewDetailMainViewDelegate: NSObjectProtocol{
}
extension ReviewDetailMainViewDelegate {
}
// MARK: - Property
class ReviewDetailMainView: BaseView {
    weak var delegate: ReviewDetailMainViewDelegate? = nil
}
// MARK: - Life cycle
extension ReviewDetailMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension ReviewDetailMainView {
}
// MARK: - method
extension ReviewDetailMainView {
}
