//
//  FourthCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/25.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol FourthCollectionViewCellDelegate: NSObjectProtocol{
}
extension FourthCollectionViewCellDelegate {
}
// MARK: - Property
class FourthCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: FourthCollectionViewCellDelegate? = nil
}
// MARK: - Life cycle
extension FourthCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension FourthCollectionViewCell {
}
// MARK: - method
extension FourthCollectionViewCell {
}
