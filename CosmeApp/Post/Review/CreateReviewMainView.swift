//
//  CreateReviewMainView.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol CreateReviewMainViewDelegate: NSObjectProtocol{
}
extension CreateReviewMainViewDelegate {
}
// MARK: - Property
class CreateReviewMainView: BaseView {
    weak var delegate: CreateReviewMainViewDelegate? = nil
}
// MARK: - Life cycle
extension CreateReviewMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension CreateReviewMainView {
}

// MARK: - method
extension CreateReviewMainView {
}
