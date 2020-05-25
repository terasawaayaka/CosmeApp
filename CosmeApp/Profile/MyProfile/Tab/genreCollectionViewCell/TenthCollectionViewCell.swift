//
//  TenthCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/25.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol TenthCollectionViewCellDelegate: NSObjectProtocol{
}
extension TenthCollectionViewCellDelegate {
}
// MARK: - Property
class TenthCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: TenthCollectionViewCellDelegate? = nil
}
// MARK: - Life cycle
extension TenthCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension TenthCollectionViewCell {
}
// MARK: - method
extension TenthCollectionViewCell {
}
