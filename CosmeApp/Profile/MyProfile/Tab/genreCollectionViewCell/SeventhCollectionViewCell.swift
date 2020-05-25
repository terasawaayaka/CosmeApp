//
//  SeventhCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/25.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol SeventhCollectionViewCellDelegate: NSObjectProtocol{
}
extension SeventhCollectionViewCellDelegate {
}
// MARK: - Property
class SeventhCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: SeventhCollectionViewCellDelegate? = nil
}
// MARK: - Life cycle
extension SeventhCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension SeventhCollectionViewCell {
}
// MARK: - method
extension SeventhCollectionViewCell {
}
