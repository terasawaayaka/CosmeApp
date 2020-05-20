//
//  ReviewDetailMainTableViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/20.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol ReviewDetailMainTableViewCellDelegate: NSObjectProtocol{
}
extension ReviewDetailMainTableViewCellDelegate {
}
// MARK: - Property
class ReviewDetailMainTableViewCell: BaseTableViewCell {
    weak var delegate: ReviewDetailMainTableViewCellDelegate? = nil
}
// MARK: - Life cycle
extension ReviewDetailMainTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension ReviewDetailMainTableViewCell {
}
// MARK: - method
extension ReviewDetailMainTableViewCell {
}
