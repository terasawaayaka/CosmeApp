//
//  SixthCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/25.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol SixthCollectionViewCellDelegate: NSObjectProtocol{
}
extension SixthCollectionViewCellDelegate {
}
// MARK: - Property
class SixthCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: SixthCollectionViewCellDelegate? = nil
}
// MARK: - Life cycle
extension SixthCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension SixthCollectionViewCell {
}
// MARK: - method
extension SixthCollectionViewCell {
}
