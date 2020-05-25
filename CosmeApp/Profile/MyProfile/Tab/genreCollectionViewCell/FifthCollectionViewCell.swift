//
//  FifthCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/25.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol FifthCollectionViewCellDelegate: NSObjectProtocol{
}
extension FifthCollectionViewCellDelegate {
}
// MARK: - Property
class FifthCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: FifthCollectionViewCellDelegate? = nil
}
// MARK: - Life cycle
extension FifthCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension FifthCollectionViewCell {
}
// MARK: - method
extension FifthCollectionViewCell {
}
